Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795328745;
	b=tNx5kvX8YVjH38JTMTWPrSo+fEnq5c3ODpdQLAihNiKb0pGgaHiVaCP0Ia8ABnODfPMO
	 m8peRPPbJlvpODztD3MAOqW0NlSlPprX/YU5Dbi0l6f7AnmfXtgWCwhSc5MdQU/NIhMsR
	 AKhy0B0uHyOW+KO2J03Ilva7456Oep8u5riQcAw8MIxQHx86v8MxOkB8qU5lgj2z6K3Zk
	 QMI7BZBBTvMGQvFAl4pRysDN6xCw3BGt7P3L71LMER5XfUrXfYpqMXpT+PImbqhPwlxWR
	 h3YFL0JhrqrJAd6QkjbsO3zOAwLdqNmci/ig/MjHki9tNEyUshGi9FbMbJncW9LqF7Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795328745;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=SNaZEsccGIBIzt38P+o6w1X84KT3cFswWVavZXBY+FA=;
	b=FB682dOwk94H1BTUPm2gCSbXSaivR0KghDG8kHQxZzysezvXDzYIs/6lXxqfKC/kbKih
	 u6QewrjLa0fRnJHmRo8h2xvCUMZNUNhNZrbSQ/kJoC5EnYzShshzKAXpFe7HnwFQnlb78
	 3r1jd47aIu3gcREE2HX4vaHxKc9+5+JVVQe6zVi5q+nyV5gWl3HSeyjTmzc/6cPoeBW1C
	 YEmiM9I+nrKjFk4WJ3cKc/pE5vVugaTLAd5sGBo1Bdnqs2MIjFE9zuovXGt46CUzE72Wf
	 vgO4zr1IId1CTqpnrEcTeNTvfiji1NGrSf3/Xv8VFSZ+LL6Adx2nMfSR1UnvmArJ9OA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=m2U0mj4n;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65743606A32A
	for <vhost-user@lists.linux.dev>; Sun, 22 Nov 2026 06:25:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=m2U0mj4n
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795328745;
	b=POxmbt26I+IdZGekhWVikEXuilMLrBxM19rXnd2IahyrbbQArtfCIJkj4lXrMS4YVHvJ
	 19Yhd1/qZ/rSBNS2hOTiM+XHXFU7RQPJ6JFSxquf9jqQpGSeL8+L6TLTGPtVAsIAJbKQS
	 ITMiC+OF/kuIVxn7rF/sAnVNel0/6A3P93PJLBFxgFPY22SKwY34g1FLRCzL/BYnLUtKk
	 0IJ4bIgECD8ekBN4+Y7lY6RS2kC0UQqODQcC3wXR5pIMq5l8Xdso03niLGQjievpgNlV6
	 QjK5t0XCDpu915cn0eVTVPHekCIyyGPRbqNLAbmpgaVjOeiMFUtvWpbmJ2DgrHPaziw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795328745;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=SNaZEsccGIBIzt38P+o6w1X84KT3cFswWVavZXBY+FA=;
	b=br5YFNU3CZWW/vPvTu1ApcuSLOA6M8/pnZP+nsAbCLJLqeP3wA+hLAuLXUD8JDQAIUDb
	 VRPlkLi9s3a5M+slfI44nLFaJ7sMgA2bupd0iM5mUmQmA09V+D82oM993nnnSzZyJV3n0
	 NGrMVQ8Y0Mo/MigELrGNDljVcnj+sPpO94vdC3GLV7Ton5TQlvt0OvHR1jJmdSmOG0EV+
	 hIl/zHLBI6Q7crOQmZln+pclFQQTh51iNH4ZVZvWGwSPvHSBUO2QEsOytNMEZzBXgeO/O
	 +fMgml1pqw+6eByJKo2CVUxEl3Du/OwoQ9O8kK3JGL/+Jjq5iInRyATt87wIuotDSDA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 28EA81F000C6;
	Sun, 22 Nov 2026 06:25:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795328744;
	bh=SNaZEsccGIBIzt38P+o6w1X84KT3cFswWVavZXBY+FA=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=m2U0mj4nSZyn9YxgpqmEFeoUt0pzkRo+88KwpPE91ywKdHShqB4g2W6VoPiYzLjLa
	 +dm3hlnc9rfitVS/tURbrWKBFzOlEh+PVlXOmmZnRrSxaD964h1B227Dgc6Xm+ikHG
	 5eplTUR1w5eNHb4OH1LkYp+SWwLniQ5bvq/9UmBF09TLufXKAtaeg2HR7UxMt9OOi6
	 QGSVCyeVhBoCZEeTIDacnLsJq8H3JvcqIhUV0uKKT7PITGdkwuQNrzjLf7KbeNi05b
	 xGNrMTt2mfX5lZZ6vzWr+pGn6uOxTbQryJGlKu0z5c8fEWfAeECCXszQOItpUqza6q
	 j0KtOZYHO0TIw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 845584BF84;
	Sun, 22 Nov 2026 06:25:43 +0000 (UTC)
