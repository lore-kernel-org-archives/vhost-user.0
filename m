Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793359302;
	b=cekgxtXG9Hd7WTjUpnIOOnCNsdf/PUVDxFgFnsamx4B1Gx9GbHtJBzcapMzE1XmSEzlr
	 6A9L/eUruEpfE5Wlz3QHXS3hcFijFvMFlitFy95HRjucpDE2AXog3EVqTUutxsQnaGHZc
	 YgMR9CDySG0DH9mNOQoFSLD+0xqgY9w6UkW+RnTMW0abYa0TXLG6c5UtYB4r3UqdFWVC4
	 KZ1l1HfXjGO2wXBInQzc0YGqyQRMLPRe4LMgK3QNx101dpLCMLFqg5CEggr8eNVIkHyX2
	 OSNL47Zt16XyFezvkWW2wRvXvOvvEabi85sM2Ju85fi0u8fbXGbAGCYYlmcaMqHEloA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793359302;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=NQyHj/7isbZq1anOngku43wTHeR8eA80fkM1Z6NDWCo=;
	b=22Ht9JduajxRq0VbqvsN6lJeUgYLWfKylp6ChEnuLpXtSvY3kEmx2wsxPa7zxf0S8ZYa
	 xpWxEvgO5Zz/jSB/O94XGIP5fL+JNKlGZpBQyu1g0RglQbi3g31gzPJwsUd+qoLVuvzYF
	 42lhIDGovpI5q4ofi8tsl94TP1oMWkY83yndLd8Gg1qdC7OlryabOWsfBmzYZvIMd8z4H
	 HV964sDfPjPQsl88dXBkAEh9z8j+nDd6w7a/e+D81QxtCYyHr/Zf5ykrN56JFe1mCaSGz
	 d6+Q1OYbpqqq4zq8ezt+1VSACBLjAhps/19OsLUTy8gMSrAoueEP40AXqB8rXXHew1Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="ybFMA6/2";
	arc=none smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7D06606A31D
	for <vhost-user@lists.linux.dev>; Fri, 30 Oct 2026 11:21:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A7D06606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ybFMA6/2
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-48dfb76b304so51346f8f.2
        for <vhost-user@lists.linux.dev>; Fri, 30 Oct 2026 04:21:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793359300; x=1793964100; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NQyHj/7isbZq1anOngku43wTHeR8eA80fkM1Z6NDWCo=;
        b=ybFMA6/23IjgTV2CN5Vy6mVWq4kRdeOCojjHhjIlAkkHmgUHdOD3T/5zuTmXbrJtdx
         8EuSP7kt3AOPHQxON6MJ3no4VU3VDo6POvneLphxGuZXYv5YlIo5a+4wODuLCq9D7dXc
         6dUqbxxq8S8lqkkaishCNdwRU668u9fMHLgNGHsEqzaNDY9RjfpXWZmOKqVA5nD2UUA0
         AqWzFYSBh/U01Ou58GQVEuigtetfiZ3MGuIXuEDSA2Oo4PnoLAovaEGuwSb/FsA7MHOY
         eRvY4XTcaAj+JEuQoeXU1JZ11GJHCzTkxvPLAf3XZeDTJ8gpCtnwJQtGq0ELEjidpdaF
         dr/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793359300; x=1793964100;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NQyHj/7isbZq1anOngku43wTHeR8eA80fkM1Z6NDWCo=;
        b=i842u8dsLD/M8DAcAuoiAQEKOA6cXYvA9RO3r9uWovRNqfVzX7sEnrRGeSF3vGyiNZ
         zmWHnVydDpsnTjgILcf1uP0l4H2gevDuFb3ZfsLJClQZMyh0efKDCjofhkAp23zPNONe
         GC5wol0IaakVlNZOFgQWqrrRg6MPBYRW4EvCg/H/xhbEXHIMm3q/xAdJtyeww1S6CP9Y
         OVQXXkbiqdR6ciZr16ktSZ0RZggOaUJ7pU8hvkys/fdCbEzcP74sdxgzpoELc/gw+yW/
         dI50vlt5pwD0t0WdV5z5yJ03znQH5079XjCVz1C222MGfAM1uzg4ytJlBU7l1HoHZsSO
         7Gyw==
