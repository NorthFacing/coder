package ${packageName}.${className_x}.model;

<#list importJARs as importJAR>
<#--导入包-->
import ${importJAR};
</#list>

import com.mall.core.base.model.BaseModel;

public class ${className_d}  extends BaseModel {

    <#--======================================== 列出所有的字段  ========================================-->
	<#list tableCarrays as tableCarray>
	<#if ((tableCarray.carrayName_x != "id") 
		&& (tableCarray.carrayName_x != "createUser") 
		&& tableCarray.carrayName_x != "createTime" 
		&& tableCarray.carrayName_x != "updateUser" 
		&& tableCarray.carrayName_x != "updateTime" )>
	private ${tableCarray.carrayType} ${tableCarray.carrayName_x};    //  ${tableCarray.remark}
	</#if>
	</#list>
		
    <#--======================================== 字段的get和set ========================================-->
	<#list tableCarrays as tableCarray>
	<#if ((tableCarray.carrayName_x != "id") 
		&& (tableCarray.carrayName_x != "createUser") 
		&& tableCarray.carrayName_x != "createTime" 
		&& tableCarray.carrayName_x != "updateUser" 
		&& tableCarray.carrayName_x != "updateTime" )>

	/** ${tableCarray.remark} */
	public ${tableCarray.carrayType} get${tableCarray.carrayName_d}() {
		return ${tableCarray.carrayName_x};
	}
	public ${className_d} set${tableCarray.carrayName_d} (${tableCarray.carrayType} ${tableCarray.carrayName_x}) {
		this.${tableCarray.carrayName_x} = ${tableCarray.carrayName_x};
		return this;
	}

	</#if>
	</#list>
	
@Override
public String toString() {
return ReflectionToStringBuilder.toString(this);
}
}