From: Kevin Nguyen via B4 Relay <devnull+kevinnguyen4221.gmail.com@kernel.org>
Date: Sun, 22 Nov 2026 00:25:34 -0600
Subject: [PATCH] libvhost-user: fail SET_LOG_BASE if mmap() of the log
 fails
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
Message-Id: <20261122-libvhost-user-log-mmap-v1-1-4ccf0773426d@gmail.com>
X-B4-Tracking: v=1; b=H4sIAN2KAmsC/yXMMQ6DMAxA0asgz7VUR4WhV6k6JMEBV0BQDBES4
 u4NML7h/x2Uk7DCu9ohcRaVOBXQowLf26ljlLYYzNM0RIZwEJf7qAuupcQhdjiOdsYmmFeogyd
 rHZR4Thxku8af721d3Y/9ct7gOP7w1XKUegAAAA==
X-Change-ID: 20261121-libvhost-user-log-mmap-6f24f5fc1aab
To: qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>, 
 Stefano Garzarella <sgarzare@redhat.com>, vhost-user@lists.linux.dev, 
 Kevin Nguyen <kevinnguyen4221@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795328743; l=2047;
 i=kevinnguyen4221@gmail.com; s=20261122; h=from:subject:message-id;
 bh=SxRVO/izDzYDID+FOGrsw/Qa/MKm2CvHM3VK68d+uuk=;
 b=1MSdQhGdWhkVii1UESGNaxMkTQKDGXTU6JioYZdIwlEli5ipOq4nTrKGrn/0cEXTYVe1fK8YQ
 CpUyAkqQ2eJDfuqFWHVzIYEGFOF1k50CTCUuvSUydt7PKmmBYk4kFcs
X-Developer-Key: i=kevinnguyen4221@gmail.com; a=ed25519;
 pk=cBY2wqCM3aigaylJj7NwKyb/YiW+LT6+Ane7Mxc7p0s=
X-Endpoint-Received: by B4 Relay for kevinnguyen4221@gmail.com/20261122
 with auth_id=1599
X-Original-From: Kevin Nguyen <kevinnguyen4221@gmail.com>
Reply-To: kevinnguyen4221@gmail.com
Content-Transfer-Encoding: 7bit

From: Kevin Nguyen <kevinnguyen4221@gmail.com>

If mmap() of the dirty log fd fails, vu_set_log_base_exec() only
prints an error, then unmaps the previous log, stores MAP_FAILED in
dev->log_table and replies as if the request succeeded. The next
request completed with VHOST_F_LOG_ALL set writes through
(uint8_t *)-1 and the backend crashes with SIGSEGV.

Leave the existing log untouched and call vu_panic() instead, without
sending a reply. Setting log_table to NULL would avoid the crash but
silently stop dirty logging, so a migration could complete with
missing pages. The SET_LOG_BASE reply has no status field, so dropping
the connection is the only way to tell the frontend that logging
failed.

Also save errno before close(fd), which may clobber it.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/4793
Signed-off-by: Kevin Nguyen <kevinnguyen4221@gmail.com>
---
 subprojects/libvhost-user/libvhost-user.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/subprojects/libvhost-user/libvhost-user.c b/subprojects/libvhost-user/libvhost-user.c
index df21581033..f47612f9e7 100644
--- a/subprojects/libvhost-user/libvhost-user.c
+++ b/subprojects/libvhost-user/libvhost-user.c
@@ -1159,6 +1159,7 @@ vu_set_log_base_exec(VuDev *dev, VhostUserMsg *vmsg)
     int fd;
     uint64_t log_mmap_size, log_mmap_offset;
     void *rc;
+    int err;
 
     if (vmsg->fd_num != 1 ||
         vmsg->size != sizeof(vmsg->payload.log)) {
@@ -1174,9 +1175,11 @@ vu_set_log_base_exec(VuDev *dev, VhostUserMsg *vmsg)
 
     rc = mmap(0, log_mmap_size, PROT_READ | PROT_WRITE, MAP_SHARED, fd,
               log_mmap_offset);
+    err = errno;
     close(fd);
     if (rc == MAP_FAILED) {
-        perror("log mmap error");
+        vu_panic(dev, "log mmap error: %s", strerror(err));
+        return false;
     }
 
     if (dev->log_table) {

---
base-commit: 8f66cb79044c370e3813c56ceb7a75a5ca2d0a0e
change-id: 20261121-libvhost-user-log-mmap-6f24f5fc1aab

Best regards,
--  
Kevin Nguyen <kevinnguyen4221@gmail.com>


