package com.uucastle.service.file;

import com.uucastle.common.utils.tree.entity.ZNodes;
import com.uucastle.entity.file.File;
import com.uucastle.repository.file.FileDao;
import com.uucastle.repository.system.org.PositionDao;
import com.uucastle.service.base.BaseServiceImp;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Service("FileService")
public class FileServiceImp extends BaseServiceImp<File> implements FileService {

	@Autowired
	private FileDao fileDao;
	@Autowired
	private PositionDao positionDao;
	
    public File findFormatByFileName(String fileName){
		File a = null;
		try {
			a= fileDao.findFormatByFileName(fileName);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return a;
	}

	@Override
	public int findCountByFileName(String fileName, String fileNo) {
		return fileDao.findCountByFileName(fileName,fileNo);
	}

	@Override
	public int insertFile(File file) throws Exception {
		int res=0;
		String fileName = file.getFileName();
		//查询数据库是否已经存在文件名
		if(StringUtils.isNotBlank(fileName)&&(fileDao.findCountByFileName(fileName,file.getFileNo())==0)){
			file.setCreateTime(new Date());
			fileDao.insert(file);
			res=1;
		}
		return res;
	}

	@Override
	public List<ZNodes> getOrgs() {
		return fileDao.getOrgs();
	}

//	@Override
	public void deleteFile(File file) {
		//事务删除
		fileDao.delete(file);
	}

	//@Override	
	@Transactional
	public void deleteBatchFile(String chks) {
		//事务删除	
		if(StringUtils.isNotBlank(chks)){
			String[] chk =chks.split(",");
			List<File> list=new ArrayList<File>();
			for(String s:chk){
				File sd=new File();
				sd.setFileId(s);
				list.add(sd);
			}
			fileDao.deleteBatch(list);
		}
	
	}
	
}
