package com.uucastle.controller.system;

import com.uucastle.controller.base.BaseController;
import com.uucastle.entity.file.Filevirtual;
import com.uucastle.entity.file.FilevirtualTracker;
import com.uucastle.service.file.FilevirtualService;
import com.uucastle.service.file.FilevirtualTrackerService;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Date;

/**
 * Created by spring on 2017/1/10.
 */
@Controller
@RequestMapping("/collect")
public class CollectController extends BaseController<Object> {

    Log log = LogFactory.getLog(CollectController.class);

    @Autowired
    private FilevirtualTrackerService filevirtualTrackerService;

    @Autowired
    private FilevirtualService filevirtualService;

    @RequestMapping(value="receiveMsg")
    protected void receiveMsg(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        /**
         * message的协议为：枪编号;条码,
         */
        String message = req.getParameter("msg");
        log.info(message + "================");
        if (message == null) return;
        FilevirtualTracker tracker = new FilevirtualTracker();
        try {
            String[] fields = message.split(";");

            tracker.setGunNo(fields[0]);
            tracker.setIsValid(1);
            String[] barcodes = fields[1].split(",");
            for (String barcode : barcodes) {
                tracker.setTrackerId(get32UUID());
                tracker.setBarcode(barcode);
                Filevirtual fvitual = filevirtualService.findFormatByBarcode(barcode);
                if (fvitual == null){
                    resp.getWriter().write("error");
                }
                tracker.setFileId(fvitual.getFileId());
                int res = filevirtualTrackerService.insertTracker(tracker);
                if (res == 0){//同一把枪对应的条码，只能保留一条记录，否则将更新updateTime
                    tracker.setUpdateTime(new Date());
                    filevirtualTrackerService.update(tracker);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            resp.getWriter().write("error");
        }
        resp.getWriter().write("ok");
    }
}
