package com.uucastle.repository.oa.leave;

import org.apache.ibatis.annotations.Param;

import com.uucastle.entity.oa.leave.Leave;
import com.uucastle.repository.base.BaseDao;
import com.uucastle.repository.base.JYBatis;
/**
 * 请假数据层
 */
@JYBatis
public interface LeaveDao extends BaseDao<Leave>{
	
	public Leave findLeaveByPId(@Param("pId")String pId);
	
	public void updateRejectReason(Leave leave);
	
	public void updateDescription(Leave leave);
}
