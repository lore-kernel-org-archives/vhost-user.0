Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793207646;
	b=WVG3STmXeXfCV50x6KbodMs+E3EbhhZO8+S5YtGTehhs+o2v1xeZZsCHfDOcTFiWUtHE
	 SVHZJX4+k395RuW4gYE2XOJFbsKP8BUA5o7hOwqqz/wqGk/SEqge83EIgHwpzMa6+JAmu
	 /TuewTjUwJknzbe9KWpZregMPe96bxopRvlZJVUaArFX+lpHS7ME9CVBnOfyiq96X3jgu
	 yrmT0GobaQkezzlB8GLeRmvzXTk8jFy9bQ8UFS8JKWwtYh3GqQvAhwnntWH8vvQtqEjYR
	 xtNb3otc1NaRsA5nJN6fmPtOxJZTGZvNNpZ6FZGTT6aNe2CL/uyqzLs4aMm3mwE/tbg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793207646;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:In-Reply-To:X-Mailer:X-Mutt-Fcc:X-Mimecast-Spam-Score:
	 X-Mimecast-MFC-PROC-ID:X-Mimecast-Originator:Content-Type:
	 Content-Disposition;
	bh=68TZ/UNOYrfsI1OvgOkxCF/VF1VTKHMvsk4ni4+G3Xs=;
	b=SkBB8vS+1DG/nUvX9xbclWjaHsjaDkkyEoMTFFp3WAUJbUpreGvnAr1/LjB2dpM27SBn
	 DhzzfIeLlyDHfeG4tUcX+yTEdviclJTf9uEfdqabDSkixNr2pYcSGcqXE0TrvRT4H6yXO
	 i8NmxepZrorZqbrRvsLqPRryOi/lg6EYxTUzzzOap7Io6XrBwBlDMYXJn5d4AEMSKP2NC
	 VI8q/VPPZHy9g0mP2LwGySB6mJdx2GHeep3o6WkMIFicrX1JgJWdu/Qi0qw3cKlqgvORl
	 mH5dK7smU0kwDLCLp2FTg5YEjDUknJfQcXqf2yA/ZCFzdprA24gUylHPpGEcswNQeqw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=EB9Nz45k;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03E8C606A31A
	for <vhost-user@lists.linux.dev>; Wed, 28 Oct 2026 17:14:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 03E8C606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=EB9Nz45k
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793207645;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=68TZ/UNOYrfsI1OvgOkxCF/VF1VTKHMvsk4ni4+G3Xs=;
	b=EB9Nz45k4sCE66NtvEdP1JMSva4VAvk47aChp0crJg3sT/it+b1IkcoTHdqPBwLS0gZULQ
	pePpWvfC1O1Z63WZ1tkrGbXKcbuT+JaLFgxs6No2yR2rFF1wNSE8mkiSPdRFI80spoeBAc
	6M6IKECJ9UNGCTxrgIHODERIQMfs+3A=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-130-waZxL6xMNkuTAaJcnaLSOw-1; Wed, 28 Oct 2026 13:14:02 -0400
X-MC-Unique: waZxL6xMNkuTAaJcnaLSOw-1
X-Mimecast-MFC-AGG-ID: waZxL6xMNkuTAaJcnaLSOw_1793207641
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-48dea677afcso726604f8f.1
        for <vhost-user@lists.linux.dev>; Wed, 28 Oct 2026 10:14:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793207641; x=1793812441;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=68TZ/UNOYrfsI1OvgOkxCF/VF1VTKHMvsk4ni4+G3Xs=;
        b=mYiv1paa5asaupqJbrAyC4swiWkfE06mZg7fYNUx/u0mkfjf7XAB36B1PHjA2oj8Hn
         QTPGnlYJaAwjY71sw8H5CiIcp7tW5m5y7mdx8x/xZ+EhaULwhOweNThy2SZhxgkvT8vt
         Oh76fA1Zl87oZHc/VgI/QzKeVTkrNzVc1NpwYFFaXm4Yhr3Um9C2QWsXF2E9wcQSjOPH
         q30qFCS7fpcODidYjZCL+yUgt3ag4xOGCcBvrGSQeemmBEor+lY1nMSmSHawqRuTmjqT
         LzCVorYfpiYT/5YEqKHhtY3D4swbAcpsXokdYStyRjaVshnErGR4gidDLxz/4yrdvk4e
         Fzbg==
