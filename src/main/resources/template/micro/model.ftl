package ${packageName}.${className_x}.entity;

<#list importJARs as importJAR>
<#--导入包-->
import ${importJAR};
</#list>

import com.alibaba.fastjson.annotation.JSONField;

import com.joyoung.smart.base.model.BaseModel;

import lombok.Getter;
import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

/**
 * ${className_d}
 * @author HongBo.Zhu
 * @Date ${.now}
 */
@Slf4j
@Setter
@Getter
public class ${className_d}  extends BaseModel {

    <#--======================================== 列出所有的字段  ========================================-->
	<#list tableCarrays as tableCarray>
	<#if ((tableCarray.carrayName_x != "id")
		&& (tableCarray.carrayName_x != "createUser")
		&& tableCarray.carrayName_x != "createTime"
		&& tableCarray.carrayName_x != "updateUser"
		&& tableCarray.carrayName_x != "updateTime"
		&& tableCarray.carrayName_x != "deleted" )>
	/**  ${tableCarray.remark} */
	@JSONField(name = "${tableCarray.carrayName}")
	private ${tableCarray.carrayType} ${tableCarray.carrayName_x};
	</#if>
	</#list>

	public ${className_d}() {
	}

	public ${className_d}(String id) {
		this.id = id;
	}

}
