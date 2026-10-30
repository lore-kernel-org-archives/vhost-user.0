Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793359299;
	b=AJQOmGHIMc8zGdC+/ifiPKs6bxypmRJwL4qAe+/9gvSpG4x9vnAnmHtNKGTA3Ohzsu+1
	 hPORRHuVr9nZ6ddeqxl0CtHcpCVyLJh39L3dhH8s43EI2urhX/4GbeuYJQKL7+ePZoEYs
	 NvHKhBWbOHdgBbhMAXNlhf6io4XY1oboEkVihrHOsDL7wXdqr8J5jmNPETvPLc2Hp6LBS
	 IwNRwpCwLyRs+w42t9IA6+jnvhdfLruOcapT5cWsbPUDBA0B5icaMQdg0y9NL+rxS7SaN
	 D2ywO1fOVnpI02gc0gY/0P9B43lZ68mttSByVcC3ODS2l0qHFh+HeG4xGacIAze9Q/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793359299;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=pcS+Jwk9ybuv9CPMRa2h0bU6xc+TDlXMtbvBgX/ZHzE=;
	b=qd7wH9hnhJ71na1IOZB6F1P/pRo5Xiglx9BZ1PjF8lQ8kJ7j6/A7emzFhCrz2Z8GvUW1
	 PH/Efg9UzwW3Q8rP+6K9LPBghl3ttwM8dbwAF40LgdAu649F8Y4SJsyjGj3El3+sXTX1i
	 LJteacsOkwzqtr3NZD9luYKhl4Rh3VVIOr1nmx7OjV4UzoikYS8TmxuS15uunTdIac6PR
	 av1zZIq5EUUc1Bq/x/v/6nxqUS8GJsEoLa6egT013f+Jk5lX35A4DhEwzKw2pf8pXMCOt
	 hKvRRPHLRuMkqYns92ONf4tjux6j3Xu1DF9YQnCl6JS+u6Cgu8xNyBM5ArDsgUcoxWw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JLfe9+Hi;
	arc=none smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78EEC606A31C
	for <vhost-user@lists.linux.dev>; Fri, 30 Oct 2026 11:21:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 78EEC606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JLfe9+Hi
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-48e20ed3b9dso546649f8f.2
        for <vhost-user@lists.linux.dev>; Fri, 30 Oct 2026 04:21:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793359298; x=1793964098; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pcS+Jwk9ybuv9CPMRa2h0bU6xc+TDlXMtbvBgX/ZHzE=;
        b=JLfe9+HiQQxTEC6B97T3GpsRyZCCdVga7RqvBExg82mXLS3kroJUc/vZYATa7CphyG
         ss4JTN6veAROxeUTqdjFeLIFn0COiACtyjRUt4bB0Uyfe1UcDzd26uzotZzWS9fOJbzV
         hKtmPgeiRzRF7tF8zRwB2wEQlwMuY/ofqSgolo+O3jyBdJENYjpIWnY9Yf7fq6NPeVFV
         t9wPHGUaproAPYbZM/ayCZgEY/0ghl4LByZqBNOUikhG2UhRg+tmC2HoYAazcDgFfoIG
         xXLgmsRdyE2m7lIBCTT9EmgQk2IhFtF/g1ou8Oxypy9jseMSr+Hu017DKqpruyqDVIB9
         o2Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793359298; x=1793964098;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pcS+Jwk9ybuv9CPMRa2h0bU6xc+TDlXMtbvBgX/ZHzE=;
        b=ztABoEKJl4ryiZAmqKs2rcCKgYUX3ms8e3mgphP2eKkR4DUftkpcVeuRxPPQIfYQpU
         JC4YFZULHkMPb6frrCRnSooykC2McaujF1XU3wRRs21hMv8tYgRech202oeNQc+5A3CS
         oNIH+HBfbMD8JW3O2YRZ3Ob/ktSnLaem4s1bVlHGbt8hQQDH1Q1bCMh7kLVBc2avR/lj
         B5sVyI+8et7zu4RU55v/LMqtxD/oab15AAv3VxEnumdP2Nd4dHjsyh++1s05ruroqwmd
         +3JlVjtPYIU33tftsR/+78hoDonOc23qmU9W7jCpl0h+qgWy6RQKn8CGRJed9xXE3PdL
         hUiQ==
