Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792796497;
	b=DrW0gEO8rjQdB/PxfKvL+5c1AxktsxS3G1SuwZJQqwGfTqJcQUZRAsR7bqhg/ChSZ/nw
	 rAcKre1aJcUz9P2l8DAC6DVSvU/cd79rYHjWcXxUsXhtxgouayPEBjtV0iunR5u1zb5Si
	 8SOlC5s5u/F4FkcVIkqjIB0pnXvgT66FuTlgfyOnGPJewx4A6m2XnGYJNAyt6pD+e+V+5
	 OazR5me9THtTvRNAiLAkTwI82DwLtq8mbUn0Yuva9wRHtoIq+mC8OUMvFtaj45fOjNnPv
	 JyOw9gxdb1hj5c8hNWYw3HhntOpHFcdPWxfvpq9xzcKAu9REHElKbIucn8JWebSVWZg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792796497;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:In-Reply-To:X-Mimecast-Spam-Score:X-Mimecast-MFC-PROC-ID:
	 X-Mimecast-Originator:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding;
	bh=PwLD211UVaqu7pPKoIP8ESXXlc0IwvVvX30TV5bc3zI=;
	b=dtsUs19aDJtgLgU7wPgkf4oRs0bjzyN3radQCKsRB5ifenpS/HG5vkBY5ciP+T+bym7M
	 mO1BsLaq0aqotr0UA+kDWhDRS7oeUaM+pwkVo5ZtmhqtGFhgTtlO6y7lWPluD+o2UUZLy
	 0/zK+Q1o0k4OndBP9wEI6/RnFYU7PojPxNe0TDerwdKssRzts8nlChlOebmhcu6J1qVnp
	 ckVk2iMxZmmvj9mlayWeV6OHmngxcRg3iLgVGkms+otkNxAf6FitQbrYe6/Zw9RuNqjCg
	 Yb3zTq51K6mEHESGqS9IjGTW5J8T/n8oglC4fuA5WE4d82Ll9R0UsiJdbAPTThwA7IA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b="B/tzl7OH";
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5771606A31B
	for <vhost-user@lists.linux.dev>; Fri, 23 Oct 2026 23:01:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D5771606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=B/tzl7OH
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792796495;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PwLD211UVaqu7pPKoIP8ESXXlc0IwvVvX30TV5bc3zI=;
	b=B/tzl7OH9UkZ5G7Oapn9RUzfOkInfn14VKnre/fo4t+WpDSBzGubVS/oWC2wBaoCiYgKlp
	cygwzxMNS/tI1K53DypwVz3tqIg7UibgS2RtmOSTlGC+LyTJFZxeVVYwLSBZ5v0Cf1TaLx
	ctUuQmANvAJrZJS9LJNa9jC5qBcBNwM=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-606-gmH9x2Z5O1aAzP3hJjQ2bQ-1; Fri, 23 Oct 2026 19:01:34 -0400
X-MC-Unique: gmH9x2Z5O1aAzP3hJjQ2bQ-1
X-Mimecast-MFC-AGG-ID: gmH9x2Z5O1aAzP3hJjQ2bQ_1792796493
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-48c430f0f01so1036951f8f.1
        for <vhost-user@lists.linux.dev>; Fri, 23 Oct 2026 16:01:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792796493; x=1793401293;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=PwLD211UVaqu7pPKoIP8ESXXlc0IwvVvX30TV5bc3zI=;
        b=Do9gA8mOd0Eq/0jWcJG0goeDS+JGhoRTRvh7lBQBGhW/5n3UoSe0EYPclrECX7yLfJ
         wreeY3WR1CZz47XVzffbq2OQdwG6iuQfWhJ0KuDiQ43Gfr85cxvMxHDdWV/S7F9CVAtW
         Px3WgC87b3YmnxruFp3JpUhNpxgiWEh99oT1qzZv554060WqWihrI9bHHgS9SFdGvcw2
         X3gJk5Knv1oe2m545XZzJQ0uOvsDWmk442EHJChy7lKX7/auy8m0EZRuq8PnodzRcZt1
         WKMb/+9IzqAKd8ftStzAyJKMcLAtCMU9GrEIDk/zLG7eXOPTuKlwO02zAL8DIdOUTdXs
         XxDQ==
