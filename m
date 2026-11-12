Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=67.231.145.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794523148;
	b=bPaSyzchza/Z/1xRPk4wTjWJWu97CAqJPZ/xJKueNyoRWHdeCACYzPYphQHy7ixHtpcH
	 jH/c0tQIL6a6Bi6BNEnsrCI2oB2ifFcems0k+o9iI1gf70lHBFb/4OsJnzqt6x4j2z+cx
	 RNu70if1H7ENS8K/X2wRZjwQaPGDZGNnVbREoho/rbQnHMYJbPrJFivtg7uL6pFGJylDs
	 4/mU4c4HbqtjauxIXUPP/xy5RNDvz6Z7vWRjNukaVcloV1dGIubaFtaIf4y6g6V5RPSZi
	 3YEkuwDyP5fRtk6Xa8L8aOD6iMXAuYjUKvAIwys0go/aoWqK/BTo5dozecGxlWojC4Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794523148;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-ID:X-B4-Tracking:X-Change-ID:To:CC:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Originating-IP:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version;
	bh=xI9HUMEq+Bki2kYd3I9HK9gGm5POQNl7FWP7xp7MQ0s=;
	b=auPYV4eiStDawEX14oJuyKzXdHBYi01CiMrSTDmf2/yjQTrubN9iI7svGsi+7a6Z3Uw+
	 /BTWf3EptpYZGLNmcwj7b9BkdCN5e4ag6TwjMpZoTnEg0+J56FJkByBsBWypQKYWttezV
	 eoZsL3wb/yWpgVHdgpYQREmzPA4BPCrB1boQpAHTTTuChWjtTrJwiRmGOBA07TYnGaj60
	 S+9ryFKyzzwWbQHnUgjzM1NoL157UzPTjS7P9WO2MMbLhTOZktIAcNQy0PE6XhRU3P7wF
	 f89mbR5G32vib5gGbGvUnXTQJlGkp6M+wW2dmdWSev1k62JuqiW6HaVUDaqN4vCo3jA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=meta.com;
	spf=pass smtp.mailfrom=meta.com;
	dkim=pass header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=WsNsqdZF;
	arc=none smtp.remote-ip=67.231.145.42
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com [67.231.145.42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B77A8606A31C
	for <vhost-user@lists.linux.dev>; Thu, 12 Nov 2026 22:39:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B77A8606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=WsNsqdZF
Received: from pps.filterd (m0109334.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ACJcieL303144;
	Thu, 12 Nov 2026 14:39:07 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pps82601-s2048-2026-q3; bh=xI9HUMEq+
	Bki2kYd3I9HK9gGm5POQNl7FWP7xp7MQ0s=; b=WsNsqdZFwE8RaLKnSLatfrmCU
	ZKVVy7gdCp7nzGTFmTHAVaHbhu+G2HAZr6fURQE/xDsq0wQaX/v0qlNIoMrXIt00
	NzX9r6W96PHEwH1WisjBYqKKM5AkTPMNIrVaQvWUBuZtbyWtQ0LcYN8abaMDoSYv
	YAGJpoEbJdejucevf3p7+1h+cS7r575D3bIz7uM+ZA2hnyKgPkf254pToSLefJ5p
	LrYRKUgj9MLlqG/FfdnnMopRYthRQ69CyDPAYWNpXYliSFwoRs2Kr7srf5Jqyhnu
	ds54EN1w8977mc+FfHpbDYtqkYucvNNt3xNw8Lomg/3/iWAb5rWYOg9GKBj/A==
Received: from maileast.thefacebook.com ([163.114.135.16])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 4hwfwd3hfr-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 12 Nov 2026 14:39:06 -0800 (PST)
Received: from localhost (2620:10d:c0a8:1b::30) by mail.thefacebook.com
 (2620:10d:c0a9:6f::8fd4) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.56; Thu, 12 Nov
 2026 22:39:05 +0000
From: Simon Lucido <simonlucido@meta.com>
Date: Thu, 12 Nov 2026 23:38:46 +0100
Subject: [PATCH v2] libvhost-user: return the backend mapping address for
 SET_MEM_TABLE
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
Message-ID: <20261112-setmemtable-fix-v2-1-b38ee27e8f19@meta.com>
X-B4-Tracking: v=1; b=H4sIAPU/9moC/3WNyw7CIBREf6W5azGAprau/A/TBY+LxUgxgETT8
 O9CXbs8k5kzK0QMFiOcuxUCZhutXyrwXQdqFssNidWVgVPeM0ZHEjE5dEnIBxJj30SPw5EZrin
 KE9TVM2CNN+N1+nF8yTuq1DStMduYfPhsl5m13n97ZoQRSo0YDoKq3siLwyT2yjuYSilfrg4U0
 78AAAA=
X-Change-ID: 20261109-setmemtable-fix-d9841f2d0eb7
To: <qemu-devel@nongnu.org>
CC: "Michael S. Tsirkin" <mst@redhat.com>,
        Stefano Garzarella
	<sgarzare@redhat.com>,
        <vhost-user@lists.linux.dev>, Simon Lucido
	<simonlucido@meta.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2306; i=simonlucido@meta.com;
 h=from:subject:message-id; bh=G8tVbopjhKBGxwCg6LhcWLK28YAS3os7dsUNIewGMGU=;
 b=owEB7QES/pANAwAIAYpLxATtCrXeAcsmYgBq9kAH0OnQ+gt3hpwRZTM95N8VYQ0hAwrL8DVvg
 HQjYwMhrA2JAbMEAAEIAB0WIQTwgj9aD8lZwgupzcGKS8QE7Qq13gUCavZABwAKCRCKS8QE7Qq1
 3vQUC/994ASBcDWWGB73XJB4x3AT1QYQkQ7Ly4Vr1uaNYF8J0omd9QYuJvWU/Ccaq1WJWmQ+wfN
 jTPrlM5g+KV6xyVVFMEmDDJKYo5IkyVBmSALdDRYOtzbTJq8CJlVN0Xr2nmqotWwnwWVjBCq8J1
 KWSMM/7vti8R4u7nnPILI/YTVSi6K9+ibP8DWCWrgnSJ/4Jl7aJ88E0gar+Wuv8LhCzC2xyLG/v
 a8oLvFl8VYWStxmrbvKZOJ3ZaBl2mWRkF88SXySDr22RDJoj75HY5HIqnIbfIR49+MWMe0wo9UG
 vyQVtpgI5UvcgkQIzAaT6k0OTuOsuW/n9CJqqkq8/KqZdPfIQnUeAV8RBauEqNAC2yCtDhsN8cB
 SXaerU/dN15GmJI0ikKUWAjkx03m36lzmfKuZV/NU+871kzpAFmRUw+OkAOxdnkj+BXZMbfSvqi
 tx5uymvlpL7lhvBTPb56NKYBXM4g6Qat+U/Bs132D4oZq1ICRxDAP/1em4boFQBOX7KWA=
X-Developer-Key: i=simonlucido@meta.com; a=openpgp;
 fpr=F0823F5A0FC959C20BA9CDC18A4BC404ED0AB5DE
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDA5MCBTYWx0ZWRfX46f2IbIP9qgD
 d7kiK0X1GFzt9aHLBG3UFXoJx6hUJjrEkF6yGVMOCv3fahzvbvptwYFUeKso/ZRgKncyA7rcp95
 z9R72uh3/pwfhRdVvbl3TvC3h34jHAg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDA5MCBTYWx0ZWRfXwuOoRoTY6OSq
 nzLKMjRuGCz4IXdA5qDMoT/bBryD22tv7qY+avHqoUL47PT4A4ZWqk349xRex6dFXb0Gy2u5/NI
 vqDqTywcRt3I4jCz04d2tJMS3IVMYGihN8xtKCXZrD0GIQeEfxJmudMfFpDKQPcthmmlsnshm3r
 UGtkRbpIBdOAT2vuYvLELzzUMr6gTIrgUOghG8nD3aaCzmdlSDcGC3vX4S1SK7xiv5cBiiFHRJy
 Hqo7lMjWx6m3naVw7EQZkenlwRZTLBhJRBFmp6r2/G+u7yoFTNPm7GfSwL1+NnoQuqgFkO5WKkP
 Yf8/Cda01/w5onCzi00Bs8/3MZRNSheH95zrX5Db6NMzt+FEZhn1lyFKZba71GTvVdoHDmL64qH
 ChsGV12L+4v3nWa4Rzt8lvNFp9G0Nr1TjvP1+Sj74EK0xFB9PbQeUZG5ALQwJmZLLKlywBckok0
 Sjn6YvYukzYLjz6CMAg==
X-Authority-Analysis: v=2.4 cv=Df+COftW c=1 sm=1 tr=0 ts=6af6400a cx=c_pps
 a=MfjaFnPeirRr97d5FC5oHw==:117 a=MfjaFnPeirRr97d5FC5oHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=7x6HtfJdh03M6CCDgxCd:22 a=crHB47gyY4rKiduisYu9:22 a=p0WdMEafAAAA:8
 a=69wJf7TsAAAA:8 a=VabnemYjAAAA:8 a=ClUZ4s5U31nGu7ryxsEA:9 a=QEXdDO2ut3YA:10
 a=O8hF6Hzn-FEA:10 a=Fg1AiH1G6rFz08G2ETeA:22 a=gKebqoRLp9LExxC7YDUY:22
X-Proofpoint-GUID: SX5zxyzKvaDJ2xW_a13kU6KodIBleL5Y
X-Proofpoint-ORIG-GUID: SX5zxyzKvaDJ2xW_a13kU6KodIBleL5Y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_03,2026-11-11_03,2025-10-01_01

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
---
Changes in v2:
- Reword the commit message to better explain the original bug
- Link to v1: https://lists.nongnu.org/archive/html/qemu-devel/2026-11/msg02840.html
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

---
base-commit: 144393da8d4bd307a22525c7feea2bb29a0a7556
change-id: 20261109-setmemtable-fix-d9841f2d0eb7

Best regards,
--  
Simon Lucido <simonlucido@meta.com>

