Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792776414;
	b=GiEyTSeg7g3Q3BIqa6U3HBWSvf3aPz9q7ZA07lyzdNXRJglLF81VLpi6ei1pwmsJG5aQ
	 03LBm9TKAAzObBJx7nVGl4++71HjtPhK/Km9UvbJNw699lrbrcQFekvPYAJ8k8W8M5b4x
	 7fi6e8AZkb8ChjskJcAFahmC0rK+ucwhWIdqpYULL2oMBliOCwvat1dNFMpFpJ9kgqtzt
	 EtolIlU61FrD4KPYZT1ghMABBor9iuY7DX1eWrtMLCjzqZyLJpYqtXZaCQpNNsj6uGm/U
	 sKooRrGBzkVCGtx+vCUMz11eSdy0GQ+Xv84a7W0AGsrEsBaaflspyvlkiIox1sA2KNA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792776414;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:In-Reply-To:X-Mimecast-Spam-Score:X-Mimecast-MFC-PROC-ID:
	 X-Mimecast-Originator:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding;
	bh=jAKUqij1gfbZxV4/z4/dQDdc1hDuO7Zccp7zljhgFlM=;
	b=qWeHOKTnAvxld04JSa1CZZMCSHNEnII5+NMJzklOTp9yKH9uV1AI/3bbvaQHf2c4HZxs
	 x5ZYmpjb8LIPLZvF/77Ce2I6PArd/dnFZsAQuscGPbXX+MTlFRHhMbQH42w3gpy3LMRPP
	 0+cd6gr78eSVZlzFFMlAHLSFoYFQCmwhHgT7GGzDqNkfR19BFVKInEAD8E7LYB2vsiDQN
	 sbm+kkOKSoXNcFKXnb/BwU45BQaOGTF0Z45n5vrRqN8oNs4Fl942Y2Li/YBASuQ02l59F
	 07DrPrMyV6R+eGLVndPOrAP/xuuMLBOJIPIwmt8oLNj2h2xNTpksvek6ElVK5lDNeuA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=AvZMqm3U;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E22AC606A31A
	for <vhost-user@lists.linux.dev>; Fri, 23 Oct 2026 17:26:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E22AC606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=AvZMqm3U
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792776412;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jAKUqij1gfbZxV4/z4/dQDdc1hDuO7Zccp7zljhgFlM=;
	b=AvZMqm3UtZzg1Rz/4zAkVLBz+cjPb1yhlfXCQM5Qmfg6cFqJmEu0sWWxUu/vz5IDPlaKnJ
	66mefP5js8lKmeln+6hz3Tvnz+YuDh4tNdedHTFE0hLw6GAmgl4ZJYID/jGU95npBg6rT4
	9J8RDuGoic150fgfE6nO7HO9mHT3miM=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-361-FLelR18vMcie0XHwJjOsTA-1; Fri, 23 Oct 2026 13:26:51 -0400
X-MC-Unique: FLelR18vMcie0XHwJjOsTA-1
X-Mimecast-MFC-AGG-ID: FLelR18vMcie0XHwJjOsTA_1792776410
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4a2063be13dso8918715e9.3
        for <vhost-user@lists.linux.dev>; Fri, 23 Oct 2026 10:26:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792776410; x=1793381210;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=jAKUqij1gfbZxV4/z4/dQDdc1hDuO7Zccp7zljhgFlM=;
        b=tDedUfJBpShDIC2WOiO/KNN8wymavFTS64jx1oAHljLbXeD2PF6y43Yq4TgfXmH8wL
         gLWbuu/BczdNgeKD0S0pouepjgP/8YBZPd0LVhXK/psecGJ1QOS8g9+JMncxg+xwzQEr
         iNwV3iGFchHbsob8PS2ZQswNIAu8am4nJa3Aw7CH7K1E6S6qexYLSNmQFruyvSqPwXiy
         KIXvazcrUj11rQJOXLcLEnX7jLzJZXVsjYxgwG3fvCc1YvHr9fvjZ1KuCin6x0TBX58K
         TuQ97MczPQCteW2C57v7RkpwZZkZ2vvEgTRlPylpLQes7oUejSiuUFiuLWXRj4LseqgC
         vakw==
