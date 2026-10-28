Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793207798;
	b=TfjN4HJNLnLG/oDfShVek4HhZ048qFaHo3KLF/lgcfkzIMyoK+j3Tu4fOJmn7DS0xryM
	 tD7n74dBcEer8IO8gjnphuP2mzx45AMYaCYE+WzePn8bvrbIvTLeYWlKFL8kJHx93N6oV
	 Yx4AaN9sdKLrDXHwazhvYgjMwfQ3lYsLoMo6pDOf9Gzo+ZMCRr765LVuthleQSPfUfUkM
	 bhf31G6WGLndCciBRSiE4MZoWrFFeejSLInxCpxhHDXHV0txX3cbfWfUD9RULE4i6TYQ6
	 cjKbUYcBKytdGyh5u/mDuQczNoAGXl+Bkv7X/e1P5S9pIzHoUJGrU35WmRO4yt9YMhA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793207798;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:In-Reply-To:X-Mailer:X-Mutt-Fcc:X-Mimecast-Spam-Score:
	 X-Mimecast-MFC-PROC-ID:X-Mimecast-Originator:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding;
	bh=AOOjb2+T7Uz3dqto95pa8UMd7Sn0XzzF+CFE3iv5nxI=;
	b=Q5y5uJiih/3Pk+2enYmGs2+aPd9/+HrLBpAoRocvNl612ipY3ud67Q2y1B9Z6mw45nBb
	 ViyjE3KPeRewih0p4AJIw5X79HBA6mvNNfGls6FqhGoPIelUGZP2uUl19/L56FLDGMhij
	 99XKQ46NxnHh03cb8yQPpuGPcSnT82LwSvzjfAu8qwu4tIkILu45Qh5tv+jzOxAy0VeUX
	 1b0jaldr+5hX86yem5oJhj8x/PmcxSe4Tu+FVGsV0MIaSZw4fa8lGNx27d8zgOtNihxsa
	 st7qCwr7fZMExmMQMdz+tklWqmsA6U1jHx3VpNqskBSjn2nW6jeU3uCcN6FaPl7hpgw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=UZCc33s1;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8A4C606A31A
	for <vhost-user@lists.linux.dev>; Wed, 28 Oct 2026 17:16:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C8A4C606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=UZCc33s1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793207796;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AOOjb2+T7Uz3dqto95pa8UMd7Sn0XzzF+CFE3iv5nxI=;
	b=UZCc33s1je6Smk6XEXaEpH5Ob37xQzTRJLJnXCmqoPSROnNEUPLW1bRAhKZXi3lIsWf6EM
	iuf2VEuNzT43bRHOCuaNjbpPDK+fgWbFNOwpZ+VNVJbQ96ruzBKtHsjL5SL1XzuPiTBar1
	vDYwei7sczWnAfSwiOlsbFbZLBEwlS4=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-373-Y3Yin1d1PoenVl7QCzCTQg-1; Wed, 28 Oct 2026 13:16:34 -0400
X-MC-Unique: Y3Yin1d1PoenVl7QCzCTQg-1
X-Mimecast-MFC-AGG-ID: Y3Yin1d1PoenVl7QCzCTQg_1793207793
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-48df730c035so782924f8f.0
        for <vhost-user@lists.linux.dev>; Wed, 28 Oct 2026 10:16:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793207793; x=1793812593;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=AOOjb2+T7Uz3dqto95pa8UMd7Sn0XzzF+CFE3iv5nxI=;
        b=IiHIkUi1D4AKY92qidSn1H+206sSXRqF5SYb3DiE2wS9HW31vbcBmMeJUlD8Rn4qSs
         E0sz37LsGSYq98LV4MdRo5y6/zFkeKEWYfCPF2ZxEYgP9/VzRVHBEjZqlKLh7+V/L7qr
         6+66Lkgk4yOR9t8w6DjdH3KFTPo0c0fo5b8jZiiCO9aLag1snUXoJ1KEv3HJrCX5KeAX
         8VFxBoKcdaQDc0WJgMpjDxm759k+AAI3hAgASvGDgtQ/+/zM7DPytvA91FHr+On6vCDU
         Z+2i3cswWSFbwppV7K6SeX/gHaOkSRPs9djKEYKTGvUXJixd5xI2qPbr5y+VKrTL3FeG
         et9Q==
X-Forwarded-Encrypted: i=1; AKwUvBywA8GJVA9sf9IvnUu7Dk/p12mcfIAVZcy1kl01QRNUaK7uc/y1Uoqz05kcd3SC8WpoP8/EFjgrBSuS@lists.linux.dev
X-Gm-Message-State: AFq9FYKc/G4XjeVlaJDfDC3PNmAtvMVY2SrQ86/B+sW70DGjWnjUzS1O
	zSaSbEGFdzgiDtJoW9MIk7ZMLMwJ+nlpLhTQoWgYHvDJS0qiIAaPlpzZH6z2dpGR8dN3btebbch
	HNtI8cZSI0QCOCxBmOfnd3suVkLwogHTbBdNLSwyym17rvTOe5vs958fd2Qz80hE=
