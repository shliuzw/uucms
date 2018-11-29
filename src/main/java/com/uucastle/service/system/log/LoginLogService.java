package com.uucastle.service.system.log;

import java.util.List;

import com.uucastle.common.mybatis.Page;
import com.uucastle.entity.system.log.LoginLog;

public interface LoginLogService {

	public Page<LoginLog> findByPage(LoginLog o,Page<LoginLog> page);	
	
	public void saveLoginLog(LoginLog o);
	
	public void deleteBatch(List<LoginLog> os);
}
