Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.176
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792737308;
	b=vgJyqH0ZVXZTbwgYpFtsyzgkL4W7+RPwUVpi+Ae7c4dTLH/lWMHNdWVCCUIfsBRXb6vq
	 LKLMXFHe0J5DkT23zHWDUSv5kJbe3eWIK0hrjpztnIN99V1m08Bf/B4T4q/ZwcqlQtGiu
	 H57ic+eZl2m8Vg43CXsFDahx3Gys7scIrTVG2dwHx68ba4PlB26RW7o5tcKSEubyyp7ff
	 o/aFlVRgN8eMXQOL3qC9hesYL2YAgi7YRKardA5O/yoWrRfrmOnwuo8heZfcBboI+1alQ
	 Iy0d3+RvwUUDT1+WKnrx7oyZyvuVaSk7FaBbdZv4350Z5n4RRs/vB7RMKLuHMnmEI0A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792737308;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Content-Type;
	bh=ZsUNjtEj4RUe68Fi2odqN0bFEItXBMJkpeS0oj9PhNc=;
	b=rLNR8FuI8/yF5+yNZyX9iSeyHxw1819wM3xp37uGakO3M0oJ3bGsKcyZr/FTaxwcfVqo
	 Nt2l8TMA/k0ioA/YUiolrMqrwCi8kAZ/T+HUL/YJpOMxAGQxKmcnxyEtARqxXXN0xxp9B
	 rW5kOotEjAulzfrBa2pPpxj7ll9FvkmtKd+ajgx4ioOjErYq6a8Sy/oPWrZ3Vsyqz9p56
	 Jvc8O0juOZIe0k33tSXLyg9vaJOupuNajGnl1ltzIImm/lTxthBtJAPrRqalaqxUFPHx5
	 P44367QuTuLMBg22XcH2q409Ss5ZimI3QUjYg3FTvhCMA+4h9lchM95RCQSTngxDtFw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linuxfoundation.org;
	spf=pass smtp.mailfrom=linuxfoundation.org;
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=google header.b=Ho9GkIio;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.176
Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0872B606A31A
	for <vhost-user@lists.linux.dev>; Fri, 23 Oct 2026 06:35:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0872B606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=google header.b=Ho9GkIio
Received: by mail-oi1-f176.google.com with SMTP id 5614622812f47-55650fe1f0dso319419b6e.2
        for <vhost-user@lists.linux.dev>; Thu, 22 Oct 2026 23:35:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792737306; cv=none;
        d=google.com; s=arc-20260327;
        b=IXmlh6NuaXnZ80nhGPtBCtdB2DFOcmFCrn6pVdwhfqR1yDpil2h5UsxCq2z0S0Mk21
         D4fh3TMn7Oogpk4c22rB6LVyCiTc18NSGOZquMUO0hHy2FeU+tCMu7vMAqSfYVIVNWqW
         jWgw+Oggw9pcmYyGk5rDlPKBj3Wr4D9nC7JnWRhNttUsns+zC55xPoPUK4UI28crpUax
         KOGTBaJYtTjA9YjImRO1pLKjY/iwJuOlpO67Znb34Gr+HfiCM1L0Jc3TrQF52P5ImVLz
         cFKLtH1yYvgJgW38veNPHV7IG9RqQxyoPJz7qqtUIJssxmzCjVYeUDlhe/6f0NcAa3Cs
         UVdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=ZsUNjtEj4RUe68Fi2odqN0bFEItXBMJkpeS0oj9PhNc=;
        fh=MyPcB0zuDuY1cq7QVdDOuGATqb2ISo/UTD9sFMv0ORo=;
        b=M4ZU4wnw+oPybsIy6D1fYEkxW2RqR4VWP9vR8opqYCnHmf1MkF6/fOVuJf39aAxqIn
         yF1QmJQwfvfQKvGQiJaR30G/Lytop4ZyPgz5K8aPG9TaNJO7JMGdjVhdUTY0/DCFEgCQ
         7idzqADtSeieBglCYU84/Y1jK2gWY9GjEKMKzPXJ8luSLrnCVWcWKrI3pJcUMMH9JcHb
         0SUqVC7x0bN5UWV5CxqiZvdug/+ukG5kS4XDbpin344fEC/+1K/fKo6IFdQRsEv3XTW5
         gzp1+rEfxU+NNG6QX5zxMnX5HGx5gm4F/sYC2a7haImHmQ5inR2wxGTipbTLVQOruYDG
         eNTQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1792737306; x=1793342106; darn=lists.linux.dev;
        h=content-type:to:subject:message-id:date:from:mime-version:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=ZsUNjtEj4RUe68Fi2odqN0bFEItXBMJkpeS0oj9PhNc=;
        b=Ho9GkIioe3edvJMTsoTVR34ZiuQtiPgZw36BioVhthBDI1335ipGg3WVrqmhORONhG
         pSxPITqSi06ShRnsvTlyDl4UMbkylBMSYEtTXtbS+RWhzxcqJ/+QzOy+yrC9q7/UwSBv
         RZdcRnM8v73AhBcXFvhXQJG3VWwwhdii7aM8A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792737306; x=1793342106;
        h=content-type:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZsUNjtEj4RUe68Fi2odqN0bFEItXBMJkpeS0oj9PhNc=;
        b=XvC3zL+6xik127/8SvdZsIXRKZTUiAOdXC+9oY724F8TM9ynPMovSppyLbG1+Rssh7
         8MC1Ay7RbDJTXoqWR2oc/21jJ5CMxph66VGEMc438PmyYpzlHBq16rLbf2dmlipMTPFK
         q7pevBPOl4p8iBGCIOz+CQ2LD3AvzSbjEYI2wyoqvob9yDyEmAXjq3vq3I3HDF3MdhHM
         evoZ5U7Ds9hV3V/6M+QHsBJGCuSwvC6v3fcE4PG0o4gFacf8iouhxShZBGehfTXX3Hht
         s33W3ExrQ/bOkqx6nrFH0F3/F3o86KfgKPeCl5P8GKKMMxHbs3rG70qaAZ5dOfvN2Pm7
         XyNg==