X-Forwarded-Encrypted: i=1; AKwUvByXsS+Ddh9dpNWn/phhB7U8JwJAEG2ShurE2Ld6Rg9iTrLLMR2QNgp+/x74hfiORJt4t5UHWLwiNNVX@lists.linux.dev
X-Gm-Message-State: AFq9FYJ74erDIdL+FOMvLFhvMXPFKgFS6WCucA+64QK4njAULbTxXQCZ
	ehjMknyETRhibWpED/fW0SBt7ZnIYLo6PBe2uz6IfZ2xbce8G/YEjcX9zNTuDfn4QNjVZgrBcTj
	vD8qFR4AC7a9CcoXKxfXyti70hn+BembVr/L292syxNyKO07PG4ScIf+Dpq6PHZ4=
X-Gm-Gg: AYBFou3nhVnaLLnG1oAR/KrsyAKtxSlKHb6e+7E1q3yRFn+qnCkqg4O+OnceD2IYIo8
	ts+gJqbUYU8beyT7CcMXy2Hf6KCZgMAfwKDae1wVpe/wKuvag4xcV7cY2piTt+//Z9e05OcgDgb
	oIVNQHoLoRaijP54J5A7k87nr1OYB2cdWJcsTJVU1TrLnyW5FZp8mXlEyITiBVvCpDeaFKGO2sm
	AW1mVVuFInBdxZGpzwe0xaimOtFssfZRHruiDBbhBicinZdvIVFe5wT9TqqjuLCXoUrnsyNfpc8
	i3rk83O1OKQNXME8+sRK+wEsJH8Jx1dvcO9G3Mm03ONEKCk3RhF+WP8x3/ovjH/+1AQwbJY=
X-Received: by 2002:a05:600c:354b:b0:4a1:97c6:d2e8 with SMTP id 5b1f17b1804b1-4a211ef95e3mr52870105e9.32.1792776409809;
        Fri, 23 Oct 2026 10:26:49 -0700 (PDT)
X-Received: by 2002:a05:600c:354b:b0:4a1:97c6:d2e8 with SMTP id 5b1f17b1804b1-4a211ef95e3mr52869515e9.32.1792776409149;
        Fri, 23 Oct 2026 10:26:49 -0700 (PDT)
Received: from redhat.com ([2a06:c701:73f6:2400:30a8:9e33:7d82:c035])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a2959197d2sm18671455e9.0.2026.10.23.10.26.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 10:26:48 -0700 (PDT)
Date: Fri, 23 Oct 2026 13:26:45 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Cc: Stefano Garzarella <sgarzare@redhat.com>, qemu-devel@nongnu.org,
	Dorinda Bassey <dbassey@redhat.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Albert Esteve <aesteve@redhat.com>,
	Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
	vhost-user@lists.linux.dev
Subject: Re: [PATCH] vhost-user: add dedicated mailing list
Message-ID: <20261023132627-mutt-send-email-mst@kernel.org>
References: <20261023162441.89450-1-sgarzare@redhat.com>
 <atuSO02ui1nOWKsQ@redhat.com>
