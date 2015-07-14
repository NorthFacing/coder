package com.bob.coder.generator;

import java.sql.Connection;
import java.util.List;

import com.bob.coder.connection.ConnectionFactory;
import com.bob.coder.connection.DataSourceCfg;
import com.bob.coder.fileWriter.FileWriterFactory;
import com.bob.coder.table.Table;
import com.bob.coder.util.TableUtil;

import freemarker.template.Configuration;

/**
 * 
 * @since v0.0.1
 * @author Bob
 * @created 2015年7月14日 下午4:36:34
 */
public class Generator {

    /**
     * 代码生成
     * 
     * @param cfg
     * @since v0.0.1
     * @author Bob
     * @created 2015年7月14日 下午4:37:39
     */
    public void generate() throws Exception {

        DataSourceCfg ds = new DataSourceCfg(GeneratorCfg.dbDriver, GeneratorCfg.dbURL, GeneratorCfg.dbUserName,
            GeneratorCfg.dbPassWord);
        Connection conn = ConnectionFactory.getConnection(ds);
        
        // 获取所有的表名
        List<Table> tables = TableUtil.getTables(conn, GeneratorCfg.packageName, GeneratorCfg.tableNames);

        // 获取模板
        Configuration configuration = FileWriterFactory.getConfiguration(GeneratorCfg.templatePath);

        for (Table table : tables) {
            if (GeneratorCfg.model) {
                buildFactory(table, configuration, FileWriterFactory.MODEL);
            }
            if (GeneratorCfg.controller) {
                buildFactory(table, configuration, FileWriterFactory.CONTROLLER);
            }
            if (GeneratorCfg.mapper) {
                buildFactory(table, configuration, FileWriterFactory.MAPPER);
            }
            if (GeneratorCfg.sqlXml) {
                buildFactory(table, configuration, FileWriterFactory.SQLXML);
            }
            if (GeneratorCfg.service) {
                buildFactory(table, configuration, FileWriterFactory.SERVICE);
            }
            if (GeneratorCfg.serviceImpl) {
                buildFactory(table, configuration, FileWriterFactory.SERVICE_IMPL);
            }
            if (GeneratorCfg.editPage) {
                buildFactory(table, configuration, FileWriterFactory.EDITPAGE);
            }
            if (GeneratorCfg.viewPage) {
                buildFactory(table, configuration, FileWriterFactory.VIEWPAGE);
            }
            if (GeneratorCfg.listPage) {
                buildFactory(table, configuration, FileWriterFactory.LISTPAGE);
            }
        }
        System.err.println("祝贺你,生成成功！");
    }

    /**
	 * 
	 */
    public void buildFactory(Table table, Configuration configuration, int type) {
        String templateUrl = "";
        switch (type) {
        case FileWriterFactory.SQLXML:
            templateUrl = "sqlXml.ftl";
            break;
        case FileWriterFactory.MODEL:
            templateUrl = "model.ftl";
            break;
        case FileWriterFactory.MAPPER:
            templateUrl = "mapper.ftl";
            break;
        case FileWriterFactory.SERVICE:
            templateUrl = "service.ftl";
            break;
        case FileWriterFactory.SERVICE_IMPL:
            templateUrl = "serviceImp.ftl";
            break;
        case FileWriterFactory.CONTROLLER:
            templateUrl = "controller.ftl";
            break;
        case FileWriterFactory.EDITPAGE:
            templateUrl = "edit.flt";
            break;
        case FileWriterFactory.VIEWPAGE:
            templateUrl = "view.ftl";
            break;
        case FileWriterFactory.LISTPAGE:
            templateUrl = "list.flt";
            break;
        }
        build(table, configuration, templateUrl, type);
    }

    /**
     * 
     * @param table
     * @param configuration
     */
    public void build(Table table, Configuration configuration, String templateUrl, int type) {
        FileWriterFactory.dataSourceOut(configuration, // 解析对象
            templateUrl, // 模板名称
            table,      // 数据对象
            type);
    }

}
