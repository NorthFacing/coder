package com.bob.coder.util;

import com.bob.coder.generator.GeneratorCfg;

import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.util.Properties;

/**
 * 配置解析
 *
 * @author Bob
 * @created 2015年7月14日 下午5:42:47
 * @since v0.0.1
 */
public class ParseConfig {

    static String filePath =
//            "\\D:\\java\\IntelliJ\\workSpace\\Bob\\coder\\target\\classes\\config\\config.properties";
            ClassLoader.getSystemResource("") + File.separator + "config" + File.separator
                    + "config.properties";

    public static void setcfg() {
        Properties ppt = readConfig(filePath);
        Object tableNames = ppt.get("tableNames");
        if (tableNames != null && !tableNames.equals("")) {
            GeneratorCfg.tableNames = ((String) tableNames).split(",");
        }
        GeneratorCfg.packageName = (String) ppt.get("packageName");
        GeneratorCfg.templatePath = (String) ppt.get("templatePath");
        GeneratorCfg.outPutPath = (String) ppt.get("outPutPath");

        GeneratorCfg.dbDriver = (String) ppt.get("dbDriver");
        GeneratorCfg.dbURL = (String) ppt.get("dbURL");
        GeneratorCfg.dbUserName = (String) ppt.get("dbUserName");
        GeneratorCfg.dbPassWord = (String) ppt.get("dbPassWord");

        GeneratorCfg.sqlXml = Boolean.parseBoolean((String) ppt.get("sqlXml"));
        GeneratorCfg.model = Boolean.parseBoolean((String) ppt.get("model"));
        GeneratorCfg.modelVo = Boolean.parseBoolean((String) ppt.get("modelVo"));
        GeneratorCfg.dao = Boolean.parseBoolean((String) ppt.get("dao"));
        GeneratorCfg.daoImpl = Boolean.parseBoolean((String) ppt.get("daoImpl"));
        GeneratorCfg.service = Boolean.parseBoolean((String) ppt.get("service"));
        GeneratorCfg.serviceImpl = Boolean.parseBoolean((String) ppt.get("serviceImpl"));
        GeneratorCfg.controller = Boolean.parseBoolean((String) ppt.get("controller"));
        GeneratorCfg.editPage = Boolean.parseBoolean((String) ppt.get("editPage"));
        GeneratorCfg.listPage = Boolean.parseBoolean((String) ppt.get("listPage"));
        GeneratorCfg.viewPage = Boolean.parseBoolean((String) ppt.get("viewPage"));

        GeneratorCfg.localDateTime = Boolean.parseBoolean((String) ppt.get("localDateTime"));
    }

    public static Properties readConfig(String filePath) {
        FileReader fr = null;
        Properties ppt = new Properties();
        try {
            fr = new FileReader(filePath);
            ppt.load(fr);
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            try {
                fr.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        return ppt;
    }

    public static void main(String[] args) {
        ParseConfig cfg = new ParseConfig();
        System.out.println(cfg);

    }

}
