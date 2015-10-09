package com.bob.coder.util;

import com.bob.coder.generator.Configger;

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

    // TODO
    static String filePath =
            "\\D:\\java\\IntelliJ\\workSpace\\Bob\\coder\\target\\classes\\config\\config.properties";
//            ClassLoader.getSystemResource("") + File.separator + "config" + File.separator
//                    + "config.properties";

    public static void setcfg() {
        Properties ppt = readConfig(filePath);
        Object tableNames = ppt.get("tableNames");
        if (tableNames != null && !tableNames.equals("")) {
            Configger.tableNames = ((String) tableNames).split(",");
        }
        Configger.packageName = (String) ppt.get("packageName");
        Configger.templatePath = (String) ppt.get("templatePath");
        Configger.outPutPath = (String) ppt.get("outPutPath");

        Configger.dbDriver = (String) ppt.get("dbDriver");
        Configger.dbURL = (String) ppt.get("dbURL");
        Configger.dbUserName = (String) ppt.get("dbUserName");
        Configger.dbPassWord = (String) ppt.get("dbPassWord");

        Configger.sqlXml = Boolean.parseBoolean((String) ppt.get("sqlXml"));
        Configger.model = Boolean.parseBoolean((String) ppt.get("model"));
        Configger.modelVo = Boolean.parseBoolean((String) ppt.get("modelVo"));
        Configger.dao = Boolean.parseBoolean((String) ppt.get("dao"));
        Configger.daoImpl = Boolean.parseBoolean((String) ppt.get("daoImpl"));
        Configger.service = Boolean.parseBoolean((String) ppt.get("service"));
        Configger.serviceImpl = Boolean.parseBoolean((String) ppt.get("serviceImpl"));
        Configger.controller = Boolean.parseBoolean((String) ppt.get("controller"));
        Configger.editPage = Boolean.parseBoolean((String) ppt.get("editPage"));
        Configger.listPage = Boolean.parseBoolean((String) ppt.get("listPage"));
        Configger.viewPage = Boolean.parseBoolean((String) ppt.get("viewPage"));

        Configger.localDateTime = Boolean.parseBoolean((String) ppt.get("localDateTime"));
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
