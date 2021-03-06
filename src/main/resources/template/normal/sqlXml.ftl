<#macro mapperEl value="">${r"#{"}${value}}</#macro>
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE mapper PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN" 
	"http://mybatis.org/dtd/mybatis-3-mapper.dtd">

<mapper namespace="${packageName}.${className_x}.mapper.${className_d}Mapper">
	
	<resultMap id="${className_d}Map" type="${packageName}.model.${className_d}">
		<#list tableCarrays as tableCarray>
		   <result property="${tableCarray.carrayName_x}" column="${tableCarray.carrayName}" />
		</#list>
	</resultMap>
	
	
	<sql id="${className_d}Columns">
		  ${stringCarrayNames3}
    </sql>
	
    <!-- 很据条件查询店铺的全部 -->
	<select id="listPage${className_d}" resultMap="${className_d}Map" 
	parameterType="${packageName}.model.${className_d}">
		select
		<include refid="${className_d}Columns" />
		from ${className} where 1=1 
		 <#list tableCarrays as tableCarray>
			 <if test="${tableCarray.carrayName_x} !=null and ${tableCarray.carrayName_x}!=''">
				and ${tableCarray.carrayName}=<@mapperEl tableCarray.carrayName_x/>
			</if>
		 </#list>
	</select>
	
	<!-- 查询${className}的数量-->
	<select id="get${className_d}Count" resultType="Integer">
		select count(*)
		from ${className}
	</select>
	
	<!-- 插入 -->
	<insert id="insert" parameterType="${className_d}" 
	  useGeneratedKeys="true" keyProperty="id">
		INSERT INTO ${className} (
			${stringCarrayNames6}
		) VALUES (
			${stringCarrayNames7}
		)
	</insert>
	
	<insert id="insertSelective" parameterType="${packageName}.model.${className_d}" useGeneratedKeys="true" keyProperty="id">
		insert into jz_user
		<trim prefix="(" suffix=")" suffixOverrides=",">
		 <#list tableCarrays as tableCarray>
		    <if test="${tableCarray.carrayName_x} !=null and ${tableCarray.carrayName_x}!=''">
		      ${tableCarray.carrayName},
		    </if>
		</#list>
		</trim>
		<trim prefix="values (" suffix=")" suffixOverrides=",">
		<#list tableCarrays as tableCarray>
		   <if test="${tableCarray.carrayName_x} !=null and ${tableCarray.carrayName_x}!=''">
		     <@mapperEl tableCarray.carrayName_x/>,
		    </if>
		 </#list>
		</trim>
	</insert>	
	
	<!-- 根据主键查询(唯一)-->
	<select id="get${className_d}ById" parameterType="Integer" resultMap="${className_d}Map">
		select 
		<include refid="${className_d}Columns" /> 
		from ${className} where 
			<#list tableIndexs as tableIndex>
		         ${tableIndex.stringCarrayNames5}
	       </#list>
	</select>
	
	<!-- 根据条件查询 ${className}  -->
	<select id="list${className_d}" resultMap="${className_d}Map" parameterType="${packageName}.model.${className_d}">
		select
		<include refid="${className_d}Columns" />
		from ${className} where 1=1 
		 <#list tableCarrays as tableCarray>
			 <if test="${tableCarray.carrayName_x} !=null and ${tableCarray.carrayName_x}!=''">
				and ${tableCarray.carrayName}=<@mapperEl tableCarray.carrayName_x/>
			</if>
		 </#list>
	</select>
	
	<!--更新  -->
	<update id="update${className_d}" parameterType="${packageName}.model.${className_d}">
		UPDATE ${className} 
		SET
		${stringCarrayNames5}
		WHERE
		<#list tableIndexs as tableIndex>
		${tableIndex.stringCarrayNames5}
	    </#list>
	</update>
		<!--根据条件update  -->
    <update id="updateByPrimaryKeySelective" parameterType="${packageName}.model.${className_d}" >
	  UPDATE ${className} 
		SET
		<set>
	     <#list tableCarrays as tableCarray>
			 <if test="${tableCarray.carrayName_x} !=null and ${tableCarray.carrayName_x}!=''">
			    ${tableCarray.carrayName} =  <@mapperEl tableCarray.carrayName_x/>,
			</if>
		 </#list>
	   </set>
		WHERE
		<#list tableIndexs as tableIndex>
		   ${tableIndex.stringCarrayNames5}
	    </#list>
	</update>
	
	
	<!--根据条件删除  -->
	<delete id="delete${className_d}" parameterType="${packageName}.model.${className_d}">
		delete from ${className} 
		where 1=1
		 <#list tableCarrays as tableCarray>
			 <if test="${tableCarray.carrayName_x} !=null and ${tableCarray.carrayName_x}!=''">
				and ${tableCarray.carrayName} =  <@mapperEl tableCarray.carrayName_x/>
			</if>
		 </#list>
	</delete>
</mapper>