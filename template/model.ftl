package ${packageName}.${className_x}.model;

<#list importJARs as importJAR>
<#--导入包-->
import ${importJAR};
</#list>

import com.mall.core.base.model.BaseModel;

/**
 * ${className_d}
 * @since v0.0.1
 * @author Bob
 * @Date ${.now}
 */
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
        StringBuilder sb = new StringBuilder("${className_d}");
        sb.append(" [ ");
		<#list tableCarrays as tableCarray>
		<#if tableCarray_has_next>
        sb.append("${tableCarray.carrayName_x}=").append(this.${tableCarray.carrayName_x}).append(", ");
        <#else>
        sb.append("${tableCarray.carrayName_x}=").append(this.${tableCarray.carrayName_x});
		</#if>
		</#list>
        sb.append(" ]");
        return sb.toString();
    }
}
