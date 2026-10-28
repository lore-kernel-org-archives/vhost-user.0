Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793207803;
	b=XTTeXzff90w8f/hiYuJ8buhI596jd6gKge7/u7xeIs094/mZWkBXtGdJ53cxVYkeoMeN
	 zq8Hv1IdJZesIa4SMatEfxK/vzTaiT/hzYXoU986U59vdWYFJTxtltBVcJXGO/s06YkUC
	 /4Js028TpfW+wvHMw0G1RbT6rgqujESwGBhpQ/ugfpWABUqhcgrVE4+yXJF9pld+DDjFV
	 9zgQ/lcNA1QdKAgWLPXmYS6LInEl15yDu1FH+kQ3rTU1JAC2+Va1M4ouBalDCTfsQFAF2
	 I2PSDnEkjB/iRJpaSFZMFI8QwHtBc3gnUtr1x7WzpIaTNjoJt+ym7TArmc1WFCWpLZg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793207803;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:In-Reply-To:X-Mailer:X-Mutt-Fcc:X-Mimecast-Spam-Score:
	 X-Mimecast-MFC-PROC-ID:X-Mimecast-Originator:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding;
	bh=dWpOsnChQtr3kRDdC1FT+mgnTXjmcTTbX2EopbWkNRs=;
	b=Jwo1pZgAi5SrjadzjIgaFrVfbXtcjioFpBphjtJe0cncmSPADRIo5Y0e8qV3CTbn4ggS
	 jaZiOxz5L0um1Zsrt/GToYRL/qYvsjQD5TRAqbpjrgF11n3iA1+Dh6BJ6Pbs+KtHQaPcF
	 AA0NlfVZIzW3hPqnE0sfijO686rFJH9c1T+OSpysoRu6maMOlFDNTZlJd7hfN/CzPcoe2
	 osrs5jfCtZ2y4HBQ441F7GVykvclOB4NRKFhGeoHUAyR35TKUbDqrDNXtIKN+z5u+q5cJ
	 rnEu0djqjVNOAktScwTLdUwCZfajQwwwBt6rnhkDwRUPo3e7XCr7lGKzr5kjAhT9Yvg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=L2VmCykM;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17DD6606A31A
	for <vhost-user@lists.linux.dev>; Wed, 28 Oct 2026 17:16:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 17DD6606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=L2VmCykM
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793207802;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dWpOsnChQtr3kRDdC1FT+mgnTXjmcTTbX2EopbWkNRs=;
	b=L2VmCykMdhxz164QaQ6PnSE5iM0h0hKRqx6QTBQOfSw77GdZqlXRTgFGh8RjG56YWSxAp4
	1feNV2KNnGwsejWDK7LhNE7WzxG2ugkuk8TGrIUXZ+e84IuiGXOGy986AMNdM08KSz/oFM
	2f7IXcjcwgw5Ou5+KH+cN0pzjTQ3Mus=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-694-zynItV1nPxSyM9p_DK7GIg-1; Wed, 28 Oct 2026 13:16:40 -0400
X-MC-Unique: zynItV1nPxSyM9p_DK7GIg-1
X-Mimecast-MFC-AGG-ID: zynItV1nPxSyM9p_DK7GIg_1793207799
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-48e1291432aso902077f8f.2
        for <vhost-user@lists.linux.dev>; Wed, 28 Oct 2026 10:16:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793207799; x=1793812599;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=dWpOsnChQtr3kRDdC1FT+mgnTXjmcTTbX2EopbWkNRs=;
        b=pbePN5S7g5f3tBU4xlwGw898dwRAcR/SfXSuRz1CFiZxSS6z2K4o8L0YRFPWfviK6U
         0abJfUeWkKgH3ad/KPg713hrFdsaNAqBHQcrbx0nGhLTaGSXfbNgaX/RZGpix3yJjBsV
         bge9qM1Ixqgbk/9Wg6xpS/Dt4DBQSQH6Uk5v3rRXwNia3RXaS1s01lvs7CS6Xh925WLc
         7/5qg0HxDYCN2nmwUHcnz/eJxq+mwK6gohRC0WiH8Hn59uIy4kcNp0/6DA+S9gVLiVd9
         E7KDOCtONNPR9yOVJS4jwlewrf27TorIjZVUEsDzuTJ9ivbjmuFqO5/O6/r8+abxophh
         nVlQ==
X-Forwarded-Encrypted: i=1; AKwUvBzpAErfzX9NnxBSW+cvMlX6/xWP48fQzdWRONQuB9FkyWoPWLrC8Ftt5UNkHT4dtLUCT/2/aXURHGrM@lists.linux.dev
X-Gm-Message-State: AFq9FYLmqrvsKJa032npv+qkjC0DPAHh1XSlkxP6yggt2jwpVw3wFOng
	yg2vqcDzS5t9SVziY1y+cgm6jLogCRG14FZqrNDOcB+ysQZqhVufuSMcA8AEKPsTVQi8CnblE2p
	B7tEkhiYBMt+36aCf3Vna1TQy3Xy1+m7kfPAFctx2s0tMx1rUt1uq6CXZ/Sx0FYw=
