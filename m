Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793359297;
	b=RTfYgQQJOXPtOT75h8+tTqLI6WGjmoQ4HmyDUQWtlX6cyjmLIFHUeGp/XwdSIEAOmwV3
	 YJOwCNFhCitQvaavtA5hboujCACfPOjC7WXJrxYkQA+VmGx1OYVTmZL+ZoDaR9Bm58jlh
	 R2pIf82Fw9ugaEVyc2Sg84ziucyFRFZVM8fhYnu15OcdW3Sngn5XOZQOAWdZhuFKbKipC
	 hr6F6wuaZnG35YHNEiZ8k+ZdbgLGH0Z5rgtMBx77YJCHJYAbappMhZhFKCWERH/I97HUg
	 ApFK1hI4ansByHjpOU6RdDrxxw9UrvcyX6oFNdDXSCTpj4EUXNM6t10O1bu0B+5rO9A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793359297;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=OKx3WZoWzdD1zHUS1BNUvEzkmCP6IQtxBC0V6HuRO1M=;
	b=nUD2NNukVdb1DN+r5kWfvU5XHuYGKiFAC4notFfioK6yJ4jA1ACKAUN47+groBF/kLiP
	 fkg159OFrKgK5m6l7EfVJ8jnMnsGNJNp4RQ6FuNhdhdi+Y20fM2yWfxutZwbcrz9Fns8Z
	 yJOi3pdonhUZXLeq7NDWvtCSX3zn9mvYYSNw2CoWFtN6AqPTPygIV/odaOH72ltubbFlp
	 8SYom84xLiPDROa1Cn9x1bHQTxG/RZiNFeeBKyzB1rDJGgoBkQSHgxE6fzaL5sIKhwfIo
	 IvYfbE5xaoIGB44MtmZ/qkewX50wyhI1ePs4wgEp9ZEU9872NnKRxw8LDzNWsrR6MkA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GYjVuQM4;
	arc=none smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF175606A31C
	for <vhost-user@lists.linux.dev>; Fri, 30 Oct 2026 11:21:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BF175606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GYjVuQM4
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-48c4be28b82so598471f8f.2
        for <vhost-user@lists.linux.dev>; Fri, 30 Oct 2026 04:21:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793359295; x=1793964095; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OKx3WZoWzdD1zHUS1BNUvEzkmCP6IQtxBC0V6HuRO1M=;
        b=GYjVuQM417arS0asliXNqnWtzZOWZxzn2Qv3w4BC3HPdrHh3o6UBpa3r+Q+cpm86XM
         k98Xpx/CCc1LEL5T5EJi25PFYe/tZTs8Y8bzI+tB5o1KaGRu9CuUWo6WsyZTu2UibKJZ
         Rm8pdy9wlIsS2ZkOZX5FYrKpBTSHPZ6yCJfyED0NLBhMCOXHgl/DtyamDEaTv5BZluil
         KV0OYUYGqZWFX5k23YIoQzE1HtEd8vTgt61bPKEf7I8qKyrhJ7G5oayhGxUyLk8RNZuA
         T/p+dhaH4Bix4EQERJRcl4cs9gQOAa0BxysKiKubndah5Ldd979/YVvngHOt//F6EFSW
         eKAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793359295; x=1793964095;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OKx3WZoWzdD1zHUS1BNUvEzkmCP6IQtxBC0V6HuRO1M=;
        b=AmPzJ+Zx3K1yB/4xOOCjgVKIaePH7GQ4xdou5pKNgkqgXzxJpzzUzD7BIH5UAJdN5m
         uvPNyObYzDVInv6E1S0Co31EJ/3vJzGmUg/VT3bgfAUjVTHE9XfS0hq+bQ43+hr7SQzp
         J1W4uI8Xi8iF5xKpQw83/i5KhQts6+SewVn5w9IUv2LP44Updx4g2yPlL3gvk7P8qdel
         kr+idzdY/fj8SkOB3i9iaRzsSWc7vTa3Fo4jZBTieEoZsUOHFSM+Whfhsl15ocIKWZ74
         qfLUMZm7Y0mabmTq1F2GRl9ckF5cJUFukQPqFA0RdxdaAKaU42i9PXGZ9m4rslZyKCA7
         Ie5w==
