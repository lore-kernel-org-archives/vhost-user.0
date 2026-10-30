Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793359303;
	b=IJ2Ujx6VNz3wFaPt4K6necLrUW4LSsKWSVEZ5cUX+pCmNv/NWjyKut6Q+3+AbbmY4Y/s
	 1fLqimsPUGhYT1XBtOo8AfipXCcXb699gteJWcZcfkiyMPjGNgkDACY3/axydsn0mvm/A
	 XQe+5CNji+RUrC9pW6p66cCy3StXfkNmfo1reDvVXh0LF/xDsVOEq6LGTr27o1vaSwCh/
	 8lWftY8GUKveiR7NxmlLbnCgvVtEBe0QRwfoU+grSa92X1QqerqIS2pYCVnhK0DWaifD+
	 ZV4W/YrrRzvqYldJggE4Zn5xxP/YKzPHcvCA/tW0vq6TcCe68+/2628ijjw1ya1fzLQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793359303;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=6GoihID3NL4nc1Mkmoc/1/qZ8Kz/J2UXjW1hpXDbIGU=;
	b=sZhJok4cW0FU0mXfvHPSEUXS3Pakv8IMn2q3oWdCt3NhD8tUHVZs+M//oa/Zu+inkYRs
	 GONwgVQW39Ra9as+CzRCzpLEFIppDa2KKBW/duSc/Kir6s9SiHApGrc4VtlALqFjm+j9h
	 vT5FLuOXyMSqF4QsXkV3UFydA5lgouqLRo2qfPdlLdIZ2c37kt1puku9QbbolJj59DGZy
	 WgQLBosBLTAQUlfQQ6uN12hCufo4+oFzajYYd5aEoR59xHBA/RLLgrGs7OuZnsWbS+PqK
	 6tWuQk5gJ/7WqcqIRAG/EAjiZUcWNzQZrtaUMyys2xCl3fVW43pSa38N0kpj21SRGvw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ga+OwC7S;
	arc=none smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7A18606A31C
	for <vhost-user@lists.linux.dev>; Fri, 30 Oct 2026 11:21:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C7A18606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ga+OwC7S
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-48b060ec084so315818f8f.0
        for <vhost-user@lists.linux.dev>; Fri, 30 Oct 2026 04:21:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793359301; x=1793964101; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6GoihID3NL4nc1Mkmoc/1/qZ8Kz/J2UXjW1hpXDbIGU=;
        b=Ga+OwC7S1RajpjYCMxYLp02VRXoiSnAJ6uBnczoAecjatMiuXV/3qcyGWn8SsHpTmx
         bQwfKWLx+UCmyt8VXGkSFbSuCxN3iPNhC+W1K7Qdw4GpNBIYdzrza50SGB+W/J6bOQW4
         BBA17iD2+cAJYnPKj3DDIYGNpPYbqqyUekmhBBPFfQuIhjHaAVUohTD6WbDpTHdXhl43
         ykd2sESKxtxeWG8sffut8kfdxWTjK36bJW+oHTJ5D0r1JrZ2tt/rRO4LXSOX2fgB3BYU
         S10E5Z3g56e8YDAvmLGrVepedsBAfds8Z3mcUBXypvtE7DV3nAUNKFUx7tZszqfvSDjv
         GIWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793359301; x=1793964101;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6GoihID3NL4nc1Mkmoc/1/qZ8Kz/J2UXjW1hpXDbIGU=;
        b=OTVOWiQFKvdSHxGMKNUr1kIxUdChd6Sh/EejM2yGfUtEdLQCBby6puyJHdn/egelzR
         1Ns+6rbgOBF/+I8U3HWH2MzpfoSpLsTbU2qJTIUjFY4MNNdQQ5YuLIy+NL71oBSsPnl8
         cQcUEEYqHGHhrsHvfvZiB1JDle8u0lZBnZODXfcWuhoEr4ZE5eaHlybyzwS3Dys4O6JW
         jQWslU+f8eMNbpb6bvpD9svl1J1LuBbajPohMqYB4mD3OfqRJj8Kgw2NBG8YEVvwSWCA
         ViGTkv8vOEV2w+ZrMtWhl6/Rs/+qX9V+vi+vy5KUI0JHIMN2PW8d9GOYHE547gRNvmn8
         s6eQ==
X-Forwarded-Encrypted: i=1; AKwUvBwysEbaqRHohJlBfjDRJSj+99E8GBu4H8siE24dEzONyC3GcbkGOfr36z/QTBJyOMJfAQDbzUBMfy9E@lists.linux.dev
X-Gm-Message-State: AFq9FYIkJa6rAt4MkTHATvHuW51TVqvEjy3UgmmmdtR0LsUi55NMuzNj
	pSR5alwD1I1IyAkN/rBJ9izomxDQxAPCZDq+RhUJX1UJP46wuD27QJb7
