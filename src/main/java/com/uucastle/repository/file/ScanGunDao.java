package com.uucastle.repository.file;

import com.uucastle.common.utils.tree.entity.ZNodes;
import com.uucastle.entity.file.ScanGun;
import com.uucastle.repository.base.BaseDao;
import com.uucastle.repository.base.JYBatis;
import org.apache.ibatis.annotations.Param;

import java.util.List;


/**
 * 用户数据层
 */
@JYBatis
public interface ScanGunDao extends BaseDao<ScanGun>{
    /**
     * 根据登录帐号查找loginName和accountType，正常只有一条数据
     * and a.isvalid='1' and a.account_type='1'需要该条件
     * @param gunNo
     * @return
     */
    public ScanGun findFormatByGunNo(String gunNo);
    /**
     * 根据登录帐号ID,正常只有一条数据
     * @param gunId
     * @return
     */
    public ScanGun findGunById(String gunId);
    /**
     * 获得角色树
     * @return
     */
    public List<ZNodes> getOrgs();
    /**
     * 通过登录名查找用户数量
     * @param gunNo 文件名
     * @return
     */
    public int findCountByGunNo(@Param("gunNo") String gunNo);

}
