package com;

import com.bob.coder.connection.ConnectionFactory;
import com.bob.coder.connection.DataSourceCfg;
import com.bob.coder.generator.Generator;
import com.bob.coder.table.Table;
import com.bob.coder.util.Configger;
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
      List<Table> tables = getTables();

      // 遍历所有表
      for (Table table : tables) {
        // 遍历所有模板文件
        for (FileEnum fileEnum : FileEnum.values()) {
          if (fileEnum.isGenerate) {
            Generator.generateMethod(table, fileEnum);
          }
        }
      }
    } catch (Exception e) {
      e.printStackTrace();
    }
  }

  private static List<Table> getTables() throws Exception {
    DataSourceCfg ds = new DataSourceCfg(Configger.dbDriver, Configger.dbURL, Configger.dbUserName, Configger.dbPassWord);
    Connection conn = ConnectionFactory.getConnection(ds);
    return TableUtil.getTables(conn, Configger.packageName, Configger.tableNames);
  }

}