X-Forwarded-Encrypted: i=1; AKwUvBwaSCOsSJmY2xa64R9N+Lp/D0qzIQU8c1lguX9AO440OsqYFq8SvhZL378DGgoT6spjo/3iIy4TzZ+z@lists.linux.dev
X-Gm-Message-State: AFq9FYL/inThh7jyN89bl0c8MDodO1N+0jGWQjRiOUP5YWF2i91mAlf1
	5jP+OjbsmuQD+1Y2Atw/HrJc+CQeclq4ehb/OSPTJGIOUf3y5RKkqKra
X-Gm-Gg: AYBFou1OEG7hQgulwN087jJJcNFdU6susGSJBQMVsYTwGll/wAU9w8qvJFlaT4olmCO
	4/HlZOoNO1ngKMABtW0qwVanlUQ0PdkeR0X0GuVV9t3X9S+zt02IIiYI/A6vBGzVAi5Rw2CR7Ld
	GbhCu/5+VAIApczjK9KxBNYfjXPktZSZSz1Nks+osiYCuKvJAuNz/eyxET0fItoHMRpKJAO+KR4
	m/7Ujigjqg0hL+xcZeM6hO54W50Sf7Y0nRI5G05h8DG+qbmsCNq83bUfRHS0+w55L7SFcSCbQXE
	EmlhWkVTGzTdwqrEnk95+/bXqUfaT022JIRR8aTL5s2HcpuioBoXDwUTpgVjqTE9vTuJzVWWb3R
	nFIaj+KWmspj3JuwKvBeFt206jSczat3eD5VWPt4l+LEi9hunidVPsnuvVPdvitGsFTE4td0n0u
	fKLrL5HYKSyVeI8n57WVFcyZt161fsLznJN2ytpsC94yslHQlgw+4iFR4EKaOCVs36C18vlEeLM
	wTLQqZKvxXgwfsnVZuDNxEhxDnAvjRP/xsvikFmlEhIWk5ytk0/OE8tC08y0+juHrNEPIWwGFFJ
	KvPPr3Tvwmvef2wfz40bnmV5n+nnWcUe2JUin5wIe3NY6M0vCXGFh28WwcXKSbr/SzShvZfEvp/
	TXC2ppDATA7FPsErBnZqXGNyeUrnNkZc+N1XCUzk2SDZ1YIwpAFZM9g7w9RgIfFvS5cwPik7SWl
	IwCc1smB8=
X-Received: by 2002:a05:6000:40ca:b0:48c:5304:5e50 with SMTP id ffacd0b85a97d-48e6e2620d8mr5235192f8f.0.1793359300014;
        Fri, 30 Oct 2026 04:21:40 -0700 (PDT)
Received: from tim-m2.local (dynamic-2a02-3100-61d8-3600-98fd-cd98-7ae6-cb49.310.pool.telefonica.de. [2a02:3100:61d8:3600:98fd:cd98:7ae6:cb49])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71a4d3e9sm2893608f8f.6.2026.10.30.04.21.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 04:21:39 -0700 (PDT)
From: Tim Pambor <timpambor@gmail.com>
Date: Fri, 30 Oct 2026 12:21:01 +0100
Subject: [PATCH v2 8/9] libvhost-user: enable it on any POSIX system
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
Content-Transfer-Encoding: 8bit
Message-Id: <20261030-vhost-user-posix-v2-8-cda7c17aad13@gmail.com>
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

From: Stefano Garzarella <sgarzare@redhat.com>

The vhost-user protocol is not really Linux-specific so let's enable
libvhost-user for any POSIX system.

Compiling it on macOS and FreeBSD some problems came up:
- avoid to include linux/vhost.h which is available only on Linux
  (vhost_types.h contains many of the things we need)
- macOS doesn't provide sys/endian.h, so let's define them
  (note: libvhost-user doesn't include QEMU's headers, so we can't use
   use "qemu/bswap.h")
- copy SEAL defines from include/qemu/memfd.h to make the code works
  on FreeBSD where MFD_ALLOW_SEALING is defined
- define MAP_NORESERVE if it's not defined (e.g. on FreeBSD)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Tested-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Acked-by: Stefan Hajnoczi <stefanha@redhat.com>
Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
Signed-off-by: Tim Pambor <timpambor@gmail.com>
---
 meson.build                               |  2 +-
 subprojects/libvhost-user/libvhost-user.c | 42 ++++++++++++++++++++++++++++++-
 subprojects/libvhost-user/libvhost-user.h |  2 +-
 3 files changed, 43 insertions(+), 3 deletions(-)

