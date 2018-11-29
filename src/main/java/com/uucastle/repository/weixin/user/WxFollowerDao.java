package com.uucastle.repository.weixin.user;

import java.util.List;

import com.uucastle.entity.weixin.user.WxFollower;
import com.uucastle.repository.base.BaseDao;
import com.uucastle.repository.base.JYBatis;


/**
 * 微信关注者数据层
 */
@JYBatis
public interface WxFollowerDao  extends BaseDao<WxFollower>{
 
    public void clearFollower();
    
    public void insertFollowers(List<WxFollower> o);
}
