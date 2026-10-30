Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793359300;
	b=v858Sp7cgKhbIpQMZRGpLTsUyCwWV7gmx1ZFdbGa2YXVCqiyx36Ioiyx4daM0v0j4U6r
	 BpMhWp6NoXcNgVl2A5QppuGQxOCn3wUxmDsX0AxApiJua2UQYWBUFxqscvJaAGFwIDFWa
	 qK4f5R5hrjbbg7otcofppUy07Ms3xmlHLw0IZSz4r9tckteVuuvF1w2d9fv00iC4VID6j
	 l7loknG/9aB1c50wBMvwwgTJX7CDucZQg9F+0vhjSB0GUhVU06rjycGYtcSpy2Qpuqu1H
	 zpqxKSBhbssSPZELbx+2ILQgfiYrg6GvRGXZCHvgdMYx+K3eh4ZH5E919Dd/ko8i94g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793359300;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=wATYT6BvjZcVXWDHqPLOg+g6BseY/5lYU9MCydp+P3g=;
	b=y2HlKgx6AnXjQA/vVVEpYqyhAAqc6VPF53JbBaNQIxI9CG/6Po+qAZdWyovoV66M18o9
	 8yAgtWN9QIlMGgmF+DEDNO2z6a8wG+dzZND4ISOAcqti+MhqSgGRzrWGJAFzLUr64cSEQ
	 CBfx7LoAUrNAZbyFat1uEaQIezrPPPiICEeWX5SQJoHh4YleBFKocBB19G6lQoKfZc8Ao
	 3lZfJSVTvjmF0qCemw00qPZoRwv/e4GOhEhercTw5Th2xcIq+DWHUhJHevco06cg3PVar
	 UJVL53m0KKJFGwzlVlkFqIpnBcyxlUXoVQCWageSbaYKLH36vq+rgLewhm6xp0U9btA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pSB47JnN;
	arc=none smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8963D606A31C
	for <vhost-user@lists.linux.dev>; Fri, 30 Oct 2026 11:21:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8963D606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pSB47JnN
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-48c45111bebso255144f8f.0
        for <vhost-user@lists.linux.dev>; Fri, 30 Oct 2026 04:21:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793359299; x=1793964099; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wATYT6BvjZcVXWDHqPLOg+g6BseY/5lYU9MCydp+P3g=;
        b=pSB47JnNVRM3uKJFZwTujmQPRfPwlh71KXWvgz6Qj33efNRjm9Hs52J1ZkzZZpQtKO
         OMUiokpQz3t7MzmoAmhhOPi3RYhuu9TYzT7bdpGAsS4WpgNgkAaDcbtMyXi46B7IrQol
         L1wKxlx1cPd7IdxzifFSWUYqjiSNYGAElaSQqSs3cWcJIyLEJo+2wK5F65x6Ksb4BbQx
         wD0TdOcoGaLhml5IS904tY4QVAJ68+K/njyjgm1yrA+XsKKzcuQYncwiGFv8y/Hi/y2C
         yK4+8fQxjBg5ecoA62K5GddEhA4p8sSwSlOJfbNiJHWtLBMvjxQUnMVFqwqyQvfReHD9
         hB8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793359299; x=1793964099;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wATYT6BvjZcVXWDHqPLOg+g6BseY/5lYU9MCydp+P3g=;
        b=iTpVfFdqPMhUg2bk1btm0wfYfAkGNRVa9gpNs0pknv1R6gWYZT4/Lte/MX6qoWgYZo
         jWJsm1QtJRV4JI8x12ssozqaV5Wz5ItjLGAg6NANLQawhL253xeerF/qEhq/XYM3vYtL
         un4TOrsSey3Zl3h0YIBHY1aOMrCb2ftNne8Se6qJJ82nH7YUNqHwRCXnG/zV4l7O1VBZ
         pDNmB/UIKrNUPmCdQSEimB2bAPDoK9JH2+KPZVVRg5ucmKTu8BaMyb3nAC4JXOKhE5Ea
         ByfSufWqfRhxq0cQq+/qoDiGDDYfP1V+XPy0nVd8xc0nluJiaWALuRm3Ge/WrD2WbcWT
         aB7g==
X-Forwarded-Encrypted: i=1; AKwUvBweMDkTAFV/6upYlAWsY7I3VgiIhiHb3ncAqqfFo16//YqfeuThCpvI5VDADGnwRMQxKilyAqsX2yWh@lists.linux.dev
X-Gm-Message-State: AFq9FYL16vmY2MRvC+mmNlKF5siZlfOVcv3xgDukZn/e1S3UOAWkbncx
	95fJxf/4SZCNAOjeff3eAZA9+Ga21wkla/zlL0R69DiavPgb+s1YYTeX
