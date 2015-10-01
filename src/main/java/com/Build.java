package com;

import com.bob.coder.connection.ConnectionFactory;
import com.bob.coder.connection.DataSourceCfg;
import com.bob.coder.generator.Config;
import com.bob.coder.generator.Generator;
import com.bob.coder.table.Table;
import com.bob.coder.util.FileEnum;
import com.bob.coder.util.ParseConfig;
import com.bob.coder.util.TableUtil;

import java.sql.Connection;
import java.util.List;

/**
 * 程序入口，执行此mian函数执行代码生成操作
 *
 * @author Bob
 * @created 2015年7月14日 下午4:19:22
 * @since v0.0.1
 */
public class Build {

    public static void main(String[] args) {
        try {
            // 初始化参数
            ParseConfig.setcfg();

            // 获取所有的表
            DataSourceCfg ds = new DataSourceCfg(Config.dbDriver, Config.dbURL, Config.dbUserName, Config.dbPassWord);
            Connection conn = ConnectionFactory.getConnection(ds);
            List<Table> tables = TableUtil.getTables(conn, Config.packageName, Config.tableNames);

            for (Table table : tables) {
                if (Config.sqlXml) {
                    Generator.generateMethod(table, FileEnum.SQLXML);
                }
                if (Config.model) {
                    Generator.generateMethod(table, FileEnum.MODEL);
                }
                if (Config.modelVo) {
                    Generator.generateMethod(table, FileEnum.MODELVO);
                }
                if (Config.dao) {
                    Generator.generateMethod(table, FileEnum.DAO);
                }
                if (Config.daoImpl) {
                    Generator.generateMethod(table, FileEnum.DAOIMPL);
                }
                if (Config.service) {
                    Generator.generateMethod(table, FileEnum.SERVICE);
                }
                if (Config.serviceImpl) {
                    Generator.generateMethod(table, FileEnum.SERVICEIMPL);
                }
                if (Config.controller) {
                    Generator.generateMethod(table, FileEnum.CONTROLLER);
                }
                if (Config.editPage) {
                    Generator.generateMethod(table, FileEnum.EDITPAGE);
                }
                if (Config.viewPage) {
                    Generator.generateMethod(table, FileEnum.VIEWPAGE);
                }
                if (Config.listPage) {
                    Generator.generateMethod(table, FileEnum.LISTPAGE);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