X-Gm-Message-State: AFq9FYJtwbSPjinR49dBsjKtNridjHCE3oY6y/6vTZ0Ksy2kwC/u/Q07
	NvZb/WeFn6pJT8g5Vtf3uYDZYQWKI3Li8pNfH3Xyr6YASS2P8xzmG2oWx0T1WTsCQ9WO+i2rRQs
	pavaWjZkmKMdGuAZ4rHtAxhyCJX0QRhdQFTi17nRXCPtbti0gHXrmWdBinTuA
X-Gm-Gg: AYBFou1NFV3c/aA3O7doo8uYpr/P5Ch74SWdiFh2qvXa3BYT+XoXLMxckSSpNcySoxt
	wRiCRpHLPbtU517LFuR6wIpONd7oYuFfNPi/+VJ3NyeVVvHyFvnoOH2rZ0Yr6XclbKk4W0gRXNK
	3AIlJIfSkNEqp11fO3MsEflNwnJSwz+6bIy16RMOInDk+X1U1NV7JuqgcKld0BF15OOQgb6UmSD
	KqnCbjvJ48kfIkAZrUGn+aKsiEBeKfmH1IgNHlVJNz1OzMQlW+8DAwEb+yr5BXgutl5clfQSNs8
	JV0MzFqhXDPYbN/Mpp6X4hUBJp/BanRq2hLDRz6I9/G30Qrw3ZEUHLzjooBnIf5hxXPR79CrGVp
	KQyU1UmB/9vqo2S4zfV1K94rK9nnuxqGTaqatC9GhuOD8BBaHKhGKXlAsiLBCJwiOjvk=
X-Received: by 2002:a05:6808:16a6:b0:4d6:9293:9b56 with SMTP id
 5614622812f47-55be8641247mr730152b6e.62.1792737305963; Thu, 22 Oct 2026
 23:35:05 -0700 (PDT)
X-Mailing-List: vhost-user@lists.linux.dev
List-Id: <vhost-user.lists.linux.dev>
List-Post: <mailto:vhost-user@lists.linux.dev>
List-Help: <mailto:vhost-user+help@lists.linux.dev>
List-Subscribe: <mailto:vhost-user+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:vhost-user+unsubscribe@lists.linux.dev>
List-Owner: <mailto:vhost-user+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
From: Chris Hoy Poy <choypoy@linuxfoundation.org>
Date: Fri, 23 Oct 2026 14:34:54 +0800
X-Gm-Features: AclHuK_6yWsYqFF-uCryouKEIl3LaN3iUj23keo7WFL8yoBgIu_tJud1oxGHAug
Message-ID: <CAKkv+gzxVMqmaJ3ORY9fHN+85uOn7Oq5w=cedBYM=r51PLgbmw@mail.gmail.com>
Subject: Delivery test - please ignore
To: vhost-user@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

This is a test message to check delivery and start the archive for the
list. Please ignore.

Chris Hoy Poy
Senior Systems Engineer
Core Projects
The Linux Foundation
Perth, Western Australia (GMT:+8)