X-Forwarded-Encrypted: i=1; AKwUvBw8DwUU20rVbf4jk3Ys1eIRbbxu43GMKRQH7qoq0iV5LdJ0l9OKFDUXmPc03aRleF/Mv7WkVv+8rEfg@lists.linux.dev
X-Gm-Message-State: AFq9FYKMkrBGZeIKieRf9I7sQxIZW8BZGXLVTvY4AisfUBX1wZeAfLm/
	xDOaJA7a2vR1E6hx90UCCaDigmhvb9l+csg8vurR3IeBNdp3/poPyDHd
X-Gm-Gg: AYBFou37MeQ+YVtt3W8XsapH7JbH3tloaWjTbAoxr1J2IEsGbiMilWlmHQJS5im4zbM
	TUQtVgcYPbFIarB484q8mO5yqVFECKGq39cxdVfJkQm1mBUtTqjKB7vLflNue8aa9E1DaWvMcOF
	tKhjJnm0F2JGLdAaxFjErGQAA3XBcUuiMZc3dO3vFUWm1dsSYSdKdrZr3tv9PLUdq73I4jPyxCN
	DXQs1R/MBCr5vn3ZN0OOvfcPILxAHmpHnbW9fk4raUCTdzrmYoGR0V6XCv0rWNAJ9VADN/wHLA7
	lW1uoeAISJDc26WiOo2QH9rLR4i4VRpt6OSKhSD/Q2JN+yC9Ru982nQ+00QqERtoyWW1ygzKQnl
	0z0RrOJkLg0wWTDvweb6Ab0Segef0j0FgQB0DPMe9C2lL2kPLOqkl5WZcZEWdz7/zsPwiIrVh+H
	AnC468SDL+rchr9Q6EDggv2l6ffI0lA5oFJX1pc6YRzOxlU1ngoDUFB+HYR/MbaUXHkCSxJKsM1
	8FmCr60UZeqUypkgHNklsPNtMbREmElQkYUN8KVik4c6sEKJtjCXNCVnxHsHTgb0JxlSUw19qY7
	he9KPG8h+QRoi/vseJBvnXnIHh4NczlGxvICU/WLXAycgxgstJSuYpFjC0LRMh5EkstfXA+z346
	1qWgYeUjchAT1CDxXgg9Vpl6jMpjJhOtpUT/sRfcbsR7wqzB2aVOvX7lEzCCTPUhDn8j+BpdF49
	hk3REnjv4=
X-Received: by 2002:a05:6000:29d1:b0:48e:37dc:7ff8 with SMTP id ffacd0b85a97d-48e6e5008bfmr2729956f8f.22.1793359297651;
        Fri, 30 Oct 2026 04:21:37 -0700 (PDT)
Received: from tim-m2.local (dynamic-2a02-3100-61d8-3600-98fd-cd98-7ae6-cb49.310.pool.telefonica.de. [2a02:3100:61d8:3600:98fd:cd98:7ae6:cb49])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71a4d3e9sm2893608f8f.6.2026.10.30.04.21.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 04:21:37 -0700 (PDT)
From: Tim Pambor <timpambor@gmail.com>
Date: Fri, 30 Oct 2026 12:20:59 +0100
Subject: [PATCH v2 6/9] chardev/char-socket: detect peer close portably
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
Message-Id: <20261030-vhost-user-posix-v2-6-cda7c17aad13@gmail.com>
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

A hang-up watch for G_IO_HUP alone is not a portable disconnect
detector.  Linux wakes such a poll() when the peer closes, but FreeBSD
registers a wakeup only for read/write interest and macOS drops its
one-shot read filter on any non-EOF event, so as long as nobody polls
the socket for readability the hang-up is not noticed until something
unrelated wakes the main loop.  Frontends that never read from the
chardev, such as vhost-user, are the ones without a G_IO_IN watch, and
that is what makes the vhost-user/reconnect qtest fail under load on
FreeBSD with "wait_for_fds: assertion failed: (s->fds_num)".

While the frontend has no read handler at all, also ask for G_IO_IN on
the hang-up watch and treat EOF as a hang-up.

Signed-off-by: Tim Pambor <timpambor@gmail.com>
---
 chardev/char-socket.c | 78 ++++++++++++++++++++++++++++++++++++++-------------
 1 file changed, 59 insertions(+), 19 deletions(-)

diff --git a/chardev/char-socket.c b/chardev/char-socket.c
index 81bac42a15..62e8871c51 100644
--- a/chardev/char-socket.c
+++ b/chardev/char-socket.c
@@ -36,11 +36,14 @@
 #include "trace.h"
 
 #include "chardev/char-io.h"
