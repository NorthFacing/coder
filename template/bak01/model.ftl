package ${packageName}.model;

<#list importJARs as importJAR>
<#--导入包-->
import ${importJAR};
</#list>

/**
 * ${className}
 * @since v0.0.1
 * @author Bob
 */
public class ${className_d} {

    <#--======================================== 列出所有的字段  ========================================-->
	<#list tableCarrays as tableCarray>
	private ${tableCarray.carrayType} ${tableCarray.carrayName_x};    //  ${tableCarray.remark}
	</#list>
		
    <#--======================================== 字段的get和set ========================================-->
	<#list tableCarrays as tableCarray>
	/** ${tableCarray.remark} */
	public ${tableCarray.carrayType} get${tableCarray.carrayName_d}() {
		return ${tableCarray.carrayName_x};
	}
	public ${className_d} set${tableCarray.carrayName_d} (${tableCarray.carrayType} ${tableCarray.carrayName_x}) {
		this.${tableCarray.carrayName_x} = ${tableCarray.carrayName_x};
		return this;
	}
	</#list>
	
    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder("${className_d}");
        sb.append(" [ ");
		<#list tableCarrays as tableCarray>
        sb.append("${tableCarray.carrayName_x}=").append(this.${tableCarray.carrayName_x}).append(", ");
		</#list>
        sb.append(" ]");
        return sb.toString();
    }
}
