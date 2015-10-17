package com.bob.coder.generator;

import com.bob.coder.table.Table;
import com.bob.coder.util.DirMaker;
import com.bob.coder.util.FileEnum;
import freemarker.template.Configuration;
import freemarker.template.DefaultObjectWrapper;
import freemarker.template.Template;
import freemarker.template.TemplateException;

import java.io.*;


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
        Configuration configuration = getConfiguration(Config.templatePath);
        Template temp = configuration.getTemplate(fileType.templateURI);
        String packageName = table.getPackageName() + "." + table.getClassName_x() + fileType.packageNamee;
        String url = Config.outPutPath + File.separator + packageName.replace(".", File.separator)
                + File.separator + table.getClassName_d() + fileType.fileName;
        File file = new File(url);
        DirMaker.createFile(file);
        Writer out = new FileWriter(file);
        temp.process(table, out);
        temp.process(table, new OutputStreamWriter(System.out));
        out.flush();
    }

    public static Configuration getConfiguration(String url) {
        if (cfg == null) {
            cfg = new Configuration(Configuration.DEFAULT_INCOMPATIBLE_IMPROVEMENTS);
            // TODO
            url =
                    System.getProperty("user.dir") + File.separator + url;
//                    "\\D:\\java\\IntelliJ\\workSpace\\Bob\\coder\\target\\classes\\"+url;
            System.out.println(url);
            File file = new File(url);
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
