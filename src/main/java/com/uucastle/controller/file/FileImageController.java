package com.uucastle.controller.file;

import com.uucastle.common.ajax.AjaxRes;
import com.uucastle.common.mybatis.Page;
import com.uucastle.common.utils.base.Const;
import com.uucastle.controller.base.BaseController;
import com.uucastle.entity.file.FileImage;
import com.uucastle.service.file.FileImageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.Map;

/**
 * Created by spring on 2017/1/4.
 */
@Controller
@RequestMapping("backstage/fileImage")
public class FileImageController  extends BaseController<FileImage>{
    @Autowired
    private FileImageService fileImageService;

    /**
     * 获取文件列表
     * @param page
     * @param fileImage
     * @return
     */
    @RequestMapping(value="findByPage", method= RequestMethod.POST)
    @ResponseBody
    public AjaxRes findByPage(Page<FileImage> page,FileImage fileImage, @RequestParam("fileId")String fileId){
        AjaxRes ajaxRes = getAjaxRes();
        if(ajaxRes.setNoAuth(doSecurityIntercept(Const.RESOURCES_TYPE_MENU,"/backstage/file/index"))){
            try {
                Page<FileImage> files = fileImageService.findByPage(fileImage, page);
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

    @RequestMapping("/file/imageView")
    public String imageView(){
        return "/system/file/imageView";
    }

    /**
     * 删除当前选择图片文件
     * @param fileImage
     * @return
     */
    @RequestMapping(value = "delFileImage", method = RequestMethod.POST)
    @ResponseBody
    public AjaxRes delFileImage(FileImage fileImage){
        AjaxRes ar = getAjaxRes();
        try {
            fileImageService.deleteFile(fileImage);
            ar.setSucceedMsg(Const.DEL_SUCCEED);
        } catch (Exception e) {
            logger.error(e.toString(),e);
            ar.setFailMsg(Const.DEL_FAIL);
        }
        return ar;
    }
}
