Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=67.231.153.30
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794261377;
	b=4kD8DHlzIBoJNxivS1vT7KO4le3ikWVPyshlkbXL54tSKVyjAEgY54rMHu0TBV4LlOP0
	 FU/XkMfF23GLPLIGWd7gGPcCp77V+FHGJD022dYIv/ajoL5OuqDlI50ECFoCjr5z5r44c
	 BmYTs4pW3VW+nYnqymYenramQXcI7W63a+e3xaRydEBm4gsIN3SniGFMieXz6bU5x/X3W
	 wZEIpl4MAlCDCc/jV+MQEoNfijbzR4yYm25i+R9aGhJJLkEKI1pHb2jGB5ta3i6/cNGFD
	 Se2tNlt+sPygWIpVMyOV3suJacUK/UGx3PARQehzBkM41IDnRtl1Kmr9Ly8X7O+1miw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794261377;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-ID:X-B4-Tracking:X-Change-ID:To:CC:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Originating-IP:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version;
	bh=+XP53B242Erg4lki601LZoZT70FJV9F5x4ogjbrV87A=;
	b=NzFdQ6uD9go6WZaI9lRPw+Ex93cuQ6OmlR+oACT/7tnlBwUhMilgiaKfR5MOEJJ2WCaa
	 0MN7IBXUQXuoyPe2jSMxEVzjeJAPDwsNI9iqbPuI1R30kpfIkqEpipJkeMaRt+kbK7TeP
	 WOHIQtInpCaV/b4KBY6yQKFLK2uuDNhoMjyQehDvKXwgwmRxSEH+ISyTBT8UTnEO3k8O0
	 QWHlOtbiOHLbirt7uRs97m2mQkAHbPuyHci54VkSzJe6mWQTE5w76MryePFxJzqEkntXM
	 jKWnIdPv5eDJ6kT8+HnKkXzCAX9Cs+ihKhEMTgn7Usg2o35iXOMWK16TWO8Vnp9AbuQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=meta.com;
	spf=pass smtp.mailfrom=meta.com;
	dkim=pass header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=CdJExJ+6;
	arc=none smtp.remote-ip=67.231.153.30
