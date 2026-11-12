Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794524254;
	b=oPK1m1MbE/Nj23NGRY8/CoFXUDx+SAdHEKosZrqfyYVVA0BMFVziWzNSllFvXnfBhYNH
	 YkP1ZjQFAz6j9H9Gx/3/8eCBFAVdXcnzbEUkSYRomj0Sb2doD1UFkB9HX3NYFYBt4MffN
	 7Zehjcf/AqI3G1DKk2q07kCQlhEBFRzwAvS/Jai66XOLyHuPBwcy6NKhcyusV3JoVN6+p
	 AXwJOLB1imlaCKJLx43M05Y6pXKOrH0sNToNgtKFrND+KU0lqNJF+AN2hD+gO8DJMLdUv
	 P82RbpiRWCk7KM/H5iDn57XL1WJA12pcFY1TeAMvBsdICTf4I84e2wWldT7FDkZiJTA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794524254;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:In-Reply-To:X-Mimecast-Spam-Score:X-Mimecast-MFC-PROC-ID:
	 X-Mimecast-Originator:Content-Type:Content-Disposition;
	bh=dhNKevsowgRkgGYHVsP6gepU4G/5TtJGOlEzBZgdb9U=;
	b=HvF6rJ7sx+9o6F0DcorGsGM7kWxYR7W/yxCcaELVcFOdaHTSP69gDkq6ZwR5vrbvlWLv
	 CRjgKxphRm+DBDbLyuQjMttoxZNN/5lZ/r3HZdxZWEdeG+4mU6HATc+3Zdgv8ROFuPEys
	 AuFGc5hbccQ8hhUbGjfxFlWKwxKAmLqzT5If/umLm45QFKPTAZ2uS8B7HwdntMDUn2DGV
	 aFi1u030eHdYeLEbHP1QbBObUvBBMrkR0E7ssizrUtvVFhwHEBK4c545vW+jyfeehl3NN
	 /OLFn70i1/lEMreI29+lWZOUZG5uQgz06zk3vJEkv0eU8hhkhvC4fJdj2FWsCFVEurQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=gM3DbeEl;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 327C1606A31C
	for <vhost-user@lists.linux.dev>; Thu, 12 Nov 2026 22:57:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 327C1606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=gM3DbeEl
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794524253;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=dhNKevsowgRkgGYHVsP6gepU4G/5TtJGOlEzBZgdb9U=;
	b=gM3DbeElcSqZj+3+5YW67Iq6YyxAqWhfmF7cjpXxa+Q/MIQlGTMRPNgE1o2rWUU+ScXqQQ
	NO//4V5eTE9XrxlOj/L8uZFulkZtQeVvEZ121ZFF37XnDc8u8TJmfh+Fp/ZCBpIkUsAf31
	AMrkTCpQbj00wT8oZGNMZhw+klvPBKo=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-608-BOA9wss3OXGKvJGpp7NG-A-1; Thu, 12 Nov 2026 17:57:31 -0500
X-MC-Unique: BOA9wss3OXGKvJGpp7NG-A-1
X-Mimecast-MFC-AGG-ID: BOA9wss3OXGKvJGpp7NG-A_1794524251
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-537548d4bc0so6841201cf.2
        for <vhost-user@lists.linux.dev>; Thu, 12 Nov 2026 14:57:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794524251; x=1795129051;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dhNKevsowgRkgGYHVsP6gepU4G/5TtJGOlEzBZgdb9U=;
        b=qkRVzWc2fGcqQmQjQT9E7qsW9rjISrDW6Eui9VMvLscwgi1l2Zbqh1Ri5nukvxi/OY
         /YaHZ414O8ErdtomTDVBy3kzYfjaDWrJhwwDylgQU40nFiY635EXPI9pF7Gd2Vnbd1pD
         TnUc7g71+drqATjsgma5lr8h4JZWEECpIMPAP1qjB8+fgQZmwuC4vISve43YrJe+CMYQ
         qO9jlt6EB6DkbqYlcpcxXONzDMLmOOzalbLq7kh0BAOSaCU8TinRnZ1PYSglyThXKJp8
         2KMgY6k0BIACObS7hc2+tlqNLCKFud9Sov77SHX1yQllKC8Y2bRwxI0tj05Q7HbLZNF6
         pBUg==
X-Forwarded-Encrypted: i=1; AL+hErGDPdjQh9WvveoMDWUQ/PTQ/1nybm6WuJAAwfrPGOPyvlL9AWW5qwLcGyp7Q7DTiNxI12imKgRPVm0Y@lists.linux.dev
X-Gm-Message-State: APuU4Z9pES1sIZW2fLPGgmIVqrJzPGdAyOehOEqkmepDLJI5KhDWKN87
	v3isjYw5sz/k5tqT1E6fdHjKMKAPXi1qComA5ZAwe37BGXNXgl10vdtA5hbszO4baM1KkgzUqpy
	cpfXpEUQ5ISXCrGThDWQ+yzsEAI9r3mPgvx7LNvLj+O9M2yNbdH9GCNrdOUqAJlA=
