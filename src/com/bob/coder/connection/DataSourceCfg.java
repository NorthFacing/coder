package com.bob.coder.connection;

/**
 * 数据库配置
 * 
 * @since v0.0.1
 * @author Bob
 * @created 2015年7月14日 下午5:09:40
 */
public class DataSourceCfg {

    public String driver;
    public String url;
    public String user;
    public String pass;
    public int dbType;

    public DataSourceCfg(String driver, String url, String user, String pass) {
        super();
        this.driver = driver;
        this.url = url;
        this.user = user;
        this.pass = pass;
    }

    public DataSourceCfg(String driver, String url, String user, String pass, int dbType) {
        super();
        this.driver = driver;
        this.url = url;
        this.user = user;
        this.pass = pass;
        this.dbType = dbType;
    }

    public String getDriver() {
        return driver;
    }

    public void setDriver(String driver) {
        this.driver = driver;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public String getUser() {
        return user;
    }

    public void setUser(String user) {
        this.user = user;
    }

    public String getPass() {
        return pass;
    }

    public void setPass(String pass) {
        this.pass = pass;
    }

    public int DbType() {
        return dbType;
    }

    public void setDbType(int dbType) {
        this.dbType = dbType;
    }

}
