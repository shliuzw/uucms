package com.uucastle.service.file;

import com.uucastle.common.utils.tree.entity.ZNodes;
import com.uucastle.entity.file.File;
import com.uucastle.entity.file.FilevirtualTracker;
import com.uucastle.repository.file.FilevirtualTrackerDao;
import com.uucastle.repository.system.org.PositionDao;
import com.uucastle.service.base.BaseServiceImp;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Service("FilevirtualTrackerService")
public class FilevirtualTrackerServiceImp extends BaseServiceImp<FilevirtualTracker> implements FilevirtualTrackerService {

	@Autowired
	private FilevirtualTrackerDao filevirtualTrackerDao;
	@Autowired
	private PositionDao positionDao;
	
    public File findFormatByFileName(String fileName){
		File a = null;
		try {
			a= filevirtualTrackerDao.findFormatByFileName(fileName);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return a;
	}
	@Override
	public int insertTracker(FilevirtualTracker file) throws Exception {
		int res=0;
		String barcode = file.getBarcode();
		String gunNo = file.getGunNo();
		//查询数据库是否已经存在文件名
		if(StringUtils.isNotBlank(barcode)&&(filevirtualTrackerDao.findCountByTracker(gunNo, barcode)==0)){
			file.setCreateTime(new Date());
			filevirtualTrackerDao.insert(file);
			res=1;
		}
		return res;
	}

	@Override
	public List<ZNodes> getOrgs() {
		return filevirtualTrackerDao.getOrgs();
	}

	@Override
	public void deleteTracker(FilevirtualTracker file) {
		//事务删除
		filevirtualTrackerDao.delete(file);
	}

	//@Override	
	@Transactional
	public void deleteBatchTracker(String chks) {
		//事务删除	
		if(StringUtils.isNotBlank(chks)){
			String[] chk =chks.split(",");
			List<FilevirtualTracker> list=new ArrayList<FilevirtualTracker>();
			for(String s:chk){
				FilevirtualTracker sd=new FilevirtualTracker();
				sd.setTrackerId(s);
				list.add(sd);
			}
			filevirtualTrackerDao.deleteBatch(list);
		}
	
	}
	
}
