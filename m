Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792777851;
	b=IyVtPHtPwiN4yw1zvYhmdMyLs0q+5xtJhKIextC0uPeMy7fDyN+AA8zB2SMtwmnmnQm+
	 HcZd8OfWVnmOAHJ85cX2Bi7OkHUFo9J8tdvxgdGP22/6KFZ4Qwo6EwujC6px39gLpEunX
	 tDAxL8+sEO5o352eJMxS4u15eObI6E/5Esz0oGXlU2aMHKEZvFdjPiw6nZezVCNQzL1jZ
	 sw8JaWAVeWC4qBrY6CVsjd/Z0wYI4G0lBmki2Jux67Nm/p5ec0FLFHURL1BwC6fT+/gA4
	 YS61VmDA7u0ve7y9Ap6ISjg4TdWpO367a6DLO/wvWR83CaRHaQ1gHbQVXcrDD2kNslg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792777851;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:In-Reply-To:X-Mimecast-Spam-Score:X-Mimecast-MFC-PROC-ID:
	 X-Mimecast-Originator:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding;
	bh=CugUozewjWHX80CQRKUYYDjpFAt9FQqtNIAskqD2gpA=;
	b=RTzTuCu/3ZQBj+4ZYocMrSo0hZu0yLBn99WUMRleC4rKwNnfnVB8ymWxmnmEnZ2jVAI0
	 l/HwdPBV7DxQ00PsRWJHlQLPPG6DoUGDH5BEn1opjETwMsWmKxIdiSYf2c2NivQbqVMFr
	 FeRO8PU33amisIzlUCqGxP8pLbwHYl4LyTf+FD+R/W4DKtl+3OI+Ja4/BPEk7c0mxd+ZC
	 KciKA/Ib3KZDYvvQqW0/QyVSeBS5keCNqlLnMuBOrQlaroOgkRDcMxr/TX6bec74J+z3H
	 cqVmLtnojbzGtu38tWZ8+811H5vpXBt0eGmxJnDxqwStDL7Le6Y3VRGb52woUXOnsQg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=V6L9z9uE;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A94D606A322
	for <vhost-user@lists.linux.dev>; Fri, 23 Oct 2026 17:50:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6A94D606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=V6L9z9uE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792777849;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CugUozewjWHX80CQRKUYYDjpFAt9FQqtNIAskqD2gpA=;
	b=V6L9z9uEnYHZdJVCwIzId5DEGrRLBx8gn+pg2hhIG1KEEg2Lm1j+bJsboP5p6RcCQ0bTrf
	MoTauM8jMKCE4ppHvCjejTxe6oN4lj88TnMZbOG/vgGr8LbEpliefJ+Towl7hYAcaWM5UZ
	vOXtLfzAyPhHKJpU5cZhEkLcREQGMwA=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-493-kUdEVYi1NW-PhBLMmSbgGw-1; Fri, 23 Oct 2026 13:50:45 -0400
X-MC-Unique: kUdEVYi1NW-PhBLMmSbgGw-1
X-Mimecast-MFC-AGG-ID: kUdEVYi1NW-PhBLMmSbgGw_1792777844
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4a2063be141so9784795e9.1
        for <vhost-user@lists.linux.dev>; Fri, 23 Oct 2026 10:50:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792777844; x=1793382644;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=CugUozewjWHX80CQRKUYYDjpFAt9FQqtNIAskqD2gpA=;
        b=pch/qnToWNwNwlH3KVfJv2cDdE8nozVYC7M75ZrIER2X9tgEt+WFbYIGcyUd936MaU
         vXZwj2/ekLbQtFNYrUhw8xCx2SBFkzW0z16xyKIx2NK2wvbrn+A+h7g4iP/kkTvKxDGR
         F8ymaVPjrszLkSkZVAhfd/wX3ukDplZ4jSfAQd9rcjf8nxcicZ10RPUfvf5XcNuFEk1A
         JXOjQFOEzNU3G5Nz8H4njgzPp1yQ35HZ1Wt5qVXojHS3Vw38Qh8FLNbVgFX19gS3nzdb
         aRq66FgPS9c03YSTJViOXoY8Pnw7b74Gy0Qkw08SD2nDsVj5BYQnsnakg1s5DgHBUGA9
         TL6Q==