diff --git a/meson.build b/meson.build
index eb296346a8..4f4068e7a7 100644
--- a/meson.build
+++ b/meson.build
@@ -3468,7 +3468,7 @@ if have_system and vfio_user_server_allowed
 endif
 
 vhost_user = not_found
-if host_os == 'linux' and have_vhost_user
+if have_vhost_user
   libvhost_user = subproject('libvhost-user')
   vhost_user = libvhost_user.get_variable('vhost_user_dep')
 endif
diff --git a/subprojects/libvhost-user/libvhost-user.c b/subprojects/libvhost-user/libvhost-user.c
index 5f649a3d52..7c5b89dc0b 100644
--- a/subprojects/libvhost-user/libvhost-user.c
+++ b/subprojects/libvhost-user/libvhost-user.c
@@ -29,7 +29,6 @@
 #include <sys/types.h>
 #include <sys/socket.h>
 #include <sys/mman.h>
-#include <endian.h>
 
 /* Necessary to provide VIRTIO_F_VERSION_1 on system
  * with older linux headers. Must appear before
@@ -38,6 +37,7 @@
 #include "standard-headers/linux/virtio_config.h"
 
 #if defined(__linux__)
+#include <endian.h>
 #include <sys/syscall.h>
 #include <fcntl.h>
 #include <sys/ioctl.h>
@@ -51,6 +51,24 @@
 
 #endif
 
+#if defined(__APPLE__) && (__MACH__)
+#include <libkern/OSByteOrder.h>
+#define htobe16(x) OSSwapHostToBigInt16(x)
+#define htole16(x) OSSwapHostToLittleInt16(x)
+#define be16toh(x) OSSwapBigToHostInt16(x)
+#define le16toh(x) OSSwapLittleToHostInt16(x)
+
+#define htobe32(x) OSSwapHostToBigInt32(x)
+#define htole32(x) OSSwapHostToLittleInt32(x)
+#define be32toh(x) OSSwapBigToHostInt32(x)
+#define le32toh(x) OSSwapLittleToHostInt32(x)
+
+#define htobe64(x) OSSwapHostToBigInt64(x)
+#define htole64(x) OSSwapHostToLittleInt64(x)
+#define be64toh(x) OSSwapBigToHostInt64(x)
+#define le64toh(x) OSSwapLittleToHostInt64(x)
+#endif
+
 #ifdef CONFIG_EVENTFD
 #include <sys/eventfd.h>
 #else
@@ -67,6 +85,28 @@ int eventfd_read(int fd, eventfd_t *value)
 }
 #endif
 
+#ifdef CONFIG_MEMFD
+#include <fcntl.h>
+
+#ifndef F_LINUX_SPECIFIC_BASE
+#define F_LINUX_SPECIFIC_BASE 1024
+#endif
+
+#ifndef F_ADD_SEALS
+#define F_ADD_SEALS (F_LINUX_SPECIFIC_BASE + 9)
+#define F_GET_SEALS (F_LINUX_SPECIFIC_BASE + 10)
+
+#define F_SEAL_SEAL     0x0001  /* prevent further seals from being set */
+#define F_SEAL_SHRINK   0x0002  /* prevent file from shrinking */
+#define F_SEAL_GROW     0x0004  /* prevent file from growing */
+#define F_SEAL_WRITE    0x0008  /* prevent writes */
+#endif
+#endif
+
+#ifndef MAP_NORESERVE
+#define MAP_NORESERVE 0
+#endif
+
 #include "include/atomic.h"
 
 #include "libvhost-user.h"
diff --git a/subprojects/libvhost-user/libvhost-user.h b/subprojects/libvhost-user/libvhost-user.h
index aedb1da96d..a2f0add832 100644
--- a/subprojects/libvhost-user/libvhost-user.h
+++ b/subprojects/libvhost-user/libvhost-user.h
@@ -18,9 +18,9 @@
 #include <stdbool.h>
 #include <stddef.h>
 #include <poll.h>
-#include <linux/vhost.h>
 #include <pthread.h>
 #include "standard-headers/linux/virtio_ring.h"
+#include "standard-headers/linux/vhost_types.h"
 
 /* Based on qemu/hw/virtio/vhost-user.c */
 #define VHOST_USER_F_PROTOCOL_FEATURES 30

-- 
2.55.0

