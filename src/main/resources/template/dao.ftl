package ${packageName}.${className_x}.mapper;

import com.bob.core.base.mapper.BaseMapper;
import com.bob.core.utils.myBatis.CRUDTemplate;
import ${packageName}.${className_x}.entity.${className_d};
import ${packageName}.${className_x}.entity.${className_d}Vo;

import org.apache.ibatis.annotations.SelectProvider;

import java.util.List;

/**
 * ${className_d}Mapper
 * @since v0.1
 * @author Bob
 * @Date ${.now}
 */
public interface ${className_d}Mapper extends BaseMapper<${className_d}, ${className_d}Vo> {

    @SelectProvider(type = CRUDTemplate.class, method = "select")
    ${className_d} select(${className_d} entity);

    @SelectProvider(type = CRUDTemplate.class, method = "select")
    ${className_d}Vo selectVo(${className_d} entity);

    @SelectProvider(type = CRUDTemplate.class, method = "select")
    List<${className_d}> selectList(${className_d} entity);

    @SelectProvider(type = CRUDTemplate.class, method = "select")
    List<${className_d}Vo> selectVoList(${className_d} entity);

}