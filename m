Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793359293;
	b=FodA4LcQZPzu7woUbAyOW8PlYl1SKxSM+MQi/7PD7WqKLfsKkVLSYZwBxKsO2hg/Ni6i
	 sBx94D+ZQG0IRndlQYy3jCrhaDRr8vWU/nWMwNlZFXz5xk7SOk9YVd5PeeSZNBcshHPtD
	 eXuLN7Ucwt3PpYU6D2RzvcOuvkCBaGUvPyovnxUPNhQVKNBw+qpwWjwAwxA0X1XMMbsPk
	 oD9JaqA5qpgjti6cU8aPdDOgKGt7l3ohjCLs9IUR4Uej+m9qoMby7nJYQihvRjN6I1QxN
	 EPSQHucls/s1JWi63nbK+XDn5IW7IAzr3izRmSaqlHa5nWfp9/dxfCXCfRAS8rj+2hg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793359293;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=vd5BWeOhgl4OJE0+2tUQcWMWNMpBRcJ6kN3JbG9lrMQ=;
	b=dHQ3IS48/YBLG8zx3Z4CuvNQHzF9Z/HlLw+YxbBuGzqpjMlBlXfbbad2MVArxbrRKvwv
	 qUmNrAPVnV+rSG2poS+J54huXFROo5dljYLDTCJRUF7CbfCj8DKpJgtfsddq8KmRKLxpX
	 4vp64ecEDcYfHRR114GFN9chAyGsjlIaoYU9OlM8XThTocpLm9aCf12v9PLxB0wj8sSm1
	 S892ZuyIVInAZzzG+uUknmRPbpm13nY4zrOnUQW7zsz+WaLoNiSF2t8w4/hiNhUDt/Ja8
	 t4/BKAYbmOkgkFiwAgkTTJms3WmscPA8UiT+EOySKJ8na+9+q9UKKafoxJyBSLWot4g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UyxAQOd4;
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDD68606A31C
	for <vhost-user@lists.linux.dev>; Fri, 30 Oct 2026 11:21:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DDD68606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UyxAQOd4
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-48e10a70540so362405f8f.1
        for <vhost-user@lists.linux.dev>; Fri, 30 Oct 2026 04:21:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793359291; x=1793964091; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vd5BWeOhgl4OJE0+2tUQcWMWNMpBRcJ6kN3JbG9lrMQ=;
        b=UyxAQOd4l17UkkqT0bXMP037Hz0Fy5im1HQWpBgwUlPRCphDc8oM9jMp9I4Zl8A5zn
         avyeyn+2BTJIxT6j1RJ0QO+2uvZ7xWVoGuV2iRpOxT3ewATE3mYK1325Sy4UOW8LLfez
         qHYjIpyjjgnT4GHeoMLxBbJlt5mCY9Xty4QnytVgArb4H9WUKkx1nVdhmMeoPRGOTvsw
         I7LnVHJT7rP56GIgc1SjB/f14V0yapytkvMLWoy2nGiLxXd8UGtReEF3PKPILhribrXU
         Jfc1SxeAET8juJ6BSr7dQs+mZlhimHgmkG+o/gvh8vemH0RvqDiCQX/a3SY7WpUnQ+XL
         FC2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793359291; x=1793964091;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vd5BWeOhgl4OJE0+2tUQcWMWNMpBRcJ6kN3JbG9lrMQ=;
        b=ThJhhERYyYQhNqY53BVkTupb0uSDiFEBvsEuQxZEYjwibmKTDUrWnhGu58ORCJGe5s
         3n/4JLZfB+72JtLerZq/0T7ckBhBccITFp9x9U+YU/0D+ijXIbGks9KVVmllLItD6i4Q
         gzoRpsaTxsGf4x7O9kd59DOCAgoOZI87vSgLkV5vCN/jSC6OYba4RAeEOemQ/S5PBgcD
         0RUUxlyY3PJzKeX73vqJd+u/RHmLBUjD5ONalMvbABDpTefCZD4/NX63td2qD/IRsQ4J
         6tBYFeJCNsZCEJSrvyM/2Aq4LMeqToVx7hqqi2Rf97+HR6giScXLktDSMZnk2TJskuZg
         XjMg==
