Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793388885;
	b=DxNF/L1qCKz8FBsqc1sqU4EN9PzfGv4wsJ7UyitrbYNudMqJyHK/2NSUNOa1409dujBS
	 JZcfMmQtkNqJv3REb72dkUyEN1+6ibaXrTM19niOcsANolOJqcZVmpb4TRU47fP22p+0t
	 H8ir5xMgovoro9GUme7vASj1D3UzvG+xTvnMRrxPbXHkIuO/htrjm8R00m1YcLitLr2Cu
	 vbA0qaMqz+RECGUgsOd+MoaRUA5SJ0s6mTKUG3MZoBwH8uTfkv06X+uAtMbEMG/u2XZYq
	 1LqmuajxD0Bq+W98rFDXdkg5r7PqyO1HSR8vZ/9cuiIaRTs5jsByWLw0H2DvDTUnklQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793388885;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:In-Reply-To:X-Scanned-By:
	 X-Mimecast-MFC-PROC-ID:X-Mimecast-Originator:Content-Type:
	 Content-Disposition;
	bh=DULR4CCYUV1xN6KTkQmnXD/WpQALqgE4bpbw1Uku33s=;
	b=NEBQjrwjUl11hXT14JX+XHQZgh1vQv7ifaXdCYyuSEKft/GruwCzw81FIeHIiZaftE7H
	 fAdXwpKaRIi3Pg4cETv1lAV6ewIpLATgpo+Onh6hXXtciiFrXYJCA9IJyJnn/Z7F/je4t
	 /y4Liyf4QNPjjSva/PNV3cb4L3y7Lb/GjKYnX2zzBfjY2HGPN4gKpIraY4DaPGusv0kp0
	 69jJgQuomU+XoSxG35vNSVhLkxZFDRdAr2SCU8CJJ3CRzYFgUswE/D4IAoEeeDV+PX+qu
	 q/n9nX58rR8gx00nRJMTk+51Yyutd1JZYbmArBcehxhKCz1WcEflxcjFt7BU1FAPZOg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=gsHZupYI;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 768B2606A31A
	for <vhost-user@lists.linux.dev>; Fri, 30 Oct 2026 19:34:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 768B2606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=gsHZupYI
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793388883;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DULR4CCYUV1xN6KTkQmnXD/WpQALqgE4bpbw1Uku33s=;
	b=gsHZupYIEtQCVhBjNsu4kCyhLHti+t4kL2njS2xTRCPPeRuRtafZsqgU6Kel4cBrFivlj0
	NxWtocllysWlOC1u1wDrCmKaLVj2wk0pIBW/WIqhvqM5tvZI+TaEBm0bQAFd4RPR8YUi0K
	4jrrCGTsX0RcGyYrCq+gNTNEsgcpk5k=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-237-ZJQLZmevNiKuHikQVpllEA-1; Fri,
 30 Oct 2026 15:34:35 -0400
X-MC-Unique: ZJQLZmevNiKuHikQVpllEA-1
X-Mimecast-MFC-AGG-ID: ZJQLZmevNiKuHikQVpllEA_1793388874
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id D9486180067D;
	Fri, 30 Oct 2026 19:34:33 +0000 (UTC)
Received: from localhost (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id B7F871800677;
	Fri, 30 Oct 2026 19:34:32 +0000 (UTC)
Date: Fri, 30 Oct 2026 15:10:54 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Tim Pambor <timpambor@gmail.com>
Cc: qemu-devel@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
	Stefano Garzarella <sgarzare@redhat.com>,
	Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
	=?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
	Hanna Reitz <hreitz@redhat.com>, Jason Wang <jasowangio@gmail.com>,
	Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
	qemu-block@nongnu.org, Raphael Norwitz <rnorwitz@nvidia.com>,
	Brad Smith <brad@comstyle.com>, vhost-user@lists.linux.dev,
	Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@oss.qualcomm.com>
Subject: Re: [PATCH v2 7/9] vhost-user: enable frontends on any POSIX system
Message-ID: <20261030191054.GA1686233@shajnocz.csb>
References: <20261030-vhost-user-posix-v2-0-cda7c17aad13@gmail.com>
 <20261030-vhost-user-posix-v2-7-cda7c17aad13@gmail.com>
X-Mailing-List: vhost-user@lists.linux.dev
List-Id: <vhost-user.lists.linux.dev>
List-Post: <mailto:vhost-user@lists.linux.dev>
List-Help: <mailto:vhost-user+help@lists.linux.dev>
List-Subscribe: <mailto:vhost-user+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:vhost-user+unsubscribe@lists.linux.dev>
List-Owner: <mailto:vhost-user+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
In-Reply-To: <20261030-vhost-user-posix-v2-7-cda7c17aad13@gmail.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
X-Mimecast-MFC-PROC-ID: ZTyH5I0crELVsJh3aljhcGOLm8j9zgOTGP60ogtC2Is_1793388874
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Oct 30, 2026 at 12:21:00PM +0100, Tim Pambor wrote:
> The vhost-user protocol is not really Linux-specific so let's enable
> vhost-user frontends for any POSIX system.
> 
> vhost_net.c uses VHOST_FILE_UNBIND, which is defined in a Linux specific
> header. The kernel's VHOST_NET_SET_BACKEND documentation asks to pass
> fd -1 to unbind, so replace the macro with -1 and drop the include,
> nothing else in the file needs it. Long-term a constant could be
> introduced and used for it.
> 
> Co-authored-by: Stefano Garzarella <sgarzare@redhat.com>
> Signed-off-by: Tim Pambor <timpambor@gmail.com>
> ---
> Changes in v2:
> - Replaced VHOST_FILE_UNBIND with -1 and dropped the include
> ---
>  hw/block/Kconfig   | 2 +-
>  hw/net/vhost_net.c | 3 +--
>  meson.build        | 1 -
>  3 files changed, 2 insertions(+), 4 deletions(-)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

