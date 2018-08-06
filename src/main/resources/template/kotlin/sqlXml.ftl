<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE mapper PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN" "http://mybatis.org/dtd/mybatis-3-mapper.dtd">

<mapper namespace="${packageName}.${className_x}.mapper.${className_d}Mapper">
	<resultMap id="BaseResultMap" type="${packageName}.${className_x}.entity.${className_d}">
		<#list tableCarrays as tableCarray>
		   <result column="${tableCarray.carrayName}" property="${tableCarray.carrayName_x}" />
		</#list>
	</resultMap>

	<sql id="baseColumn">
		<#list tableCarrays as tableCarray>
			<#if tableCarray_has_next>
				${tableCarray.carrayName},
	        <#else>
				${tableCarray.carrayName}
			</#if>
		</#list>
	</sql>

    <sql id="whereCondition">
        <where>
		<#list tableCarrays as tableCarray>
            <if test=" ${tableCarray.carrayName_x} != null ">
                AND ${tableCarray.carrayName} = ${r'#'}{${tableCarray.carrayName_x}}
            </if>
		</#list>
        </where>
	</sql>

    <sql id="queryCondition">
        <where>
        </where>
    </sql>

    <select id="count" parameterType="${packageName}.${className_x}.entity.${className_d}Query" resultType="java.lang.Long">
        SELECT count(id)
        FROM ${className}
        <include refid="queryCondition"/>
    </select>

    <select id="query" parameterType="${packageName}.${className_x}.entity.${className_d}Query" resultMap="BaseResultMap">
        SELECT
        <include refid="baseColumn"/>
        FROM ${className}
        <include refid="queryCondition"/>
        LIMIT ${r'#'}{startRow}, ${r'#'}{size}
    </select>


</mapper>