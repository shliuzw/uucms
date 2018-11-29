package com.uucastle.service.weixin.user;

import com.uucastle.entity.weixin.user.WxFollower;
import com.uucastle.service.weixin.base.WxBaseService;

public interface WxFollowerService extends WxBaseService<WxFollower>{

	/**
	 * 同步微信服务器关注者数据
	 */
	public void syncFollower();
}