X-Forwarded-Encrypted: i=1; AKwUvBzjYIu+S2YXsgdPPylhJZ9/X5zy0UGhmezH41txXfIY7ajl7+giKVpU2UQB6A/m+3aXIssCR9OS+QCW@lists.linux.dev
X-Gm-Message-State: AFq9FYLUTZYuc10ig7dM4b/d4AvtHVjYavfPZsrnAEjkbowWM/iSmKLy
	y5LV/g4Fo9faVribPRcJ9DQWG2B4Sr2ndxxTJl4vMRzdol1vBPmhGZjePaJ20H0v5BNN7eB2KfE
	SkDZJCbVJMU42Z231GUzbi/vurQaPiqxAR0Q27y0CVo0Vf6DE58t+OgC7pPlbKco=
X-Gm-Gg: AYBFou1lcg3tiuVM8kmYWkGXJtkqkY5OGkviM/KpEfwgaxI+RCZJBo3OqXn9wsenkS9
	rnp2Aa0/qUeFFqOdOSGPvYWlGP6thFU+IGB4Cafbba/RdalTqJ3OD04Pack0SQRcnuXUfvRxYkX
	8aIaF+56y2inQQYDN0NHrxNmHDr6qPQZQN2elR+sdcYwk4nHCh2QefdFmIknYKZ7ycfzo1SUhKU
	wAxsHoF0763ROXG/KhLXNFznbvJFJc9dvW5pKZcvPdz7tX76bZGP2Dph2hNqor+FMdYwmwwVlwg
	0YiUzxMlxgBIpRbmaoSF/wokKVT7zZiX9cPGaH311SiQJ8xhOLIoRsybjMs1z2uvcqDNQjo=
X-Received: by 2002:a05:600c:4e87:b0:4a1:f99e:f22d with SMTP id 5b1f17b1804b1-4a35acafe0dmr5967735e9.6.1792796492869;
        Fri, 23 Oct 2026 16:01:32 -0700 (PDT)
X-Received: by 2002:a05:600c:4e87:b0:4a1:f99e:f22d with SMTP id 5b1f17b1804b1-4a35acafe0dmr5967235e9.6.1792796492252;
        Fri, 23 Oct 2026 16:01:32 -0700 (PDT)
Received: from redhat.com ([2a06:c701:73f6:2400:30a8:9e33:7d82:c035])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a359fc1207sm11090945e9.1.2026.10.23.16.01.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 16:01:30 -0700 (PDT)
Date: Fri, 23 Oct 2026 19:01:28 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Stefano Garzarella <sgarzare@redhat.com>
Cc: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
	qemu-devel@nongnu.org, Dorinda Bassey <dbassey@redhat.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Albert Esteve <aesteve@redhat.com>,
	Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
	vhost-user@lists.linux.dev
Subject: Re: [PATCH] vhost-user: add dedicated mailing list
Message-ID: <20261023190116-mutt-send-email-mst@kernel.org>
References: <20261023162441.89450-1-sgarzare@redhat.com>
 <atuSO02ui1nOWKsQ@redhat.com>
 <20261023132627-mutt-send-email-mst@kernel.org>
 <atucq-HuQIj_zXCk@sgarzare-redhat>
X-Mailing-List: vhost-user@lists.linux.dev
List-Id: <vhost-user.lists.linux.dev>
List-Post: <mailto:vhost-user@lists.linux.dev>
List-Help: <mailto:vhost-user+help@lists.linux.dev>
List-Subscribe: <mailto:vhost-user+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:vhost-user+unsubscribe@lists.linux.dev>
List-Owner: <mailto:vhost-user+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
In-Reply-To: <atucq-HuQIj_zXCk@sgarzare-redhat>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: g3g16WeYe69CxOfas54EoIw12O52Pc_k_mRqRw4TZeQ_1792796493
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Fri, Oct 23, 2026 at 07:50:34PM +0200, Stefano Garzarella wrote:
> On Fri, Oct 23, 2026 at 01:26:45PM -0400, Michael S. Tsirkin wrote:
> > On Fri, Oct 23, 2026 at 05:58:35PM +0100, Daniel P. Berrangé wrote:
> > > On Fri, Oct 23, 2026 at 06:24:40PM +0200, Stefano Garzarella wrote:
> > > > From: Stefano Garzarella <sgarzare@redhat.com>
> > > >
> > > > During the "Virtio and Vhost-User Ecosystem for Production and
> > > > Automotive Systems" BoF at LPC 2026 [1] we discussed and agreed on
> > > > creating a new vhost-user mailing list, mainly for changes to the
> > > > specification and discussions around the protocol.
> > > 
> > > You say the list is for discussions around the spec / protocol, but...
> > > 
> > > > The main reason is that the vhost-user specification is also used
> > > > by other VMMs and implemented by several back-ends outside the QEMU
> > > > repository, whose developers often do not follow qemu-devel.
> > > >
> > > > Add a paragraph in the specification about the new mailing list and
> > > > a dedicated MAINTAINERS entry for the vhost-user protocol, covering
> > > > the specification, the QEMU front-end and libvhost-user (back-end
> > > > library).
> > > 
> > > ...this MAINTAINERS addition means the mailing list will be CC'd
> > > on all code patches sent to QEMU for those file patterns. Are you
> > > sure that's content that members of the list want to be sent
> > > unconditionally ?
> 
> I added them mainly because QEMU is kind of a reference implementation,
> indeed during the discussion we agreed on keeping the spec file in QEMU
> source git, because we saw a value on asking for both spec and code changes.
> And also because other implementers can be interested on issues/fixes of
> QEMU front-end and back-end code.
> 
> But yeah, I see your point, I can leave just spec files if we think it's
> just noise.
> 
> > > 
> > > 
> > 
> > Good point. Let's make it a separate section?
> 
> Do you mean a `vhost-user specification` section with just the spec (and the
> new mailing list), and another `vhost-user implementation` section with the
> code (without the mailing list)?

