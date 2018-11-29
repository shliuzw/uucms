package com.uucastle.common.utils;

import com.uucastle.entity.file.Filevirtual;
import freemarker.template.Configuration;
import freemarker.template.Template;

import java.io.*;
import java.util.HashMap;

public class WordUtil {
    private Configuration configuration = null;
    public static WordUtil wordUtil = null;

    public static WordUtil getInstance() {
        return wordUtil == null ? new WordUtil() : wordUtil;
    }

    public WordUtil() {
        this.configuration = new Configuration();
        this.configuration.setDefaultEncoding("UTF-8");
    }

    public void createWord(Filevirtual vfile, String basePath, String barcodePath) {
        HashMap dataMap = new HashMap();

        try {
            dataMap.put("fileName", vfile.getFileName());
            dataMap.put("orgName", vfile.getOrgName());
            dataMap.put("createTime", vfile.getCreateTime());
            dataMap.put("barcodeUrl", barcodePath);
            dataMap.put("description", vfile.getDescription());
            this.configuration.setClassForTemplateLoading(this.getClass(), "/");
            Template template = this.configuration.getTemplate("face.ftl");
            File outFile = new File(basePath + "/" + vfile.getBarcode() + ".html");
            Writer out = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(outFile), "UTF-8"));
            template.process(dataMap, out);
            out.close();
        } catch (Exception var8) {
            var8.printStackTrace();
        }

    }

    public static void main(String[] args) {
        new WordUtil();
    }
}
