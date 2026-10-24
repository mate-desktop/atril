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

#pragma once

#include <glib.h>

G_BEGIN_DECLS

typedef enum {
	EV_IMAGE_SIZE_FOUND,
	EV_IMAGE_SIZE_NEED_MORE,
	EV_IMAGE_SIZE_UNKNOWN
} EvImageSizeResult;

EvImageSizeResult ev_image_size_from_header (const guchar *data,
					     gsize         len,
					     gint         *width,
					     gint         *height);

G_END_DECLS
