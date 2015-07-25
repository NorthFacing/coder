<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE mapper PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN" 
	"http://mybatis.org/dtd/mybatis-3-mapper.dtd">

<mapper namespace="${packageName}.${className_x}.mapper.${className_d}Mapper">
	<resultMap id="BaseResultMap" type="${packageName}.${className_x}.model.${className_d}">
		<#list tableCarrays as tableCarray>
		   <result column="${tableCarray.carrayName}" property="${tableCarray.carrayName_x}" />
		</#list>
	</resultMap>
	
	<sql id="tabaleName">${className_x}</sql>

	<sql id="baseColumn">
		<#list tableCarrays as tableCarray>
		   ${tableCarray.carrayName},
		</#list>
	</sql>

	<select id="getList" parameterType="${packageName}.${className_x}.model.${className_d}Vo"
		resultMap="BaseResultMap">
		select
		<include refid="baseColumn"></include>
		from
		<include refid="tabaleName"></include>
		<where>
			<#list tableCarrays as tableCarray>
				<if test=" ${tableCarray.carrayName_x}!=null and ${tableCarray.carrayName_x}!='' ">
					and ${tableCarray.carrayName} = ${tableCarray.carrayName_x}
				</if>
			</#list>
		</where>

	</select>
	
</mapper>