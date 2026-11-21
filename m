Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795221362;
	b=zqbVGCRrOgeRNdjeNDAqWzzWUlAp9ZS0g7GpY8fd38TedNlU6SOI52eQgCYuDuU+5fGH
	 ncDwFPDYfnEYFPMa9c5nxafvkvC7fPgj8lpRJAfPCP67J7y1C+q8YWcBNrYLyK7A0bG9Q
	 BaBeTsxa80dskh4F8JU2gWGiX5Qm3vjtDFVe/l/2ugduEU5ZnJ40M42c5BdXdBt/izuzb
	 oHs8VoyaE6EWmLzlPd5b4U5+FWZF3p0UYxv6GcmtsvXKQtRlYtEu6THLf+hm477NOCcgC
	 jZgPdDoGI1moo9wr0EhlWcWCIloz/wADjeHgE7Veixtk+Y3y0Tj3tip85aJCVL5HedA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795221362;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=mcVi9So+lH+nOcKf3r97gXmNVWTDvOb3ZDH44hgBVpQ=;
	b=Jyoi2WImuIKg+bIg1CkFqohjGFjmNMBOHif4bJdVfVhUpiGSLVySUMIP+ACD9gAE+03T
	 6Wh5XTFxgn/Mqe0ULRRtb9lVk0zXOvO+Wz1//9JxFA76OrHPuQRwV/4kYnH/p4+ASpHeD
	 EWkMI//j9aqNRybfc7RVBA+WpVLVN5PyV6SZzbzb+kj6kCDg7I9UYECNf4Kh3rqlJzEt2
	 VjZF7nDcUxf1U6Jhh5a/JBp7jtokPgZXVG+N8sWpJBKMVXNEAubVvQPhcEbHro8Most9p
	 S8DLNRr1v1enOVBOrEbjfvazjN9yu8Uwywe7oOZh7TYobt4w/s70FHsM2cOmCa3YhUA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--changyuanl.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=G8G39fRq;
	arc=none smtp.remote-ip=74.125.82.200
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 518C4606A68C
	for <vhost-user@lists.linux.dev>; Sat, 21 Nov 2026 00:36:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 518C4606A68C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--changyuanl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=G8G39fRq
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-375bac6bd21so1576377eec.0
        for <vhost-user@lists.linux.dev>; Fri, 20 Nov 2026 16:36:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795221360; x=1795826160; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mcVi9So+lH+nOcKf3r97gXmNVWTDvOb3ZDH44hgBVpQ=;
        b=G8G39fRqxc9p9ACDOZNTkb7lmjAwJSL2yQxxEiizxXx0XzSlnjy2jDmYfpldv0f7WI
         PFXNf/+TBy3ei6yMfTlZir5OsuI8B6Q6a10AJZNzj4qk0SHwwZoNGSA2dozGzwNDXh2G
         QpdtJm/SOivVNH8kLvHcCNYZMaXwqRNxE5wrj0G+nsjfAfwJ2MIPayRIUewBojcz+0r8
         1wkJdkv0qg4VUwMZ9hrxieV0nVZ8B6PHi4QloAW1lII7Dy2T8zMT2EEr93h1pituAqvC
         aD7tyUrDg0DZ/wsN8cjoCf2WrCnxZ5Rm1YVRWeeUDrS62cD3usjgZj7kmsSJS83ce4MX
         8UCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795221360; x=1795826160;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mcVi9So+lH+nOcKf3r97gXmNVWTDvOb3ZDH44hgBVpQ=;
        b=fk0mnynx7ABXkeqE1gqRNQP6fHn359W6Njv+81Z+hpSejVpqLuQVv9ARxSVHU8eTCq
         /9Gwdr6Q6mPcT5u048sFBNV2o6JTLZaIw20H8AxQFZQNuU8T6T3znUy+P3/5nlWW5leN
         OVh4Ma0if4pnL3xFtx0FRorvv8qF/8QIN5+QMKmmynfYuiI6PaUyWEpJaUeBcLFajjuZ
         eXNA+4ZYVySUKXNz9h53byY+zhZcBSBHa4K697rMTjtOjETw25GS/spPyi9+WVxaSpCo
         n+luK9m8Vw55xiybztU7FPDbwFxti6c6OgcqCsEl9+ZJmrDzIA+glgwKtl0TKyeFvCAy
         ITUg==
X-Forwarded-Encrypted: i=1; AL+hErG0C7cW8yoVzP7cw8DptAhVpFrZZJpQA4WvOJNJSxybhnXVGn/d6Z3vGVkvTAVkgXoJCjqzj6b7ieHe@lists.linux.dev
X-Gm-Message-State: APuU4Z81fN+zJ5AlVQhD2xK3u3L9d9LiEPt55SUkOUXJwBb7fLPk1ybK
	oqn6+ucDmDmOoGbnmvyxORjIX6TnuhHBNHV7FmU0BS97odC+T6ppdeEK9KJGTS7nPdUP6lVFtR+
	JmPwy/nV29n/B0FGMt03ffQ==
