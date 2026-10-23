Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792772689;
	b=23UtyUCQv2/FFvZ8wQfnqs4v096SELxMQhXwSrZ9Npd+VElBwqk9icnZkGqPJyj2YQd4
	 rjXNajy01hpoRz29prw9/7sb0hdljGeLPWiX/9FUwxcBkTEQV9KkY+/ThwsVwB8+Dp5Ce
	 oNlKvzmCinbLwaN3QrqDoWEFOHfUiS1sUHDzSGQR+mOIsX27teoCg0Hifi074YnN/lMTf
	 Y8XZ8l6Ncfdbt6bTil4pQ8lCaqen5rS2TXfdAyB7BD+WMGbl5fiOET7AEzsPbW9HBR655
	 hMZupcVIaYQzJuWKDoc0R+vkxpxAuDUeMoL56NqELJ5cBfAbNTPpFfxVJXpkzaUXhAQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792772689;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:X-Mimecast-Spam-Score:X-Mimecast-MFC-PROC-ID:
	 X-Mimecast-Originator:Content-Type:Content-Transfer-Encoding;
	bh=+wDdcMQ8EY02wA42GqC3QO4nYriHJaInirxC5LhjcR8=;
	b=ht9kzDWdAgC1XlnKOeAwJN6lPxaXKC9KPgrfytR+ukRS4B/WjWww3k6vPgvgS/jBWYt/
	 voQTnhY1Md2PYvigHWwcPovOOUrZG1f5bbKXegRmXu/S2rpJQ1wlYPGHiw7nO/x+rcF3f
	 kF1WeR8nu8xNw8lSpIP37btbZ0IQCQWoVJb4tlAWSdWULXED1hTMzDKqF5WXJPkFqouzL
	 doFRoNL8AL3z8FJhmrqJMSkiDpv72y6A16KVgigQT2UKGm6Rd5CijbqstpyaJu0r2MMWc
	 5aqug6v210q+W0XJg5UM6WD9Wj98tcPwlweBBYAW+3K0iwmo3qGZqPgK7kMdCzFFf7Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=dPWuEZR4;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EEFF606A31A
	for <vhost-user@lists.linux.dev>; Fri, 23 Oct 2026 16:24:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7EEFF606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=dPWuEZR4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792772687;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=+wDdcMQ8EY02wA42GqC3QO4nYriHJaInirxC5LhjcR8=;
	b=dPWuEZR48BBC++VxGZKyvpVQ8GoLgLHbe6Du6mXwkok+1SNsfJVQ9J83Xfy6354Z1hU7Mg
	tIykOgpOk269Qpsc2nOBqZcpm7eRNi7L/EiCkbJi2Dau6y+HIJikcTnkJNpFZH+OfR6+dE
	oMwAHmjsbkl+7FKkpWc9WLtKcRUnxJs=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-212-mI6xzSQQNWGO20IRc_YSAw-1; Fri, 23 Oct 2026 12:24:45 -0400
X-MC-Unique: mI6xzSQQNWGO20IRc_YSAw-1
X-Mimecast-MFC-AGG-ID: mI6xzSQQNWGO20IRc_YSAw_1792772684
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-48c6a1d4034so987888f8f.0
        for <vhost-user@lists.linux.dev>; Fri, 23 Oct 2026 09:24:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792772684; x=1793377484;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+wDdcMQ8EY02wA42GqC3QO4nYriHJaInirxC5LhjcR8=;
        b=YdJ6QvzL+JP9D4o28UJSDmEExpSHAf7yRh8UyQQJFn5NLbc4oDEhi6OO6IOvQPvE5Q
         1MHkuXjtxYUjpfomkrEMXizDRKXiDQ8qnBi1gA625/NVSL5p/CZh3ennc2UYyQUYi3Ls
         ULTEs2Qig5EDChzb15CQt5gVZOzTP2mFqJFyi2XXGkcXekJNjFIfVFih+51eOCnZBh0s
         DqwStXGX565M4l8DBLL7xL0lIzv5RVrnv9WOXUU/CMlYeOM96jmCmaFv7i7xCS/g3eIP
         6dqbZpPPpGjtZ+gO9Ta78LklE7Cvi/qURkPopDp5IcBLgC0EC6zm6GiHRt2PtuldAB03
         Qdow==
X-Forwarded-Encrypted: i=1; AKwUvBwVrYkAFVdTKPB2gWAfnIR/bbxdm6JFQ7AGNEnZ0LCOt4CqOFroJvjxOjCc4pNIcLZaTeilDiVh8dcD@lists.linux.dev
X-Gm-Message-State: AFq9FYL93UHRvYvQUb68F6fas/vdZ4y4WKjNqthvMjv6eIgLBRZ5EeAm
	YN1vyOwzcj4Lc6kqg1E6I+S5654Ic2kBNKfnWyUkTCd6eFg2ovCFE/6k7PzarIck5WNw2j0wBg/
	t/MFegWBBYdou7v2WZevn08eKYA0/4Df0FP5k+TyjF82C+B+FaZhjGKjdYg1fF5M=
