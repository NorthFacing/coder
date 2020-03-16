package ${packageName}.${className_x}.service;

import ${packageName}.${className_x}.model.${className_d};
import com.joyoung.smart.base.exceptions.BaseException;

/**
 * ${className_d}Service
 * @author Bob.Zhu
 * @Date ${.now}
 */
public interface ${className_d}Service {

  ${className_d} insert(${className_d} entity) throws BaseException;

  int update(${className_d} entity) throws BaseException;

  int delete(String id, String updateUser) throws BaseException;

  ${className_d} query(${className_d} entity) throws BaseException;

}