+#include "chardev/char-fe.h"
 #include "chardev/char-socket.h"
 
 static gboolean socket_reconnect_timeout(gpointer opaque);
 static void tcp_chr_telnet_init(Chardev *chr);
 static char *qemu_chr_compute_filename(SocketChardev *s);
+static gboolean tcp_chr_hup(QIOChannel *channel, GIOCondition cond,
+                            void *opaque);
 
 static void tcp_chr_change_state(SocketChardev *s, TCPChardevState state)
 {
@@ -345,6 +348,33 @@ static void remove_hup_source(SocketChardev *s)
     }
 }
 
+static void add_hup_source(SocketChardev *s, GIOCondition cond)
+{
+    Chardev *chr = CHARDEV(s);
+
+    remove_hup_source(s);
+    s->hup_source = qio_channel_create_watch(s->ioc, cond);
+    /*
+     * poll() is liable to return POLLHUP even when there is
+     * still incoming data available to read on the FD. If
+     * we have the hup_source at the same priority as the
+     * main io_add_watch_poll GSource, then we might end up
+     * processing the POLLHUP event first, closing the FD,
+     * and as a result silently discard data we should have
+     * read.
+     *
+     * By setting the hup_source to G_PRIORITY_DEFAULT + 1,
+     * we ensure that io_add_watch_poll GSource will always
+     * be dispatched first, thus guaranteeing we will be
+     * able to process all incoming data before closing the
+     * FD
+     */
+    g_source_set_priority(s->hup_source, G_PRIORITY_DEFAULT + 1);
+    g_source_set_callback(s->hup_source, (GSourceFunc)tcp_chr_hup,
+                          chr, NULL);
+    g_source_attach(s->hup_source, chr->gcontext);
+}
+
 static void char_socket_yank_iochannel(void *opaque)
 {
     QIOChannel *ioc = QIO_CHANNEL(opaque);
@@ -520,6 +550,30 @@ static gboolean tcp_chr_hup(QIOChannel *channel,
                                void *opaque)
 {
     Chardev *chr = CHARDEV(opaque);
+    SocketChardev *s = SOCKET_CHARDEV(opaque);
+
+    if (!(cond & G_IO_HUP)) {
+        /* Readable while nobody reads: only EOF counts as a hang-up. */
+        int flags = MSG_PEEK;
+        ssize_t n;
+        char c;
+
+#ifdef MSG_DONTWAIT
+        flags |= MSG_DONTWAIT;
+#endif
+
+        n = recv(s->sioc->fd, &c, 1, flags);
+
+        if (n < 0 && (errno == EAGAIN || errno == EINTR)) {
+            return G_SOURCE_CONTINUE;
+        }
+
+        if (n > 0) {
+            /* Data nobody will read: stop watching for it, or we spin. */
+            add_hup_source(s, G_IO_HUP);
+            return G_SOURCE_REMOVE;
+        }
+    }
     trace_chr_socket_hangup(chr, chr->label);
     tcp_chr_disconnect(chr);
     return G_SOURCE_REMOVE;
@@ -611,27 +665,13 @@ static void update_ioc_handlers(SocketChardev *s)
                                      tcp_chr_read, chr,
                                      chr->gcontext);
 
-    remove_hup_source(s);
-    s->hup_source = qio_channel_create_watch(s->ioc, G_IO_HUP);
     /*
-     * poll() is liable to return POLLHUP even when there is
-     * still incoming data available to read on the FD. If
-     * we have the hup_source at the same priority as the
-     * main io_add_watch_poll GSource, then we might end up
-     * processing the POLLHUP event first, closing the FD,
-     * and as a result silently discard data we should have
-     * read.
-     *
-     * By setting the hup_source to G_PRIORITY_DEFAULT + 1,
-     * we ensure that io_add_watch_poll GSource will always
-     * be dispatched first, thus guaranteeing we will be
-     * able to process all incoming data before closing the
-     * FD
+     * A G_IO_HUP-only poll() is not woken by a peer close on FreeBSD
+     * nor reliably on macOS.  Therefore, while nobody reads, ask for
+     * G_IO_IN too and let tcp_chr_hup tell EOF from data.
      */
-    g_source_set_priority(s->hup_source, G_PRIORITY_DEFAULT + 1);
-    g_source_set_callback(s->hup_source, (GSourceFunc)tcp_chr_hup,
-                          chr, NULL);
-    g_source_attach(s->hup_source, chr->gcontext);
+    add_hup_source(s, G_IO_HUP |
+                   (chr->fe && chr->fe->chr_can_read ? 0 : G_IO_IN));
 }
 
 static void tcp_chr_connect(void *opaque)

-- 
2.55.0

