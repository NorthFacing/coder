package com.bob.coder.util;

import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.util.Properties;

import com.bob.coder.generator.GeneratorCfg;

/**
 * 配置解析
 * 
 * @since v0.0.1
 * @author Bob
 * @created 2015年7月14日 下午5:42:47
 */
public class ParseConfig {

    static String filePath = System.getProperty("user.dir") + File.separator + "config" + File.separator
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
        GeneratorCfg.mapper = Boolean.parseBoolean((String) ppt.get("mapper"));
        GeneratorCfg.model = Boolean.parseBoolean((String) ppt.get("model"));
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