X-Gm-Gg: AYBFou1KVANzlHW1l6MZf8vyFzCRZEPAvLVK6//+qqZqXplimWBKkJZ7LwsVdxvwUio
	oOY9xiJIYE6DIh01l9gqut57ZuOV2IGK8oiYKDKHSF0/sZX3ChB4plaVuni3OI+2Jd7Wnm8DfOU
	3hYP7VvyLj7EdsRwQzqZNQoWMU5kc+l6cwzyQVc0X4hFc3DV6AB5ZhJiDIaPLLCuF32jcCZfuwc
	76dNDRV3nG9ctdqf1xxn2WgftgQtICnmNygjaaJ/F9OYyaTKr+/mOxDJeAmTxkTqYSMZd+/doRW
	wR7fiVhAwt8Wr2X/bWjPBucqGDoLeMCW5HCc1uPL1mlBnwUZTEi3T7GdVgidvL6EMMYcqeT1VvE
	4yu0TqpINkGdS3QybB6zfk2iP3t8uWCIrFJC7nLbUMFW5PQxCRrR6VsF2mb9UlpiCjanyRC0S3K
	1XerDJiJYMv7oV5G+eVJFEmas7airWhQHxFa1OoRF/VSwKmE1EmPvc9xY6WvqdqRdPzgFlmB2UE
	al5dakEs41uoaQqRj3U8GlCfHe67e7wHLwr9tbYyoQXhgaD/1P1BuX3QJoD+WDOLaXoVXp9gxG4
	rPGRIWYt0Q0g3N0NNyPco5/HYzBv2SA4qcZtpXsMmrzzuqbCDo7t0w3I/oJDEOy9tLBj1C/KB3A
	QoDLZLBhKgiP759ujRuQEl9058RB+qP0d+fhPfM7jNDsvrIC6AemAfqUCp4lq2A==
X-Received: by 2002:a05:6000:2f84:b0:48e:e98:8b64 with SMTP id ffacd0b85a97d-48e6e2eb232mr4479528f8f.19.1793359301149;
        Fri, 30 Oct 2026 04:21:41 -0700 (PDT)
Received: from tim-m2.local (dynamic-2a02-3100-61d8-3600-98fd-cd98-7ae6-cb49.310.pool.telefonica.de. [2a02:3100:61d8:3600:98fd:cd98:7ae6:cb49])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71a4d3e9sm2893608f8f.6.2026.10.30.04.21.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 04:21:40 -0700 (PDT)
From: Tim Pambor <timpambor@gmail.com>
Date: Fri, 30 Oct 2026 12:21:02 +0100
Subject: [PATCH v2 9/9] contrib/vhost-user-blk: enable it on any POSIX
 system
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
Message-Id: <20261030-vhost-user-posix-v2-9-cda7c17aad13@gmail.com>
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

Let's make the code more portable by adding defines from
block/file-posix.c to support O_DIRECT in other systems (e.g. macOS).

vhost-user-server.c is a dependency, let's enable it for any POSIX
system.

Acked-by: Stefan Hajnoczi <stefanha@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Tested-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
Signed-off-by: Tim Pambor <timpambor@gmail.com>
---
 contrib/vhost-user-blk/vhost-user-blk.c | 14 ++++++++++++++
 meson.build                             |  2 --
 util/meson.build                        |  4 +++-
 3 files changed, 17 insertions(+), 3 deletions(-)

diff --git a/contrib/vhost-user-blk/vhost-user-blk.c b/contrib/vhost-user-blk/vhost-user-blk.c
index 6cc18a1c04..419ad2a10d 100644
--- a/contrib/vhost-user-blk/vhost-user-blk.c
+++ b/contrib/vhost-user-blk/vhost-user-blk.c
@@ -25,6 +25,20 @@
 #include <sys/ioctl.h>
 #endif
 
+/* OS X does not have O_DSYNC */
+#ifndef O_DSYNC
+#ifdef O_SYNC
+#define O_DSYNC O_SYNC
+#elif defined(O_FSYNC)
+#define O_DSYNC O_FSYNC
+#endif
+#endif
+
+/* Approximate O_DIRECT with O_DSYNC if O_DIRECT isn't available */
+#ifndef O_DIRECT
+#define O_DIRECT O_DSYNC
+#endif
+
 enum {
     VHOST_USER_BLK_MAX_QUEUES = 8,
 };
diff --git a/meson.build b/meson.build
index 4f4068e7a7..1250d467a0 100644
--- a/meson.build
+++ b/meson.build
@@ -2177,8 +2177,6 @@ osdep_prefix = '''
 '''
 
 have_vhost_user_blk_server = get_option('vhost_user_blk_server') \
-  .require(host_os == 'linux',
-           error_message: 'vhost_user_blk_server requires linux') \
   .require(have_vhost_user,
            error_message: 'vhost_user_blk_server requires vhost-user support') \
   .disable_auto_if(not have_tools and not have_system) \
diff --git a/util/meson.build b/util/meson.build
index fa174c07a5..54ca587362 100644
--- a/util/meson.build
+++ b/util/meson.build
@@ -105,10 +105,12 @@ if have_block
     util_ss.add(files('filemonitor-stub.c'))
   endif
   if host_os == 'linux'
-    util_ss.add(files('vhost-user-server.c'), vhost_user)
     util_ss.add(files('vfio-helpers.c'))
     util_ss.add(files('chardev_open.c'))
   endif
+  if host_os != 'windows'
+    util_ss.add(files('vhost-user-server.c'), vhost_user)
+  endif
   util_ss.add(files('yank.c'))
 endif
 

-- 
2.55.0

