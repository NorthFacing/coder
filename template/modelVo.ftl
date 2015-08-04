package ${packageName}.${className_x}.model;

import com.mall.core.base.model.BaseModel;

/**
 * ${className_d}Vo
 * @since v0.0.1
 * @author Bob
 * @Date ${.now}
 */
public class ${className_d}Vo  extends BaseModel {

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
