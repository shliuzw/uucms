package com.uucastle.service.file;

import com.uucastle.common.utils.tree.entity.ZNodes;
import com.uucastle.entity.file.ScanGun;
import com.uucastle.repository.file.ScanGunDao;
import com.uucastle.repository.system.org.PositionDao;
import com.uucastle.service.base.BaseServiceImp;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Service("ScanGunService")
public class ScanGunServiceImp extends BaseServiceImp<ScanGun> implements ScanGunService {

	@Autowired
	private ScanGunDao scanGunDao;
	@Autowired
	private PositionDao positionDao;
	
    public ScanGun findFormatByGunNo(String gunNo){
		ScanGun a = null;
		try {
			a = scanGunDao.findFormatByGunNo(gunNo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return a;
	}
	@Override
	public int insertGun(ScanGun scanGun) throws Exception {
		int res=0;
		String gunNo = scanGun.getGunNo();
		//查询数据库是否已经存在文件名
		if(StringUtils.isNotBlank(gunNo)&&(scanGunDao.findCountByGunNo(gunNo)==0)){
			scanGun.setCreateTime(new Date());
			scanGunDao.insert(scanGun);
			res=1;
		}
		return res;
	}

	@Override
	public List<ZNodes> getOrgs() {
		return scanGunDao.getOrgs();
	}

	@Override
	public void deleteGun(ScanGun scanGun) {
		//事务删除
		scanGunDao.delete(scanGun);
	}

	@Override
	@Transactional
	public void deleteBatchGun(String chks) {
		//事务删除	
		if(StringUtils.isNotBlank(chks)){
			String[] chk =chks.split(",");
			List<ScanGun> list=new ArrayList<ScanGun>();
			for(String s:chk){
				ScanGun sd=new ScanGun();
				sd.setGunId(s);
				list.add(sd);
			}
			scanGunDao.deleteBatch(list);
		}
	
	}
	
}
