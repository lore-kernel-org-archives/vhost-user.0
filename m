Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793207766;
	b=AsZj/2gXQ4TarFoIQlPSz/NbcgRSLROT5VTopiq8fVn1FpaZQOx0Ml98o8kq5ttqAHlB
	 LSEU7p9FlPyWFBTwkrYrB9Nn0UO50NJMzEpDYcVpquR03ksiRe+fYFgLaLi0aPIqHnSCc
	 jFg98S2dEA2mZ2nx2WAH+hJcxwtXiZCpibNEq7HNJn1eXdjt1SvyQI/Y4VMroHUONxq1P
	 R/RO1s8HgSgNCfDCErZY7auziTkYOSfFLfg7jh4frzee1pXZBV4zJjJVpFfNdzAmXW2+1
	 u53vlGlKOscNiGcBX2bA2chyOqQcGJXSfNpLCHy7P4C+FbSVFhB99zti1tJXecSZsfQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793207766;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:In-Reply-To:X-Mailer:X-Mutt-Fcc:X-Mimecast-Spam-Score:
	 X-Mimecast-MFC-PROC-ID:X-Mimecast-Originator:Content-Type:
	 Content-Disposition;
	bh=XqhvxUVpombCjmAwjmm5BTwgJ42rWV/z09huDiwROrQ=;
	b=epXYM4IGMOdRLBGQwl31xIQ3QPd6vQF47u3XSQFfVDKbRHhvdNzzdKavRKA98zWNzxY6
	 M5qy+km1EZUIiF8CDzjBe1VT4s2jAVaLBVrsphwtNFNX547aFf/3KWGNN+x0nv6BalhzH
	 RHBWSdPUlqgF9fFc4oDBp2cMzswv00RC3H0OZjeQuH104Cbs1QqfwCta5afu2Z5MPHL87
	 x9uS0HDfKd1ZAP+ON9bMzUG4iWHWLapj7NgAMKU4bKTt2igfJcK6kzTWmGxnPJAX4kgpw
	 /7WmO0ALVkPv2sNaHVoF6wD5/xlM4qBK47ht2zjdPbWvteAfk+x4eLpQDLi4nOC5q1w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=al5Dn69f;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08F0F606A31A
	for <vhost-user@lists.linux.dev>; Wed, 28 Oct 2026 17:16:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 08F0F606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=al5Dn69f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793207765;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=XqhvxUVpombCjmAwjmm5BTwgJ42rWV/z09huDiwROrQ=;
	b=al5Dn69fnyL/TOYQ1metMjPN9g7l3CeTKUIHFCSmuLTndONcBr+3UeVfaY+z91JTNW0UDM
	Q1CR6RcPxbPtnGwxMJ5CbqwDJ1N9cjLS4HsmIdSWAoS0LhdvqD6XElRfqh+TDXn+f1wikg
	CWgd9R5iNz/rWpYlThGnUvubFtOzxbA=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-568-OMqJ_ecMN-GOL8_dpCjbUA-1; Wed, 28 Oct 2026 13:16:03 -0400
X-MC-Unique: OMqJ_ecMN-GOL8_dpCjbUA-1
X-Mimecast-MFC-AGG-ID: OMqJ_ecMN-GOL8_dpCjbUA_1793207762
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-48e0389d6f9so758371f8f.1
        for <vhost-user@lists.linux.dev>; Wed, 28 Oct 2026 10:16:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793207762; x=1793812562;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XqhvxUVpombCjmAwjmm5BTwgJ42rWV/z09huDiwROrQ=;
        b=Amt57q1VSrnUWpT9IL4pvBsYLe0Njnah+Dq7qpS5ih3MilLeTt2IOY93MAwk4FmvMT
         ++jyAMYl5MMuXQNUhsR73+TfWQ16cpqqLo9myzSQcOJa3yOHlDiLPp3dyrknndyS8YbX
         eS6sF1eJz92u1ITwrGYG1XX2uCTvsbG0Ly1n6xRauXy5F0gaDv717M4V6n4z+K9PWhnF
         QHgYTMd3bmWVRvYo0s/44/pMdiq/f/cEYo9C0YLxN2zlhAfx7nk89uQnvusy2bL3v2Zu
         u76TZ32ElDcWRJZgjVbpuGy9zzJ6m6AP/u5cSoWg/NCweqibez177xkrpJjZco8n5PN/
         acYA==
X-Forwarded-Encrypted: i=1; AKwUvBxQlvIQOhOki/TdjehRI19a8+4rtKQJQA5HT3BvR0rXnfYOVboK8az16wRlScSuJ75h2IPTs43Gkooj@lists.linux.dev
X-Gm-Message-State: AFq9FYLwfdVtQAKa+3quHyXsJx4gpww++fSCTWlqOwH6i4K/RYPhWL5Y
	la2ZZUGoK0PNsU69jpvY4UiLoFpuuZ00BjUFTfomEaAQxepjUFXUW/QqV3xdYRqtUfia/jsYqSh
	j5cHRixrhdZOs31s8vgsHjiUiMluJ2hAT7Eq5BNNIX2hKZBtQJ0MBYrx60tvkXLw=
