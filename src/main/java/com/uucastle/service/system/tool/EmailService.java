package com.uucastle.service.system.tool;

import com.uucastle.entity.system.tool.Email;
import com.uucastle.service.base.BaseService;

public interface EmailService extends BaseService<Email>{
	
	/**发送邮件（简单版）
     * @param o
     * @return
     */
	public boolean sentEmailSimple(Email o);

}