X-Forwarded-Encrypted: i=1; AKwUvBwl671LoAAyK/9NOKDvkwDgyMdgPslYFenvUX5kX71ecwPdhD1+fSvC1e347Zw1UCjAGUlQPKQciwOi@lists.linux.dev
X-Gm-Message-State: AFq9FYLFtKWd0RBL1q2pluyMTuAEIZCTHFNmifV0i31h2uB/aERffIqW
	TYrvGyWKm27wSO/pHgafkXz+XTIMDwlNNAUQJwEMVLWMzTylnKiJCw+z1tXrPlcmYZBCKDYR4m4
	bptrVF6WxesAQc4xzWaXkw+zU5Eb5j9c0wybqV8debNrCa95WyFJq88RXPR4mPcs=
X-Gm-Gg: AYBFou1+sAcFROOxlljoOYIHEpRf2gvFg4JDXlfUM/hy2sofBJQEGMyqQpliaD4wPJo
	0yxlVCsVuYVC7BeGXWHIOc66wlPy5wOJbQzL42TqqSin5FVgRFEgzN04pobtEYyt/w0wm868O5z
	HQtRIjiBDtTR6fsNfXU3RLfG6HsicSFnwCU0b1SBzPF6pYytivXbqbozo2P09G55iIsnxZ9pzxq
	bpTSC5y5TINcDfNvmx4StFZlXKLPUARyXSeZIviK587tqxtl6jWxzvfyvvXXEmrTlV+yMcExSp1
	olKfBmcBOMH0ojTIqzruNf8EbsrP65X7i71KFLAg6IUBZAQMK9BnOPIgwrGWsQ0Yol9BY0vBA8J
	Ftw==
X-Received: by 2002:a05:600c:470d:b0:4a1:fba8:b13d with SMTP id 5b1f17b1804b1-4a211caf202mr48524565e9.9.1792777843825;
        Fri, 23 Oct 2026 10:50:43 -0700 (PDT)
X-Received: by 2002:a05:600c:470d:b0:4a1:fba8:b13d with SMTP id 5b1f17b1804b1-4a211caf202mr48524295e9.9.1792777843177;
        Fri, 23 Oct 2026 10:50:43 -0700 (PDT)
Received: from sgarzare-redhat ([5.179.131.81])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a29cd9d09csm20670065e9.5.2026.10.23.10.50.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 10:50:42 -0700 (PDT)
Date: Fri, 23 Oct 2026 19:50:34 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>, 
	Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, Dorinda Bassey <dbassey@redhat.com>, 
	Stefan Hajnoczi <stefanha@redhat.com>, Albert Esteve <aesteve@redhat.com>, 
	Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>, vhost-user@lists.linux.dev
Subject: Re: [PATCH] vhost-user: add dedicated mailing list
Message-ID: <atucq-HuQIj_zXCk@sgarzare-redhat>
References: <20261023162441.89450-1-sgarzare@redhat.com>
 <atuSO02ui1nOWKsQ@redhat.com>
 <20261023132627-mutt-send-email-mst@kernel.org>
X-Mailing-List: vhost-user@lists.linux.dev
List-Id: <vhost-user.lists.linux.dev>
List-Post: <mailto:vhost-user@lists.linux.dev>
List-Help: <mailto:vhost-user+help@lists.linux.dev>
List-Subscribe: <mailto:vhost-user+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:vhost-user+unsubscribe@lists.linux.dev>
List-Owner: <mailto:vhost-user+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
In-Reply-To: <20261023132627-mutt-send-email-mst@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: f_raTXZmFzouGpX3idgX3lXhYVqQBMmhky_NZ8OLdHQ_1792777844
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Fri, Oct 23, 2026 at 01:26:45PM -0400, Michael S. Tsirkin wrote:
>On Fri, Oct 23, 2026 at 05:58:35PM +0100, Daniel P. Berrangé wrote:
>> On Fri, Oct 23, 2026 at 06:24:40PM +0200, Stefano Garzarella wrote:
>> > From: Stefano Garzarella <sgarzare@redhat.com>
>> >
>> > During the "Virtio and Vhost-User Ecosystem for Production and
>> > Automotive Systems" BoF at LPC 2026 [1] we discussed and agreed on
>> > creating a new vhost-user mailing list, mainly for changes to the
>> > specification and discussions around the protocol.
>>
>> You say the list is for discussions around the spec / protocol, but...
>>
>> > The main reason is that the vhost-user specification is also used
>> > by other VMMs and implemented by several back-ends outside the QEMU
>> > repository, whose developers often do not follow qemu-devel.
>> >
>> > Add a paragraph in the specification about the new mailing list and
>> > a dedicated MAINTAINERS entry for the vhost-user protocol, covering
>> > the specification, the QEMU front-end and libvhost-user (back-end
>> > library).
>>
>> ...this MAINTAINERS addition means the mailing list will be CC'd
>> on all code patches sent to QEMU for those file patterns. Are you
>> sure that's content that members of the list want to be sent
>> unconditionally ?