X-Gm-Gg: AYBFou385EhMnnNQg5VhR+cWAMAMUuuPIiUbHr8Ot5Dlb4w3NEPmKu7y2wDfMx4kOYR
	0Yjeu5aYLlvIqUdYRDPYIRQ4SxogwZYshJv/DJXq6VtN3VLxL/tGGiGnFL526IAg8GRwbsdwalc
	YuoKk7xotfb+mbEXM46piux8WZiLPmytYFJOyb4mOfURq+F4gWZji04HL2i9ql9AIOnef8MzeJ+
	WTUJwcLMGmtdOOhJz1akOXxdnVSD2TaLPdlz5GsP0RYuWgPFxzJj+3rzgzUPYpISZxWFSjrWCj0
	ALs2QJYmsEbrhukEaETqQcJjZtaPHEwjDb1mME4HTquR2DqWz9CoOAcdiL4OJH8lf8fHNVjHmWg
	X+rxawQ==
X-Received: by 2002:a05:6000:4006:b0:48e:824:f0b9 with SMTP id ffacd0b85a97d-48e385ba51amr5083048f8f.45.1792772684442;
        Fri, 23 Oct 2026 09:24:44 -0700 (PDT)
X-Received: by 2002:a05:6000:4006:b0:48e:824:f0b9 with SMTP id ffacd0b85a97d-48e385ba51amr5083013f8f.45.1792772683885;
        Fri, 23 Oct 2026 09:24:43 -0700 (PDT)
Received: from stex1.redhat.corp ([94.32.46.128])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3d3eefacsm923877f8f.9.2026.10.23.09.24.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 09:24:43 -0700 (PDT)
From: Stefano Garzarella <sgarzare@redhat.com>
To: qemu-devel@nongnu.org
Cc: Dorinda Bassey <dbassey@redhat.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Albert Esteve <aesteve@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Stefano Garzarella <sgarzare@redhat.com>,
	Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
	vhost-user@lists.linux.dev
Subject: [PATCH] vhost-user: add dedicated mailing list
Date: Fri, 23 Oct 2026 18:24:40 +0200
Message-ID: <20261023162441.89450-1-sgarzare@redhat.com>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: vhost-user@lists.linux.dev
List-Id: <vhost-user.lists.linux.dev>
List-Post: <mailto:vhost-user@lists.linux.dev>
List-Help: <mailto:vhost-user+help@lists.linux.dev>
List-Subscribe: <mailto:vhost-user+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:vhost-user+unsubscribe@lists.linux.dev>
List-Owner: <mailto:vhost-user+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: -QRPhz3pnD__5praixdaSqQrrqribuTh8rBWp_zbos4_1792772684
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Stefano Garzarella <sgarzare@redhat.com>

During the "Virtio and Vhost-User Ecosystem for Production and
Automotive Systems" BoF at LPC 2026 [1] we discussed and agreed on
creating a new vhost-user mailing list, mainly for changes to the
specification and discussions around the protocol.

The main reason is that the vhost-user specification is also used
by other VMMs and implemented by several back-ends outside the QEMU
repository, whose developers often do not follow qemu-devel.

Add a paragraph in the specification about the new mailing list and
a dedicated MAINTAINERS entry for the vhost-user protocol, covering
the specification, the QEMU front-end and libvhost-user (back-end
library).

[1] https://lpc.events/event/20/contributions/2365/

Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
---
 MAINTAINERS                 | 12 ++++++++++--
 docs/interop/vhost-user.rst |  6 ++++++
 2 files changed, 16 insertions(+), 2 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index d9209f043f..dcdb65d8cb 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2532,19 +2532,27 @@ M: Michael S. Tsirkin <mst@redhat.com>
 R: Stefano Garzarella <sgarzare@redhat.com>
 S: Supported
 F: hw/*/*vhost*
-F: docs/interop/vhost-user*
 F: docs/system/devices/virtio/vhost-user*
 F: contrib/vhost-user-*/
 F: backends/*vhost*
 F: include/system/vhost-user-backend.h
 F: include/hw/virtio/vhost*
 F: include/*/vhost*
-F: subprojects/libvhost-user/
 F: block/export/vhost-user*
 F: util/vhost-user-server.c
 F: net/vhost*
 F: tests/functional/x86_64/test_vhost_user_bridge.py
 
+vhost-user protocol
+M: Michael S. Tsirkin <mst@redhat.com>
+R: Stefano Garzarella <sgarzare@redhat.com>
+L: vhost-user@lists.linux.dev
+S: Supported
+F: docs/interop/vhost-user*
+F: hw/virtio/vhost-user.c
+F: include/hw/virtio/vhost-user.h
+F: subprojects/libvhost-user/
+
 vhost-shadow-virtqueue
 R: Eugenio Pérez <eperezma@redhat.com>
 F: hw/virtio/vhost-shadow-virtqueue.*
diff --git a/docs/interop/vhost-user.rst b/docs/interop/vhost-user.rst
index c1e02ff7e9..198ad30f5c 100644
--- a/docs/interop/vhost-user.rst
+++ b/docs/interop/vhost-user.rst
@@ -38,6 +38,12 @@ conventions <backend_conventions>`.
 The *front-end* and *back-end* can be either a client (i.e. connecting) or
 server (listening) in the socket communication.
 
+The protocol is developed and discussed on the `vhost-user mailing list
+<mailto:vhost-user@lists.linux.dev>`_, archived at
+https://lore.kernel.org/vhost-user/. Until October 2026, when this list
+was created, discussions took place on the qemu-devel mailing list,
+archived at https://lore.kernel.org/qemu-devel/.
+
 Support for platforms other than Linux
 --------------------------------------
 
-- 
2.56.0

