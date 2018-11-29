package com.uucastle.repository.system.log;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.uucastle.common.mybatis.Page;
import com.uucastle.entity.system.log.LoginLog;
import com.uucastle.repository.base.JYBatis;

@JYBatis
public interface LoginLogDao {

	public List<LoginLog> findByPage(@Param("param")LoginLog o,Page<LoginLog> page);
	
	public void insert(LoginLog o);
	
	public void deleteBatch(List<LoginLog> os);
}
