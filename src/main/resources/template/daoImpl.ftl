package ${packageName}.${className_x}.dao.impl;

import org.springframework.stereotype.Service;
import ${packageName}.${className_x}.dao.BaseDaoImpl;
import ${packageName}.${className_x}.dao.${className_d}Dao;
import ${packageName}.${className_x}.entity.${className_d};
import ${packageName}.${className_x}.entity.${className_d}Vo;

@Service("${className_x}DaoImpl")
public class ${className_d}DaoImpl extends BaseDaoImpl<${className_d}> implements ${className_d}Dao{
    private String nameSpace = this.getClass().getName();

    public String getMethodPath(String methodType) {
        return nameSpace + "." + methodType;
    }
}