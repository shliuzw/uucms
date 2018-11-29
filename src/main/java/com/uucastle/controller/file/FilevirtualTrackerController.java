package com.uucastle.controller.file;

import com.uucastle.common.ajax.AjaxRes;
import com.uucastle.common.mybatis.Page;
import com.uucastle.common.utils.base.Const;
import com.uucastle.common.utils.tree.entity.ZNodes;
import com.uucastle.controller.base.BaseController;
import com.uucastle.entity.file.FilevirtualTracker;
import com.uucastle.service.file.FilevirtualTrackerService;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/backstage/filevirtualTracker/")
public class FilevirtualTrackerController extends BaseController<FilevirtualTracker>{
	Log log = LogFactory.getLog(FilevirtualTrackerController.class);
	@Autowired
	private FilevirtualTrackerService filevirtualTrackerService;

	@RequestMapping(value = "collect", method = RequestMethod.GET)
	public void index(@RequestParam(value="message",required=true) String message) {
		log.debug("============"+message);
	}

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
		if(ar.setNoAuth(doSecurityIntercept(Const.RESOURCES_TYPE_MENU, "/backstage/file/index"))){
			try {
				List<ZNodes> list= filevirtualTrackerService.getOrgs();
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
	public AjaxRes findByPage(Page<FilevirtualTracker> page,FilevirtualTracker file){
		AjaxRes ajaxRes = getAjaxRes();
			try {
				Page<FilevirtualTracker> files = filevirtualTrackerService.findByPage(file, page);
				Map<String, Object> pageMap = new HashMap<String, Object>();
				pageMap.put("list", files);
				ajaxRes.setSucceed(pageMap);
			} catch (Exception e) {
				logger.error(e.toString(),e);
				ajaxRes.setFailMsg(Const.DATA_FAIL);
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
	public AjaxRes add(FilevirtualTracker file){
		AjaxRes ar=getAjaxRes();
		if(ar.setNoAuth(doSecurityIntercept(Const.RESOURCES_TYPE_FUNCTION))){			
			try {
				file.setTrackerId(get32UUID());
				file.setBarcode("");
				int res= filevirtualTrackerService.insertTracker(file);
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
				filevirtualTrackerService.deleteBatchTracker(chks);
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
	public AjaxRes del(FilevirtualTracker file){
		AjaxRes ar = getAjaxRes();
		if(ar.setNoAuth(doSecurityIntercept(Const.RESOURCES_TYPE_BUTTON))){
			try {
				filevirtualTrackerService.deleteTracker(file);
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
	public AjaxRes find(FilevirtualTracker file){
		AjaxRes ar=getAjaxRes();
		if(ar.setNoAuth(doSecurityIntercept(Const.RESOURCES_TYPE_BUTTON))){	
			try {
				List<FilevirtualTracker> list= filevirtualTrackerService.find(file);
				FilevirtualTracker acount =list.get(0);
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
	public AjaxRes update(FilevirtualTracker file){
		AjaxRes ar=getAjaxRes();
		if(ar.setNoAuth(doSecurityIntercept(Const.RESOURCES_TYPE_BUTTON))){
			try {
				file.setUpdateTime(new Date());
				filevirtualTrackerService.update(file);
				ar.setSucceedMsg(Const.UPDATE_SUCCEED);
			} catch (Exception e) {
				logger.error(e.toString(),e);
				ar.setFailMsg(Const.UPDATE_FAIL);
			}
		}
		return ar;
	}
}
