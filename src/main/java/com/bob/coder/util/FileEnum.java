package com.bob.coder.util;

/**
 * Created by Bob on 2015/10/1.
 */
public enum FileEnum {

  SQL_XML("sqlXml.ftl", ".mapper", "Mapper.xml", true),
  MODEL("model.ftl", ".entity", ".java", true),
  MODEL_VO("modelVo.ftl", ".entity", "Vo.java", true),
  QUERY("query.ftl", ".entity", "Query.java", true),
  DAO("dao.ftl", ".mapper", "Mapper.java", true),
  DAO_IMPL("daoImpl.ftl", ".dao.impl", "DaoImpl.java", true),
  SERVICE("service.ftl", ".service", "Service.java", true),
  SERVICE_IMPL("serviceImp.ftl", ".service.impl", "ServiceImpl.java", true),
  CONTROLLER("controller.ftl", ".controller", "Controller.java", true),
  LIST_PAGE("list.ftl", ".jsp.", "List.jsp", true),
  EDIT_PAGE("edit.ftl", ".jsp.", "edit.jsp", true),
  VIEW_PAGE("view.ftl", ".jsp.", "View.jsp", true);

  public String templateName;
  public String packageName;
  public String fileName;
  public boolean isGenerate;

  /**
   * @param templateName 模板名称
   * @param packageName  文件包路径
   * @param fileName     文件名
   * @param isGenerate   是否自动生成（默认生成）
   */
  FileEnum(String templateName, String packageName, String fileName, boolean isGenerate) {
    this.templateName = templateName;
    this.packageName = packageName;
    this.fileName = fileName;
    this.isGenerate = isGenerate;
  }

  public static void main(String[] args) {
    FileEnum[] values = FileEnum.values();
    for (FileEnum e : values) {
      e.isGenerate = false;
    }
    for (FileEnum e : values) {
      System.out.println(e.fileName);
      System.out.println(e.isGenerate);
    }
  }
}
