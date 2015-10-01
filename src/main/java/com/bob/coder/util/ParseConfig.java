package com.bob.coder.util;

import com.bob.coder.generator.Config;

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
            Config.tableNames = ((String) tableNames).split(",");
        }
        Config.packageName = (String) ppt.get("packageName");
        Config.templatePath = (String) ppt.get("templatePath");
        Config.outPutPath = (String) ppt.get("outPutPath");

        Config.dbDriver = (String) ppt.get("dbDriver");
        Config.dbURL = (String) ppt.get("dbURL");
        Config.dbUserName = (String) ppt.get("dbUserName");
        Config.dbPassWord = (String) ppt.get("dbPassWord");

        Config.sqlXml = Boolean.parseBoolean((String) ppt.get("sqlXml"));
        Config.model = Boolean.parseBoolean((String) ppt.get("model"));
        Config.modelVo = Boolean.parseBoolean((String) ppt.get("modelVo"));
        Config.dao = Boolean.parseBoolean((String) ppt.get("dao"));
        Config.daoImpl = Boolean.parseBoolean((String) ppt.get("daoImpl"));
        Config.service = Boolean.parseBoolean((String) ppt.get("service"));
        Config.serviceImpl = Boolean.parseBoolean((String) ppt.get("serviceImpl"));
        Config.controller = Boolean.parseBoolean((String) ppt.get("controller"));
        Config.editPage = Boolean.parseBoolean((String) ppt.get("editPage"));
        Config.listPage = Boolean.parseBoolean((String) ppt.get("listPage"));
        Config.viewPage = Boolean.parseBoolean((String) ppt.get("viewPage"));

        Config.localDateTime = Boolean.parseBoolean((String) ppt.get("localDateTime"));
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