Right.

> Not sure about that, the code is already covered by `vhost`.
> 
> Thanks,
> Stefano
> 
> > 
> > > >
> > > > [1] https://lpc.events/event/20/contributions/2365/
> > > >
> > > > Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
> > > > ---
> > > >  MAINTAINERS                 | 12 ++++++++++--
> > > >  docs/interop/vhost-user.rst |  6 ++++++
> > > >  2 files changed, 16 insertions(+), 2 deletions(-)
> > > >
> > > > diff --git a/MAINTAINERS b/MAINTAINERS
> > > > index d9209f043f..dcdb65d8cb 100644
> > > > --- a/MAINTAINERS
> > > > +++ b/MAINTAINERS
> > > > @@ -2532,19 +2532,27 @@ M: Michael S. Tsirkin <mst@redhat.com>
> > > >  R: Stefano Garzarella <sgarzare@redhat.com>
> > > >  S: Supported
> > > >  F: hw/*/*vhost*
> > > > -F: docs/interop/vhost-user*
> > > >  F: docs/system/devices/virtio/vhost-user*
> > > >  F: contrib/vhost-user-*/
> > > >  F: backends/*vhost*
> > > >  F: include/system/vhost-user-backend.h
> > > >  F: include/hw/virtio/vhost*
> > > >  F: include/*/vhost*
> > > > -F: subprojects/libvhost-user/
> > > >  F: block/export/vhost-user*
> > > >  F: util/vhost-user-server.c
> > > >  F: net/vhost*
> > > >  F: tests/functional/x86_64/test_vhost_user_bridge.py
> > > >
> > > > +vhost-user protocol
> > > > +M: Michael S. Tsirkin <mst@redhat.com>
> > > > +R: Stefano Garzarella <sgarzare@redhat.com>
> > > > +L: vhost-user@lists.linux.dev
> > > > +S: Supported
> > > > +F: docs/interop/vhost-user*
> > > > +F: hw/virtio/vhost-user.c
> > > > +F: include/hw/virtio/vhost-user.h
> > > > +F: subprojects/libvhost-user/
> > > > +
> > > >  vhost-shadow-virtqueue
> > > >  R: Eugenio Pérez <eperezma@redhat.com>
> > > >  F: hw/virtio/vhost-shadow-virtqueue.*
> > > > diff --git a/docs/interop/vhost-user.rst b/docs/interop/vhost-user.rst
> > > > index c1e02ff7e9..198ad30f5c 100644
> > > > --- a/docs/interop/vhost-user.rst
> > > > +++ b/docs/interop/vhost-user.rst
> > > > @@ -38,6 +38,12 @@ conventions <backend_conventions>`.
> > > >  The *front-end* and *back-end* can be either a client (i.e. connecting) or
> > > >  server (listening) in the socket communication.
> > > >
> > > > +The protocol is developed and discussed on the `vhost-user mailing list
> > > > +<mailto:vhost-user@lists.linux.dev>`_, archived at
> > > > +https://lore.kernel.org/vhost-user/. Until October 2026, when this list
> > > > +was created, discussions took place on the qemu-devel mailing list,
> > > > +archived at https://lore.kernel.org/qemu-devel/.
> > > > +
> > > >  Support for platforms other than Linux
> > > >  --------------------------------------
> > > >
> > > > --
> > > > 2.56.0
> > > >
> > > >
> > > 
> > > With regards,
> > > Daniel
> > > --
> > > |: https://berrange.com       ~~        https://hachyderm.io/@berrange :|
> > > |: https://libvirt.org          ~~          https://entangle-photo.org :|
> > > |: https://pixelfed.art/berrange   ~~    https://fstop138.berrange.com :|
> > 

