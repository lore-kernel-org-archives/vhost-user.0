Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793359295;
	b=uG/6hPz6p9xscwgPg+ajPrdb2o6xrwhMs8NZZyGZ03jAZdPtXPfd1Zr57zKMw+f8ASQe
	 CeSbJv/C70iuVW6DIszYK7ksEked2DE44KTka+1aDFM1Ocffqt5dIJX6bk/HX7jwKbjkY
	 xqEmZdXdeVhgzhg2w7baOeyaWvlCa4M46kx8mv5A4cl47Sv4mCw4Tf1kUFCZVuUI1/Sx0
	 I9xMbWAMz5vPTfrJGSXUpyqTlUngqEGE6IBUkijYsJhpXqupc7fvvKKEaXRvZllqKuRDY
	 /FhqvbenH+sYDAMorcpBfVqQ3oTUt8Z6ueteTEfevu9Aorzba7/B+JTdGR11l0kdH9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793359295;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=EEwSVgmgSkQ5ZAKDlh9daWSH5HudgGHgylwl/5eaU1k=;
	b=3MfosF94zxXj8X+rbEl3dPXr1cnvNzXdiON/OZkvUfnFuPfpDh2l+B9F7KYzQ8QbtYdD
	 kqChwxRxOi4gmM2nXiRIk+psU4SgkWIEUSERB+eCPNPBNBIX93wbwbaAzgYb/ADnS5BMB
	 b2Zrep9audYEqrpa3iFMGK4Y+LMSJ20Nq78A9F5VMtLVRtQj1bnt6MlTndT4KDPxyAN1H
	 2kJr+JKQdw5O/WHMrVO5hUlFbZV69taQS3y+6ou+zLxhlmZIYxI1ow9WMfo6Ji06xmSZB
	 ClDNH2gwbL+ZPaBdFkDOcR6yjBTz7de8NuBWqjtlScGpbA6kEHgVE7t0+VUF6LaeUWg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NggheWL9;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D176606A31D
	for <vhost-user@lists.linux.dev>; Fri, 30 Oct 2026 11:21:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4D176606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NggheWL9
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a60f9474c4so5984085e9.0
        for <vhost-user@lists.linux.dev>; Fri, 30 Oct 2026 04:21:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793359294; x=1793964094; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EEwSVgmgSkQ5ZAKDlh9daWSH5HudgGHgylwl/5eaU1k=;
        b=NggheWL9fFEkXr7GbjlotO1HbDOtwjqmhry2JEb9w5HWBUD7QuQ+KMHK5n9Mt5I/Lp
         ptnENn8QlGU/CGZHPv25ypBEkXJwxHVjll6poRya7/xN8Sy7+vo/GNVoxQLJ5iEiVFfd
         1oZs5M6s/9ILNwW5zTgapAtcZn2J9rZY+3JaKozJsagpOwWz/kwm2lB6qRT9GApvUjru
         /ewUTiaieW/7ovGK2YAzz+boVKQb2Gd4JwX7K65JcvQHqN7lOWUowRyhx8Dj2r8mjxfv
         vK7oKQwTyoukYP9Vidq4B3zn2D9oC4yLCmDK3p5gt9e9BL153mFYJtGVhK0txpUZXDzz
         dItw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793359294; x=1793964094;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EEwSVgmgSkQ5ZAKDlh9daWSH5HudgGHgylwl/5eaU1k=;
        b=g9RrFjvfaXm9HgIz1l4SKBG5QyhtFTpLawDrrZgr8ttZvB8v6g1tY0kDbO220hzQZy
         e8gLbUHan3QgzLhCtD2HesN7hk4kXK7rhB52Xjv12tBmL3jLlNWTtDpM6lyoz4zk6ZTl
         W0PgeIRqZsYRsaDIya44CgyHYmn0M1/pQM64W9GDRA0cRn+DSmIZ/YqKFCCC6F9oZ5SG
         1rKd4bF+Lj5Ot1VMGzwbeIuoLuzrrYzoMdipz+2ql7B5leGAgwTtpGPkv1KnUHZJVWKJ
         R5W9jKNX2BL/XBADXxJqwQrpRbrZXnZ8InFhB3t09R7DI5AxH5j5EyFMpsObfNK8ePKX
         bA3g==
X-Forwarded-Encrypted: i=1; AKwUvBy73/LTS0GvDPuXLy9D/xJr0aWh9VOXhm/s3BHiKVa9hnN9+hORSvtiuv8u64EAI5VkynqcQilBbCnW@lists.linux.dev
X-Gm-Message-State: AFq9FYJiYZxmSTu1s9VQGra6B+ja5fOmFpFqFiIy2PgTw+JuOKoYW5Ah
	JMFPczMwsJeDE0YZGSQbmQaMobUSdpnAamEsnfmpRt4Kku7cs7q5GnxJ
