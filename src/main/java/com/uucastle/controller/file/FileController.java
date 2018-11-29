package com.uucastle.controller.file;

import com.uucastle.common.ajax.AjaxRes;
import com.uucastle.common.mybatis.Page;
import com.uucastle.common.utils.DateUtils;
import com.uucastle.common.utils.PropertyUtil;
import com.uucastle.common.utils.base.Const;
import com.uucastle.common.utils.tree.entity.ZNodes;
import com.uucastle.controller.base.BaseController;
import com.uucastle.entity.file.File;
import com.uucastle.service.file.FileService;
import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/backstage/file/")
public class FileController extends BaseController<File>{

	@Autowired
	private FileService fileService;

	/**
	 * 打开文件录入首页
	 * @param model
	 * @return
	 */
	@RequestMapping("index")
	public String index(Model model){
		if(doSecurityIntercept(Const.RESOURCES_TYPE_MENU)){
			model.addAttribute("permitBtn", getPermitBtn(Const.RESOURCES_TYPE_FUNCTION));	
			return "/system/file/list";
		}
		return Const.NO_AUTHORIZED_URL;
	}

	/**
	 * 获取系统的组织树
	 * @return
	 */
	@RequestMapping(value="orgTree", method=RequestMethod.POST)
	@ResponseBody
	public AjaxRes orgTree(){
		AjaxRes ar=getAjaxRes();
		if(ar.setNoAuth(doSecurityIntercept(Const.RESOURCES_TYPE_MENU, "/backstage/file/index"))){
			try {
				List<ZNodes> list= fileService.getOrgs();
				ar.setSucceed(list);
			} catch (Exception e) {
				logger.error(e.toString(),e);
				ar.setFailMsg(Const.DATA_FAIL);
			}
		}
		return ar;
	}

	/**
	 * 获取文件列表
	 * @param page
	 * @param file
	 * @return
	 */
	@RequestMapping(value="findByPage", method=RequestMethod.POST)
	@ResponseBody
	public AjaxRes findByPage(Page<File> page,File file){
		AjaxRes ajaxRes = getAjaxRes();
		if(ajaxRes.setNoAuth(doSecurityIntercept(Const.RESOURCES_TYPE_MENU,"/backstage/file/index"))){
			try {
				Page<File> files = fileService.findByPage(file, page);
				Map<String, Object> pageMap = new HashMap<String, Object>();
				pageMap.put("permitBtn", getPermitBtn(Const.RESOURCES_TYPE_BUTTON));
				pageMap.put("list", files);
				ajaxRes.setSucceed(pageMap);
			} catch (Exception e) {
				logger.error(e.toString(),e);
				ajaxRes.setFailMsg(Const.DATA_FAIL);
			}
		}
		return ajaxRes;
	}

	/**
	 * 添加文件
	 * @param file
	 * @return
	 */
	@RequestMapping(value="add", method=RequestMethod.POST)
	@ResponseBody
	public AjaxRes add(File file){
		AjaxRes ar=getAjaxRes();
		if(ar.setNoAuth(doSecurityIntercept(Const.RESOURCES_TYPE_FUNCTION))){			
			try {
				file.setFileId(get32UUID());
				file.setBarcode("");
				int res= fileService.insertFile(file);
				if(res==1)
					ar.setSucceedMsg(Const.SAVE_SUCCEED);
				else
					ar.setFailMsg("文件名已存在");
			} catch (Exception e) {
				logger.error(e.toString(),e);
				ar.setFailMsg(Const.SAVE_FAIL);
			}
		}
		return ar;
	}

	/**
	 * 批量删除
	 * @param chks
	 * @return
	 */
	@RequestMapping(value="delBatch", method=RequestMethod.POST)
	@ResponseBody
	public AjaxRes delBatch(String chks){
		AjaxRes ar=getAjaxRes();
		if(ar.setNoAuth(doSecurityIntercept(Const.RESOURCES_TYPE_FUNCTION))){		
			try {
				fileService.deleteBatchFile(chks);
				ar.setSucceedMsg(Const.DEL_SUCCEED);
			} catch (Exception e) {
				logger.error(e.toString(),e);
				ar.setFailMsg(Const.DEL_FAIL);
			}
		}
		return ar;
	}
	/**
	 * 删除单个文件
	 * @param file
	 * @return
	 */
	@RequestMapping(value="del", method=RequestMethod.POST)
	@ResponseBody
	public AjaxRes del(File file){
		AjaxRes ar = getAjaxRes();
		if(ar.setNoAuth(doSecurityIntercept(Const.RESOURCES_TYPE_BUTTON))){
			try {
				fileService.deleteFile(file);
				ar.setSucceedMsg(Const.DEL_SUCCEED);
			} catch (Exception e) {
				logger.error(e.toString(),e);
				ar.setFailMsg(Const.DEL_FAIL);
			}
		}
		return ar;
	}

