Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793359292;
	b=cjxEVhTX9YmF3zQMkI+8wplotr1HJAhd1stTNMjLlIpw0i1lIX9aO459cO+9ReJX1uop
	 uVHQG+SldxwoE00T+ouq4WCcsgrg1SmOfEcyVwS1bF3TbCMVSfGZ/HnRrG5kXl5dZgL4t
	 zXHW5SYupIUL+Wn1HcaNahQkeBnY5te4+1+z+03Fxog6bmpZMrCs8461rSSnoZozJ8KOb
	 5TU3yU6PRDdbw7gkdrsQXCJzJb50b8arCRGg2mMBa5gO1cOlUR3BuCjYj1C6ZOGuzYMJI
	 NYUkfGjRnF+LxSKYWGUfv7lKaxv4zxgb2UV/h4uyqjY5+JDKjrDAAgrgqVCVliqIwxg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793359292;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=b/HG26TxZTq1sxK4QqoMzxHAvHSmMQFGYKOqt8YOLVA=;
	b=fkZ0eWQJKZN6M390PtlHyyke1d4T/PQ1w/oZ5SUSfW3CVcHG1quDXu35M12xjrzhTNW6
	 AYfT3pw4xIHY4U6cHWtReutK7OrsGdod0EyG5hesi/YAhTp9tOZXw8yADmMCOkWGo7Z1m
	 e8aR0eCe/yY9UPVgkEPZ9ZQLx8Ht23rs4uWk2CvXzBOe1cMwlCtpMAfa0aKBKkR+hfDR2
	 7wBFqyZ+q3RTNZNfYPd1to70H1Nha39Kl8pOV97FQhW7Om8FqoJU83rBqdRhNg9hGYMZL
	 41oPU67QvGjst5IHMihljx1KF+2bHhX6T2N51jgnkfHfj5vkAX4bymrEZ+vtKDOU70g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pB9I5iuh;
	arc=none smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9329606A31C
	for <vhost-user@lists.linux.dev>; Fri, 30 Oct 2026 11:21:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D9329606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pB9I5iuh
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-48e10a70540so362391f8f.1
        for <vhost-user@lists.linux.dev>; Fri, 30 Oct 2026 04:21:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793359290; x=1793964090; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=b/HG26TxZTq1sxK4QqoMzxHAvHSmMQFGYKOqt8YOLVA=;
        b=pB9I5iuhZo83ThqT5YZOXKhYLOclQ0Lj4bLBFJyzQQqG6/uF9rP/t0OzYMjIZBQNi0
         O1N08FOFHpG5/Sobq9jkC/vVHKdo22YdXxwq3bJF6F7Di05nFa34ELjV61ODHM02I26B
         zwfFZzrWAC0XCmBBgNSufRpGgPw+xdJtFBJgTjGhYfrF32sLFhEc6jyAbaS+tRdbJAk3
         4LwCOQGipIli8P53Dow7cFuo2Unfy5dqT0VWgAzJYJng8l1K3R+uBF3VULnQFP5qBWmo
         PuBBkUyRQ8cg2zemYEN3NCSdo3f8DzmZjmmSO/NktFKv3xhjI0q8L0HXTdVgcQ59NmBg
         BRPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793359290; x=1793964090;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=b/HG26TxZTq1sxK4QqoMzxHAvHSmMQFGYKOqt8YOLVA=;
        b=YO3WjdeTeVoS3WZwEOqdDoED+Lfw8KxSmjL/Ex/XmxKj0mlbcHYXWbwGVMHyTS4+AT
         8u9KrIp3oL1IGBkWIBvuQ5kJf92bs6wR1QYMqpH5gH65zBIrOz7+72lly5i1g48uzQKR
         +g20DZdP5Il2J64uricyW8OXvH12KCkiwpgi25Im0DSXTEY87GX9dL8Erpb4qbWE+g07
         HAvtUuXhqWQ2ZlpkXrEF6Jg6tvtS806gUGm62QpHe3QeTkrIDbkd4b6McCHCaJp6+jgd
         RHYPwODRHG2EEO9UsRUzdYGcoPtUxO0/xOgTLm+t+VNTk070/huTPtZdwqD+ORh+ocNw
         Khyw==
X-Forwarded-Encrypted: i=1; AKwUvBwJz37Czs/4iq8g4J9mAf9sgmb5W00YEUmd+m4Oy6/Asx9/2QPa2aa88570mP1JHEcEpEiTIK0H6Jup@lists.linux.dev
X-Gm-Message-State: AFq9FYJALp8ErsUn6y+4bN5Fck580U4XOCxPacfv6mBfBSSzRJQoThIV
	I7Wz5ndUePNoAe7U9c/x7T0WpxRzob5bEVxFdoYXIcj/N9C+SROkL2+5