X-Forwarded-Encrypted: i=1; AKwUvBwe1N8sj7l5deCvriM/eufF9M9CdK8HmvCwPUTQWLucyZ4OTH6SfROXW+d/6lGH/ebsa6gBNh2hVod+@lists.linux.dev
X-Gm-Message-State: AFq9FYKzOXQbFqwkKIpFhb5pY7c7pfuPx+YIz8zRIUnKjxOeFLR+CADC
	l5jBDEE/CtQ0rBOHoT9YTbQIWGc0MKFkYQD9iycYpUYsLrkeqG+Ime1T
X-Gm-Gg: AYBFou1iK20500kkNrMo2KB+SPOOVYGMuYq8yOjsh2KWeiHEkcYdqRIo0Z9PAJn44aJ
	evUfOjZO7YfujHdQi2xhE1e8A1131bbYZgQtQ8216yMYb+kcuM0mRIAqVts/a8w58ncF6GddBWp
	u0XR2JRp1/P/3lFwqICb7ymLSjMod+1uyafazf8SnFD9wvRPDmTG6EqdT8yBAmvMm3c/EUe2QFb
	p2zUUsoOj5JVwUvGiN/UrKA06CzgKKjOOHaXRsq2W9qoz+K8TGL1UpEb7XC85IANBf1F3UErry2
	G2298Ii+cb7YKQKzsuudIgoOd7XuJ+mrYkQx/FFJAcDPPUI/mEvDV73cOy8bZbdJST8BcHM4M12
	e3XehF8A5aStynzsYEtGKe8e3U3JKk4amHBOBoBqnV+mpReh+oepTZ0Cs7/JH3/w3c55YbbDbyE
	nFws6k+x7i4p/m6ilMaDzpQEWAPOXMpd1Pcpf8zTWbvzqH/vm/OmlbQhOH70HDQY+X0fRzj+R5+
	hWzzTqequOuDb22pPgXa/Cyn6REDKb7w4FxXRZZ5ZeqZwllsAP96WMGXo33+ybLxSEHafCkI3Dq
	nVdWO2K8oF4tQbhknc1xEv5wixJAxbNszK5omtuOL/qgnWBXIdJuLJCtZd7C6mw2P1/gllx5m64
	XGhxtbAYbx6BfiGEAgDNj8qDtKsHZRVD86h4JcAZNB8vbJKrlYMiPHrVySB+FAQ==
X-Received: by 2002:a05:6000:41c8:b0:48d:faa6:cedf with SMTP id ffacd0b85a97d-48e6e50645dmr4644278f8f.56.1793359291162;
        Fri, 30 Oct 2026 04:21:31 -0700 (PDT)
Received: from tim-m2.local (dynamic-2a02-3100-61d8-3600-98fd-cd98-7ae6-cb49.310.pool.telefonica.de. [2a02:3100:61d8:3600:98fd:cd98:7ae6:cb49])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71a4d3e9sm2893608f8f.6.2026.10.30.04.21.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 04:21:30 -0700 (PDT)
From: Tim Pambor <timpambor@gmail.com>
Date: Fri, 30 Oct 2026 12:20:54 +0100
Subject: [PATCH v2 1/9] libvhost-user: detect memfd support with a link
 test
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
Message-Id: <20261030-vhost-user-posix-v2-1-cda7c17aad13@gmail.com>
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

The inflight fd code is guarded by #ifdef MFD_ALLOW_SEALING, which only
tells us that the headers define the flag, not that memfd_create() is
available in the C library. There are environments where the flag is
defined but the link fails:

  ld: error: libvhost-user.a(libvhost-user.c.o): undefined symbol: memfd_create

Probe for memfd_create() with MFD_ALLOW_SEALING in the subproject's
meson.build, using the same test QEMU's top-level meson.build uses for
CONFIG_MEMFD, and guard the code with CONFIG_MEMFD instead.

