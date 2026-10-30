Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793359298;
	b=O5mHB5ttE6rL3ek3Cdpyq5GvuX03STJQ4ZhUEH4wqiBJRYG7WqZjpYFKB+PYxDrxDB0h
	 JykUGpIU6pU2ObYgb98g08cpKNiVatmXAbpllrOuBsjbF1msU10Ke6Ld9JwdZl3CYoD62
	 w0KTm9B/94RYcDnDEn7YAq4VTzp0zl3AjHkF0cxCcjvsmH8dIOaApuWkoNiLHgKCneAQE
	 Vr7altnSvqEiT0SvPzCMOUUvCFXmuwx90TONRVVLIBI9KhOd7heEkMH8LLT15NoSv6ob+
	 qRpzS8AhziQZtuJrmw+zWrm/CvVwUkongiR/fPEK6taPPo7+WJKWbjLirwPc+4JX6tQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793359298;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=CtFQfS3ZPQMOHEPZqYufRtBAPULATHXGwg5wUHbxOvE=;
	b=uFiRp+ZFyWASbqIT/j7ltcVx/g1OZANUyfcgahHAGv8+aUbx9vFy3MYKbsU0URLhMFME
	 CE25xV3e9o5zat3adXM9jTgK50KHL8U4IkAvtqMKeO+boVbFytpL7mk/KML5XnISjcQ+R
	 WsjBFju9TlavEQTbwDjoG2iWwFutxPe3ravqHk7o2pdtIFyYkjbmbD+tPbyBBa+g4cvzS
	 UnceTlR8H1kSe2PNPVROicldr8kVYa8DuUJrqqtIhnQCXWYARQ/D/g/dRblkPijdycEGr
	 2C8+5HkzjacyVgzPW9V8WG1C4uSiGYKpWpWQPfys4H49Y2WIeMOY/gApLTo4MDeij0g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fPB0Wf74;
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25D50606A31C
	for <vhost-user@lists.linux.dev>; Fri, 30 Oct 2026 11:21:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 25D50606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fPB0Wf74
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-48afcfc4bf5so550690f8f.1
        for <vhost-user@lists.linux.dev>; Fri, 30 Oct 2026 04:21:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793359296; x=1793964096; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CtFQfS3ZPQMOHEPZqYufRtBAPULATHXGwg5wUHbxOvE=;
        b=fPB0Wf74Ddsold8L+u02PDkLE9U2MFvILvZZCkyLXpd4vAoh2Fw9fRxhN9fS5O++gd
         y6a8oWWErHUlyJZzxSRB7rxJ0302ixLybFcwx3PCcFEs5IlxFEKUVKqy3nEZYgVObZi2
         /By73wWDCQ7LXfwRnyCl6i5K2KxufD0iNTpgkfkAF73Vi0N3NKtKfOT1gUbRBnl6Hkc2
         a2YvxaHNsumfELBL51Y+Kpn1EbGkmIT8VEvZXN1OSjayKOKVZkmDJPr1oaT3bMm72/O4
         wQn1lRYuQEB65KHfJGUWi9DReA67A+VzAY5dj5NVzOQjJW0CtaL05xgtJQ8DORYcu5bp
         zdgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793359296; x=1793964096;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CtFQfS3ZPQMOHEPZqYufRtBAPULATHXGwg5wUHbxOvE=;
        b=KFJnoKKDaREqNv/a+Am6ZikseX40NBesnlcGEUi9uoej3eMHOvPz8oZZIrXGkG3tHj
         JpV+daf9KhJfGJJ7WdcNeG461rO5HqSsbPpHHogPc7bRyfgy581exgyYtPkPTM5WqgQ/
         aZ2+3xqPBuq0I1oANu2kWPLe15pDVA+/QYZ93XZiUdQRnPnwajyShayykMnh3VAkZYaE
         t1GGz4XQ/UbAqs5wpAABgbRTZjzXF9eq8S7ZK5bfR8yneBMtge4sRmv7UnM9soK7zugH
         IeTkAPbqM2402RqArpSIjDV09yTMgIjHhBpQQCq19l+7AsiVPho7xJpgG/loJxNdLvMW
         ThJQ==
X-Forwarded-Encrypted: i=1; AKwUvBxmW7kxHj0UmCZinrZ1yCMr7BlpQppYqyfBQTPzZeciKjY6XJLrhrxXfhGwR7J8BDWU0kneT7i4Np1c@lists.linux.dev
X-Gm-Message-State: AFq9FYLjg9GdmzFUvK5M6FG4hjThtazCxT0gOiCvb2UhvhBe44jjiV0Y
	Ze1h/FnNO3/6e65k+cWhZyhzM7d10FjZ1tGU5VZ44qEuw50eJFwTRGTw
