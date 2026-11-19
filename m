Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795081649;
	b=d9i7qiZGGNY9Boe8CngY8KgxtuNBIV/AsOqneUe6zMKMVtmCOKbvxG4PrqCPG/h3Aj+V
	 nGAvDdc6jwKtdsbah8sJ6tCtsemCsJFJfctho9sCrSj0P+QLDRuXZud5JTJyZjbxP5hQf
	 f+DSNo/RuIcGTpeeqXX+Fgi4e7+uotHIsgGzq6fQF7aOwlL3cCD9s4Z0FHgNTJmoNouIo
	 9tjcdbn/F2I1iqrHLJRgIxT31xAx9KgiMWcWUEkw061/jyPvrQ0cvNcCyQhCarBVgr7DV
	 zDS0xvsrESAM0ROUVXzxio0OLeZxPwE/+rqIf8Pu7whpCAcYjHlNzS0s6tQ1L9GJO1g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795081649;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:In-Reply-To:X-Mailer:X-Mutt-Fcc:X-Mimecast-Spam-Score:
	 X-Mimecast-MFC-PROC-ID:X-Mimecast-Originator:Content-Type:
	 Content-Disposition;
	bh=CNbyFIDODwI06hCwH9i3quh0ISVp3K1bMaePzo6+Uh4=;
	b=k4GlmKb93sSyQVAo/uAODEYBGqzujmw86QibfWEserDfXsfh2NSTB8PHFW4PRthhH9gL
	 tFd6lHeGPsca5lIim94leik3OSGhUp92veakUhlmpZJeXlMIfKmcE3FbryvnNnyBaT+6/
	 5rZvd0n9kHxsWsLiAyx1mxgeqOmXabWrBYEeuIm9f6FvTxMq4Mq0eXwSDmM3dGaAfqVdg
	 eYjMFFL3UQVglw6KEMlwPnI6yBq+BKGBf+N01Si1NXfv9kBeaz+kCYMxkQ/USRlLMICBM
	 4xt1o94t7zGcfPGLvjL8Dl1DF4nyeYQKm2bbVrygzBSpt6QiH8O3Ifsz/AJhrpIdNiA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Rcfu3rpz;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0175B606A320
	for <vhost-user@lists.linux.dev>; Thu, 19 Nov 2026 09:47:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0175B606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Rcfu3rpz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795081648;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=CNbyFIDODwI06hCwH9i3quh0ISVp3K1bMaePzo6+Uh4=;
	b=Rcfu3rpzM0wZXQ836sjKIB1BC0oCF6YYaJcKcnMgwFWlkschZXRHozfVTaNxsimYVPoR3T
	8MLhBnVvz4riJuLccANHLPHR5JmZcHafHAPahYkmls5ARXnltk+JeTS6Rj5zTHr1phTYNI
	ErQI5xC6eEbG/mJW+Q05OdjiUDGYPPU=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-694-3f2gczcMM6mWW8H2Ixv3yQ-1; Thu, 19 Nov 2026 04:47:24 -0500
X-MC-Unique: 3f2gczcMM6mWW8H2Ixv3yQ-1
X-Mimecast-MFC-AGG-ID: 3f2gczcMM6mWW8H2Ixv3yQ_1795081643
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-48fcb657f32so1203154f8f.2
        for <vhost-user@lists.linux.dev>; Thu, 19 Nov 2026 01:47:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795081643; x=1795686443;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CNbyFIDODwI06hCwH9i3quh0ISVp3K1bMaePzo6+Uh4=;
        b=Ndvx6aE8wfdj3nqB8u+YcH+4NtUfNfS6eoJN4X+RdkFP7ts9PhFo1ZwGmOYYLYdV4H
         WlXHlGKse1Ft2Ktqe3beyXGtPEHpwWsM+CpLdRVv85jFzQMdlb5BbSqD0Qi4rYuKUEbE
         yoiG8f5BrIPLp1nFVi040gW8Hyap1z6CspBkLUffvS/wnh8qSDWCBxmUHDSLVmOe6jdC
         vj8AujOyFhk2EkPZDivoj29CGah70EEU2U9cYHE/aTd5qhI4Hxt76jMaoSXQO3M1v++C
         mlvP3Ngxc29Cuy8zALph4ShSj3hON0oQ/wFOy92D3KzsesPUNcRXjCP/nU7ImvGWljwc
         MA2A==
X-Forwarded-Encrypted: i=1; AL+hErFDax2FWc3g3NlzOpKRW2BjcgDO+sRVNZSRemGlzq1nbmkxA9qeBD9dB3xv65R1V/qFgx5czhNOliTO@lists.linux.dev
X-Gm-Message-State: APuU4Z8Vxjk3WbVZwEasc3qAC+DbhYqvx09tYsbCxgyHoD1l98sSWtae
	YHVWMvvjjkuOcMrE+/HHB5DTHgN4aaNfx+w+AZV4f9ImblkKnTNBvTHVfK6k4hcg5SAgk0hyTze
	FWCO8AjqrOpSBee0Ca8SsR2JHI2dngMTGVyTlK1OQnTYn4C+2iPHKDK8f5Lt6dq2MoMsyuSw=