X-Gm-Gg: AYBFou1i8tDY2hR8fhRBirFl3NkVGDCXv2b2v+YEofgz/2T9Ni7yrMCvUIaUZJrDy53
	ehdFO2D0brVa+E8kBQlfXJECEeJ3uu+FfIvQu1Mp8l1E/CfOkGjAYKhnrYZZ5DU8ks/Uo5/a9kp
	MV2qa9W4S77J9d+QC8qIFDspXEZUmgpwoG6OOSD9RTBvkMJEcdCJMix21wJ+CBRCGYLGKBVOTb8
	52IDlGsSrEXjH5cPVpOu4EkTNAsdEMrnnYHrylPNaGcE+Fh2RfZ6EOQp7oqeF1+1rfGZAHNUts7
	LbE/PHLX8h8wqGVZM8QyKXKPMYh7/+i+ihjaX9iUIxWGmpzcXFlkMSBQjAqAN+0KyQWdW8h1WWf
	cNg17xZfkh3J5OKwlSamrWZsa6sQ0thubsPl50yEL
X-Received: by 2002:a05:6000:4553:b0:48a:f0cd:8712 with SMTP id ffacd0b85a97d-48e5d5e26a6mr5110946f8f.50.1793207799283;
        Wed, 28 Oct 2026 10:16:39 -0700 (PDT)
X-Received: by 2002:a05:6000:4553:b0:48a:f0cd:8712 with SMTP id ffacd0b85a97d-48e5d5e26a6mr5110895f8f.50.1793207798667;
        Wed, 28 Oct 2026 10:16:38 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:1536:fc00:b838:383:1c7:6e81])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebc4d76sm30009609f8f.12.2026.10.28.10.16.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 10:16:37 -0700 (PDT)
Date: Wed, 28 Oct 2026 13:16:36 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Stefano Garzarella <sgarzare@redhat.com>,
	Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
	vhost-user@lists.linux.dev
Subject: [PULL 60/78] vhost-user: add dedicated mailing list
Message-ID: <f5992d68d3dff73e17f65264d5e443ac40d546ad.1793207602.git.mst@redhat.com>
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
X-Mimecast-MFC-PROC-ID: hZDJ1-H35-YJ-LgmipD5doXHVtrYjhals6nkL3IGf-0_1793207799
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

From: Stefano Garzarella <sgarzare@redhat.com>

During the "Virtio and Vhost-User Ecosystem for Production and
Automotive Systems" BoF at LPC 2026 [1] we discussed and agreed on
creating a new vhost-user mailing list, mainly for changes to the
specification and discussions around the protocol.

The main reason is that the vhost-user specification is also used
by other VMMs and implemented by several back-ends outside the QEMU
repository, whose developers often do not follow qemu-devel.

Add a paragraph in the specification about the new mailing list and
a dedicated MAINTAINERS entry for the vhost-user protocol, covering
the specification, the QEMU front-end and libvhost-user (back-end
library).

[1] https://lpc.events/event/20/contributions/2365/

Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Message-ID: <20261023162441.89450-1-sgarzare@redhat.com>
---
 MAINTAINERS                 | 12 ++++++++++--
 docs/interop/vhost-user.rst |  6 ++++++
 2 files changed, 16 insertions(+), 2 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index d7ec12ac39..04842adba6 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2544,19 +2544,27 @@ M: Michael S. Tsirkin <mst@redhat.com>
 R: Stefano Garzarella <sgarzare@redhat.com>
 S: Supported
 F: hw/*/*vhost*
-F: docs/interop/vhost-user*
 F: docs/system/devices/virtio/vhost-user*
 F: contrib/vhost-user-*/
 F: backends/*vhost*
 F: include/system/vhost-user-backend.h
 F: include/hw/virtio/vhost*
 F: include/*/vhost*
-F: subprojects/libvhost-user/
 F: block/export/vhost-user*
 F: util/vhost-user-server.c
 F: net/vhost*
 F: tests/functional/x86_64/test_vhost_user_bridge.py
 
+vhost-user protocol
+M: Michael S. Tsirkin <mst@redhat.com>
+R: Stefano Garzarella <sgarzare@redhat.com>
+L: vhost-user@lists.linux.dev
+S: Supported
+F: docs/interop/vhost-user*
+F: hw/virtio/vhost-user.c
+F: include/hw/virtio/vhost-user.h
+F: subprojects/libvhost-user/
+
 vhost-shadow-virtqueue
 R: Eugenio Pérez <eperezma@redhat.com>
 F: hw/virtio/vhost-shadow-virtqueue.*
diff --git a/docs/interop/vhost-user.rst b/docs/interop/vhost-user.rst
index 488214a306..c31a75def3 100644
--- a/docs/interop/vhost-user.rst
+++ b/docs/interop/vhost-user.rst
@@ -38,6 +38,12 @@ conventions <backend_conventions>`.
 The *front-end* and *back-end* can be either a client (i.e. connecting) or
 server (listening) in the socket communication.
 
+The protocol is developed and discussed on the `vhost-user mailing list
+<mailto:vhost-user@lists.linux.dev>`_, archived at
+https://lore.kernel.org/vhost-user/. Until October 2026, when this list
+was created, discussions took place on the qemu-devel mailing list,
+archived at https://lore.kernel.org/qemu-devel/.
+
 Support for platforms other than Linux
 --------------------------------------
 
-- 
MST

