/* ev-document-signatures.h
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

#if !defined (__EV_ATRIL_DOCUMENT_H_INSIDE__) && !defined (ATRIL_COMPILATION)
#error "Only <atril-document.h> can be included directly."
#endif

#ifndef EV_DOCUMENT_SIGNATURES_H
#define EV_DOCUMENT_SIGNATURES_H

#include <gdk/gdk.h>
#include <gio/gio.h>

#include "ev-document.h"

G_BEGIN_DECLS

#define EV_TYPE_DOCUMENT_SIGNATURES            (ev_document_signatures_get_type ())
#define EV_DOCUMENT_SIGNATURES(o)              (G_TYPE_CHECK_INSTANCE_CAST ((o), EV_TYPE_DOCUMENT_SIGNATURES, EvDocumentSignatures))
#define EV_DOCUMENT_SIGNATURES_IFACE(k)        (G_TYPE_CHECK_CLASS_CAST((k), EV_TYPE_DOCUMENT_SIGNATURES, EvDocumentSignaturesInterface))
#define EV_IS_DOCUMENT_SIGNATURES(o)           (G_TYPE_CHECK_INSTANCE_TYPE ((o), EV_TYPE_DOCUMENT_SIGNATURES))
#define EV_IS_DOCUMENT_SIGNATURES_IFACE(k)     (G_TYPE_CHECK_CLASS_TYPE ((k), EV_TYPE_DOCUMENT_SIGNATURES))
#define EV_DOCUMENT_SIGNATURES_GET_IFACE(inst) (G_TYPE_INSTANCE_GET_INTERFACE ((inst), EV_TYPE_DOCUMENT_SIGNATURES, EvDocumentSignaturesInterface))

typedef struct _EvDocumentSignatures          EvDocumentSignatures;
typedef struct _EvDocumentSignaturesInterface EvDocumentSignaturesInterface;

typedef struct
{
  char *id;
  char *subject_common_name;
} EvCertificateInfo;

typedef struct {
  char *destination_file;
  EvCertificateInfo *certificate_info;
  char *password;
  int page;
  char *signature;
  char *signature_left;

  EvRectangle *rect;
  GdkRGBA font_color;
  GdkRGBA border_color;
  GdkRGBA background_color;
  gdouble font_size;
  gdouble left_font_size;
  gdouble border_width;
  char *document_owner_password;
  char *document_user_password;
} EvSignaturesData;

typedef char * (*EvSignaturePasswordCallback)(const gchar *text);

struct _EvDocumentSignaturesInterface
{
   GTypeInterface base_iface;

   /* Methods  */
   void      (* set_password_callback) (EvDocumentSignatures *document_signatures, EvSignaturePasswordCallback cb);
   GList    *(* get_available_signing_certificates) (EvDocumentSignatures *document_signatures);
   EvCertificateInfo *(* get_certificate_info) (EvDocumentSignatures *document_signatures, const char *id);
   void  (* sign) (EvDocumentSignatures *document_signatures, EvSignaturesData *data, GCancellable *cancellable, GAsyncReadyCallback callback, gpointer user_data);
   gboolean  (* can_sign) (EvDocumentSignatures *document_signatures);
};

/* Certificate Information */
#define EV_TYPE_CERTIFICATE_INFO (ev_certificate_info_get_type())

GType ev_certificate_info_get_type (void) G_GNUC_CONST;

EvCertificateInfo *ev_certificate_info_new (const char *id, const char *subject_common_name);

EvCertificateInfo *ev_certificate_info_copy (const EvCertificateInfo *certificate_info);

void ev_certificate_info_free (EvCertificateInfo *certificate_info);

const char *ev_certificate_info_get_id (const EvCertificateInfo *certificate_info);

const char *ev_certificate_info_get_subject_common_name (const EvCertificateInfo *certificate_info);

GType ev_document_signatures_get_type (void) G_GNUC_CONST;

GList *ev_document_signatures_get_available_signing_certificates (EvDocumentSignatures *document_signatures);

void ev_document_signatures_set_password_callback (EvDocumentSignatures *document_signatures, EvSignaturePasswordCallback cb);

EvCertificateInfo *ev_document_signature_get_certificate_info (EvDocumentSignatures *document_signatures, const char *id);

gboolean ev_document_signatures_sign (EvDocumentSignatures *document_signatures,
                                      EvSignaturesData     *data,
                                      GCancellable         *cancellable,
                                      GAsyncReadyCallback   callback,
                                      gpointer              user_data);

gboolean ev_document_signatures_can_sign (EvDocumentSignatures *document_signatures);

EvSignaturesData *ev_document_signatures_data_new (void);

void ev_document_signatures_data_set_certificate_info (EvSignaturesData *data, const EvCertificateInfo *certificate);

void ev_document_signatures_data_set_destination_file (EvSignaturesData *data, const char *file);

void ev_document_signatures_data_set_page (EvSignaturesData *data, guint page);

void ev_document_signatures_data_free (EvSignaturesData *data);

void ev_document_signatures_data_set_rect (EvSignaturesData *data, const EvRectangle *rect);

void ev_document_signatures_data_set_signature (EvSignaturesData *data, const char *signature);

void ev_document_signatures_data_set_signature_left (EvSignaturesData *data, const char *signature_left);

G_END_DECLS

#endif /* EV_DOCUMENT_SIGNATURES_H */