When memfd is not available, VHOST_USER_PROTOCOL_F_INFLIGHT_SHMFD is
masked out as before, so the frontend never sends
VHOST_USER_GET_INFLIGHT_FD.

Signed-off-by: Tim Pambor <timpambor@gmail.com>
---
 subprojects/libvhost-user/libvhost-user.c | 15 +++++++--------
 subprojects/libvhost-user/meson.build     | 11 ++++++++++-
 2 files changed, 17 insertions(+), 9 deletions(-)

diff --git a/subprojects/libvhost-user/libvhost-user.c b/subprojects/libvhost-user/libvhost-user.c
index 2fed792e85..adda700630 100644
--- a/subprojects/libvhost-user/libvhost-user.c
+++ b/subprojects/libvhost-user/libvhost-user.c
@@ -1800,13 +1800,12 @@ vu_get_protocol_features_exec(VuDev *dev, VhostUserMsg *vmsg)
         features |= dev->iface->get_protocol_features(dev);
     }
 
-#ifndef MFD_ALLOW_SEALING
+#ifndef CONFIG_MEMFD
     /*
-     * If MFD_ALLOW_SEALING is not defined, we are not able to handle
-     * VHOST_USER_GET_INFLIGHT_FD messages, since we can't create a memfd.
-     * Those messages are used only if VHOST_USER_PROTOCOL_F_INFLIGHT_SHMFD
-     * is negotiated. A device implementation can enable it, so let's mask
-     * it to avoid a runtime panic.
+     * Without memfd we are not able to handle VHOST_USER_GET_INFLIGHT_FD
+     * messages. Those messages are used only if
+     * VHOST_USER_PROTOCOL_F_INFLIGHT_SHMFD is negotiated. A device
+     * implementation can enable it, so let's mask it to avoid a runtime panic.
      */
     features &= ~(1ULL << VHOST_USER_PROTOCOL_F_INFLIGHT_SHMFD);
 #endif
@@ -2001,7 +2000,7 @@ vu_inflight_queue_size(uint16_t queue_size)
            sizeof(uint16_t), INFLIGHT_ALIGNMENT);
 }
 
-#ifdef MFD_ALLOW_SEALING
+#ifdef CONFIG_MEMFD
 static void *
 memfd_alloc(const char *name, size_t size, unsigned int flags, int *fd)
 {
@@ -2068,7 +2067,7 @@ vu_get_inflight_fd(VuDev *dev, VhostUserMsg *vmsg)
 
     mmap_size = vu_inflight_queue_size(queue_size) * num_queues;
 
-#ifdef MFD_ALLOW_SEALING
+#ifdef CONFIG_MEMFD
     addr = memfd_alloc("vhost-inflight", mmap_size,
                        F_SEAL_GROW | F_SEAL_SHRINK | F_SEAL_SEAL,
                        &fd);
diff --git a/subprojects/libvhost-user/meson.build b/subprojects/libvhost-user/meson.build
index a18014e7f2..aa5894a642 100644
--- a/subprojects/libvhost-user/meson.build
+++ b/subprojects/libvhost-user/meson.build
@@ -11,10 +11,19 @@ add_project_arguments(cc.get_supported_arguments('-Wsign-compare',
 threads = dependency('threads')
 glib = dependency('glib-2.0')
 
+vhost_user_flags = ['-D_GNU_SOURCE']
+
+if cc.links('''
+    #define _GNU_SOURCE
+    #include <sys/mman.h>
+    int main(void) { return memfd_create("foo", MFD_ALLOW_SEALING); }''')
+  vhost_user_flags += '-DCONFIG_MEMFD'
+endif
+
 vhost_user = static_library('vhost-user',
                             files('libvhost-user.c'),
                             dependencies: threads,
-                            c_args: '-D_GNU_SOURCE')
+                            c_args: vhost_user_flags)
 
 executable('link-test', files('link-test.c'),
            link_whole: vhost_user)

-- 
2.55.0

