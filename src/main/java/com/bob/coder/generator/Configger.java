package com.bob.coder.generator;

/**
 * 生成文件的所有可选项
 *
 * @author Bob
 * @created 2015年7月14日 下午4:24:57
 * @since v0.0.1
 */
public class Configger {

  public static String[] tableNames;
  public static String packageName = "com.bob.biz";
  public static String templatePath = "template/";
  public static String outPutPath = "D:/outPut";

  public static String dbDriver = "com.mysql.jdbc.Driver";
  public static String dbURL;
  public static String dbUserName;
  public static String dbPassWord;

  public static boolean sqlXml;
  public static boolean model;
  public static boolean modelVo;
  public static boolean dao;
  public static boolean daoImpl;
  public static boolean service;
  public static boolean serviceImpl;
  public static boolean controller;
  public static boolean editPage;
  public static boolean viewPage;
  public static boolean listPage;

  public static boolean localDateTime;
}
