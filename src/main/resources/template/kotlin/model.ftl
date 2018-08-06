package ${packageName}.${className_x}.entity

import ${packageName}.base.entity.BaseEntity

/**
 * ${className_d}
 * @since v0.0.1
 * @author Bob.Zhu
 * @Date ${.now}
 */
open class ${className_d} : BaseEntity {

<#--======================================== 列出所有的字段  ========================================-->
<#list tableCarrays as tableCarray>
    <#if ((tableCarray.carrayName_x != "id")
    && (tableCarray.carrayName_x != "createUser")
    && tableCarray.carrayName_x != "createTime"
    && tableCarray.carrayName_x != "updateUser"
    && tableCarray.carrayName_x != "updateTime"
    && tableCarray.carrayName_x != "deleted" )>
  var ${tableCarray.carrayName_x}: ${tableCarray.carrayType} = ""    //  ${tableCarray.remark}
    </#if>
</#list>

  constructor() : super()
  constructor(id: String) : super(id)

}