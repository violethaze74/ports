/*
 * Copyright (C) 2008 Jacob Meuser <jakemsr@sdf.lonestar.org>
 * Copyright (C) 2012 Alexandre Ratchov <alex@caoua.org>
 *
 * Permission to use, copy, modify, and distribute this software for any
 * purpose with or without fee is hereby granted, provided that the above
 * copyright notice and this permission notice appear in all copies.
 *
 * THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
 * WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
 * MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
 * ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
 * WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
 * ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
 * OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
 */


#ifndef __GST_SNDIOSRC_H__
#define __GST_SNDIOSRC_H__

#include <sndio.h>

#include <gst/gst.h>
#include <gst/audio/gstaudiosrc.h>
#include "gstsndio.h"

G_BEGIN_DECLS

#define GST_TYPE_SNDIOSRC \
  (gst_sndiosrc_get_type())
#define GST_SNDIOSRC(obj) \
  (G_TYPE_CHECK_INSTANCE_CAST((obj),GST_TYPE_SNDIOSRC,GstSndioSrc))
#define GST_SNDIOSRC_CLASS(klass) \
  (G_TYPE_CHECK_CLASS_CAST((klass),GST_TYPE_SNDIOSRC,GstSndioSrcClass))
#define GST_IS_SNDIOSRC(obj) \
  (G_TYPE_CHECK_INSTANCE_TYPE((obj),GST_TYPE_SNDIOSRC))
#define GST_IS_SNDIOSRC_CLASS(klass) \
  (G_TYPE_CHECK_CLASS_TYPE((klass),GST_TYPE_SNDIOSRC))

typedef struct _GstSndioSrc GstSndioSrc;
typedef struct _GstSndioSrcClass GstSndioSrcClass;

struct _GstSndioSrc {
  GstAudioSrc src;
  struct gstsndio sndio;
};

struct _GstSndioSrcClass {
  GstAudioSrcClass parent_class;
};

GType gst_sndiosrc_get_type (void);

G_END_DECLS

#endif /* __GST_SNDIOSRC_H__ */