Received: from mx0b-00082601.pphosted.com (mx0b-00082601.pphosted.com [67.231.153.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EDA4606A31C
	for <vhost-user@lists.linux.dev>; Mon,  9 Nov 2026 21:56:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9EDA4606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=CdJExJ+6
Received: from pps.filterd (m0528005.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A9L9GfN2742611;
	Mon, 9 Nov 2026 13:56:14 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pps82601-s2048-2026-q3; bh=+XP53B242
	Erg4lki601LZoZT70FJV9F5x4ogjbrV87A=; b=CdJExJ+6axsUrpZ4hbkwH9Pwt
	bGuLaMa7MpvgMwIjjOHOHlLCfr6XV+mPTDDQWXYtq9XkCi9Zne/OONxw1G0zjwru
	7y7e7+JusVzMoUjNUbKoQMR4YBpZQh3d/7AlVlxDpfRMZZU8oz/pX7EFbAfZ83Iq
	bF2SK4QLpXJNMkGj/G+HpLm5UaF9IOt46wbxyuXgHwXybPWdj/XOVY53DgI/0Y7i
	VOcyF3iASaYSJ3gQbzEg2ioJcLYVe3XX52vhhOuvDyknu8wQHcard7tWLDz0rAzH
	L/FntFdORijofAGPNjLT5v4ZCuxnZlLRa83m7qj+0P7BHBOpiXyp5+JNOmmKw==
Received: from mail.thefacebook.com ([163.114.134.16])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 4htpepschg-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Mon, 09 Nov 2026 13:56:14 -0800 (PST)
Received: from localhost (2620:10d:c085:208::f) by mail.thefacebook.com
 (2620:10d:c08b:78::2ac9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.56; Mon, 9 Nov
 2026 21:56:12 +0000
From: Simon Lucido <simonlucido@meta.com>
Date: Mon, 9 Nov 2026 22:55:42 +0100
Subject: [PATCH] libvhost-user: return the backend address in SET_MEM_TABLE
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
Message-ID: <20261109-setmemtable-fix-v1-1-00fa83a0c6fb@meta.com>
X-B4-Tracking: v=1; b=H4sIAF1B8moC/yXMUQqDMBCE4avIPhtIgtjaqxQfjBl1S7WSjSKId
 zfax29g/p0EgSH0ynYKWFn4NyWYPKN2aKYein0yWW1LY3SlBHHEGBv3hep4U756FqazXsM9KL3
 mgDTfxXf9tyzugzZeGTqOE6HBtc5zAAAA
X-Change-ID: 20261109-setmemtable-fix-d9841f2d0eb7
To: <qemu-devel@nongnu.org>
CC: "Michael S. Tsirkin" <mst@redhat.com>,
        Stefano Garzarella
	<sgarzare@redhat.com>,
        <vhost-user@lists.linux.dev>, Simon Lucido
	<simonlucido@meta.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1561; i=simonlucido@meta.com;
 h=from:subject:message-id; bh=ZrRfvXnGcnlg/F2xpE6fKLBIAYJACcblm+0W/trQKM0=;
 b=owEB7QES/pANAwAIAYpLxATtCrXeAcsmYgBq8kF6f5SgsvU9DTKAQXfxYeucUBKCbeY3dfKqK
 1fDa5YObDGJAbMEAAEIAB0WIQTwgj9aD8lZwgupzcGKS8QE7Qq13gUCavJBegAKCRCKS8QE7Qq1
 3vFuC/9pK+1uohrmUD2ra4jc0m6i7VTmdNr1aLJR713fRO247PX1i2PSDT1psZ73iLbEvCZeEJZ
 bISg0vunXSSJB9O6wUFDhhQd5vc4z1m6toq9h4m7XtvK5hCMfVGW4aDTvZRZ50dqV5qKcQGfJ4K
 aDqk6Ygo8XrXCDQYSJi3A1/SO1c3DdFTyyHDi6f8a45XiosAPpn5fSVmN3MVArb9VKhtrDlayWd
 qYtdJLlfkMeNexjLLAZTB4vu67wlQCEyopn3tbZgKIK4cp3LZSKVThsYZt3gaL0f082SmJc6Xaz
 1mtQxyhZQZo6ZsHmxRrQKrRfOufxo0zKfqvi5Pmw+kCcnp1dEVtcni6Qvpnmwuh0F9vPLWPiy4K
 FpiUiFyn8D/LqospsHBusREh/DNLE9SptLzYQzSLg3jN1v20rKwRi7B2eZs0lXB0K3F8aOoVUgv
 +B18o4eLnut2tzhNCuEIRhAAIHsTFhipug+ZsfTMcVHKlntDJ3PzH1SMSi3JAft7vmaug=
X-Developer-Key: i=simonlucido@meta.com; a=openpgp;
 fpr=F0823F5A0FC959C20BA9CDC18A4BC404ED0AB5DE
X-Authority-Analysis: v=2.4 cv=ULBIjyfy c=1 sm=1 tr=0 ts=6af2417e cx=c_pps
 a=CB4LiSf2rd0gKozIdrpkBw==:117 a=CB4LiSf2rd0gKozIdrpkBw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=7x6HtfJdh03M6CCDgxCd:22 a=jCddH8ec0KUNCymVuxII:22 a=p0WdMEafAAAA:8
 a=VabnemYjAAAA:8 a=LDzaNlu2npTx8y8zOV0A:9 a=QEXdDO2ut3YA:10 a=O8hF6Hzn-FEA:10
 a=gKebqoRLp9LExxC7YDUY:22
X-Proofpoint-GUID: AqrpJZcbH-2o_28gQYMHpSCRnMQTlwSd
X-Proofpoint-ORIG-GUID: AqrpJZcbH-2o_28gQYMHpSCRnMQTlwSd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA4NyBTYWx0ZWRfX709FWMDOQPGt
 ayNRori2i7I9GmL0uFrmFeSpskOVFtbJk1YVV+kyv0KZFvy5+36xLoiIXqWJMKYnWMGlA+7JMjY
 7/LO59yA12FlJj1l0SZ/3UpVDyvQvCt8E77bwLG8hoZCw4Q+F3D9L1kf323hH9M1PE72hcB/jHR
 07M4I78w8n8J4dZ4cyd1pQgaE6G/+4qZgRhmWdpCgpC/20zISDC3P4stJpXEbSViphTnWkokiWp
 HhvEcHJ2SI8Yl6/pIRCBfSiWCctP+F0qAGAP+t2gCbvpMQkKbsBmhp9HCm5VIutH5q8nwqAlzxr
 PSdFt48213TMad1cCc7J0ZuPWkUx3mzYBcwNtEdc/plkmld5KY8vn0KX5eNJEuVT/kem9L0HZ97
 +SagLDHwVsGTNbMz5ziP7XdeakE3R7VU79Cbq2ZXL556ovYKucneZ41VvyY3mUOImKOgI+Eh6a4
 LeSQgNLL/LKzQhuFe5A==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA4NyBTYWx0ZWRfX2fuzlzEflaID
 SLALN03CRdUVQABtIrPppMOF0ZqyL5SO0CvTP+jlYCcj+9bz7jo2kdOR6A65ER5vaCi+QMSJq2j
 VPF5IKtTMSc54BKZQSPVng+mHTeBLBU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_07,2026-11-06_01,2025-10-01_01

During postcopy, the vhost-user backend ought to return the base address
at which they mapped regions during SET_MEM_TABLE and ADD_MEM_REG calls
[0]. This was done properly for ADD_MEM_REG, but not for SET_MEM_TABLE,
so any frontend that was relying on that call would not work.

QEMU wasn't affected as it uses ADD_MEM_REG, but any combination of a
frontend that uses SET_MEM_TABLE and libvhost-user backend is.

[0]: https://gitlab.com/qemu-project/qemu/-/blob/144393da8d4bd307a22525c7feea2bb29a0a7556/docs/interop/vhost-user.rst#L1263

Fixes: d288eef3a0a8 ("libvhost-user: fix -Waddress-of-packed-member")
Signed-off-by: Simon Lucido <simonlucido@meta.com>
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

