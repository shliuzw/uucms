package com.uucastle.service.oa.leave;

import java.util.Date;

import org.springframework.stereotype.Service;

import com.uucastle.entity.oa.leave.Leave;
import com.uucastle.repository.oa.leave.LeaveDao;
import com.uucastle.service.base.BaseServiceImp;
@Service("OaLeaveService")
public class LeaveServiceImp extends BaseServiceImp<Leave> implements LeaveService {

	//@Override
	public Leave findLeaveByPId(String pId) {
		return ((LeaveDao)baseDao).findLeaveByPId(pId);
	}

	//@Override
	public void updateRejectReason(String pId,String rejectReason) {
		Leave l=new Leave();
		l.setpId(pId);
		l.setRejectReason(rejectReason);
		l.setUpdateTime(new Date());
		((LeaveDao)baseDao).updateRejectReason(l);
	}

	//@Override
	public void updateDescription(String pId,String description) {
		Leave l=new Leave();
		l.setpId(pId);
		l.setDescription(description);
		l.setUpdateTime(new Date());
		((LeaveDao)baseDao).updateDescription(l);
	}

}