X-Forwarded-Encrypted: i=1; AKwUvBw5hnYkUBzNACAIUwL16lkAcIhTtibmo/oK2DQm8j8HXi7kUiTsyvSR/q4JfPEGBkKRtI7ReY057LZa@lists.linux.dev
X-Gm-Message-State: AFq9FYKFqpvZrMVYQFear9QkJw5rdqjKQOsBFINI7WspCvo5bR9Ilkkz
	nw9qtmNPmny/aoIcPPmmmnzZnARv6aetZjkiH469QFHy4kItV1eYyjon
X-Gm-Gg: AYBFou2KsyoM85NIWMcT70BmnXWdKPENbHINE2j5reHZw65Ht+9DZxtj57vMZkqEzv3
	tFBwSOHE5J7nobPq6biqcbHg0eqfpGjhUlX9dA8C1VEstfZLIeIPj2JIPRTv4EcuMyywREuGMLN
	5+8pGbmWptsaL/lief2xodEc6vWAMSH5PLcKzUcfqI+2aNDqBM0Z0RQrQGGtjd0QxB2HeefBCF7
	AV17JnYdzOWB3bpkWR6gZO8BbzDxuGfmrtA9MkE4eARSH5qLuNERCFFvUbRceU8mordenaWIgCh
	X15vp5++Ahz02eZB0E1GLfJF+6EivYG8dLGbPkC7X6hcbCBrKg13R1yVJ1Qchb/5RxN3ZS7365k
	zH9676/4hvXf3JrZ4OizjJngrJyc/6I4R68fAwUmJvivCCn2M/V0LkAxn7xdcS41m7hdpHfbrOv
	kckmE/zjjeB36ZOJJioxfPP+C0J4ldE4EAzUqBDpHzsZgrj/HJghkJlBwMR+mzNJCY2xR0vL/oN
	R4bOsb1h4wFzeG96dPq1rv+AfhtzOMD/PWpVQNH+DmYkOe0BOAylwuR2WBvkO7U/0J5jDJSzynj
	gNerAhWhyI0ScFeJqWJcKNvA1ibr9UqRvGHNLUU7dqE04nlKk3MQ91T2zATYhzgMzlg9aMguOra
	S/U+FztmF8xdtWq/8a2eS4aRchcMJnME5FejLtS5Ks1Yxmkxf01R42pCLbJARNw==
X-Received: by 2002:a5d:5f85:0:b0:48e:20ed:27b1 with SMTP id ffacd0b85a97d-48e6e2625fcmr4697030f8f.0.1793359295061;
        Fri, 30 Oct 2026 04:21:35 -0700 (PDT)
Received: from tim-m2.local (dynamic-2a02-3100-61d8-3600-98fd-cd98-7ae6-cb49.310.pool.telefonica.de. [2a02:3100:61d8:3600:98fd:cd98:7ae6:cb49])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71a4d3e9sm2893608f8f.6.2026.10.30.04.21.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 04:21:34 -0700 (PDT)
From: Tim Pambor <timpambor@gmail.com>
Date: Fri, 30 Oct 2026 12:20:57 +0100
Subject: [PATCH v2 4/9] libvhost-user: run handlers of started rings after
 the reply
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
Content-Transfer-Encoding: 7bit
Message-Id: <20261030-vhost-user-posix-v2-4-cda7c17aad13@gmail.com>
References: <20261030-vhost-user-posix-v2-0-cda7c17aad13@gmail.com>
In-Reply-To: <20261030-vhost-user-posix-v2-0-cda7c17aad13@gmail.com>
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

