package com.uucastle.service.file;

import com.uucastle.common.utils.tree.entity.ZNodes;
import com.uucastle.entity.file.Filevirtual;
import com.uucastle.service.base.BaseService;

import java.util.List;

public interface FilevirtualService extends BaseService<Filevirtual>{
    /**
     * @param barcode
     * @return
     */
    public Filevirtual findFormatByBarcode(String barcode);

    /**
     * 新增文件(后台)
     * @param file
     * @return
     */
    public int insertFile(Filevirtual file) throws Exception;
    /**
     * 获得角色树
     * @return
     */
    public List<ZNodes> getOrgs();
	 /**
     * 删除文件
     * @param file
     * @return
     */
	public void deleteFile(Filevirtual file);
	 /**
     * 批量删除文件
     * @param chks 人员id 
     * @return
     */
	public void deleteBatchFile(String chks);
}
