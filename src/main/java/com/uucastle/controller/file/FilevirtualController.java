package com.uucastle.controller.file;

import com.uucastle.common.ajax.AjaxRes;
import com.uucastle.common.mybatis.Page;
import com.uucastle.common.utils.BarcodeUtil;
import com.uucastle.common.utils.DateUtils;
import com.uucastle.common.utils.FileUtil;
import com.uucastle.common.utils.WordUtil;
import com.uucastle.common.utils.base.Const;
import com.uucastle.common.utils.tree.entity.ZNodes;
import com.uucastle.controller.base.BaseController;
import com.uucastle.entity.file.Filevirtual;
import com.uucastle.service.file.FilevirtualService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/backstage/filevirtual/")
public class FilevirtualController extends BaseController<Filevirtual>{

	@Autowired
	private FilevirtualService filevirtualService;

	/**
	 * 打开文件录入首页
	 * @param model
	 * @return
	 */
	@RequestMapping("index")
	public String index(Model model){
		if(doSecurityIntercept(Const.RESOURCES_TYPE_MENU)){
			model.addAttribute("permitBtn", getPermitBtn(Const.RESOURCES_TYPE_FUNCTION));	
			return "/system/filevirtual/list";
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
		if(ar.setNoAuth(doSecurityIntercept(Const.RESOURCES_TYPE_MENU, "/backstage/filevirtual/index"))){
			try {
				List<ZNodes> list= filevirtualService.getOrgs();
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
	public AjaxRes findByPage(Page<Filevirtual> page,Filevirtual file){
		AjaxRes ajaxRes = getAjaxRes();
		if(ajaxRes.setNoAuth(doSecurityIntercept(Const.RESOURCES_TYPE_MENU,"/backstage/filevirtual/index"))){
			try {
				Page<Filevirtual> files = filevirtualService.findByPage(file, page);
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
	public AjaxRes add(Filevirtual file){
		AjaxRes ar=getAjaxRes();
		if(ar.setNoAuth(doSecurityIntercept(Const.RESOURCES_TYPE_FUNCTION))){			
			try {
				file.setFileId(get32UUID());
				file.setBarcode(DateUtils.formatDate(new Date(), DateUtils.DATETIME_PATTERN));
				int res= filevirtualService.insertFile(file);
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
				filevirtualService.deleteBatchFile(chks);
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
	public AjaxRes del(Filevirtual file){
		AjaxRes ar = getAjaxRes();
		if(ar.setNoAuth(doSecurityIntercept(Const.RESOURCES_TYPE_BUTTON))){
			try {
				filevirtualService.deleteFile(file);
				ar.setSucceedMsg(Const.DEL_SUCCEED);
			} catch (Exception e) {
				logger.error(e.toString(),e);
				ar.setFailMsg(Const.DEL_FAIL);
			}
		}
		return ar;
	}
	
	@RequestMapping(value="find", method=RequestMethod.POST)
	@ResponseBody
	public AjaxRes find(Filevirtual file){
		AjaxRes ar=getAjaxRes();
		if(ar.setNoAuth(doSecurityIntercept(Const.RESOURCES_TYPE_BUTTON))){	
			try {
				List<Filevirtual> list= filevirtualService.find(file);
				Filevirtual acount =list.get(0);
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
	public AjaxRes update(Filevirtual file){
		AjaxRes ar=getAjaxRes();
		if(ar.setNoAuth(doSecurityIntercept(Const.RESOURCES_TYPE_BUTTON))){
			try {
				file.setUpdateTime(new Date());
				filevirtualService.update(file);
				ar.setSucceedMsg(Const.UPDATE_SUCCEED);
			} catch (Exception e) {
				logger.error(e.toString(),e);
				ar.setFailMsg(Const.UPDATE_FAIL);
			}
		}
		return ar;
	}

	/**
	 * 生成条码
	 * @param file
	 * @return
	 */
	@RequestMapping(value="createBarcode", method=RequestMethod.POST)
	@ResponseBody
	public AjaxRes createBarcode(Filevirtual file,HttpServletRequest request){
		AjaxRes ar=getAjaxRes();
		if(ar.setNoAuth(doSecurityIntercept(Const.RESOURCES_TYPE_BUTTON))){
			try {
				List<Filevirtual> list= filevirtualService.find(file);
				Filevirtual vfile =list.get(0);
				String realPath=request.getSession().getServletContext().getRealPath("/");
				String basePath = realPath+"/barcode/"+vfile.getBarcode();
				if (!FileUtil.isDirectory(basePath)){
					FileUtil.createDir(basePath);
				}
				String barcodePath = basePath +"/"+vfile.getBarcode()+".png";
				if(!FileUtil.exist(barcodePath)){//判定条码文件是否存在，如果不存在，就生成
					BarcodeUtil.generateFile(vfile.getBarcode(), barcodePath);
				}
				if(FileUtil.exist(barcodePath)){// 如果条码文件存在，就生成HTML文件
					String path = request.getContextPath();
					String basePathTmp = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
					barcodePath = basePathTmp + "barcode/"+vfile.getBarcode()+"/"+vfile.getBarcode()+".png";
					WordUtil.getInstance().createWord(vfile, basePath, barcodePath);
					ar.setSucceed(vfile);

				}else {
					ar.setFailMsg(Const.DATA_FAIL);
				}
			} catch (Exception e) {
				logger.error(e.toString(),e);
				ar.setFailMsg(Const.DATA_FAIL);
			}
		}
		return ar;
	}
	/**
	 * 生成封面
	 * @param file
	 * @return
	 */
	@RequestMapping(value="createFace", method=RequestMethod.POST)
	@ResponseBody
	public AjaxRes createFace(Filevirtual file,HttpServletRequest request,HttpServletResponse response){
		AjaxRes ar=getAjaxRes();
		if(ar.setNoAuth(doSecurityIntercept(Const.RESOURCES_TYPE_BUTTON))){
			try {
				List<Filevirtual> list= filevirtualService.find(file);
				Filevirtual vfile =list.get(0);

				String path = request.getContextPath();
				String basePathTmp = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
				String barcodePath = basePathTmp + "barcode/"+vfile.getBarcode()+"/"+vfile.getBarcode()+".html";
				vfile.setBarcode(barcodePath);
				ar.setSucceed(vfile);
			} catch (Exception e) {
				logger.error(e.toString(),e);
				ar.setFailMsg(Const.DATA_FAIL);
			}
		}
		return ar;
	}
}