X-Gm-Gg: AYBFou1GKx89tqR+Qr0tjoJYhgVBebI1gowpP8alBAoHKAzbd+w2H1llmOm75ZtB7x+
	5fzH/bxqhbBcdPlybB2FArEi7zVT+OANfqamn4ruckh4yKB0w4BDApHGT1kkFbnBA+PIxajq+zA
	Ghv0Me2BpyydHeh77zkA1GlZ0Pwkexx7ZeTce0BOGBVoyY5uBSo7n4Mc9xr0IfkjfHihmxEHBNh
	cMJ6frdaiwNFW8nYeNxxM+hEPA2Ou3wcbDTYsHVN5uLL90DayRIVPnUueCT03TbIkWXnqy+Goec
	YN5G53o9nRz3ZXXkXZsMeM310pKe6oREzxI9fwM0e+1jfTElJDIlepQlPR9HZT+PgHGn4uk81l+
	VFfkPctc1/3N4K1ycB3BYjXD3by2m1e0FGLuD+Y6W
X-Received: by 2002:a05:6000:240e:b0:48e:f07:160e with SMTP id ffacd0b85a97d-48e5d5c46e4mr7632376f8f.38.1793207761776;
        Wed, 28 Oct 2026 10:16:01 -0700 (PDT)
X-Received: by 2002:a05:6000:240e:b0:48e:f07:160e with SMTP id ffacd0b85a97d-48e5d5c46e4mr7632280f8f.38.1793207761172;
        Wed, 28 Oct 2026 10:16:01 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:1536:fc00:b838:383:1c7:6e81])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebcb851sm25583227f8f.26.2026.10.28.10.15.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 10:16:00 -0700 (PDT)
Date: Wed, 28 Oct 2026 13:15:58 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Yuho Choi <dbgh9129@gmail.com>, Yuho Choi <oss.patchbox@gmail.com>,
	Albert Esteve <aesteve@redhat.com>,
	Stefano Garzarella <sgarzare@redhat.com>,
	vhost-user@lists.linux.dev
Subject: [PULL 46/78] vhost-user: remove shared object entries during cleanup
Message-ID: <05b213ca8e2b63ba56e978fdb252549909e1f635.1793207602.git.mst@redhat.com>
References: <cover.1793207602.git.mst@redhat.com>
X-Mailing-List: vhost-user@lists.linux.dev
List-Id: <vhost-user.lists.linux.dev>
List-Post: <mailto:vhost-user@lists.linux.dev>
List-Help: <mailto:vhost-user+help@lists.linux.dev>
List-Subscribe: <mailto:vhost-user+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:vhost-user+unsubscribe@lists.linux.dev>
List-Owner: <mailto:vhost-user+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
In-Reply-To: <cover.1793207602.git.mst@redhat.com>
X-Mailer: git-send-email 2.51.2.2891.g4157995a80.dirty
X-Mutt-Fcc: =sent
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ifpqAzsupAJRpg9shRtjSPBSLGvLylVLb_2Gahq0bcU_1793207762
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

From: Yuho Choi <dbgh9129@gmail.com>

SHARED_OBJECT_ADD publishes a borrowed vhost_dev pointer in the global
UUID table. If an exporter goes away without sending SHARED_OBJECT_REMOVE,
vhost_user_backend_cleanup() frees dev->opaque but leaves these entries
behind. A later lookup from another backend can dereference the NULL
opaque pointer, or access a freed vhost_dev if its containing allocation
has also been released.

Remove all entries exported by the device after closing its backend
request channel and before freeing its state. Match both the resource
type and owner pointer so other exporters and dma-buf entries are kept.

Add unit coverage for multiple UUIDs per owner, unrelated resources,
repeated cleanup, UUID reuse, and an uninitialized or empty table.

Fixes: 160947666276 ("vhost-user: add shared_object msg")
Signed-off-by: Yuho Choi <oss.patchbox@gmail.com>
Reviewed-by: Albert Esteve <aesteve@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Message-ID: <20260910053012.1395885-1-oss.patchbox@gmail.com>
---
 include/hw/virtio/virtio-dmabuf.h |  8 ++++++
 hw/display/virtio-dmabuf.c        | 18 +++++++++++++
 hw/virtio/vhost-user.c            |  1 +
 tests/unit/test-virtio-dmabuf.c   | 43 +++++++++++++++++++++++++++++++
 4 files changed, 70 insertions(+)

diff --git a/include/hw/virtio/virtio-dmabuf.h b/include/hw/virtio/virtio-dmabuf.h
index 627c3b6db7..a1ad362c37 100644
--- a/include/hw/virtio/virtio-dmabuf.h
+++ b/include/hw/virtio/virtio-dmabuf.h
@@ -65,6 +65,14 @@ bool virtio_add_vhost_device(QemuUUID *uuid, struct vhost_dev *dev);
  */
 bool virtio_remove_resource(const QemuUUID *uuid);
 
