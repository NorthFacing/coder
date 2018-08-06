package ${packageName}.${className_x}.mapper

import ${packageName}.base.mapper.BaseMapper
import ${packageName}.${className_x}.entity.${className_d}
import ${packageName}.${className_x}.entity.${className_d}Vo
import com.bob.core.utils.myBatis.CRUDTemplate
import org.apache.ibatis.annotations.SelectProvider

/**
 * ${className_d}Mapper
 * @since v0.0.1
 * @author Bob.Zhu
 * @Date ${.now}
 */
interface ${className_d}Mapper : BaseMapper<${className_d}> {

  @SelectProvider(type = CRUDTemplate::class, method = "select")
  override fun selectVo(entity: ${className_d}): ${className_d}Vo

  @SelectProvider(type = CRUDTemplate::class, method = "select")
  override fun selectVoList(entity: ${className_d}): List<${className_d}Vo>

}