X-Gm-Gg: AYBFou0u8MkS6UM4+M1eKlSpGWxbmO1q1FPy0JpsM4qXj/UNjweBvuGyKkAtcHQvrgz
	ZjbXqY+d5yHj8wB7bghPkGuTIULv919/W6O/Tc3i+GpEwkTkTvxqltSWYRUNk9jTDbILAgzAkEW
	3JBX7yUv8YOwpZVyBJafvlZfLshMHOwHy5CxaHKlKiZFfiWh5IiqXRdjvvQZOcDlfUb0TmAYTJm
	U81yqcey8kmAh8G0gsN5/qIlO0N+iB/tjN/tslYu3/okW0VakF6xRAvvn0yvtQQTs5u/1vITZ7J
	HQDgyd4b338G1v+X9j4KM1ZH8hRy0m7oo9+rzOVTgCR0G6r/xMojB+bYqLRDR0+KTKL3K8M+O+D
	VarpJwhB1JtD2Oey8iwazvL/Zz++BrJ9fhpOQCwOD9BWotBg5YC4ivXsb229aGQDK1X9iDvQEkp
	gVkZlygccyy9ZNvSvWg53pARFX0XzaSZmV+YQvb2NrNNyRENoKZ8XEkyecDaE6rL8AWUnIvfT4R
	lu9xqTF1/SD4xCpvC+/D0neD5z47358yJKHNdAOmbnj9iVJJzswmITTnGyzqLdHBP+3MYv7SJFy
	de+LXCe3ehgduxyuSI7ATGY1aKoXaU/WyWEocSMAmaQweorD3mzjsLCCCNqKStpLqh3VFIgWynT
	F1TuQwXUa6zUAkY8Yb2FD29rCqzvhrOO0XFYApEWoGG/0FnIwTc0112dvpkRH0+Fqlg7EHjgeIM
	j//l5ZYgk=
X-Received: by 2002:a05:6000:d8c:b0:48e:1c72:abc with SMTP id ffacd0b85a97d-48e6e5066a2mr3651079f8f.35.1793359298840;
        Fri, 30 Oct 2026 04:21:38 -0700 (PDT)
Received: from tim-m2.local (dynamic-2a02-3100-61d8-3600-98fd-cd98-7ae6-cb49.310.pool.telefonica.de. [2a02:3100:61d8:3600:98fd:cd98:7ae6:cb49])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71a4d3e9sm2893608f8f.6.2026.10.30.04.21.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 04:21:38 -0700 (PDT)
From: Tim Pambor <timpambor@gmail.com>
Date: Fri, 30 Oct 2026 12:21:00 +0100
Subject: [PATCH v2 7/9] vhost-user: enable frontends on any POSIX system
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
Message-Id: <20261030-vhost-user-posix-v2-7-cda7c17aad13@gmail.com>
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

The vhost-user protocol is not really Linux-specific so let's enable
vhost-user frontends for any POSIX system.

vhost_net.c uses VHOST_FILE_UNBIND, which is defined in a Linux specific
header. The kernel's VHOST_NET_SET_BACKEND documentation asks to pass
fd -1 to unbind, so replace the macro with -1 and drop the include,
nothing else in the file needs it. Long-term a constant could be
introduced and used for it.

Co-authored-by: Stefano Garzarella <sgarzare@redhat.com>
Signed-off-by: Tim Pambor <timpambor@gmail.com>
---
Changes in v2:
- Replaced VHOST_FILE_UNBIND with -1 and dropped the include
---
 hw/block/Kconfig   | 2 +-
 hw/net/vhost_net.c | 3 +--
 meson.build        | 1 -
 3 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/hw/block/Kconfig b/hw/block/Kconfig
index 737dbcdb3e..7edcd7a8f6 100644
--- a/hw/block/Kconfig
+++ b/hw/block/Kconfig
@@ -28,7 +28,7 @@ config VHOST_USER_BLK
     bool
     # Only PCI devices are provided for now
     default y if VIRTIO_PCI
-    depends on VIRTIO && VHOST_USER && LINUX
+    depends on VIRTIO && VHOST_USER
 
 config SWIM
     bool
diff --git a/hw/net/vhost_net.c b/hw/net/vhost_net.c
index 6e05c995f1..d0f1014ce1 100644
--- a/hw/net/vhost_net.c
+++ b/hw/net/vhost_net.c
@@ -33,7 +33,6 @@
 #include "standard-headers/linux/virtio_ring.h"
 #include "hw/virtio/vhost.h"
 #include "hw/virtio/virtio-bus.h"
-#include "linux-headers/linux/vhost.h"
 
 void vhost_net_get_features_ex(struct vhost_net *net, uint64_t *features)
 {
@@ -681,7 +680,7 @@ err_start:
     error_report("Error when restarting the queue.");
 
     if (net->nc->info->type == NET_CLIENT_DRIVER_TAP) {
-        file.fd = VHOST_FILE_UNBIND;
+        file.fd = -1;
         file.index = idx;
         int ret = vhost_net_set_backend(&net->dev, &file);
         assert(ret >= 0);
diff --git a/meson.build b/meson.build
index b67a97ab45..eb296346a8 100644
--- a/meson.build
+++ b/meson.build
@@ -221,7 +221,6 @@ have_tpm = get_option('tpm') \
 
 # vhost
 have_vhost_user = get_option('vhost_user') \
-  .disable_auto_if(host_os != 'linux') \
   .require(host_os != 'windows',
            error_message: 'vhost-user is not available on Windows').allowed()
 have_vhost_vdpa = get_option('vhost_vdpa') \

-- 
2.55.0

