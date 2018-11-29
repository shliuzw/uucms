package com.uucastle.service.oa.leave;

import com.uucastle.entity.oa.leave.Leave;
import com.uucastle.service.base.BaseService;

public interface LeaveService extends BaseService<Leave>{
	/**
	 * 通过processInstanceId找到请假对象
	 * @param pId
	 */
	public Leave findLeaveByPId(String pId);
	/**
	 * 更新驳回理由
	 * @param rejectReason
	 */
	public void updateRejectReason(String pId,String rejectReason);
	/**
	 * 调整理由
	 * @param rejectReason
	 */
	public void updateDescription(String pId,String description);
}
