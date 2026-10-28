Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793207648;
	b=X9lA9DOwwm8SENdA0fVVaJOztEVeN8HehkWTO8OrDg38QQPFoOA4i+zjNxyevuuI5UAe
	 wl2WoZIV3n0WwMl63N5o7d/T0WO65l9nXWhVfJF57Z/wVrCrF99uSuLTnFFQJuDGFNIJb
	 VTl6xPxRyiCDMZtW7uIVZkS1O51RpCVVaNWiu915gc99F5feDCSKN/45E5IBF9OYFVujx
	 2BED+7MhzubM2Fy8zOSGxnPbdoU0H3N01gYcrpgA9ki5vJgi23OhC4NhxGVPoO6OOGxGD
	 KQ7s4zw4OzoiwBIO11hjuiWBVmitBLOTqztR7SipJKW62lQXYK27xtnDvdgM3gtaWwg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793207648;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:In-Reply-To:X-Mailer:X-Mutt-Fcc:X-Mimecast-Spam-Score:
	 X-Mimecast-MFC-PROC-ID:X-Mimecast-Originator:Content-Type:
	 Content-Disposition;
	bh=gsYpqqNsWCDbPhmHvOVJ9XTiCUpe2ciD0w9tmZpqsBk=;
	b=u6RhNxS/zQVTuePKapEiNf294G2qZ4k8VZJ905FGLl7pU4kzi9JYdsa7JGygL5eDrKk5
	 gPIJR7JZBUi8Y5+cZX+dE+Q+xXHl9q7NhCb5+iuUJ0wjRRUgdHY4aE7NtyB0kVoEK7bOM
	 BL1zqMjU4gLbbZMS9SetY8W1kKM2A9HuVLi8kir7yf7GKpuCXorCZr5KHZtYiBsbAFZj1
	 YcYohZ8CvI8nkAic918Re/Nespp6cPdZ9MX8rdbEy363V669mQB1Mh7QXEou/NBmPN7QG
	 tHn441FK7EgBqt87r52twXudRdTXLtGTu/3n5+J+amFOqExu7pOpNysPcG318KFQyKw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=dnrROFb5;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 052E2606A31C
	for <vhost-user@lists.linux.dev>; Wed, 28 Oct 2026 17:14:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 052E2606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=dnrROFb5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793207647;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=gsYpqqNsWCDbPhmHvOVJ9XTiCUpe2ciD0w9tmZpqsBk=;
	b=dnrROFb52dvRwm+p+4WBNT5ql2NorAR6aGOkiHerbrE5lwRzUjhZCfk4GO5qSTE7BePL6Q
	dC2W5+8aQKsVpaZCd0SLeqooQftzj3d0nhYCCEtg/PqYcKRnIqeBhClL1V7+BkaZWUP7Ey
	HkccsQzoBsNhCXA36amPvlHS9FbE8Wk=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-472-H05Thyy5NgKbdWPPRUVkbA-1; Wed, 28 Oct 2026 13:13:59 -0400
X-MC-Unique: H05Thyy5NgKbdWPPRUVkbA-1
X-Mimecast-MFC-AGG-ID: H05Thyy5NgKbdWPPRUVkbA_1793207638
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-48afcecb035so372822f8f.0
        for <vhost-user@lists.linux.dev>; Wed, 28 Oct 2026 10:13:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793207638; x=1793812438;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gsYpqqNsWCDbPhmHvOVJ9XTiCUpe2ciD0w9tmZpqsBk=;
        b=rW77SeO9X96fAy1rseeux5XwYJ7PFv5zVI5ht3F8Rp5+dpU2jHf+xxeYTeEWSA71Kh
         2eWODHPxxQTiY66H9cDCd+G+JPmUeOtnrYz4b8mD1assMA+DJWARHDlZlqx0YTGCTlcP
         EteAKqfB4+0OwD87jt3QlUgMKlcBVsBY1CGWtJDdQdTjvwbVzAAIWDfV3qQFTklP9bmn
         P+dEXNKAbq9Ao3rXVyB7CroMzCiM5YMQjx4q1B0cvmKIW/ni/WHuY1GJjaSJh8eugMkf
         3H4M0b6RKAgCfSxk9qceyzFI6WQDCkIgkOjrHr7GAgB6QmTUrP/WxAtwTKHubzZTks1p
         gcPQ==
X-Forwarded-Encrypted: i=1; AKwUvBwddQqNu9EtUFuB9LvJHdtb00Nzmscjk/Bc90nWOBB4pp6m+Uu9HsigDj+dFYU/inNbMb2qvHdtw5eT@lists.linux.dev
X-Gm-Message-State: AFq9FYLVdf3RJpNhSq8DvgihPitDtHOvgIaDwjSs9F7F311249DX/DpL
	oEovZ46dHGhW+zT1U9fKk1RKbQXRtW2jAzActdUrwnXb/gEadxWEvR+snLOMcalc9vG7VEZiF1X
	XLvqLH6iHgBJdzwW92oUP7pr4wgPYEOG9cKgFnQyzpl1qy4tnV4KNrtSMWDUmnW0=