X-Gm-Gg: AYBFou3lEN4PixpjbRRLqtoLcHEa6hytO3XQNWkVzvNd6HvLS26aggID4tFlJqXqLEQ
	4pSS55LJ5zr1fRvX9pJ0KzSUMecuXWu9jnENOsXXO8BEwafo6h66Go+vrUbwBs/ka4SsvvJvnKO
	7NNqRyIr62Pg/Z/WrDjd7Aw7JRm5mMm8RlCNBq02JInsV9IU7eiiVak7k6+BohbzUiREt0t5WV5
	QwsOhb9dYP4oFq9wB1+h8M6HWS16mdc/BNbqJOEMCZ5VJ5s4ssXtx5EFgF1h8b3/7O9KtfRQ1lr
	JHXezfFLq5J/Uf6lemTY6UrjEqkapjBc4moZnZeqyyvoMuWZzD6P9fyH5V0sbGQJzXRglpFq4Or
	XPwk/jVJCGT8RSalZrVo3fA0ojdUxbl3nQOCtdlA/RiA=
X-Received: by 2002:a05:600c:6290:b0:4bb:7b4d:6396 with SMTP id 5b1f17b1804b1-4bb7d6cd4f3mr106643535e9.3.1795081643088;
        Thu, 19 Nov 2026 01:47:23 -0800 (PST)
X-Received: by 2002:a05:600c:6290:b0:4bb:7b4d:6396 with SMTP id 5b1f17b1804b1-4bb7d6cd4f3mr106643135e9.3.1795081642490;
        Thu, 19 Nov 2026 01:47:22 -0800 (PST)
Received: from redhat.com ([2a0d:6fc0:1520:4400:d78d:7b2d:2f5d:e08f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853368d3sm24935355e9.1.2026.11.19.01.47.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 01:47:21 -0800 (PST)
Date: Thu, 19 Nov 2026 04:47:20 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Simon Lucido <simonlucido@meta.com>,
	Stefano Garzarella <sgarzare@redhat.com>,
	vhost-user@lists.linux.dev
Subject: [PULL 6/8] libvhost-user: return the backend mapping address for
 SET_MEM_TABLE
Message-ID: <9a90624000367faea6f2809d1f21b9d7d168031c.1795081539.git.mst@redhat.com>
References: <cover.1795081539.git.mst@redhat.com>
X-Mailing-List: vhost-user@lists.linux.dev
List-Id: <vhost-user.lists.linux.dev>
List-Post: <mailto:vhost-user@lists.linux.dev>
List-Help: <mailto:vhost-user+help@lists.linux.dev>
List-Subscribe: <mailto:vhost-user+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:vhost-user+unsubscribe@lists.linux.dev>
List-Owner: <mailto:vhost-user+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
In-Reply-To: <cover.1795081539.git.mst@redhat.com>
X-Mailer: git-send-email 2.51.2.2891.g4157995a80.dirty
X-Mutt-Fcc: =sent
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: IuuShKndckzw-4tIXXMSSnnwUCRLS3t3ifrpmYkiGDY_1795081643
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

From: Simon Lucido <simonlucido@meta.com>

During postcopy, the vhost-user backend ought to return the base address
at which they mapped regions during SET_MEM_TABLE and ADD_MEM_REG calls
[0]. This was done properly for ADD_MEM_REG, but not for SET_MEM_TABLE,
so any frontend that was relying on that call would not work.

The bug appeared in d288eef3a0a8, which, to silence the
address-of-packed-member warning, created a local copy of vhost message.
That's fine for reading the table, but for postcopy, we also write into
it to send the base addresses back, and after d288eef3a0a8 we ended up
writing into the copy.

This bug was affecting ADD_MEM_REG and SET_MEM_TABLE alike, until
905e8c7e260d fixed the ADD_MEM_REG path by copying back the memory into
the payload.

This commit fixes the SET_MEM_TABLE path by doing exactly that: copying
back the memory table into the payload.

QEMU wasn't affected as it uses ADD_MEM_REG, but any combination of a
frontend that uses SET_MEM_TABLE and libvhost-user backend is.

[0]: https://gitlab.com/qemu-project/qemu/-/blob/144393da8d4bd307a22525c7feea2bb29a0a7556/docs/interop/vhost-user.rst#L1263

Fixes: d288eef3a0a8 ("libvhost-user: fix -Waddress-of-packed-member")
Signed-off-by: Simon Lucido <simonlucido@meta.com>
Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Message-ID: <20261112-setmemtable-fix-v2-1-b38ee27e8f19@meta.com>
---
 subprojects/libvhost-user/libvhost-user.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/subprojects/libvhost-user/libvhost-user.c b/subprojects/libvhost-user/libvhost-user.c
index 52817cc733d..df215810339 100644
--- a/subprojects/libvhost-user/libvhost-user.c
+++ b/subprojects/libvhost-user/libvhost-user.c
@@ -1119,6 +1119,7 @@ vu_set_mem_table_exec(VuDev *dev, VhostUserMsg *vmsg)
 
     if (dev->postcopy_listening) {
         /* Send the message back to qemu with the addresses filled in */
+        vmsg->payload.memory = m;
         vmsg->fd_num = 0;
         if (!vu_send_reply(dev, dev->sock, vmsg)) {
             vu_panic(dev, "failed to respond to set-mem-table for postcopy");
-- 
MST

