Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793359294;
	b=nplOwYMuOeNN87i9UGhy7W3+MJFI064WqoiYQSGHOSXz/mgcSBogCGeBG9nasALdWz4Q
	 IMQRuR4wd7n9py2BhNfPDICJSx8XEYRZuGhQ+pt/Js0qLOQ6gmPJKHl7gYEmAK0/qSIv4
	 lHRUOSwzNskflgqx8j/qhoWMhZJgpEMLpMbo2jRWkuwoByZhFFibRShnnBhBbOZFlXhku
	 0kaR2vwOe6CwBmayTVDmm2jx/q/BaONfEvMEzQgm/0SVY1yoNwdeqchh2NHUTxs5Q38iJ
	 Tbj7hMe6lkJEpxOzPNjc6o0d2as8aDoY72us0qhDrbwveqeYIxWNupFx85N2XY5gR0w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793359294;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=9BuA42MLQr/5PMMpsTyjKbeHEHVM7JPHne/HEN7zZQU=;
	b=3humHfpfP+uxUaM0e8zNGRFiSNaWvbfJ4lQitbnGeu58F+rn/eOXtQ0uw0o9EhkQwxtj
	 VU0hgmTmsmea+K/FQUBXOEtd7lnpCwD3lx51jliMn790kf99Ri81KuwSs34ouv3ubHxIT
	 J/D/CCLlypdZPdsScccH4SgbC7vZ9hDRF92pQlQnQG9+/EMJzL497GDcV+kX82g1UycRI
	 uUQYh3lCS6MKQLDSe/vYL8Ocy+cvzsgRu1LoPrRfg8U/Qk/wCdVwusRXuz1bPA8A3NJBJ
	 13MTKMlUlcXjK37PnspYIk9ow7a3gUXqCT3xx/bLSc7v71WkMpdMWOm5rC6fPsuZNdw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GzxpwBTP;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13B5E606A31D
	for <vhost-user@lists.linux.dev>; Fri, 30 Oct 2026 11:21:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 13B5E606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GzxpwBTP
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a5087a5348so4116555e9.0
        for <vhost-user@lists.linux.dev>; Fri, 30 Oct 2026 04:21:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793359292; x=1793964092; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9BuA42MLQr/5PMMpsTyjKbeHEHVM7JPHne/HEN7zZQU=;
        b=GzxpwBTP8iIR1TaeAIrc7VRH/0bLj0YX8Gqr/zlAPVxq5SqA7RbkB4U5GM2k4+a0TN
         DGDrF1qR+ukGXpvJzPV65khtNWbyl3XWs1xJTsIsjoXKsMZt2LO4lxedfDKAncihShDs
         0mIZlBcuLvxRBYL5SomudiEJGvEtUbY4SEYBLoV5KzDnnUaLWsNH6mlzLAvVpOL3RhDx
         EfBR8JUhBuF0UmH/ah6DbEA0DX6UoFF7rzqyVZWXI3kNw1LCTBDS4Ifh8sUGgZZD03zN
         rHt/Rh9d3iiEaAlIt8ZL08zImg5EWG9MjxBbUSomQ6GTcpG71iGJgmQdzjcIO1vIuhwl
         F86A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793359292; x=1793964092;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9BuA42MLQr/5PMMpsTyjKbeHEHVM7JPHne/HEN7zZQU=;
        b=dWrqpxP+GPmgUO/uS3yBMo5r+Lycbzxq2NlPCEEz4/hBuPXOKPMzu5dhT5W5yUA/K7
         rWZx4SCWeYjm8ZNHmzalgekCIS8gvCDmfXy+D6eSIhmgX/LuuZXNYcqXjyVgPwraRZ5A
         SeilvtnXNZBMZUOQbzLLs5FgjL6P8+XWxoe3i2cEGHL2R2aUxmhuTmkRsEn4YNjgbKWa
         tOpqrIRkxfZzJ2135aWRYqAwuXIYownXhxsK51T2HUEXBFB/iwy11iEl/BNgjW+fO21y
         XthaZc/GoRXK1CfNDhx9IChm5+oNZriqYtHM68OJgXJN4OVwhzoXUjuanmjmODvJyHEG
         ch9A==
X-Forwarded-Encrypted: i=1; AKwUvBzUsiRE1BiSSy0H4a/cg5dRN0G8zHJK5H0E0nhb0I9JZnT85pYuzmR5eYdF9aNREB6JR7FOkVHKIc6R@lists.linux.dev
X-Gm-Message-State: AFq9FYJ2/LfG7GIAGf3iTr+8HQDsljVh6V1JYSyoKLuxm5h/Zb9ZtAyd
	qO7YNn2dlcIDEREBCBcVLR3Y5fjWRUTGBeGTFGqAwx2LAVnJhMbfAl7w
