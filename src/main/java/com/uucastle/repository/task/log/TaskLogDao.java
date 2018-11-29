package com.uucastle.repository.task.log;

import com.uucastle.entity.task.log.TaskLog;
import com.uucastle.repository.base.BaseDao;
import com.uucastle.repository.base.JYBatis;
/**
 * 动态任务数据层
 */
@JYBatis
public interface TaskLogDao extends BaseDao<TaskLog>{
	
}
