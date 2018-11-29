package com.uucastle.service.file;

import com.uucastle.common.utils.tree.entity.ZNodes;
import com.uucastle.entity.file.Filevirtual;
import com.uucastle.repository.file.FilevirtualDao;
import com.uucastle.repository.system.org.PositionDao;
import com.uucastle.service.base.BaseServiceImp;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Service("FilevirtualService")
public class FilevirtualServiceImp extends BaseServiceImp<Filevirtual> implements FilevirtualService {

	@Autowired
	private FilevirtualDao filevirtualDao;
	@Autowired
	private PositionDao positionDao;
	
    public Filevirtual findFormatByBarcode(String barcode){
		Filevirtual a = null;
		try {
			a= filevirtualDao.findFormatByBarcode(barcode);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return a;
	}
	@Override
	public int insertFile(Filevirtual file) throws Exception {
		int res=0;
		String fileName = file.getFileName();
		//查询数据库是否已经存在文件名
		if(StringUtils.isNotBlank(fileName)&&(filevirtualDao.findCountByFileName(fileName)==0)){
			file.setCreateTime(new Date());
			filevirtualDao.insert(file);
			res=1;
		}
		return res;
	}

	@Override
	public List<ZNodes> getOrgs() {
		return filevirtualDao.getOrgs();
	}

//	@Override
	public void deleteFile(Filevirtual file) {
		//事务删除
		filevirtualDao.delete(file);
	}

	//@Override	
	@Transactional
	public void deleteBatchFile(String chks) {
		//事务删除	
		if(StringUtils.isNotBlank(chks)){
			String[] chk =chks.split(",");
			List<Filevirtual> list=new ArrayList<Filevirtual>();
			for(String s:chk){
				Filevirtual sd=new Filevirtual();
				sd.setFileId(s);
				list.add(sd);
			}
			filevirtualDao.deleteBatch(list);
		}
	
	}
	
}