X-Mailing-List: vhost-user@lists.linux.dev
List-Id: <vhost-user.lists.linux.dev>
List-Post: <mailto:vhost-user@lists.linux.dev>
List-Help: <mailto:vhost-user+help@lists.linux.dev>
List-Subscribe: <mailto:vhost-user+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:vhost-user+unsubscribe@lists.linux.dev>
List-Owner: <mailto:vhost-user+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
In-Reply-To: <atuSO02ui1nOWKsQ@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Zl14F3hxviOGaSBDimnN7Z89CduYScZ9G6e8gJUjULQ_1792776410
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Fri, Oct 23, 2026 at 05:58:35PM +0100, Daniel P. Berrangé wrote:
> On Fri, Oct 23, 2026 at 06:24:40PM +0200, Stefano Garzarella wrote:
> > From: Stefano Garzarella <sgarzare@redhat.com>
> > 
> > During the "Virtio and Vhost-User Ecosystem for Production and
> > Automotive Systems" BoF at LPC 2026 [1] we discussed and agreed on
> > creating a new vhost-user mailing list, mainly for changes to the
> > specification and discussions around the protocol.
> 
> You say the list is for discussions around the spec / protocol, but...
> 
> > The main reason is that the vhost-user specification is also used
> > by other VMMs and implemented by several back-ends outside the QEMU
> > repository, whose developers often do not follow qemu-devel.
> > 
> > Add a paragraph in the specification about the new mailing list and
> > a dedicated MAINTAINERS entry for the vhost-user protocol, covering
> > the specification, the QEMU front-end and libvhost-user (back-end
> > library).
> 
> ...this MAINTAINERS addition means the mailing list will be CC'd
> on all code patches sent to QEMU for those file patterns. Are you
> sure that's content that members of the list want to be sent
> unconditionally ?
> 
> 

Good point. Let's make it a separate section?

> > 
> > [1] https://lpc.events/event/20/contributions/2365/
> > 
> > Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
> > ---
> >  MAINTAINERS                 | 12 ++++++++++--
> >  docs/interop/vhost-user.rst |  6 ++++++
> >  2 files changed, 16 insertions(+), 2 deletions(-)
> > 
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index d9209f043f..dcdb65d8cb 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -2532,19 +2532,27 @@ M: Michael S. Tsirkin <mst@redhat.com>
> >  R: Stefano Garzarella <sgarzare@redhat.com>
> >  S: Supported
> >  F: hw/*/*vhost*
> > -F: docs/interop/vhost-user*
> >  F: docs/system/devices/virtio/vhost-user*
> >  F: contrib/vhost-user-*/
> >  F: backends/*vhost*
> >  F: include/system/vhost-user-backend.h
> >  F: include/hw/virtio/vhost*
> >  F: include/*/vhost*
> > -F: subprojects/libvhost-user/
> >  F: block/export/vhost-user*
> >  F: util/vhost-user-server.c
> >  F: net/vhost*
> >  F: tests/functional/x86_64/test_vhost_user_bridge.py
> >  
> > +vhost-user protocol
> > +M: Michael S. Tsirkin <mst@redhat.com>
> > +R: Stefano Garzarella <sgarzare@redhat.com>
> > +L: vhost-user@lists.linux.dev
> > +S: Supported
> > +F: docs/interop/vhost-user*
> > +F: hw/virtio/vhost-user.c
> > +F: include/hw/virtio/vhost-user.h
> > +F: subprojects/libvhost-user/
> > +
> >  vhost-shadow-virtqueue
> >  R: Eugenio Pérez <eperezma@redhat.com>
> >  F: hw/virtio/vhost-shadow-virtqueue.*
> > diff --git a/docs/interop/vhost-user.rst b/docs/interop/vhost-user.rst
> > index c1e02ff7e9..198ad30f5c 100644
> > --- a/docs/interop/vhost-user.rst
> > +++ b/docs/interop/vhost-user.rst
> > @@ -38,6 +38,12 @@ conventions <backend_conventions>`.
> >  The *front-end* and *back-end* can be either a client (i.e. connecting) or
> >  server (listening) in the socket communication.
> >  
> > +The protocol is developed and discussed on the `vhost-user mailing list
> > +<mailto:vhost-user@lists.linux.dev>`_, archived at
> > +https://lore.kernel.org/vhost-user/. Until October 2026, when this list
> > +was created, discussions took place on the qemu-devel mailing list,
> > +archived at https://lore.kernel.org/qemu-devel/.
> > +
> >  Support for platforms other than Linux
> >  --------------------------------------
> >  
> > -- 
> > 2.56.0
> > 
> > 
> 
> With regards,
> Daniel
> -- 
> |: https://berrange.com       ~~        https://hachyderm.io/@berrange :|
> |: https://libvirt.org          ~~          https://entangle-photo.org :|
> |: https://pixelfed.art/berrange   ~~    https://fstop138.berrange.com :|

