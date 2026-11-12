Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794508954;
	b=dI4kHDIHR8CTQN+wHnLgUQBXULLpQ26IcEh2DvN0OmRV9lFM0gthtuBvy6eaJaRsysOk
	 DmfbQLzQOqisH2ovQthIPdzaTmICZWEQNthAQg0scGZkebrOVDnBrnvs/bpgXo4x2Uvow
	 whr8U6caLbrwod591lxrxZtHZYRYtTpdF6v02CnxjmEk/bYLAU3hRJchrXjxxPD/JJOUX
	 av/OvW8tPDoDlJ3+Ul9KRhTwUHRrgHQMDyilWUg8U2bIy3Au6mt2qOnyYg0R4iEA4iSHX
	 i/Jc2wW2E1Ymsp4DCREZx41yvPFKJxRt2ZXLnIW8FFy96lm9oxTKJB7SpTnwhM1c2eQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794508954;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:In-Reply-To:X-Mimecast-Spam-Score:X-Mimecast-MFC-PROC-ID:
	 X-Mimecast-Originator:Content-Type:Content-Disposition;
	bh=A3++6SSdAWARjbTLG3hk+lQQ7aiEgqNJA3N4D+HfgX0=;
	b=qQILYYb9zyL0I7VLM7k+vh3bujyx++wCN+fbsAPzVJdZ56UGRVmOOhtiWft7DkOAj//O
	 It52r1xqVjKkWkUfE7PRyzwnsvzq3KRXb71xKC0i9uJPS2LtF8nFvV7OalXYX5/Bak7lo
	 sascOvlJ+YN7r6lRLEYUVc0hotZEgQ9PROU5Uw2uPoE/3Iy+G4W0/5ugmpcVRJ94Fl8Il
	 hyoUEyRhbDxsx9l0+vUhMaqRXNWdEnIaSfj26sCoeF/GYoTUsvGlpBx3Oo3kiZjZzPLar
	 Ltwt0sYfeN/mAdTqnoZZ/HS1rZgsqrP0VZ4exiNmjBEGiMTYO23sdU/mad9GsXr2AEw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=aTVT5gKq;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FBC3606A321
	for <vhost-user@lists.linux.dev>; Thu, 12 Nov 2026 18:42:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2FBC3606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=aTVT5gKq
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794508953;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=A3++6SSdAWARjbTLG3hk+lQQ7aiEgqNJA3N4D+HfgX0=;
	b=aTVT5gKqoFT+9mxuodV+9EBFchlIpNOuTy6qSNV91LWBhhrK1miFrlJh8ak0dd/R1ySQ/v
	PEnYa23zMZ4pQrD/HPeNG0j6o9JCGibSVGgmigTNP5CkI2tpn5D7Nefas6JcWCXx5Lu9wR
	yH/P8LlhZ+6nAKOMVg6CpA17/0l8vY4=
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com
 [209.85.215.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-626-esBI-hRLMIalxolJdF-hjQ-1; Thu, 12 Nov 2026 13:42:31 -0500
X-MC-Unique: esBI-hRLMIalxolJdF-hjQ-1
X-Mimecast-MFC-AGG-ID: esBI-hRLMIalxolJdF-hjQ_1794508951
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cd652c0385bso93909a12.2
        for <vhost-user@lists.linux.dev>; Thu, 12 Nov 2026 10:42:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794508951; x=1795113751;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=A3++6SSdAWARjbTLG3hk+lQQ7aiEgqNJA3N4D+HfgX0=;
        b=jzCZp7+0oJb8ihcyNyDEI6z7Hj5q1z2OdfUlYeosLZHDhg/8o84BRSDIlI7HfTcKSX
         +onfti0tw3hxqTelE9qSJ5yNH5rnr3e2DDdHLADa3aAlHXgse8I4ZUgNHA1hOYeo0XcO
         tKWfZfKubOv1umx96+hlYVP87OyTmv7OwaAFQ5sfOe4kKkZVuY1tce44FMh3A4V/Xyz6
         YN7fBPDgxbm3Xa+kL9t8saNhbBgdd/CFU6t6OUBFjLBmI9/YMaSlpGmqKnWz6CCj5RJe
         BBXbtRwYfNwdfXSBx8kVCeIlOupB3aLKScOs7uOBJh7OyVorFpBJEZdvrKNBiCIrRXK7
         VEeA==
X-Forwarded-Encrypted: i=1; AL+hErGjltGidefP/koQsD7xQ+qJ1AhEfugJ+Mx+aOKdxmdLKV9WDq318DYmflR1x6i0aBGHiGnuJxgSxt7m@lists.linux.dev
X-Gm-Message-State: APuU4Z+Ul7GQ+X5Kh2aziXtsbabsvi2iIgCrKPaXM/f0DGc+E/kCWQDu
	0mJYto708zh/2SCANNtzjMf2fSzdS+5K1shUsQeOLXk1xz6ELPpr/P3ue4fIrrMeBBT8Gaf5JgP
	uY0OElVe9KpW1k+m+aWB+ZKcMM9ztI5nxn525DgNKoeALBDaRljO3Wz4Au4TSiw0=
X-Gm-Gg: AYBFou0bFDP0+pZlxIpCHRDQWB6sUMaHdDiAtF2SbsiO2IYK5oudPdYjVcGF6d2D1S4
	8Uo9DiGFmCkFDdqrA8yz338B1YnSGcGCtbjJUmLLfffu+xn1FswlxvggyQ+zgdYQhifzyXV6lt5
	yqb5151o2815qn7idKMEwKWAUAY55hd97BinXIDqnRodhYIr8dOAcjK3kWzuhNh59hAurq5mbch
	0jFryh2gbif+kssHPMw0m1WA3vMRj5e0OkebkojWtET1A8PruSFSEewHRMssbYmsuiGQEUX8zgB
	XtvSQEexX81u8qqzP5mFeMdZKCJu7yRciKNWmaIXckjj6VX1cfc8/7PR0X2LkaHNXmjVmwqrJoj
	cwLgQTvj1I1oL4kgQOxzSvBSIrPN7oNI3qbaXQgV2j0LEp9dwlS0U
X-Received: by 2002:a17:90b:3c83:b0:3ac:a993:5b5c with SMTP id 98e67ed59e1d1-3b1b081b573mr652a91.6.1794508950606;
        Thu, 12 Nov 2026 10:42:30 -0800 (PST)
X-Received: by 2002:a17:90b:3c83:b0:3ac:a993:5b5c with SMTP id 98e67ed59e1d1-3b1b081b573mr637a91.6.1794508950030;
        Thu, 12 Nov 2026 10:42:30 -0800 (PST)
Received: from sgarzare-redhat ([69.196.88.181])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1ae981c55sm584343a91.1.2026.11.12.10.42.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 10:42:29 -0800 (PST)
Date: Thu, 12 Nov 2026 19:42:22 +0100
From: Stefano Garzarella <sgarzare@redhat.com>
To: Simon Lucido <simonlucido@meta.com>
Cc: qemu-devel@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>, 
	vhost-user@lists.linux.dev
Subject: Re: [PATCH] libvhost-user: return the backend address in
 SET_MEM_TABLE
Message-ID: <avYHUgnTmWUiA1Qy@sgarzare-redhat>
References: <20261109-setmemtable-fix-v1-1-00fa83a0c6fb@meta.com>
X-Mailing-List: vhost-user@lists.linux.dev
List-Id: <vhost-user.lists.linux.dev>
List-Post: <mailto:vhost-user@lists.linux.dev>
List-Help: <mailto:vhost-user+help@lists.linux.dev>
List-Subscribe: <mailto:vhost-user+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:vhost-user+unsubscribe@lists.linux.dev>
List-Owner: <mailto:vhost-user+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
In-Reply-To: <20261109-setmemtable-fix-v1-1-00fa83a0c6fb@meta.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: cvPpVDXZHTVcPTBnQelYV3S_w2k9SgY8QqdLa8T_WaY_1794508951
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline

On Mon, Nov 09, 2026 at 10:55:42PM +0100, Simon Lucido wrote:
>During postcopy, the vhost-user backend ought to return the base address
>at which they mapped regions during SET_MEM_TABLE and ADD_MEM_REG calls
>[0]. This was done properly for ADD_MEM_REG, but not for SET_MEM_TABLE,
>so any frontend that was relying on that call would not work.
>
>QEMU wasn't affected as it uses ADD_MEM_REG, but any combination of a
>frontend that uses SET_MEM_TABLE and libvhost-user backend is.
>
>[0]: https://gitlab.com/qemu-project/qemu/-/blob/144393da8d4bd307a22525c7feea2bb29a0a7556/docs/interop/vhost-user.rst#L1263
>
>Fixes: d288eef3a0a8 ("libvhost-user: fix -Waddress-of-packed-member")

IMO the commit message should explain a bit better why that commit 
introduced the bug. I spent some time to understand the relationship, 
that IIUC is because from that commit we are using a local copy of 
VhostUserMemory.

The patch LGTM.

Thanks,
Stefano

>Signed-off-by: Simon Lucido <simonlucido@meta.com>
>---
> subprojects/libvhost-user/libvhost-user.c | 1 +
> 1 file changed, 1 insertion(+)
>
>diff --git a/subprojects/libvhost-user/libvhost-user.c b/subprojects/libvhost-user/libvhost-user.c
>index 52817cc733d..df215810339 100644
>--- a/subprojects/libvhost-user/libvhost-user.c
>+++ b/subprojects/libvhost-user/libvhost-user.c
>@@ -1119,6 +1119,7 @@ vu_set_mem_table_exec(VuDev *dev, VhostUserMsg *vmsg)
>
>     if (dev->postcopy_listening) {
>         /* Send the message back to qemu with the addresses filled in */
>+        vmsg->payload.memory = m;
>         vmsg->fd_num = 0;
>         if (!vu_send_reply(dev, dev->sock, vmsg)) {
>             vu_panic(dev, "failed to respond to set-mem-table for postcopy");
>
>---
>base-commit: 144393da8d4bd307a22525c7feea2bb29a0a7556
>change-id: 20261109-setmemtable-fix-d9841f2d0eb7
>
>Best regards,
>--
>Simon Lucido <simonlucido@meta.com>
>