X-Forwarded-Encrypted: i=1; AKwUvBzXtQgFvE30Eug2SWPF6v/wjfMlO5ZNVcEX10+iaknhqDSQKXxsx33gz3LXxePlteIj8GXMPwq46WTP@lists.linux.dev
X-Gm-Message-State: AFq9FYIUckpsdpSu15XEMBltHrqbagS+Z9qC4vTlH6F3cCaVw3S1WNei
	c8xbuQ044jbOIUEx9eseW5rfvJkjNYsuxOqNqXMi5IbrLHlMrvrKMxyJyUPZFA/rgnfXQ3EooXt
	eN4KNP+tEVkqhj9Z9rTFU352xgIMYbKVULMp6QI8oivhCjj4sX+zHQUfbRdPC6L8=
X-Gm-Gg: AYBFou3zsWAJDpbwWS3GhsXnk5i0mD1X6BQMDVx5o0+rlPuWsK9xq03ZVhQdxZldY7P
	7QE6v1nVjmXV8r82MSk7ec72txgBexwBoLymhPukq5PF0/H6BfKUKxW7y7m961nuZyyboAlAD9W
	wzkyjnthwTDr2P7lm45MZFKK6iPBagMCK4B3787oTwquykQFtXEOQx9R8vYJLE4xt+TgLtbSszk
	KjD7QLOWE8TgAwm5pW4xrzJ7S6RtNZUs4+HXfQASuInxf0/ZWswzGqttN3JyamgkYWnsD5NCD1Q
	uBSlpQ+ll5tppWTX/bjycRPxpcjyqBwHpyN2sll+yYad7mE1uiO6QiScpVqvjYh/dZj9ZK6+39F
	IWBXM1zwd//qFwGyrYZI5X9Gj6Hq3jC3LTD1Rt9zy
X-Received: by 2002:adf:fed2:0:b0:48a:f4d4:e1f3 with SMTP id ffacd0b85a97d-48e64979d4dmr358415f8f.13.1793207641122;
        Wed, 28 Oct 2026 10:14:01 -0700 (PDT)
X-Received: by 2002:adf:fed2:0:b0:48a:f4d4:e1f3 with SMTP id ffacd0b85a97d-48e64979d4dmr358348f8f.13.1793207640563;
        Wed, 28 Oct 2026 10:14:00 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:1536:fc00:b838:383:1c7:6e81])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecd3c32sm30639985f8f.47.2026.10.28.10.13.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 10:14:00 -0700 (PDT)
Date: Wed, 28 Oct 2026 13:13:57 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Stefano Garzarella <sgarzare@redhat.com>,
	luzhixing12345 <luzhixing12345@gmail.com>,
	Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
	vhost-user@lists.linux.dev
Subject: [PULL 02/78] vhost-user: fix SET_MEM_TABLE number of regions
Message-ID: <82b5c5d4b7514f96cd2e652180219fe833071e59.1793207602.git.mst@redhat.com>
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
X-Mimecast-MFC-PROC-ID: 8hXDHeB4J6DCx52YXEs6rgSuygIsRbv92qx7lX6SJvg_1793207641
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

vhost-user.rst says the legacy SET_MEM_TABLE contains 8 regions, but
this does not make sense - we have a num_regions field for this.
And it is not true in practice: if QEMU has less, it sends less.

The incorrect wording was introduced, without explanation, as
part of an editorial cleanup. Probably an oversight.

It's really "up to 8".

Fixes: b87ea798eb83 ("docs: fix vhost-user protocol doc")
Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>
Cc: luzhixing12345 <luzhixing12345@gmail.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Message-ID: <712e301bf7f815412fb264de8159cb3475bd237a.1789469028.git.mst@redhat.com>
---
 docs/interop/vhost-user.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/docs/interop/vhost-user.rst b/docs/interop/vhost-user.rst
index c1e02ff7e9..488214a306 100644
--- a/docs/interop/vhost-user.rst
+++ b/docs/interop/vhost-user.rst
@@ -248,7 +248,7 @@ Multiple Memory regions description
 
 :padding: 32-bit
 
-:regions: regions field contains 8 regions of type :ref:`Memory region description <memory_region_description>`.
+:regions: regions field contains up to 8 regions of type :ref:`Memory region description <memory_region_description>`.
 
 Log description
 ^^^^^^^^^^^^^^^
-- 
MST

