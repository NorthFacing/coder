package com.bob.coder.generator;

import com.bob.coder.table.Table;
import com.bob.coder.util.Configger;
import com.bob.coder.util.DirMaker;
import com.bob.coder.util.FileEnum;
import freemarker.template.Configuration;
import freemarker.template.DefaultObjectWrapper;
import freemarker.template.Template;
import freemarker.template.TemplateException;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.io.Writer;


/**
 * @author Bob
 * @created 2015年7月14日 下午4:36:34
 * @since v0.0.1
 */
public class Generator {

  private static Configuration cfg;

  public static void generateMethod(Table table, FileEnum fileType)
      throws IOException, TemplateException {
    // 获取模板
    String templatePath = System.getProperty("user.dir") + "\\src\\main\\resources\\template";
    if (Configger.templatePath != null) {
      templatePath = System.getProperty("user.dir") + "\\src\\main\\resources\\" + Configger.templatePath;
    }
    Configuration configuration = getConfiguration(templatePath);
    Template temp = configuration.getTemplate(fileType.templateName);
    String packageName = table.getPackageName() + "." + table.getClassName_x() + fileType.packageName;
    String url = System.getProperty("user.dir") + File.separator + "outPut" + File.separator
        + packageName.replace(".", File.separator) + File.separator
        + table.getClassName_d() + fileType.fileName;
    File file = new File(url);
    DirMaker.createFile(file);
    Writer out = new FileWriter(file);
    temp.process(table, out);
    temp.process(table, new OutputStreamWriter(System.out));
    out.flush();
  }

  public static Configuration getConfiguration(String templatePath) {
    if (cfg == null) {
      cfg = new Configuration(Configuration.DEFAULT_INCOMPATIBLE_IMPROVEMENTS);
      File file = new File(templatePath);
      try {
        cfg.setDirectoryForTemplateLoading(file);
        cfg.setObjectWrapper(new DefaultObjectWrapper());
      } catch (IOException e) {
        e.printStackTrace();
      }
    }
    return cfg;
  }
}