	/**
	 * 备份文件
	 * @param
	 * @return
	 */
	@RequestMapping(value="copyBatch", method=RequestMethod.POST)
	@ResponseBody
	public AjaxRes copyBatch(String srcDir,String destDir){
		AjaxRes ar = getAjaxRes();
		if(ar.setNoAuth(doSecurityIntercept(Const.RESOURCES_TYPE_FUNCTION))){
			try {
				java.io.File from = new java.io.File(srcDir);
				java.io.File to = new java.io.File(destDir);
				try {
					if (!from.exists()){
						ar.setFailMsg(Const.BACKUP_FAIL_SRCDIR);
						return ar;
					}
					if (!to.exists()){
						if(!to.mkdirs()) {
							ar.setFailMsg(Const.BACKUP_FAIL_DESTDIR);
							return ar;
						}
					}
					FileUtils.copyDirectory(from, to);
					ar.setSucceedMsg(Const.BACKUP_SUCCEED);
				} catch (IOException e) {
					e.printStackTrace();
				}
			} catch (Exception e) {
				logger.error(e.toString(),e);
				ar.setFailMsg(Const.BACKUP_FAIL);
			}
		}
		return ar;
	}
	@RequestMapping(value="copyBatchInit", method=RequestMethod.POST)
	@ResponseBody
	public AjaxRes copyBatchInit(File file,HttpServletRequest request){
		AjaxRes ar = getAjaxRes();
		try {
			Map<String,String> uploadMap= PropertyUtil.getPropertyMap(Const.UPLOAD_CONFIG);
			String backupPath=uploadMap.get("backupPath");//备份路径
			String picFilePath=uploadMap.get("picFilePath");//允许图片文件路径

			String realPath=request.getSession().getServletContext().getRealPath("/");
			file.setSrcDir(realPath + picFilePath);
			file.setDestDir(backupPath + DateUtils.getDate("yyyyMMdd")+"_bak/");

			ar.setSucceed(file);
		} catch (Exception e) {
			logger.error(e.toString(),e);
			ar.setFailMsg(Const.DATA_FAIL);
		}
		return ar;
	}
	
	@RequestMapping(value="find", method=RequestMethod.POST)
	@ResponseBody
	public AjaxRes find(File file){
		AjaxRes ar=getAjaxRes();
		if(ar.setNoAuth(doSecurityIntercept(Const.RESOURCES_TYPE_BUTTON))){	
			try {
				List<File> list= fileService.find(file);
				File acount =list.get(0);
				ar.setSucceed(acount);
			} catch (Exception e) {
				logger.error(e.toString(),e);
				ar.setFailMsg(Const.DATA_FAIL);
			}
		}
		return ar;
	}

	/**
	 * 修改文件
	 * @param file
	 * @return
	 */
	@RequestMapping(value="update", method=RequestMethod.POST)
	@ResponseBody
	public AjaxRes update(File file){
		AjaxRes ar=getAjaxRes();
		if(ar.setNoAuth(doSecurityIntercept(Const.RESOURCES_TYPE_BUTTON))){
			try {
				if (fileService.findCountByFileName(file.getFileName(),file.getFileNo())==0){
					file.setDescription(file.getDescription());
					file.setUpdateTime(new Date());
					fileService.update(file);
					ar.setSucceedMsg(Const.UPDATE_SUCCEED);
				}else{
					ar.setFailMsg("文号和文件名已存在");
				}
			} catch (Exception e) {
				logger.error(e.toString(),e);
				ar.setFailMsg(Const.UPDATE_FAIL);
			}
		}
		return ar;
	}
}