X-Gm-Gg: AYBFou0t/ElFnmZlwzHRu3kJx/dwUpH2aMRqGUvFjtu8b1YFeET6G2vnvTz6O+WnuJj
	OUdB3GaHdVMKAgC+owgaiP1uugMjoXT3o+M6P+6z1KDvMEbp0rHc0AIwNAOgN6fwW/HU/zEVOhP
	whWyNqvvFqyqQSGF/D8bLab1f+Y9+QopesXIaEV9P4HlfDZNrMRNcehxFMNK4c4DCswIowHKAIN
	vo0eINGXJ6clDDSRvXPzi0iOZes0mLBJayBk/bt8pm/PaviyBBHOiOhCinngsyFTJwfT4Y6TMlf
	vEBajdxB219or2JGiZsv5SjDknw4u0NXuZmDwicXHTvo4Qr4J7BHrNHFF0w7wBkcG5L3rg6ta/Q
	uZvnzP1fzOLm5I7+/rdK/82o/Tcf5Rh6R7HxoN1BSE0u2nZe6Y2CLjlyXxR5rVj4Y/x29q7MRfM
	A0K0locO96CHE8Tfs0+nZ2mszWE1kI8GmsKvoLGssO8JOhANtUMCFFwCBFcPh7iSigbWORJcS2E
	zmsNrkPOjhaDjx93uGD0ActiFq7QCp21FOI6WYXmQF8Dte+Z+/7Rgn3e1OyK0JLCfAFcjDiGO2w
	+sOFZyEbMc+aSGiV8lLEAOx6XSxYM9Ue+rWQf69EzUCRBdx8fToMIvSSpmAkXt7wa3iAix/w9WC
	8xhAzUNLOlGjkCAEX1ku1DTsnXk2Ffbpd9n7YgH1m7aReGwBHCWQr75n2T9jXKQ==
X-Received: by 2002:a05:600c:138c:b0:4a1:f90d:6f4c with SMTP id 5b1f17b1804b1-4ac17ffaff2mr39360115e9.7.1793359292398;
        Fri, 30 Oct 2026 04:21:32 -0700 (PDT)
Received: from tim-m2.local (dynamic-2a02-3100-61d8-3600-98fd-cd98-7ae6-cb49.310.pool.telefonica.de. [2a02:3100:61d8:3600:98fd:cd98:7ae6:cb49])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71a4d3e9sm2893608f8f.6.2026.10.30.04.21.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 04:21:31 -0700 (PDT)
From: Tim Pambor <timpambor@gmail.com>
Date: Fri, 30 Oct 2026 12:20:55 +0100
Subject: [PATCH v2 2/9] libvhost-user: detect eventfd support with a link
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
Message-Id: <20261030-vhost-user-posix-v2-2-cda7c17aad13@gmail.com>
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

libvhost-user includes <sys/eventfd.h> unconditionally and uses
eventfd_read() and eventfd_write(). The header is not available on every
POSIX system, e.g. macOS, so the build fails there:

  libvhost-user.c:31:10: fatal error: 'sys/eventfd.h' file not found

Probe for eventfd() in the subproject's meson.build, using the same test
QEMU's top-level meson.build uses for CONFIG_EVENTFD, and only include
the header when CONFIG_EVENTFD is set.

Without eventfd the front-end falls back to pipes, so provide
eventfd_read() and eventfd_write() replacements with plain read() and
write().

Signed-off-by: Tim Pambor <timpambor@gmail.com>
---
 subprojects/libvhost-user/libvhost-user.c | 17 ++++++++++++++++-
 subprojects/libvhost-user/meson.build     |  6 ++++++
 2 files changed, 22 insertions(+), 1 deletion(-)

diff --git a/subprojects/libvhost-user/libvhost-user.c b/subprojects/libvhost-user/libvhost-user.c
index adda700630..ece2bfcdd7 100644
--- a/subprojects/libvhost-user/libvhost-user.c
+++ b/subprojects/libvhost-user/libvhost-user.c
@@ -28,7 +28,6 @@
 #include <inttypes.h>
 #include <sys/types.h>
 #include <sys/socket.h>
-#include <sys/eventfd.h>
 #include <sys/mman.h>
 #include <endian.h>
 
@@ -52,6 +51,22 @@
 
 #endif
 
+#ifdef CONFIG_EVENTFD
+#include <sys/eventfd.h>
+#else
+#define eventfd_t uint64_t
+
+int eventfd_write(int fd, eventfd_t value)
+{
+    return (write(fd, &value, sizeof(value)) == sizeof(value)) ? 0 : -1;
+}
+
+int eventfd_read(int fd, eventfd_t *value)
+{
+    return (read(fd, value, sizeof(*value)) == sizeof(*value)) ? 0 : -1;
+}
+#endif
+
 #include "include/atomic.h"
 
 #include "libvhost-user.h"
diff --git a/subprojects/libvhost-user/meson.build b/subprojects/libvhost-user/meson.build
index aa5894a642..2f9aedb208 100644
--- a/subprojects/libvhost-user/meson.build
+++ b/subprojects/libvhost-user/meson.build
@@ -20,6 +20,12 @@ if cc.links('''
   vhost_user_flags += '-DCONFIG_MEMFD'
 endif
 
+if cc.links('''
+    #include <sys/eventfd.h>
+    int main(void) { return eventfd(0, EFD_NONBLOCK | EFD_CLOEXEC); }''')
+  vhost_user_flags += '-DCONFIG_EVENTFD'
+endif
+
 vhost_user = static_library('vhost-user',
                             files('libvhost-user.c'),
                             dependencies: threads,

-- 
2.55.0

