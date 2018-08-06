package ${packageName}.${className_x}.service.impl

import ${packageName}.base.service.impl.BaseServiceImpl
import ${packageName}.${className_x}.entity.${className_d}
import ${packageName}.${className_x}.mapper.${className_d}Mapper
import ${packageName}.${className_x}.service.${className_d}Service
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.stereotype.Service

/**
 * ${className_d}ServiceImpl
 * @since v0.0.1
 * @author Bob.Zhu
 * @Date ${.now}
 */
@Service("${className_x}Service")
class ${className_d}ServiceImpl : ${className_d}Service, BaseServiceImpl<${className_d}>() {

  @Autowired
  lateinit var ${className_x}Mapper: ${className_d}Mapper

  override fun getEntity(id: String) = ${className_d}(id)

  override fun getMapper() = ${className_x}Mapper

}