X-Gm-Gg: AYBFou1J8kAj70jx+wCY6vPWtyxVQfivY3v9Q4EPpEigksAQTujRMX45X8E9Gx1hmiW
	Z08kH9r1csY7BuQZDX7gvsRkATUDOcSpsSJwbd+uYXeYVtYFmyCbJr0Tn3Rl+LPy1xyS5XKlekW
	kA/v2iFdQRvf4lWJYriHvFCA54sdnB+k1K3IqiM7nU/0SxJ/6WvOoFB7Fzw5GNuDs2J8sgvWTJ5
	J57bXmpLMhrwer+KkJxO+i0y+hUMYHheoBjT7339sr6DbVY3xwiyB6WsP8qav5sXEPxzvO+OHpW
	Mx2QNIjCKPg2fbHwskrKZ+NnzH58ONQDRgbITp8u2l5j3GxnFIASTl4SXkZUcsv2g7zu0VmUKdT
	nX+mm2RNMnJ9p4xUUI021N7iSjqZERiL9oYNEO7RfIKG2ElzGNyRuWV4gi15cMUledBsQIwVlrB
	Z1U21RFEtaHsuHfA4/chHivln5K++RG7WptL43VkDFf2ZmsxRelY6svJXyFw7l7X4TsFXwfpwOw
	OPTWqeJyPz6J04d7d8KF3W6TaBzFNN6nyeHt8ylTQA2zCm+gMwtwkpBs3+T9ftyeCGVYwVfZ4Op
	uJ8ILbYynKZ4dT4SZUn85kfr+FEfuvNo90jEd3t69lm7YPPIq6RsiFrs0wd/EcnH/UDlDzcbA7B
	LPAbCPQV8H9gi9TSstyU/6LPBsL0uXErAn5tnyYd02lhP7Jee9s7xxdi2f2XAOg==
X-Received: by 2002:a5d:4ec6:0:b0:48c:7143:610c with SMTP id ffacd0b85a97d-48e6e3091c8mr3797943f8f.36.1793359289998;
        Fri, 30 Oct 2026 04:21:29 -0700 (PDT)
Received: from tim-m2.local (dynamic-2a02-3100-61d8-3600-98fd-cd98-7ae6-cb49.310.pool.telefonica.de. [2a02:3100:61d8:3600:98fd:cd98:7ae6:cb49])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71a4d3e9sm2893608f8f.6.2026.10.30.04.21.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 04:21:29 -0700 (PDT)
From: Tim Pambor <timpambor@gmail.com>
Subject: [PATCH v2 0/9] vhost-user: another try at supporting any POSIX
 system
Date: Fri, 30 Oct 2026 12:20:53 +0100
Message-Id: <20261030-vhost-user-posix-v2-0-cda7c17aad13@gmail.com>
X-Mailing-List: vhost-user@lists.linux.dev
List-Id: <vhost-user.lists.linux.dev>
List-Post: <mailto:vhost-user@lists.linux.dev>
List-Help: <mailto:vhost-user+help@lists.linux.dev>
List-Subscribe: <mailto:vhost-user+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:vhost-user+unsubscribe@lists.linux.dev>
List-Owner: <mailto:vhost-user+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/32NQQ6CMBBFr0JmbU1bQYIr72FYlHaEMUJJBxoM4
 e4W3Lt8yfvvr8AYCBlu2QoBIzH5IYE+ZWA7M7QoyCUGLfVVSa1F7DxPYk4zMXqmRWDZVFVlTFk
 oB2k2BnzSciQf9Y95bl5op72zGx3x5MPn+Ixq9/7koxJSyMblLi+k0xd7b3tD77P1PdTbtn0BK
 Vm6iMIAAAA=
X-Change-ID: 20261022-vhost-user-posix-e7b999aa751d
To: qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>, 
 Stefano Garzarella <sgarzare@redhat.com>, 
 =?utf-8?q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 =?utf-8?q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, Kevin Wolf <kwolf@redhat.com>, 
 Hanna Reitz <hreitz@redhat.com>, Jason Wang <jasowangio@gmail.com>, 
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>, qemu-block@nongnu.org, 
 Raphael Norwitz <rnorwitz@nvidia.com>, Brad Smith <brad@comstyle.com>, 
 vhost-user@lists.linux.dev, Tim Pambor <timpambor@gmail.com>, 
 Stefan Hajnoczi <stefanha@redhat.com>, 
 =?utf-8?q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
X-Mailer: b4 0.16.0

This series continues the work started by Stefano [1] to add support
for any POSIX system to vhost-user.

Three patches from his original series were never applied due to failing
tests [2]. I was able to reproduce these test failures on current master.

Patch 6 contains a fix for this problem. Patches 1-5 fix further issues I
came across while testing, mostly on macOS. Patches 7-9 are the three
patches from Stefano's series; patch 7 drops VHOST_FILE_UNBIND as
discussed in v1, the other two are unmodified.

