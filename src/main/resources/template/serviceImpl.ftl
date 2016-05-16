package ${packageName}.${className_x}.service.impl;

import com.bob.core.base.service.impl.BaseServiceImpl;
import ${packageName}.${className_x}.entity.${className_d};
import ${packageName}.${className_x}.entity.${className_d}Vo;
import ${packageName}.${className_x}.mapper.${className_d}Mapper;
import ${packageName}.${className_x}.service.${className_d}Service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * ${className_d}ServiceImpl
 * @since v0.1
 * @author Bob
 * @Date ${.now}
 */
@Service("${className_x}Service")
public class ${className_d}ServiceImpl extends BaseServiceImpl<${className_d}, ${className_d}Vo> implements ${className_d}Service {

    @Autowired
    private ${className_d}Mapper ${className_x}Mapper;

}