X-Gm-Gg: AYBFou3rbQSF/iYa4yJcGg4/TDo4BHCyxc+6BB9+u1InhxVfMjZnvSCNjtOkXZlbe+V
	3HKvyg9VXIwMu+gkU6JfdOPs8X0MAr4i7Bhq36pk06vDQKao5CHh2sIRgaKVmAYhXW4L8pXvv6Z
	ad7Xs/d2ORj7JiDcQMm7OwlWRecIVBoFXVPSfC8mjSCFBv1+WERPgXAMD1j3V1xVPfUz5myRuIg
	+3TGuDhM10V3xq9mlH2HJUyaqi4YAnrMPyQ9DkthVw/U9x6BaUFeRVSmN4EFTCzI2bKcLF7Wa37
	pmYbQ64tu9KwF3IRrB6bD1JZQ4sfgeeDldTXT6tI+QzaLHtRdGDXbsUfP/viwlUyZzQuT6rQvdK
	yBsurnkmNReyb+oC+yq90I7P+zn6h4wfBzhsKVPq5J8xWyR7icHyxNSfq06eHbqGTJx9Vm/km7X
	MP7Lwr6x6NGTOitjTNz4oxBnUBHDJXww31lkiP+9LoT6f6hsMsPvfgP33OUNzb4KgUF66sK34oE
	FZ8BsO5fVSLQsuauQCDuJzFhd1X2tmjYZTG1R3M5EONBHqzXZE6qfetBe9enT/jWIWOzDjlUXke
	Pqjgow3oo08MtFUG24+480wtY4Ng6f9yUcJyzS7t2vFQcdU/Zl/TDEKpBYoi5qennkPaOT2g69a
	ij1+wAnGqUUFkUrdUIszxehqpCb0zupBY3ehFdnbR/aEGzuK2PFawm+FvgP8qAQ==
X-Received: by 2002:a05:6000:200e:b0:48c:466e:9d08 with SMTP id ffacd0b85a97d-48e6e50ab18mr4700925f8f.43.1793359296428;
        Fri, 30 Oct 2026 04:21:36 -0700 (PDT)
Received: from tim-m2.local (dynamic-2a02-3100-61d8-3600-98fd-cd98-7ae6-cb49.310.pool.telefonica.de. [2a02:3100:61d8:3600:98fd:cd98:7ae6:cb49])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71a4d3e9sm2893608f8f.6.2026.10.30.04.21.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 04:21:35 -0700 (PDT)
From: Tim Pambor <timpambor@gmail.com>
Date: Fri, 30 Oct 2026 12:20:58 +0100
Subject: [PATCH v2 5/9] util/oslib-posix: implement qemu_set_blocking()
 with fcntl()
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
Message-Id: <20261030-vhost-user-posix-v2-5-cda7c17aad13@gmail.com>
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

qemu_set_blocking() relies on g_unix_set_fd_nonblocking(), which always
issues fcntl(F_SETFL) even if O_NONBLOCK already has the requested
value.  macOS rejects F_SETFL on POSIX shared memory descriptors.  The
socket channel treats this like a read error and disconnects.  Those
descriptors are passed in blocking mode anyway, so there is nothing to
change on them.  Query the flags with F_GETFL first and only issue
F_SETFL when O_NONBLOCK is actually set.

Signed-off-by: Tim Pambor <timpambor@gmail.com>
---
 util/oslib-posix.c | 26 +++++++++++++++++++-------
 1 file changed, 19 insertions(+), 7 deletions(-)

diff --git a/util/oslib-posix.c b/util/oslib-posix.c
index dc001da66d..3d5bb16ca6 100644
--- a/util/oslib-posix.c
+++ b/util/oslib-posix.c
@@ -252,17 +252,29 @@ void qemu_anon_ram_free(void *ptr, size_t size)
 
 bool qemu_set_blocking(int fd, bool block, Error **errp)
 {
-    g_autoptr(GError) err = NULL;
+    int flags, new_flags;
 
-    if (!g_unix_set_fd_nonblocking(fd, !block, &err)) {
-        error_setg_errno(errp, errno,
-                         "Can't set file descriptor %d %s: %s", fd,
-                         block ? "blocking" : "non-blocking",
-                         err->message);
-        return false;
+    flags = fcntl(fd, F_GETFL);
+    if (flags < 0) {
+        goto fail;
+    }
+
+    if (block) {
+        new_flags = flags & ~O_NONBLOCK;
+    } else {
+        new_flags = flags | O_NONBLOCK;
+    }
+
+    if (new_flags != flags && fcntl(fd, F_SETFL, new_flags) < 0) {
+        goto fail;
     }
 
     return true;
+
+fail:
+    error_setg_errno(errp, errno, "Can't set file descriptor %d %s", fd,
+                     block ? "blocking" : "non-blocking");
+    return false;
 }
 
 int socket_set_fast_reuse(int fd)

-- 
2.55.0

