package com.uucastle.repository.file;

import com.uucastle.common.utils.tree.entity.ZNodes;
import com.uucastle.entity.file.File;
import com.uucastle.entity.file.FilevirtualTracker;
import com.uucastle.repository.base.BaseDao;
import com.uucastle.repository.base.JYBatis;
import org.apache.ibatis.annotations.Param;

import java.util.List;


/**
 * 用户数据层
 */
@JYBatis
public interface FilevirtualTrackerDao extends BaseDao<FilevirtualTracker>{
    /**
     * 根据登录帐号查找loginName和accountType，正常只有一条数据
     * and a.isvalid='1' and a.account_type='1'需要该条件
     * @param fileName
     * @return
     */
    public File findFormatByFileName(String fileName);
    /**
     * 根据登录帐号ID,正常只有一条数据
     * @param fileId
     * @return
     */
    public File findFileById(String fileId);
    /**
     * 获得角色树
     * @return
     */
    public List<ZNodes> getOrgs();
    /**
     * 通过登录名查找用户数量
     * @param fileName 文件名
     * @return
     */
    public int findCountByTracker(@Param("gunNo") String gunNo, @Param("barcode")String barcode);

}