X-Received: from dybmw18.prod.google.com ([2002:a05:7300:cd92:b0:380:c63f:6b75])
 (user=changyuanl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:693c:68dc:b0:384:244b:12ed with SMTP id 5a478bee46e88-384b11ec95amr6473729eec.3.1795221359870;
 Fri, 20 Nov 2026 16:35:59 -0800 (PST)
Date: Fri, 20 Nov 2026 16:35:56 -0800
X-Mailing-List: vhost-user@lists.linux.dev
List-Id: <vhost-user.lists.linux.dev>
List-Post: <mailto:vhost-user@lists.linux.dev>
List-Help: <mailto:vhost-user+help@lists.linux.dev>
List-Subscribe: <mailto:vhost-user+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:vhost-user+unsubscribe@lists.linux.dev>
List-Owner: <mailto:vhost-user+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.1.750.gf70dc682cf-goog
Message-ID: <20261121003556.2270798-1-changyuanl@google.com>
Subject: [PATCH] libvhost-user: honor the offset of VHOST_USER_GET_CONFIG
From: Changyuan Lyu <changyuanl@google.com>
To: qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Stefano Garzarella <sgarzare@redhat.com>, vhost-user@lists.linux.dev, 
	Changyuan Lyu <changyuanl@google.com>
Content-Type: text/plain; charset="UTF-8"

In the vhost-user specification, the payload of VHOST_USER_GET_CONFIG
carries an offset into the config space of the virtio device, an access
size in bytes, and a byte array of that size with the contents of the
config space (see "Virtio device config space" in
docs/interop/vhost-user.rst). So a front-end may read any part of the
config space.

vu_get_config() hands the payload buffer and the size of the request to
the get_config() callback of the device, and ignores the offset. The
callback takes no offset and fills in the config space from its start,
so the reply always carries the first bytes of the config space,
whatever offset the front-end asked for.

QEMU does not notice, because it always reads the whole config space
from offset 0. A front-end that forwards each config space access of
the guest driver gets wrong data for every access at a non-zero offset.
For example, with a vhost-user-blk export of qemu-storage-daemon, a
Linux guest gets the low bytes of the capacity in place of num_queues
and fails to probe the device:

  virtio_blk virtio0: MQ advertised but zero queues reported
  virtio_blk virtio0: probe with driver virtio_blk failed with error -22

Ask the callback for the config space up to the end of the requested
range, and move the range to the start of the reply. This keeps the
callback as it is, so no device has to change. Reply with an error, a
zero-length payload as the specification says, if the range does not
fit in VHOST_USER_MAX_CONFIG_SIZE. The callbacks already reject a
length beyond the end of their config space.

Fixes: 0bc24d831e49 ("contrib/libvhost-user: enable virtio config space messages")
Signed-off-by: Changyuan Lyu <changyuanl@google.com>
---
 subprojects/libvhost-user/libvhost-user.c | 17 ++++++++++++++---
 subprojects/libvhost-user/libvhost-user.h |  2 +-
 2 files changed, 15 insertions(+), 4 deletions(-)

diff --git a/subprojects/libvhost-user/libvhost-user.c b/subprojects/libvhost-user/libvhost-user.c
index 52817cc733..a55899919c 100644
--- a/subprojects/libvhost-user/libvhost-user.c
+++ b/subprojects/libvhost-user/libvhost-user.c
@@ -1902,16 +1902,27 @@ vu_set_backend_req_fd(VuDev *dev, VhostUserMsg *vmsg)
 static bool
 vu_get_config(VuDev *dev, VhostUserMsg *vmsg)
 {
+    uint32_t offset = vmsg->payload.config.offset;
+    uint32_t size = vmsg->payload.config.size;
+    uint8_t *region = vmsg->payload.config.region;
     int ret = -1;
 
-    if (dev->iface->get_config) {
-        ret = dev->iface->get_config(dev, vmsg->payload.config.region,
-                                     vmsg->payload.config.size);
+    /*
+     * The get_config() callback takes no offset and fills in the config
+     * space from its start. So get everything up to the end of the
+     * requested range, and move the range to the start of the reply.
+     */
+    if (dev->iface->get_config &&
+        offset <= VHOST_USER_MAX_CONFIG_SIZE &&
+        size <= VHOST_USER_MAX_CONFIG_SIZE - offset) {
+        ret = dev->iface->get_config(dev, region, offset + size);
     }
 
     if (ret) {
         /* resize to zero to indicate an error to frontend */
         vmsg->size = 0;
+    } else if (offset > 0) {
+        memmove(region, region + offset, size);
     }
 
     return true;
diff --git a/subprojects/libvhost-user/libvhost-user.h b/subprojects/libvhost-user/libvhost-user.h
index a534d70771..163adad719 100644
--- a/subprojects/libvhost-user/libvhost-user.h
+++ b/subprojects/libvhost-user/libvhost-user.h
@@ -290,7 +290,7 @@ typedef struct VuDevIface {
      * on unmanaged exit/crash.
      */
     vu_queue_is_processed_in_order_cb queue_is_processed_in_order;
-    /* get the config space of the device */
+    /* get the first len bytes of the config space of the device */
     vu_get_config_cb get_config;
     /* set the config space of the device */
     vu_set_config_cb set_config;
-- 
2.56.1.750.gf70dc682cf-goog