X-Gm-Gg: AYBFou0f3Kyc/beAmKTPdjXo5GnEojDqVR+LLqkt9pk8kLnXTQ8lD16j4lQppVK6y0X
	J76u7N2HjnEPveXIONYF/P8gU5HTTvzQ/EsNPUpul22dTR/YqaHf5MFO+vVQcYgO3THSsHl1B6U
	lEf8SmoQCt0W51jq0TfVCSGzuiFdg9us91ewIu0FuYkOcz6wnO6XOgxXEc8I+dz7ZpI9t7qLOmK
	JjgMksLv4gcAaHg/nbV1rjLdpEyTin52ujPwg+CkaogDawGdNBTD7cWYd9Sb1BhrHj/014qvvEL
	6mTOdFAaU3A7kpX05OjlLMuaeo4IMC3pazk/Y8gfkUVpYtY9u56ysJkdHfrM3OGgolAGoilUFlU
	U1BD6mRkgrbHFWVFKEqAXZKMpJGp85l8i5tnNZGZu
X-Received: by 2002:a05:6000:98b:b0:48c:6756:dab3 with SMTP id ffacd0b85a97d-48e64945b11mr612259f8f.3.1793207638253;
        Wed, 28 Oct 2026 10:13:58 -0700 (PDT)
X-Received: by 2002:a05:6000:98b:b0:48c:6756:dab3 with SMTP id ffacd0b85a97d-48e64945b11mr612173f8f.3.1793207637644;
        Wed, 28 Oct 2026 10:13:57 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:1536:fc00:b838:383:1c7:6e81])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecd3418sm26513824f8f.41.2026.10.28.10.13.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 10:13:57 -0700 (PDT)
Date: Wed, 28 Oct 2026 13:13:55 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Stefano Garzarella <sgarzare@redhat.com>,
	Omer Can Vural <can.omer.5306@outlook.com>,
	vhost-user@lists.linux.dev
Subject: [PULL 01/78] libvhost-user: protect against OOB memory table access
Message-ID: <d033951e563397b3f6a7162e3de6bd90dcc770e9.1793207602.git.mst@redhat.com>
References: <cover.1793207602.git.mst@redhat.com>
X-Mailing-List: vhost-user@lists.linux.dev
List-Id: <vhost-user.lists.linux.dev>
List-Post: <mailto:vhost-user@lists.linux.dev>
List-Help: <mailto:vhost-user+help@lists.linux.dev>
List-Subscribe: <mailto:vhost-user+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:vhost-user+unsubscribe@lists.linux.dev>
List-Owner: <mailto:vhost-user+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
In-Reply-To: <cover.1793207602.git.mst@redhat.com>
X-Mailer: git-send-email 2.51.2.2891.g4157995a80.dirty
X-Mutt-Fcc: =sent
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 3yyUjkY1kT-cioOVhEY3BiJ4MiZGUg8T_vPmOE85_CY_1793207638
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

SET_MEM_TABLE handler uses nregions from the message as a loop
bound without checking that it is below VHOST_MEMORY_BASELINE_NREGIONS,
so a malformed message causes an out-of-bounds access to the
regions[] and fds[] arrays.

Frontend is trusted so not a security problem, but
an OOB access is not a nice way to handle errors.
Check, and panic.

Fixes: 7b2e5c65f42f ("contrib: add libvhost-user")
Resolves: https://gitlab.com/qemu-project/qemu/-/work_items/4403
Cc: Stefano Garzarella <sgarzare@redhat.com>
Reported-by: Omer Can Vural <can.omer.5306@outlook.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Message-ID: <8adc88f2f535ab0566a5df1c66db728112dd6f74.1789469161.git.mst@redhat.com>
---
 subprojects/libvhost-user/libvhost-user.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/subprojects/libvhost-user/libvhost-user.c b/subprojects/libvhost-user/libvhost-user.c
index 2fed792e85..52817cc733 100644
--- a/subprojects/libvhost-user/libvhost-user.c
+++ b/subprojects/libvhost-user/libvhost-user.c
@@ -1105,6 +1105,13 @@ vu_set_mem_table_exec(VuDev *dev, VhostUserMsg *vmsg)
     vu_remove_all_mem_regs(dev);
 
     DPRINT("Nregions: %u\n", memory->nregions);
+
+    if (memory->nregions > VHOST_MEMORY_BASELINE_NREGIONS) {
+        vu_panic(dev, "Invalid set_mem_table nregions: %u > %u",
+                 memory->nregions, VHOST_MEMORY_BASELINE_NREGIONS);
+        return false;
+    }
+
     for (i = 0; i < memory->nregions; i++) {
         _vu_add_mem_reg(dev, &memory->regions[i], vmsg->fds[i]);
         close(vmsg->fds[i]);
-- 
MST