+/**
+ * virtio_remove_vhost_device() - Remove a vhost device's exported resources
+ * @dev: the exporter whose entries are to be removed
+ *
+ * The caller must remove the entries before cleaning up the device.
+ */
+void virtio_remove_vhost_device(struct vhost_dev *dev);
+
 /**
  * virtio_lookup_dmabuf() - Looks for a dma-buf resource in the lookup table
  * @uuid: resource's UUID
diff --git a/hw/display/virtio-dmabuf.c b/hw/display/virtio-dmabuf.c
index 5e0395be77..636372543a 100644
--- a/hw/display/virtio-dmabuf.c
+++ b/hw/display/virtio-dmabuf.c
@@ -96,6 +96,24 @@ bool virtio_remove_resource(const QemuUUID *uuid)
     return result;
 }
 
+static gboolean virtio_vhost_device_match(gpointer key, gpointer value,
+                                         gpointer dev)
+{
+    VirtioSharedObject *vso = value;
+
+    return vso->type == TYPE_VHOST_DEV && vso->value == dev;
+}
+
+void virtio_remove_vhost_device(struct vhost_dev *dev)
+{
+    g_mutex_lock(&lock);
+    if (resource_uuids != NULL) {
+        g_hash_table_foreach_remove(resource_uuids, virtio_vhost_device_match,
+                                    dev);
+    }
+    g_mutex_unlock(&lock);
+}
+
 static VirtioSharedObject *get_shared_object(const QemuUUID *uuid)
 {
     gpointer lookup_res = NULL;
diff --git a/hw/virtio/vhost-user.c b/hw/virtio/vhost-user.c
index 65889b0776..3402accc6f 100644
--- a/hw/virtio/vhost-user.c
+++ b/hw/virtio/vhost-user.c
@@ -2711,6 +2711,7 @@ static int vhost_user_backend_cleanup(struct vhost_dev *dev)
     if (u->backend_sioc) {
         close_backend_channel(u);
     }
+    virtio_remove_vhost_device(dev);
     g_free(u->region_rb);
     u->region_rb = NULL;
     g_free(u->region_rb_offset);
diff --git a/tests/unit/test-virtio-dmabuf.c b/tests/unit/test-virtio-dmabuf.c
index a45ec52f42..395ea6f464 100644
--- a/tests/unit/test-virtio-dmabuf.c
+++ b/tests/unit/test-virtio-dmabuf.c
@@ -22,6 +22,47 @@
 #include "hw/virtio/virtio-dmabuf.h"
 
 
+static void test_remove_vhost_device(void)
+{
+    struct vhost_dev dev = { 0 }, other = { 0 };
+    QemuUUID uuids[2], other_uuid, dmabuf_uuid;
+    int i;
+
+    /* Also allow cleanup before any resources have been registered. */
+    virtio_remove_vhost_device(&dev);
+
+    for (i = 0; i < ARRAY_SIZE(uuids); i++) {
+        qemu_uuid_generate(&uuids[i]);
+        g_assert_true(virtio_add_vhost_device(&uuids[i], &dev));
+    }
+    qemu_uuid_generate(&other_uuid);
+    g_assert_true(virtio_add_vhost_device(&other_uuid, &other));
+    qemu_uuid_generate(&dmabuf_uuid);
+    g_assert_true(virtio_add_dmabuf(&dmabuf_uuid, 3));
+
+    virtio_remove_vhost_device(&dev);
+    for (i = 0; i < ARRAY_SIZE(uuids); i++) {
+        g_assert_null(virtio_lookup_vhost_device(&uuids[i]));
+        g_assert_cmpint(virtio_object_type(&uuids[i]), ==, TYPE_INVALID);
+    }
+
+    /* Repeated cleanup must preserve unrelated resources. */
+    virtio_remove_vhost_device(&dev);
+    g_assert_true(virtio_lookup_vhost_device(&other_uuid) == &other);
+    g_assert_cmpint(virtio_lookup_dmabuf(&dmabuf_uuid), ==, 3);
+
+    /* Removed UUIDs can be exported by another device. */
+    g_assert_true(virtio_add_vhost_device(&uuids[0], &other));
+    virtio_remove_vhost_device(&other);
+    g_assert_null(virtio_lookup_vhost_device(&uuids[0]));
+    g_assert_null(virtio_lookup_vhost_device(&other_uuid));
+    g_assert_true(virtio_remove_resource(&dmabuf_uuid));
+
+    virtio_remove_vhost_device(&dev);
+    virtio_free_resources();
+    virtio_remove_vhost_device(&dev);
+}
+
 static void test_add_remove_resources(void)
 {
     QemuUUID uuid;
@@ -125,6 +166,8 @@ static void test_free_resources(void)
 int main(int argc, char **argv)
 {
     g_test_init(&argc, &argv, NULL);
+    g_test_add_func("/virtio-dmabuf/remove_vhost_device",
+                    test_remove_vhost_device);
     g_test_add_func("/virtio-dmabuf/add_rm_res", test_add_remove_resources);
     g_test_add_func("/virtio-dmabuf/add_rm_dev", test_add_remove_dev);
     g_test_add_func("/virtio-dmabuf/rm_invalid_res",
-- 
MST