I added them mainly because QEMU is kind of a reference implementation, 
indeed during the discussion we agreed on keeping the spec file in QEMU 
source git, because we saw a value on asking for both spec and code 
changes. And also because other implementers can be interested on 
issues/fixes of QEMU front-end and back-end code.

But yeah, I see your point, I can leave just spec files if we think it's 
just noise.

>>
>>
>
>Good point. Let's make it a separate section?

Do you mean a `vhost-user specification` section with just the spec (and 
the new mailing list), and another `vhost-user implementation` section 
with the code (without the mailing list)?

Not sure about that, the code is already covered by `vhost`.

Thanks,
Stefano

>
>> >
>> > [1] https://lpc.events/event/20/contributions/2365/
>> >
>> > Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
>> > ---
>> >  MAINTAINERS                 | 12 ++++++++++--
>> >  docs/interop/vhost-user.rst |  6 ++++++
>> >  2 files changed, 16 insertions(+), 2 deletions(-)
>> >
>> > diff --git a/MAINTAINERS b/MAINTAINERS
>> > index d9209f043f..dcdb65d8cb 100644
>> > --- a/MAINTAINERS
>> > +++ b/MAINTAINERS
>> > @@ -2532,19 +2532,27 @@ M: Michael S. Tsirkin <mst@redhat.com>
>> >  R: Stefano Garzarella <sgarzare@redhat.com>
>> >  S: Supported
>> >  F: hw/*/*vhost*
>> > -F: docs/interop/vhost-user*
>> >  F: docs/system/devices/virtio/vhost-user*
>> >  F: contrib/vhost-user-*/
>> >  F: backends/*vhost*
>> >  F: include/system/vhost-user-backend.h
>> >  F: include/hw/virtio/vhost*
>> >  F: include/*/vhost*
>> > -F: subprojects/libvhost-user/
>> >  F: block/export/vhost-user*
>> >  F: util/vhost-user-server.c
>> >  F: net/vhost*
>> >  F: tests/functional/x86_64/test_vhost_user_bridge.py
>> >
>> > +vhost-user protocol
>> > +M: Michael S. Tsirkin <mst@redhat.com>
>> > +R: Stefano Garzarella <sgarzare@redhat.com>
>> > +L: vhost-user@lists.linux.dev
>> > +S: Supported
>> > +F: docs/interop/vhost-user*
>> > +F: hw/virtio/vhost-user.c
>> > +F: include/hw/virtio/vhost-user.h
>> > +F: subprojects/libvhost-user/
>> > +
>> >  vhost-shadow-virtqueue
>> >  R: Eugenio Pérez <eperezma@redhat.com>
>> >  F: hw/virtio/vhost-shadow-virtqueue.*
>> > diff --git a/docs/interop/vhost-user.rst b/docs/interop/vhost-user.rst
>> > index c1e02ff7e9..198ad30f5c 100644
>> > --- a/docs/interop/vhost-user.rst
>> > +++ b/docs/interop/vhost-user.rst
>> > @@ -38,6 +38,12 @@ conventions <backend_conventions>`.
>> >  The *front-end* and *back-end* can be either a client (i.e. connecting) or
>> >  server (listening) in the socket communication.
>> >
>> > +The protocol is developed and discussed on the `vhost-user mailing list
>> > +<mailto:vhost-user@lists.linux.dev>`_, archived at
>> > +https://lore.kernel.org/vhost-user/. Until October 2026, when this list
>> > +was created, discussions took place on the qemu-devel mailing list,
>> > +archived at https://lore.kernel.org/qemu-devel/.
>> > +
>> >  Support for platforms other than Linux
>> >  --------------------------------------
>> >
>> > --
>> > 2.56.0
>> >
>> >
>>
>> With regards,
>> Daniel
>> --
>> |: https://berrange.com       ~~        https://hachyderm.io/@berrange :|
>> |: https://libvirt.org          ~~          https://entangle-photo.org :|
>> |: https://pixelfed.art/berrange   ~~    https://fstop138.berrange.com :|
>

