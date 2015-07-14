package com.bob.coder.fileWriter;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.io.Writer;

import com.bob.coder.generator.GeneratorCfg;
import com.bob.coder.table.Table;
import com.bob.coder.util.DirMaker;

import freemarker.template.Configuration;
import freemarker.template.DefaultObjectWrapper;
import freemarker.template.Template;
import freemarker.template.TemplateException;

/**
 * 
 * @author jlon
 *
 */
public class FileWriterFactory {

    private static Configuration cfg;
    /**
     * 
     */
    public static final int SQLXML = 1;
    /**
	 * 
	 */
    public static final int MODEL = 2;
    /**
	 * 
	 */
    public static final int MAPPER = 3;
    /**
	 * 
	 */
    public static final int SERVICE = 4;
    /**
	 * 
	 */
    public static final int SERVICE_IMPL = 5;
    /**
	 * 
	 */
    public static final int LISTPAGE = 6;

    public static final int EDITPAGE = 7;

    public static final int VIEWPAGE = 8;

    public static final int CONTROLLER = 9;

    /**
     * 
     * @param url
     * @return
     */
    public static Configuration getConfiguration(String url) {
        if (cfg == null) {
            cfg = new Configuration();
            url = System.getProperty("user.dir") + "/" + url;

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

    /**
     * 
     * @param cfg
     *        解析对象
     * @param templateName
     *        模板名称
     * @param root
     *        数据对象 包名称
     * @param fileName
     *        生成文件名称
     */
    public static void dataSourceOut(Configuration cfg, String templateName, Table table, int type) {
        String fileName = null;
        Template temp = null;
        try {
            temp = cfg.getTemplate(templateName);
        } catch (IOException e) {
            e.printStackTrace();
        }
        Writer out = null;

        try {
            String packageName = table.getPackageName() + "." + table.getClassName_x();
            switch (type) {
            case MODEL:
                fileName = ".java";
                packageName += ".model";
                break;
            case CONTROLLER:
                fileName = "Controller" + ".java";
                packageName += ".controller";
                break;
            case MAPPER:
                fileName = "Mapper" + ".java";
                packageName += ".mapper";
                break;
            case SERVICE:
                fileName = "Service" + ".java";
                packageName += ".service";
                break;
            case SERVICE_IMPL:
                fileName = "ServiceImpl" + ".java";
                packageName += ".service.impl";
                break;
            case SQLXML:
                fileName = "Mapper" + ".xml";
                packageName += ".mapper";
                break;
            case LISTPAGE:
                fileName = "List.jsp";
                packageName = ".jsp." + table.getClassName_x();
                break;
            case EDITPAGE:
                fileName = "edit.jsp";
                packageName = ".jsp." + table.getClassName_x();
                break;
            case VIEWPAGE:
                fileName = "View.jsp";
                packageName = ".jsp." + table.getClassName_x();
                break;
            }
            packageName = packageName.replace(".", "/");

            String url = GeneratorCfg.outPutPath + "/" + packageName + "/" + table.getClassName_d() + fileName;

            File file = new File(url);

            DirMaker.createFile(file);

            out = new FileWriter(file);

            temp.process(table, out);

            temp.process(table, new OutputStreamWriter(System.out));

            out.flush();

        } catch (TemplateException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            if (out != null) {
                try {
                    out.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
    }

    public static void dataSourceOut(Configuration cfg, String templateName, Object root, String fileName) {

        Template temp = null;
        try {
            temp = cfg.getTemplate(templateName);
        } catch (IOException e) {
            e.printStackTrace();
        }
        Writer out = null;
        try {
            if (fileName != null && !"".equals(fileName)) {
                String packageName = "";
                packageName = packageName.replace(".", "/");
                String url = "src/" + packageName + "/" + fileName;
                File file = new File(url);
                out = new FileWriter(file);
                temp.process(root, out);
            }
            temp.process(root, new OutputStreamWriter(System.out));
            out.flush();
        } catch (TemplateException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            if (out != null) {
                try {
                    out.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
    }
}
