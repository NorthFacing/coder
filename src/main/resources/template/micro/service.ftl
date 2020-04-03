package ${packageName}.${className_x}.service;

import ${packageName}.${className_d};
import com.joyoung.smart.base.exceptions.DbException;
import com.joyoung.smart.base.exceptions.ParamException;
import java.util.List;

/**
 * ${className_d}Service
 * @author Bob.Zhu
 * @Date ${.now}
 */
public interface ${className_d}Service {

    String insert(${className_d} entity) throws DbException;

    List<String> insertBatch(List<${className_d}> entity) throws DbException;

    int update(${className_d} entity) throws DbException;

    List<${className_d}> query(${className_d} entity) throws DbException, ParamException ;

    int delete(String id, String updateUser) throws DbException;

}