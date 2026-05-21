/* ev-document-signatures.c
 *  this file is part of atril, a mate document viewer
 *
 * Copyright (C) 2022 Jan-Michael Brummer <jan.brummer@tabos.org>
 * Copyright (C) 2026 MATE Developers
 *
 * Atril is free software; you can redistribute it and/or modify it
 * under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 *
 * Atril is distributed in the hope that it will be useful, but
 * WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301, USA.
 */

#ifdef HAVE_CONFIG_H
#include "config.h"
#endif

#include "ev-document-signatures.h"

G_DEFINE_INTERFACE (EvDocumentSignatures, ev_document_signatures, 0)

static void
ev_document_signatures_default_init (EvDocumentSignaturesInterface *klass)
{
}

void
ev_document_signatures_set_password_callback (EvDocumentSignatures *document_signatures, EvSignaturePasswordCallback cb)
{
   EvDocumentSignaturesInterface *iface = EV_DOCUMENT_SIGNATURES_GET_IFACE (document_signatures);

   if (iface->set_password_callback)
       iface->set_password_callback (document_signatures, cb);
}

GList *
ev_document_signatures_get_available_signing_certificates (EvDocumentSignatures *document_signatures)
{
   EvDocumentSignaturesInterface *iface = EV_DOCUMENT_SIGNATURES_GET_IFACE (document_signatures);

   if (iface->get_available_signing_certificates)
       return iface->get_available_signing_certificates (document_signatures);

   return NULL;
}

EvCertificateInfo *
ev_document_signature_get_certificate_info (EvDocumentSignatures *document_signatures,
                                            const char           *id)
{
   EvDocumentSignaturesInterface *iface = EV_DOCUMENT_SIGNATURES_GET_IFACE (document_signatures);

   if (iface->get_certificate_info)
       return iface->get_certificate_info (document_signatures, id);

   return NULL;
}

gboolean
ev_document_signatures_sign (EvDocumentSignatures *document_signatures,
                             EvSignaturesData     *data,
                             GCancellable         *cancellable,
                             GAsyncReadyCallback   callback,
	                     gpointer              user_data,
	                     GError              **error)
{
   EvDocumentSignaturesInterface *iface = EV_DOCUMENT_SIGNATURES_GET_IFACE (document_signatures);

	if (iface->sign)
	   return iface->sign (document_signatures, data, cancellable, callback, user_data, error);

   return FALSE;
}

gboolean
ev_document_signatures_sign_finish (EvDocumentSignatures *document_signatures,
	                            GAsyncResult         *result,
	                            GError              **error)
{
	EvDocumentSignaturesInterface *iface = EV_DOCUMENT_SIGNATURES_GET_IFACE (document_signatures);

	if (iface->sign_finish)
		return iface->sign_finish (document_signatures, result, error);

	return FALSE;
}

gboolean
ev_document_signatures_can_sign (EvDocumentSignatures *document_signatures)
{
   EvDocumentSignaturesInterface *iface = EV_DOCUMENT_SIGNATURES_GET_IFACE (document_signatures);

   if (iface->can_sign)
       return iface->can_sign (document_signatures);

   return FALSE;
}

EvDocumentSignatureState
ev_document_signatures_get_signature_state (EvDocumentSignatures *document_signatures,
	                                    guint                *n_signatures)
{
	EvDocumentSignaturesInterface *iface = EV_DOCUMENT_SIGNATURES_GET_IFACE (document_signatures);

	if (n_signatures)
		*n_signatures = 0;

	if (iface->get_signature_state)
		return iface->get_signature_state (document_signatures, n_signatures);

	return EV_DOCUMENT_SIGNATURE_STATE_NONE;
}

EvSignaturesData *
ev_document_signatures_data_new (void)
{
	EvSignaturesData *data = g_malloc0 (sizeof (EvSignaturesData));

	gdk_rgba_parse (&data->font_color, "#000000");
	gdk_rgba_parse (&data->border_color, "#000000");
	gdk_rgba_parse (&data->background_color, "#F0F0F0");

	data->font_size = 10.0;
	data->left_font_size = 20.0;
	data->border_width = 1.5;

	return data;
}

void
ev_document_signatures_data_free (EvSignaturesData *data)
{
	g_clear_pointer (&data->certificate_info, ev_certificate_info_free);
	g_clear_pointer (&data->destination_file, g_free);
	g_clear_pointer (&data->password, g_free);
	g_clear_pointer (&data->signature, g_free);
	g_clear_pointer (&data->signature_left, g_free);
	g_clear_pointer (&data->rect, ev_rectangle_free);
	g_clear_pointer (&data->document_owner_password, g_free);
	g_clear_pointer (&data->document_user_password, g_free);

	g_free (data);
}

void
ev_document_signatures_data_set_certificate_info (EvSignaturesData        *data,
                                                  const EvCertificateInfo *certificate_info)
{
	g_clear_pointer (&data->certificate_info, ev_certificate_info_free);
	data->certificate_info = ev_certificate_info_copy (certificate_info);
}

void
ev_document_signatures_data_set_destination_file (EvSignaturesData *data,
                                                  const char       *file)
{
	g_clear_pointer (&data->destination_file, g_free);
	data->destination_file = g_strdup (file);
}

void
ev_document_signatures_data_set_page (EvSignaturesData *data,
                                      guint             page)
{
	data->page = page;
}

void
ev_document_signatures_data_set_rect (EvSignaturesData  *data,
                                      const EvRectangle *rectangle)
{
	g_clear_pointer (&data->rect, ev_rectangle_free);
	data->rect = ev_rectangle_copy ((EvRectangle*)rectangle);
}

void
ev_document_signatures_data_set_signature (EvSignaturesData *data,
                                           const char       *signature)
{
	g_clear_pointer (&data->signature, g_free);
	data->signature = g_strdup (signature);
}

void
ev_document_signatures_data_set_signature_left (EvSignaturesData *data,
                                                const char       *signature_left)
{
	g_clear_pointer (&data->signature_left, g_free);
	data->signature_left = g_strdup (signature_left);
}

G_DEFINE_BOXED_TYPE(EvCertificateInfo, ev_certificate_info, ev_certificate_info_copy, ev_certificate_info_free)

EvCertificateInfo *
ev_certificate_info_new (const char *id, const char *subject_common_name)
{
	EvCertificateInfo *info = (EvCertificateInfo *)g_malloc0(sizeof(EvCertificateInfo));

	info->id = g_strdup (id);
	info->subject_common_name = g_strdup (subject_common_name);
	return info;
}

EvCertificateInfo *
ev_certificate_info_copy (const EvCertificateInfo *info)
{
	EvCertificateInfo *info_copy = (EvCertificateInfo *)g_malloc0(sizeof(EvCertificateInfo));

	info_copy->id = g_strdup (info->id);
	info_copy->subject_common_name = g_strdup (info->subject_common_name);
	return info_copy;
}

void
ev_certificate_info_free (EvCertificateInfo *info)
{
	g_clear_pointer (&info->id, g_free);
	g_clear_pointer (&info->subject_common_name, g_free);
	g_free (info);
}

const char *
ev_certificate_info_get_id (const EvCertificateInfo *info)
{
	return info->id;
}

const char *
ev_certificate_info_get_subject_common_name (const EvCertificateInfo *info)
{
	return info->subject_common_name;
}