I have tested this patch series on Ubuntu 24.04, macOS 15, FreeBSD 14.2
and OpenBSD 7.7. On all platforms the tests are now passing. In addition,
on these platforms I have tested successfully booting a Fedora image with

  qemu-storage-daemon \
    --blockdev file,filename=Fedora-Cloud-Base-Generic-44-1.7.x86_64.qcow2,node-name=file \
    --blockdev qcow2,file=file,node-name=qcow2 \
    --export vhost-user-blk,addr.type=unix,addr.path=/tmp/vhost.socket,id=vub,num-queues=1,node-name=qcow2,writable=on

  qemu-system-x86_64 -smp 2 -M q35,memory-backend=mem \
    -object memory-backend-shm,id=mem,size="512M" \
    -device vhost-user-blk-pci,num-queues=1,chardev=char0 \
    -chardev socket,id=char0,path=/tmp/vhost.socket

Full CI run: https://gitlab.com/tpambor/qemu/-/pipelines/3007880563

[1] https://lore.kernel.org/all/20240618100043.144657-1-sgarzare@redhat.com/
[2] https://lore.kernel.org/all/suvpzkb3ppdodjdyo5zcpngz5mwrrlq3nfowemh4tqjghbc4si@hzrsr23fganv/

Signed-off-by: Tim Pambor <timpambor@gmail.com>
---
Changes in v2:
- Moved "libvhost-user: detect memfd support with a link test" to the
  front of the series.
- Added "libvhost-user: detect eventfd support with a link test".
- Replaced the library-owned self-kick notifier in libvhost-user with a
  per-ring flag; the handlers of started rings now run at the end of
  vu_dispatch(), after the reply has been sent.
- Dropped "io/channel-socket: only clear O_NONBLOCK on received fds if
  set" and instead reimplemented qemu_set_blocking() with fcntl(), so
  F_SETFL is only issued when O_NONBLOCK actually changes.
- vhost_net.c: replaced VHOST_FILE_UNBIND with -1 and dropped the
  Linux header include instead of defining the constant for other
  systems.
- Added a comment and an assert to "vhost-user: kick via
  event_notifier_set()".
- New CI run: https://gitlab.com/tpambor/qemu/-/pipelines/3007880563
- Link to v1: https://lore.kernel.org/qemu-devel/20261022-vhost-user-posix-v1-0-0bd4d450d23c@gmail.com

To: qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Stefano Garzarella <sgarzare@redhat.com>
Cc: "Daniel P. Berrangé" <berrange@redhat.com>
Cc: Marc-André Lureau <marcandre.lureau@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: Kevin Wolf <kwolf@redhat.com>
Cc: Hanna Reitz <hreitz@redhat.com>
Cc: Jason Wang <jasowangio@gmail.com>
Cc: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Cc: qemu-block@nongnu.org
Cc: Raphael Norwitz <rnorwitz@nvidia.com>
Cc: Brad Smith <brad@comstyle.com>
Cc: vhost-user@lists.linux.dev
Cc: Philippe Mathieu-Daudé <philmd@linaro.org>
Cc: Stefan Hajnoczi <stefanha@redhat.com>

---
Stefano Garzarella (2):
      libvhost-user: enable it on any POSIX system
      contrib/vhost-user-blk: enable it on any POSIX system

Tim Pambor (7):
      libvhost-user: detect memfd support with a link test
      libvhost-user: detect eventfd support with a link test
      vhost-user: kick via event_notifier_set()
      libvhost-user: run handlers of started rings after the reply
      util/oslib-posix: implement qemu_set_blocking() with fcntl()
      chardev/char-socket: detect peer close portably
      vhost-user: enable frontends on any POSIX system

 chardev/char-socket.c                     |  78 +++++++++++++++-----
 contrib/vhost-user-blk/vhost-user-blk.c   |  14 ++++
 hw/block/Kconfig                          |   2 +-
 hw/net/vhost_net.c                        |   3 +-
 hw/virtio/vhost-user.c                    |  19 ++---
 meson.build                               |   5 +-
 subprojects/libvhost-user/libvhost-user.c | 118 ++++++++++++++++++++++++------
 subprojects/libvhost-user/libvhost-user.h |   3 +-
 subprojects/libvhost-user/meson.build     |  17 ++++-
 util/meson.build                          |   4 +-
 util/oslib-posix.c                        |  26 +++++--
 11 files changed, 221 insertions(+), 68 deletions(-)
---
base-commit: a19f59a72d96056d9a8f48cf6c77f5787491e414
change-id: 20261022-vhost-user-posix-e7b999aa751d

Best regards,
--  
Tim Pambor <timpambor@gmail.com>

