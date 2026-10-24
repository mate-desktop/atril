/* -*- Mode: C; tab-width: 8; indent-tabs-mode: t; c-basic-offset: 8; c-indent-level: 8 -*- */
/*
 * Copyright (C) 2026, Manu Cornet <m@ma.nu>
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2, or (at your option)
 * any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301, USA.
 */

#include "config.h"
#include "ev-image-size.h"

#include <string.h>

#define READ_BE16(p) ((guint) ((p)[0] << 8 | (p)[1]))
#define READ_LE16(p) ((guint) ((p)[0] | (p)[1] << 8))
#define READ_BE32(p) ((guint32) (p)[0] << 24 | (guint32) (p)[1] << 16 | (guint32) (p)[2] << 8 | (p)[3])
#define READ_LE24(p) ((guint32) (p)[0] | (guint32) (p)[1] << 8 | (guint32) (p)[2] << 16)

static EvImageSizeResult
jpeg_size_from_header (const guchar *data,
		       gsize         len,
		       gint         *width,
		       gint         *height)
{
	/* See https://www.w3.org/Graphics/JPEG/itu-t81.pdf page 39 (section
	 * B.2.2) */
	gsize pos = 2;

	while (1) {
		guchar marker;

		if (pos + 2 > len)
			return EV_IMAGE_SIZE_NEED_MORE;
		if (data[pos] != 0xff)
			return EV_IMAGE_SIZE_UNKNOWN;
		marker = data[pos + 1];
		if (marker == 0xff) {
			/* Fill byte */
			pos++;
			continue;
		}
		pos += 2;
		/* Markers without a payload */
		if (marker == 0x01 || (marker >= 0xd0 && marker <= 0xd7))
			continue;
		/* End of image or start of scan before any frame header */
		if (marker == 0xd9 || marker == 0xda)
			return EV_IMAGE_SIZE_UNKNOWN;

		if (pos + 2 > len)
			return EV_IMAGE_SIZE_NEED_MORE;

		/* Start of frame markers, except DHT, JPG and DAC */
		if (marker >= 0xc0 && marker <= 0xcf &&
		    marker != 0xc4 && marker != 0xc8 && marker != 0xcc) {
			if (pos + 7 > len)
				return EV_IMAGE_SIZE_NEED_MORE;
			*height = READ_BE16 (data + pos + 3);
			*width = READ_BE16 (data + pos + 5);
			return EV_IMAGE_SIZE_FOUND;
		}

		if (READ_BE16 (data + pos) < 2)
			return EV_IMAGE_SIZE_UNKNOWN;
		pos += READ_BE16 (data + pos);
	}
}

static EvImageSizeResult
webp_size_from_header (const guchar *data,
		       gsize         len,
		       gint         *width,
		       gint         *height)
{
	/* See https://developers.google.com/speed/webp/docs/riff_container
	 * and https://datatracker.ietf.org/doc/html/rfc6386 (lossy) as well as
	 * https://developers.google.com/speed/webp/docs/webp_lossless_bitstream_specification
	 * (lossless). */
	const guchar *chunk = data + 12;

	if (len < 30)
		return EV_IMAGE_SIZE_NEED_MORE;

	if (memcmp (chunk, "VP8 ", 4) == 0) {
		/* Lossy: 3-byte frame tag, then the 9d 01 2a start code */
		if (memcmp (chunk + 11, "\x9d\x01\x2a", 3) != 0)
			return EV_IMAGE_SIZE_UNKNOWN;
		*width = READ_LE16 (chunk + 14) & 0x3fff;
		*height = READ_LE16 (chunk + 16) & 0x3fff;
		return EV_IMAGE_SIZE_FOUND;
	} else if (memcmp (chunk, "VP8L", 4) == 0) {
		/* Lossless: signature byte, then 14-bit width-1 and height-1 */
		const guchar *b = chunk + 9;
		if (chunk[8] != 0x2f)
			return EV_IMAGE_SIZE_UNKNOWN;
		*width = 1 + (b[0] | (b[1] & 0x3f) << 8);
		*height = 1 + (b[1] >> 6 | b[2] << 2 | (b[3] & 0x0f) << 10);
		return EV_IMAGE_SIZE_FOUND;
	} else if (memcmp (chunk, "VP8X", 4) == 0) {
		/* Extended: 24-bit canvas width-1 and height-1 */
		*width = 1 + READ_LE24 (chunk + 12);
		*height = 1 + READ_LE24 (chunk + 15);
		return EV_IMAGE_SIZE_FOUND;
	}

	return EV_IMAGE_SIZE_UNKNOWN;
}

static EvImageSizeResult
png_size_from_header (const guchar *data,
		      gsize         len,
		      gint         *width,
		      gint         *height)
{
	/* The IHDR chunk always comes first, right after the signature.
	 * See https://www.w3.org/TR/png/#11IHDR */
	if (len < 24)
		return EV_IMAGE_SIZE_NEED_MORE;
	if (memcmp (data + 12, "IHDR", 4) != 0)
		return EV_IMAGE_SIZE_UNKNOWN;
	*width = READ_BE32 (data + 16);
	*height = READ_BE32 (data + 20);
	return EV_IMAGE_SIZE_FOUND;
}

static EvImageSizeResult
gif_size_from_header (const guchar *data,
		      gsize         len,
		      gint         *width,
		      gint         *height)
{
	/* The logical screen size follows the signature. See
	 * https://www.w3.org/Graphics/GIF/spec-gif89a.txt ("Logical Screen
	 * Descriptor" section, number 18). */
	*width = READ_LE16 (data + 6);
	*height = READ_LE16 (data + 8);
	return EV_IMAGE_SIZE_FOUND;
}

/**
 * ev_image_size_from_header:
 * @data: the first bytes of an image file
 * @len: the number of bytes in @data
 * @width: (out): where to store the image width
 * @height: (out): where to store the image height
 *
 * Reads the size of a JPEG, PNG, GIF or WebP image from the first bytes of
 * its file, without decoding the image.
 *
 * Returns: %EV_IMAGE_SIZE_FOUND if @width and @height were set,
 * %EV_IMAGE_SIZE_NEED_MORE if @data is too short to tell, or
 * %EV_IMAGE_SIZE_UNKNOWN if the format isn't supported or the header is
 * invalid.
 */
EvImageSizeResult
ev_image_size_from_header (const guchar *data,
			   gsize         len,
			   gint         *width,
			   gint         *height)
{
	EvImageSizeResult ret = EV_IMAGE_SIZE_UNKNOWN;

	if (len < 12)
		return EV_IMAGE_SIZE_NEED_MORE;

	if (data[0] == 0xff && data[1] == 0xd8) {
		ret = jpeg_size_from_header (data, len, width, height);
	} else if (memcmp (data, "\x89PNG\r\n\x1a\n", 8) == 0) {
		ret = png_size_from_header (data, len, width, height);
	} else if (memcmp (data, "GIF87a", 6) == 0 || memcmp (data, "GIF89a", 6) == 0) {
		ret = gif_size_from_header (data, len, width, height);
	} else if (memcmp (data, "RIFF", 4) == 0 && memcmp (data + 8, "WEBP", 4) == 0) {
		ret = webp_size_from_header (data, len, width, height);
	}

	if (ret == EV_IMAGE_SIZE_FOUND && (*width <= 0 || *height <= 0))
		return EV_IMAGE_SIZE_UNKNOWN;

	return ret;
}
