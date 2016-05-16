package com.bob.coder.util;

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
          System.getProperty("user.dir") + "\\src\\main\\resources\\config\\config.properties";

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

    for (FileEnum e : FileEnum.values()) {
      String templateName = e.templateName;
      if (templateName.endsWith(".ftl")) {
        templateName = templateName.substring(0, templateName.length() - 4);
        if (ppt.get(templateName) != null) {
          e.isGenerate = Boolean.parseBoolean((String) ppt.get(templateName));
        }
      }
    }

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
    String s = System.getProperty("user.dir");
    System.out.println(s);

  }

}
