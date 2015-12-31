package com.bob.coder.util;

/**
 * Created by Bob on 2015/10/1.
 */
public enum FileEnum {
    /**
     * templateURI: 模板路径
     * packageName：文件包路径
     * fileName：文件名
     */
    SQLXML("sqlXml.ftl", ".mapper", "Mapper.xml"),
    MODEL("model.ftl", ".entity", ".java"),
    MODELVO("modelVo.ftl", ".entity", "Vo.java"),
    DAO("dao.ftl", ".mapper", "Mapper.java"),
    DAOIMPL("daoImpl.ftl", ".dao.impl", "DaoImpl.java"),
    SERVICE("service.ftl", ".service", "Service.java"),
    SERVICEIMPL("serviceImp.ftl", ".service.impl", "ServiceImpl.java"),
    CONTROLLER("controller.ftl", ".controller", "Controller.java"),
    LISTPAGE("list.flt", ".jsp.", "List.jsp"),
    EDITPAGE("edit.flt", ".jsp.", "edit.jsp"),
    VIEWPAGE("view.ftl", ".jsp.", "View.jsp");

    public String templateURI;
    public String packageNamee;
    public String fileName;

    FileEnum(String templateURI, String packageName, String fileName) {
        this.templateURI = templateURI;
        this.packageNamee = packageName;
        this.fileName = fileName;
    }
}
