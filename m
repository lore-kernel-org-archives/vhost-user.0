Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792774727;
	b=bh+t+65AEdIOSZiVasihehTFO98ZOu93VLwlfMTkU1LkycbQPIzL91jDQgqQcvz6ir4C
	 RFDcGFbtW022kCEDPyPbWL6m+I3ChWyXMPnh88Egisd55IXRNsl+77JYgK1GqNjJCCc90
	 3GiqaqPzUpFnb/taAtIhjAMgo73XdrnI8iZN3plOOiZE7AW6m+HzG2CkX0j/0nWavqq6Y
	 3IPzhWz7ewsH2VHU5YHRrQuPiPGtr9ncxP+hmjV8WzL+K+Y9Ts7EChnI2F8an1hyFfB1M
	 4caMNsYSinnLQQyRujtG0IbevDLQ7TsYRGvMRnGYwE1EcHqm8KZzAXLI8+BRT6MmXCw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792774727;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:Date:From:To:Cc:Subject:
	 Message-ID:Reply-To:References:MIME-Version:In-Reply-To:User-Agent:
	 X-Scanned-By:X-Mimecast-MFC-PROC-ID:X-Mimecast-Originator:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding;
	bh=JjTmzfgRIgsxdv35pL8NePUUPwmcEndqQsMdTszIkMo=;
	b=sd9NTDhFWA+7US6v9su/54kLeVq1pzsEqiK/ayD40UBVUWVkowvRCynn02Dlr7ZtVWBt
	 zx5sjMGK1ITzZGcMVB9RGDHurEiVhSyYnFrLb5foAd97pNqivDdT7B7jpjNi/LPQm+t+l
	 2b1dYvUQEDbt8byzqybotJZUU+EBPOBmVDVMkprQWQ3znYBNTPrAsMwfxE/qBqieAU50p
	 xgvSEaY/67gSxdyys3V/Qen97hz4D1DLvpOLBbLkwWXfnd+wQ6AsL5bkPKnN1HFy4NEH+
	 x/EynXEX70qXdjzXIL1OqvQcJq2kIQxvIajBw1OnkuDCdIJ/uQ1RrDitxx1wmUioSDw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=RYoTBO5o;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 580A7606A31D
	for <vhost-user@lists.linux.dev>; Fri, 23 Oct 2026 16:58:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 580A7606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=RYoTBO5o
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792774726;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JjTmzfgRIgsxdv35pL8NePUUPwmcEndqQsMdTszIkMo=;
	b=RYoTBO5o0h3WzEeBCjIwH5feTfplvqrSgmvBakzgo7MxTjBHBwIbmG6MQLxkvTD1TN+9tO
	lflnbtgwDegEyTIRvo59U286KZVy22v9fedkhbrtWNCUfTnAdoU2o442Wf0dYUaNbOP/S+
	QcDQGD37oksv1MnXXx5G4kMcZM9Wmsg=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-170-FAklahg6NF-nmwY-QJ-dMA-1; Fri,
 23 Oct 2026 12:58:42 -0400
X-MC-Unique: FAklahg6NF-nmwY-QJ-dMA-1
X-Mimecast-MFC-AGG-ID: FAklahg6NF-nmwY-QJ-dMA_1792774721
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 656B81956052;
	Fri, 23 Oct 2026 16:58:41 +0000 (UTC)
