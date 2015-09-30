package com.bob.coder.fileWriter;

import com.bob.coder.generator.GeneratorCfg;
import com.bob.coder.table.Table;
import com.bob.coder.util.DirMaker;
import freemarker.template.Configuration;
import freemarker.template.DefaultObjectWrapper;
import freemarker.template.Template;
import freemarker.template.TemplateException;

import java.io.*;

/**
 * @author jlon
 */
public class FileWriterFactory {

    private static Configuration cfg;
    public static final int SQLXML = 1;
    public static final int MODEL = 2;
    public static final int MODELVO = 3;
    public static final int DAO = 4;
    public static final int DAOIMPL = 5;
    public static final int SERVICE = 6;
    public static final int SERVICEIMPL = 7;
    public static final int CONTROLLER = 8;
    public static final int LISTPAGE = 9;
    public static final int EDITPAGE = 10;
    public static final int VIEWPAGE = 11;

    public static Configuration getConfiguration(String url) {
        if (cfg == null) {
            cfg = new Configuration();
            url = System.getProperty("user.dir") + File.separator + "coder" + File.separator + url;

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
                case SQLXML:
                    fileName = "Mapper.xml";
                    packageName += ".mapper";
                    break;
                case MODEL:
                    fileName = ".java";
                    packageName += ".model";
                    break;
                case MODELVO:
                    fileName = "Vo.java";
                    packageName += ".model";
                    break;
                case DAO:
                    fileName = "Dao" + ".java";
                    packageName += ".dao";
                    break;
                case DAOIMPL:
                    fileName = "DaoImpl" + ".java";
                    packageName += ".dao.impl";
                    break;
                case SERVICE:
                    fileName = "Manager" + ".java";
                    packageName += ".manager";
                    break;
                case SERVICEIMPL:
                    fileName = "ManagerImpl" + ".java";
                    packageName += ".manager.impl";
                    break;
                case CONTROLLER:
                    fileName = "Controller" + ".java";
                    packageName += ".controller";
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