X-Gm-Gg: AYBFou0zaTl+x0y1GEIVqqitPTDCMZsZEKa1c26v5HUeMkFWDRvkKgqk2ZiXFFcW6qk
	h5z6CyILlBF8P+pq2TVkkaWrP/QZDMyDSB1yPb7EYFvIuy9n/5DQK0OOpIdbLtcw0Hje9N8t8M1
	LJj+FovJvdcTFMEwj+p3Pyufcy10Mf7sKRkmjK69WqWZzFZjIDeOOhXntcuRx1azFDPTmcofweD
	qw4o1e1/IFToSj5EYDxOZ/ujENUDoDQH5K/tGZrjbLXZde/zlJqzMANA0jiDvagd/qv8thPdRNW
	hnHu110gK3svDT4DyJdW0L4sNl1FF+uxmMD0pBkyEYHl7Gyvpgjaf0Cis51gDBLnoBZAaAABATY
	qEhG7jxD9BtQIEsdnmkMA3jLyUWjeiEmv7iR5ZjY6MYiINjthI6rm9Y++d5qIbOYVS7rJtGu9pv
	sUEE6Ul1VIOhnWrs+42ep6i3c4ledVm76lhfzN/kHLP9BeWuo9/ZBc7YI3Z7rjfNnBUTKjDeYoA
	DYTijxj5RcmURL2QXOqwJakFphQbKIowRTkEXMSP0PDumZhzL2wjoassoNusup2LOyVaG4Ktpbf
	nk7SJxnS1VCZiTsPvb51NqgZn5DI2MU3gKvKZ5JEJQaK3WZCAiUvsx7g54QcEbZgobvrxwRT577
	TpQmlo+LhSKsfWr3pOCp+ve+EES2lG5ow5qtoYZ8xci6q3C2lalIrt0DbDS28Dl8=
X-Received: by 2002:a05:600c:6087:b0:4a1:fe26:24f0 with SMTP id 5b1f17b1804b1-4ac1765ce52mr40569815e9.20.1793359293737;
        Fri, 30 Oct 2026 04:21:33 -0700 (PDT)
Received: from tim-m2.local (dynamic-2a02-3100-61d8-3600-98fd-cd98-7ae6-cb49.310.pool.telefonica.de. [2a02:3100:61d8:3600:98fd:cd98:7ae6:cb49])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71a4d3e9sm2893608f8f.6.2026.10.30.04.21.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 04:21:33 -0700 (PDT)
From: Tim Pambor <timpambor@gmail.com>
Date: Fri, 30 Oct 2026 12:20:56 +0100
Subject: [PATCH v2 3/9] vhost-user: kick via event_notifier_set()
X-Mailing-List: vhost-user@lists.linux.dev
List-Id: <vhost-user.lists.linux.dev>
List-Post: <mailto:vhost-user@lists.linux.dev>
List-Help: <mailto:vhost-user+help@lists.linux.dev>
List-Subscribe: <mailto:vhost-user+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:vhost-user+unsubscribe@lists.linux.dev>
List-Owner: <mailto:vhost-user+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261030-vhost-user-posix-v2-3-cda7c17aad13@gmail.com>
References: <20261030-vhost-user-posix-v2-0-cda7c17aad13@gmail.com>
In-Reply-To: <20261030-vhost-user-posix-v2-0-cda7c17aad13@gmail.com>
To: qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>, 
 Stefano Garzarella <sgarzare@redhat.com>, 
 =?utf-8?q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 =?utf-8?q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, Kevin Wolf <kwolf@redhat.com>, 
 Hanna Reitz <hreitz@redhat.com>, Jason Wang <jasowangio@gmail.com>, 
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>, qemu-block@nongnu.org, 
 Raphael Norwitz <rnorwitz@nvidia.com>, Brad Smith <brad@comstyle.com>, 
 vhost-user@lists.linux.dev, Tim Pambor <timpambor@gmail.com>, 
 Stefan Hajnoczi <stefanha@redhat.com>, 
 =?utf-8?q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
X-Mailer: b4 0.16.0

vhost-user injects a kick by writing to the fd it has just passed to the
back-end. With an eventfd that fd is writable, but when pipes are used
it is the read end and the write fails.

Instead, kick via event_notifier_set() on the queue's host notifier,
which writes to the correct end in both cases.

Signed-off-by: Tim Pambor <timpambor@gmail.com>
---
Changes in v2:
- Add comment about eventfd vs pipe
- Add assert file->fd == event_notifier_get_fd()
---
 hw/virtio/vhost-user.c | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/hw/virtio/vhost-user.c b/hw/virtio/vhost-user.c
index 65889b0776..868b3d25ca 100644
--- a/hw/virtio/vhost-user.c
+++ b/hw/virtio/vhost-user.c
@@ -1527,16 +1527,17 @@ static int vhost_user_set_vring_kick(struct vhost_dev *dev,
      * receiving a kick. The spec suggests this to improve compatibility.
      */
     if (file->fd != -1) {
-        uint64_t val = 1;
-        ssize_t nwritten;
-
-        do {
-            nwritten = write(file->fd, &val, sizeof(val));
-        } while (nwritten < 0 && errno == EINTR);
+        /*
+         * With an eventfd that fd is writable, but when pipes are used it is
+         * the read end and the write fails. Instead, kick via
+         * event_notifier_set() on the queue's host notifier, which writes
+         * to the correct end in both cases.
+         */
+        VirtQueue *vq = virtio_get_queue(dev->vdev, file->index);
+        EventNotifier *n = virtio_queue_get_host_notifier(vq);
 
-        if (nwritten < 0 && errno != EAGAIN /* back-end can already read */) {
-            return -errno;
-        }
+        assert(file->fd == event_notifier_get_fd(n));
+        return event_notifier_set(n);
     }
 
     return 0;

-- 
2.55.0