Received: from redhat.com (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 890C018004D2;
	Fri, 23 Oct 2026 16:58:38 +0000 (UTC)
Date: Fri, 23 Oct 2026 17:58:35 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Stefano Garzarella <sgarzare@redhat.com>
Cc: qemu-devel@nongnu.org, Dorinda Bassey <dbassey@redhat.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Albert Esteve <aesteve@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
	vhost-user@lists.linux.dev
Subject: Re: [PATCH] vhost-user: add dedicated mailing list
Message-ID: <atuSO02ui1nOWKsQ@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <20261023162441.89450-1-sgarzare@redhat.com>
X-Mailing-List: vhost-user@lists.linux.dev
List-Id: <vhost-user.lists.linux.dev>
List-Post: <mailto:vhost-user@lists.linux.dev>
List-Help: <mailto:vhost-user+help@lists.linux.dev>
List-Subscribe: <mailto:vhost-user+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:vhost-user+unsubscribe@lists.linux.dev>
List-Owner: <mailto:vhost-user+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
In-Reply-To: <20261023162441.89450-1-sgarzare@redhat.com>
User-Agent: Mutt/2.4.2 (2026-08-30)
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
X-Mimecast-MFC-PROC-ID: JqeMSwRUyxCOV15kAWxUm0E2tdno3zmkYU5LkjrLlgY_1792774721
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Fri, Oct 23, 2026 at 06:24:40PM +0200, Stefano Garzarella wrote:
> From: Stefano Garzarella <sgarzare@redhat.com>
> 
> During the "Virtio and Vhost-User Ecosystem for Production and
> Automotive Systems" BoF at LPC 2026 [1] we discussed and agreed on
> creating a new vhost-user mailing list, mainly for changes to the
> specification and discussions around the protocol.

You say the list is for discussions around the spec / protocol, but...

> The main reason is that the vhost-user specification is also used
> by other VMMs and implemented by several back-ends outside the QEMU
> repository, whose developers often do not follow qemu-devel.
> 
> Add a paragraph in the specification about the new mailing list and
> a dedicated MAINTAINERS entry for the vhost-user protocol, covering
> the specification, the QEMU front-end and libvhost-user (back-end
> library).

...this MAINTAINERS addition means the mailing list will be CC'd
on all code patches sent to QEMU for those file patterns. Are you
sure that's content that members of the list want to be sent
unconditionally ?



> 
> [1] https://lpc.events/event/20/contributions/2365/
> 
> Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
> ---
>  MAINTAINERS                 | 12 ++++++++++--
>  docs/interop/vhost-user.rst |  6 ++++++
>  2 files changed, 16 insertions(+), 2 deletions(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index d9209f043f..dcdb65d8cb 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2532,19 +2532,27 @@ M: Michael S. Tsirkin <mst@redhat.com>
>  R: Stefano Garzarella <sgarzare@redhat.com>
>  S: Supported
>  F: hw/*/*vhost*
> -F: docs/interop/vhost-user*
>  F: docs/system/devices/virtio/vhost-user*
>  F: contrib/vhost-user-*/
>  F: backends/*vhost*
>  F: include/system/vhost-user-backend.h
>  F: include/hw/virtio/vhost*
>  F: include/*/vhost*
> -F: subprojects/libvhost-user/
>  F: block/export/vhost-user*
>  F: util/vhost-user-server.c
>  F: net/vhost*
>  F: tests/functional/x86_64/test_vhost_user_bridge.py
>  
> +vhost-user protocol
> +M: Michael S. Tsirkin <mst@redhat.com>
> +R: Stefano Garzarella <sgarzare@redhat.com>
> +L: vhost-user@lists.linux.dev
> +S: Supported
> +F: docs/interop/vhost-user*
> +F: hw/virtio/vhost-user.c
> +F: include/hw/virtio/vhost-user.h
> +F: subprojects/libvhost-user/
> +
>  vhost-shadow-virtqueue
>  R: Eugenio Pérez <eperezma@redhat.com>
>  F: hw/virtio/vhost-shadow-virtqueue.*
> diff --git a/docs/interop/vhost-user.rst b/docs/interop/vhost-user.rst
> index c1e02ff7e9..198ad30f5c 100644
> --- a/docs/interop/vhost-user.rst
> +++ b/docs/interop/vhost-user.rst
> @@ -38,6 +38,12 @@ conventions <backend_conventions>`.
>  The *front-end* and *back-end* can be either a client (i.e. connecting) or
>  server (listening) in the socket communication.
>  
> +The protocol is developed and discussed on the `vhost-user mailing list
> +<mailto:vhost-user@lists.linux.dev>`_, archived at
> +https://lore.kernel.org/vhost-user/. Until October 2026, when this list
> +was created, discussions took place on the qemu-devel mailing list,
> +archived at https://lore.kernel.org/qemu-devel/.
> +
>  Support for platforms other than Linux
>  --------------------------------------
>  
> -- 
> 2.56.0
> 
> 

With regards,
Daniel
-- 
|: https://berrange.com       ~~        https://hachyderm.io/@berrange :|
|: https://libvirt.org          ~~          https://entangle-photo.org :|
|: https://pixelfed.art/berrange   ~~    https://fstop138.berrange.com :|