X-Gm-Gg: AYBFou38RdRYCaA0EwGIpuIDwVKyikuBAvVOmrgw/EGStPJ0WJ1LADjNkCGaVC4GMGU
	a0ryMhdKMzF69l8sjz98wYaAbEV+Uv4j3ZOC7buWb5dRm6aYXxQjwIY24QXcfAwtDPc4hy2BYXu
	gamsD+PSzlbe4KBdzKS5X0ljY8R7L+GrEKn7wbe914Fzbh/Iw7TPzdSyM0X82CyGmXBj1kLXj1f
	/y1VrAazVXiIpI0uqDonZrkcPFhX+L6sHivN82+wQQ1vhmtwNuhmKXAmm5g7XupLEB99Q7/bAdB
	hjTQfKOOPuTdODfvhLHA+yqKT3bOnIn6yjRpSHJz0ezu0xoBjcKgy8H2Q+bpviqwG7sl55jNB+v
	+dZO6iGXRvvEs5yHgwyMTCPdZ1HHOaBODTFDLIqx/E/aosLp1KHjT
X-Received: by 2002:a05:622a:14c9:b0:535:20ea:cefe with SMTP id d75a77b69052e-55ac817f1eamr14991641cf.18.1794524250676;
        Thu, 12 Nov 2026 14:57:30 -0800 (PST)
X-Received: by 2002:a05:622a:14c9:b0:535:20ea:cefe with SMTP id d75a77b69052e-55ac817f1eamr14991401cf.18.1794524250088;
        Thu, 12 Nov 2026 14:57:30 -0800 (PST)
Received: from sgarzare-redhat ([209.52.143.85])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55ad13fbdd5sm5379111cf.22.2026.11.12.14.57.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 14:57:29 -0800 (PST)
Date: Thu, 12 Nov 2026 23:57:25 +0100
From: Stefano Garzarella <sgarzare@redhat.com>
To: Simon Lucido <simonlucido@meta.com>
Cc: qemu-devel@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>, 
	vhost-user@lists.linux.dev
Subject: Re: [PATCH v2] libvhost-user: return the backend mapping address for
 SET_MEM_TABLE
Message-ID: <avZESAvu8nq4P0uS@sgarzare-redhat>
References: <20261112-setmemtable-fix-v2-1-b38ee27e8f19@meta.com>
X-Mailing-List: vhost-user@lists.linux.dev
List-Id: <vhost-user.lists.linux.dev>
List-Post: <mailto:vhost-user@lists.linux.dev>
List-Help: <mailto:vhost-user+help@lists.linux.dev>
List-Subscribe: <mailto:vhost-user+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:vhost-user+unsubscribe@lists.linux.dev>
List-Owner: <mailto:vhost-user+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
In-Reply-To: <20261112-setmemtable-fix-v2-1-b38ee27e8f19@meta.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: LAhcx3lE2ze6AycgEeNrnfmnUBHnTJrDF5Loo4oj-iM_1794524251
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline

On Thu, Nov 12, 2026 at 11:38:46PM +0100, Simon Lucido wrote:
>During postcopy, the vhost-user backend ought to return the base address
>at which they mapped regions during SET_MEM_TABLE and ADD_MEM_REG calls
>[0]. This was done properly for ADD_MEM_REG, but not for SET_MEM_TABLE,
>so any frontend that was relying on that call would not work.
>
>The bug appeared in d288eef3a0a8, which, to silence the
>address-of-packed-member warning, created a local copy of vhost message.
>That's fine for reading the table, but for postcopy, we also write into
>it to send the base addresses back, and after d288eef3a0a8 we ended up
>writing into the copy.
>
>This bug was affecting ADD_MEM_REG and SET_MEM_TABLE alike, until
>905e8c7e260d fixed the ADD_MEM_REG path by copying back the memory into
>the payload.
>
>This commit fixes the SET_MEM_TABLE path by doing exactly that: copying
>back the memory table into the payload.
>
>QEMU wasn't affected as it uses ADD_MEM_REG, but any combination of a
>frontend that uses SET_MEM_TABLE and libvhost-user backend is.
>
>[0]: https://gitlab.com/qemu-project/qemu/-/blob/144393da8d4bd307a22525c7feea2bb29a0a7556/docs/interop/vhost-user.rst#L1263
>
>Fixes: d288eef3a0a8 ("libvhost-user: fix -Waddress-of-packed-member")
>Signed-off-by: Simon Lucido <simonlucido@meta.com>
>---
>Changes in v2:
>- Reword the commit message to better explain the original bug
>- Link to v1: https://lists.nongnu.org/archive/html/qemu-devel/2026-11/msg02840.html
>---
> subprojects/libvhost-user/libvhost-user.c | 1 +
> 1 file changed, 1 insertion(+)

Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>