When a ring is started, it may already hold requests: ones the driver
queued while the back-end was away and ones the previous instance left
in flight. libvhost-user handled them by writing to the kick fd it had
just received, which only works when that fd is an eventfd. With pipes
it is the read end, so the back-end was left relying on the front-end
sending a kick after SET_VRING_KICK.

Instead, flag the ring in vu_set_vring_kick_exec() and run the handler
of every flagged ring at the end of vu_dispatch(), once the reply has
gone out. This needs no writable fd and works the same with eventfds
and pipes.

Signed-off-by: Tim Pambor <timpambor@gmail.com>
---
 subprojects/libvhost-user/libvhost-user.c | 44 ++++++++++++++++++++++---------
 subprojects/libvhost-user/libvhost-user.h |  1 +
 2 files changed, 32 insertions(+), 13 deletions(-)

diff --git a/subprojects/libvhost-user/libvhost-user.c b/subprojects/libvhost-user/libvhost-user.c
index ece2bfcdd7..5f649a3d52 100644
--- a/subprojects/libvhost-user/libvhost-user.c
+++ b/subprojects/libvhost-user/libvhost-user.c
@@ -1320,6 +1320,7 @@ vu_get_vring_base_exec(VuDev *dev, VhostUserMsg *vmsg)
     vmsg->size = sizeof(vmsg->payload.state);
 
     dev->vq[index].started = false;
+    dev->vq[index].kick_pending = false;
     if (dev->iface->queue_set_started) {
         dev->iface->queue_set_started(dev, index, false);
     }
@@ -1493,19 +1494,12 @@ vu_set_vring_kick_exec(VuDev *dev, VhostUserMsg *vmsg)
         vu_panic(dev, "Failed to check inflights for vq: %d\n", index);
     }
 
-    /* Inject a kick to look for available vq buffers */
-    if (dev->vq[index].kick_fd != -1) {
-        int ret;
-
-        do {
-            ret = eventfd_write(dev->vq[index].kick_fd, 1);
-        } while (ret != 0 && errno == EINTR);
-
-        if (ret != 0 && errno != EAGAIN /* already readable */) {
-            vu_panic(dev, "Failed to inject kick during SET_VRING_KICK "
-                     "on vq: %d with error: %m\n", index);
-        }
-    }
+    /*
+     * The ring may already hold requests: ones the driver queued while the
+     * back-end was away and ones the previous instance left in flight. Run
+     * the handler once the reply to this message has gone out.
+     */
+    dev->vq[index].kick_pending = true;
 
     return false;
 }
@@ -2313,6 +2307,25 @@ vu_process_message(VuDev *dev, VhostUserMsg *vmsg)
     return false;
 }
 
+static void
+vu_run_pending_handlers(VuDev *dev)
+{
+    unsigned int i;
+
+    for (i = 0; i < dev->max_queues && !dev->broken; i++) {
+        VuVirtq *vq = &dev->vq[i];
+
+        /* Without a handler the request stays pending until one is set */
+        if (!vq->kick_pending || !vq->handler) {
+            continue;
+        }
+        vq->kick_pending = false;
+
+        DPRINT("Running handler for pending requests on vq: %u\n", i);
+        vq->handler(dev, i);
+    }
+}
+
 bool
 vu_dispatch(VuDev *dev)
 {
@@ -2345,6 +2358,11 @@ vu_dispatch(VuDev *dev)
 
 end:
     free(vmsg.data);
+
+    if (success) {
+        vu_run_pending_handlers(dev);
+    }
+
     return success;
 }
 
diff --git a/subprojects/libvhost-user/libvhost-user.h b/subprojects/libvhost-user/libvhost-user.h
index a534d70771..aedb1da96d 100644
--- a/subprojects/libvhost-user/libvhost-user.h
+++ b/subprojects/libvhost-user/libvhost-user.h
@@ -392,6 +392,7 @@ typedef struct VuVirtq {
     int err_fd;
     unsigned int enable;
     bool started;
+    bool kick_pending;
 
     /* Guest addresses of our ring */
     struct vhost_vring_addr vra;

-- 
2.55.0

