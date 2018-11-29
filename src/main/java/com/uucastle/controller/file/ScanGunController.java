package com.uucastle.controller.file;

import com.uucastle.common.ajax.AjaxRes;
import com.uucastle.common.mybatis.Page;
import com.uucastle.common.utils.base.Const;
import com.uucastle.common.utils.tree.entity.ZNodes;
import com.uucastle.controller.base.BaseController;
import com.uucastle.entity.file.ScanGun;
import com.uucastle.service.file.ScanGunService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/backstage/scangun/")
public class ScanGunController extends BaseController<ScanGun>{

	@Autowired
	private ScanGunService scanGunService;

	/**
	 * 打开文件录入首页
	 * @param model
	 * @return
	 */
	@RequestMapping("index")
	public String index(Model model){
		if(doSecurityIntercept(Const.RESOURCES_TYPE_MENU)){
			model.addAttribute("permitBtn", getPermitBtn(Const.RESOURCES_TYPE_FUNCTION));	
			return "/system/scangun/list";
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
		AjaxRes ar = getAjaxRes();
		if(ar.setNoAuth(doSecurityIntercept(Const.RESOURCES_TYPE_MENU, "/backstage/scangun/index"))){
			try {
				List<ZNodes> list= scanGunService.getOrgs();
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
	public AjaxRes findByPage(Page<ScanGun> page,ScanGun file){
		AjaxRes ajaxRes = getAjaxRes();
		if(ajaxRes.setNoAuth(doSecurityIntercept(Const.RESOURCES_TYPE_MENU,"/backstage/scangun/index"))){
			try {
				Page<ScanGun> files = scanGunService.findByPage(file, page);
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
	 * @param scanGun
	 * @return
	 */
	@RequestMapping(value="add", method=RequestMethod.POST)
	@ResponseBody
	public AjaxRes add(ScanGun scanGun){
		AjaxRes ar=getAjaxRes();
		if(ar.setNoAuth(doSecurityIntercept(Const.RESOURCES_TYPE_FUNCTION))){			
			try {
				scanGun.setGunId(get32UUID());
				int res= scanGunService.insertGun(scanGun);
				if(res==1)
					ar.setSucceedMsg(Const.SAVE_SUCCEED);
				else
					ar.setFailMsg("扫描枪编号已存在");
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
				scanGunService.deleteBatchGun(chks);
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
	 * @param scanGun
	 * @return
	 */
	@RequestMapping(value="del", method=RequestMethod.POST)
	@ResponseBody
	public AjaxRes del(ScanGun scanGun){
		AjaxRes ar = getAjaxRes();
		if(ar.setNoAuth(doSecurityIntercept(Const.RESOURCES_TYPE_BUTTON))){
			try {
				scanGunService.deleteGun(scanGun);
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
	public AjaxRes find(ScanGun scanGun){
		AjaxRes ar=getAjaxRes();
		if(ar.setNoAuth(doSecurityIntercept(Const.RESOURCES_TYPE_BUTTON))){	
			try {
				List<ScanGun> list= scanGunService.find(scanGun);
				ScanGun acount =list.get(0);
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
	 * @param scanGun
	 * @return
	 */
	@RequestMapping(value="update", method=RequestMethod.POST)
	@ResponseBody
	public AjaxRes update(ScanGun scanGun){
		AjaxRes ar=getAjaxRes();
		if(ar.setNoAuth(doSecurityIntercept(Const.RESOURCES_TYPE_BUTTON))){
			try {
				scanGun.setUpdateTime(new Date());
				scanGunService.update(scanGun);
				ar.setSucceedMsg(Const.UPDATE_SUCCEED);
			} catch (Exception e) {
				logger.error(e.toString(),e);
				ar.setFailMsg(Const.UPDATE_FAIL);
			}
		}
		return ar;
	}
}
