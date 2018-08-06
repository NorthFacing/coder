package ${packageName}.${className_x}.controller

import ${packageName}.${className_x}.entity.${className_d}
import ${packageName}.${className_x}.entity.${className_d}Query
import ${packageName}.${className_x}.service.impl.${className_d}ServiceImpl
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.web.bind.annotation.RestController

/**
 * ${className_d}Controller
 * @since v0.0.1
 * @author Bob.Zhu
 * @Date ${.now}
 */
@RestController
@RequestMapping("/${className_x}")
class ${className_d}Controller {

  @Autowired
  lateinit var ${className_x}Service: ${className_d}ServiceImpl

}