X-Gm-Gg: AYBFou3XP94kC8aizNyA2DjQ0FmAwlpyiZuYsqjoh+qzBXuX41m3qvf5ee8ZIGwEqCp
	+8zQpoOEqj48Fe9CUprSyxxmWgAaB4NImx30zgQeWSFrPdU//tfrgsMYwQLq6AAZurkjPszvyzI
	yaGBMDdfbN74O+XE9+6V27YPTYvrvymQh5hhsfvXCigOcTg6w3/dyZPflRXlcuutD/3ycwQ0cT1
	bGQqp+JU20ze1nxiaVaTWYDZW+PFEMP9JYS+5pCSQUfqvc2rRqqzGzabqTolkg1UhTNPK5zCfZc
	AHQZ2Yj1g4C5HVMcr8VWnSecZm83BKYqM8uDquxagA+cyDSzxWqRw89HXvPqOW+7T/nkdgRIZoM
	RVPIjckV2ryVOGny+zA6I9TiQLmHtvcoPZqIHITcR
X-Received: by 2002:a05:6000:178b:b0:48b:5e2:52dd with SMTP id ffacd0b85a97d-48e5d5c3874mr8409607f8f.11.1793207792972;
        Wed, 28 Oct 2026 10:16:32 -0700 (PDT)
X-Received: by 2002:a05:6000:178b:b0:48b:5e2:52dd with SMTP id ffacd0b85a97d-48e5d5c3874mr8409524f8f.11.1793207792283;
        Wed, 28 Oct 2026 10:16:32 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:1536:fc00:b838:383:1c7:6e81])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e4806e208sm23942614f8f.40.2026.10.28.10.16.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 10:16:31 -0700 (PDT)
Date: Wed, 28 Oct 2026 13:16:29 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Alexandr Moshkov <dtalexundeer@yandex-team.ru>,
	=?utf-8?Q?Cl=C3=A9ment?= Chigot <chigot@adacore.com>,
	Stefano Garzarella <sgarzare@redhat.com>,
	vhost-user@lists.linux.dev
Subject: [PULL 58/78] vhost: move skip-drain feature check to vhost-user
Message-ID: <1272a3d91519108ebcb9e5a8f5f1b838ea2ecb24.1793207602.git.mst@redhat.com>
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
X-Mimecast-MFC-PROC-ID: aiRX4IQPj8Oo3x2CL0IF3sfDIqw8x4_ej7fKt8WF_eY_1793207793
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

From: Alexandr Moshkov <dtalexundeer@yandex-team.ru>

Currently, do_vhost_virtqueue_stop() calls
vhost_user_has_protocol_feature(), causing a link failure with
--disable-vhost-user when other vhost backends are enabled.

Move the assertion to vhost_user_get_vring_base_skip_drain(), keeping
the protocol feature check in the vhost-user backend and removing
the dependency from the common vhost code.

Reported-by: Clément Chigot <chigot@adacore.com>
Fixes: 5eb2347867ee ("vhost-user: add skip_drain param to do_vhost_virtqueue_stop")
Signed-off-by: Alexandr Moshkov <dtalexundeer@yandex-team.ru>
Acked-by: Stefano Garzarella <sgarzare@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Message-ID: <20260929122223.2164612-1-dtalexundeer@yandex-team.ru>
---
 hw/virtio/vhost-user.c | 4 +---
 hw/virtio/vhost.c      | 5 -----
 2 files changed, 1 insertion(+), 8 deletions(-)

diff --git a/hw/virtio/vhost-user.c b/hw/virtio/vhost-user.c
index 3402accc6f..402d9603c0 100644
--- a/hw/virtio/vhost-user.c
+++ b/hw/virtio/vhost-user.c
@@ -1463,9 +1463,7 @@ static int vhost_user_get_vring_base_skip_drain(struct vhost_dev *dev,
     bool skip_drain_supported = vhost_user_has_protocol_feature(dev,
                                VHOST_USER_PROTOCOL_F_GET_VRING_BASE_SKIP_DRAIN);
 
-    if (!skip_drain_supported) {
-        return 0;
-    }
+    assert(skip_drain_supported);
 
     return get_vring_base(dev, ring, true);
 }
diff --git a/hw/virtio/vhost.c b/hw/virtio/vhost.c
index cbf6e82afb..b25919c5c7 100644
--- a/hw/virtio/vhost.c
+++ b/hw/virtio/vhost.c
@@ -23,7 +23,6 @@
 #include "qemu/log.h"
 #include "standard-headers/linux/vhost_types.h"
 #include "hw/virtio/virtio-bus.h"
-#include "hw/virtio/vhost-user.h"
 #include "hw/mem/memory-device.h"
 #include "migration/blocker.h"
 #include "migration/misc.h"
@@ -1554,10 +1553,6 @@ static int do_vhost_virtqueue_stop(struct vhost_dev *dev,
                                    unsigned idx, bool force,
                                    bool skip_drain)
 {
-    if (skip_drain) {
-        assert(vhost_user_has_protocol_feature(dev,
-               VHOST_USER_PROTOCOL_F_GET_VRING_BASE_SKIP_DRAIN));
-    }
     int vhost_vq_index = dev->vhost_ops->vhost_get_vq_index(dev, idx);
     struct vhost_vring_state state = {
         .index = vhost_vq_index,
-- 
MST

