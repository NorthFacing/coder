<#macro mapperElNotNull value="">
   ${r"${not empty "}${value}List}
</#macro>

<#macro mapperElList value="">
  ${r"${"}${value}List}
</#macro>

<#macro mapperEl pre="" end="">
  ${r"${"}${pre}${end}}
</#macro>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" 
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>HLRMS-好邻后台管理系统</title>
<link type="text/css" rel="stylesheet" href="../css/main.css" />
<script type="text/javascript" src="../js/jquery-1.5.1.min.js"></script>
<script type="text/javascript" src="../js/datePicker/WdatePicker.js"></script>
<script type="text/javascript" src="../js/lhgdialog/lhgdialog.min.js?t=self&s=areo_blue"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$(".main_info:even").addClass("main_table_even");
	});
	
	//全选
    function sltAll${className_x}() {
		if ($("#sltAll").attr("checked")) {
			$("input[name='${className_x}Ids']").attr("checked", true);
		} else {
			$("input[name='${className_x}Ids']").attr("checked", false);
		}
	}
    //新增
	function load${className_d}(${className_x}Id) {
		var dg = new $.dialog({
			title : '新增${className_x}信息',
			id : '${className_x}_new',
			width : 650,
			height : 350,
			iconTitle : false,
			cover : true,
			maxBtn : false,
			xButton : true,
			resize : false,
			page : 'load.html?${key_x}=" + ${className_x}Id;
		});
		dg.ShowDialog();
	}
    
    //删除
	function del${className_d}(${className_x}Id) {
		if (confirm("确定要删除该记录？")) {
			var url = "delete.html?${key_x}=" + ${className_x}Id;
			$.get(url, function(data) {
			    data=JSON.parse(data);
				if (data == "success") {
					document.location.reload();
				}
			});
		}
	}
	
	//详情
	function view${className_d}(${className_x}Id){
		var dg = new $.dialog({
			title : '查看${className_d}信息详情',
			id : '${className_d}_view',
			width : 630,
			height : 320,
			iconTitle : false,
			cover : true,
			maxBtn : false,
			xButton : true,
			resize : false,
			page : 'view.html?${key_x}='+${className_x}Id
		});
		dg.ShowDialog();
	}
	
	 //查询
	function search() {
		$("#${className_x}Form").submit();
	}
    
    //导出
	function export${className_d}() {
		document.location = "${className_d}/excel.html";
	}
	
	//删除全部
	function delAll(){
		 var chenked=$('input[type="checkbox"]:checked'); 
			
		  if(chenked.length == 0){
			  alert("请选中一个要删除的记录!");
			  return;
		  }
		  var ids='';
		  $('input[type="checkbox"]:checked').each(function(){
			  ids +=$(this).val()+",";
		  }); 

		if (confirm("确定要删除这些记录吗？")) {
				var url = "${className_d}/delete.html?ids=" + ids;
				$.get(url, function(data) {
					if (data == "success") {
						document.location.reload();
					}
				});
		 }
	}
</script>
</head>
<body>
	<form action="list.html" method="post" name="${className_x}Form" id="${className_x}Form">
		<div class="search_div">
			               <#list tableCarrays as tableCarray>
							    <#if tableCarray.carrayType=="java.util.Date">
							     <input type="text" name="${tableCarray.carrayName_x}" id="${tableCarray.carrayName_x}"   onclick="WdatePicker()" readonly="readonly" style="width: 150px;" placeholder="${tableCarray.remark}" value="<@mapperEl pre="${className_x}." end="${tableCarray.carrayName_x}" />" />
							    <fmt:formatDate value="<@mapperEl pre="a." end="${tableCarray.carrayName_x}" />" pattern="yyyy-MM-dd" />
			                    <#else>
			                     <input type="text" name="${tableCarray.carrayName_x}" id="${tableCarray.carrayName_x}"  value="<@mapperEl pre="${className_x}." end="${tableCarray.carrayName_x}" />"  style="width: 150px;" placeholder="${tableCarray.remark}" />
			                   </#if>
				           </#list>
			<a href="javascript:search();" class="myBtn"><em>查询</em></a> 
			<a href="javascript:load${className_d}();" class="myBtn"><em>新增</em></a> 
		</div>

		<!--列表 -->
		<table width="100%" border="0" cellpadding="0" cellspacing="0"
			class="main_table">
			<tr class="main_head">
				<th>序号</th>
				<#list tableCarrays as tableCarray>
				   <th>${tableCarray.remark}</th>
				</#list>
				<th>操作</th>
			</tr>
			<c:choose>
			
				<c:when test="<@mapperElNotNull className_x/>">
					<c:forEach items="<@mapperElList className_x/>" var="a" varStatus="vs">
						<tr class="main_info">
							<td><@mapperEl pre="vs.index+1"/></td>
							<#list tableCarrays as tableCarray>
							  <td>
							    <#if tableCarray.carrayType=="java.util.Date">
							    <fmt:formatDate value="<@mapperEl pre="a." end="${tableCarray.carrayName}" />" pattern="yyyy-MM-dd" />
			                    <#else>
			                    <@mapperEl pre="a." end="${tableCarray.carrayName_x}" />
			                   </#if></td>
				           </#list>
							
							<td>
							      <a href="javascript:load${className_d}(<@mapperEl pre="a." end="${key_x}"/>);">修改</a>
								| <a href="javascript:del${className_d}(<@mapperEl pre="a." end="${key_x}"/>);">删除</a>
								| <a href="javascript:view${className_d}(<@mapperEl pre="a." end="${key_x}"/>);">信息详情</a>
							</td>
						</tr>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<tr class="main_info">
						<td colspan="8">没有相关数据</td>
					</tr>
				</c:otherwise>
			</c:choose>
		</table>
		<div class="page_and_btn"><@mapperEl pre="${className_x}" end=".page.pageStr"/></div>
	</form>
</body>
</html>