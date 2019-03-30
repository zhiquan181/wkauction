<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<style type="text/css">
<!--
.catalog{}
.catalog .catalog_box{}
.catalog .catalog_box h2{text-indent:20px;height:50px;line-height:50px;font-weight: 400;}
.catalog ul{}
.catalog ul li{}
.catalog ul li{list-style: none;line-height:30px;float:left;margin:0px 0px 0px 20px;}
.catalog ul li a{color:#000;text-decoration: none;}
.catalog ul li a:hover{color:rgb(0,174,239);}
-->
</style>

<div class="catalog">
	<div class="catalog_box">
		<h2>全部分类</h2>
	</div>
	
	<ul>
		<s:iterator value="#request['home_catalogs']" var="home_catalog">
			<li>
				<a href="productAllPaging?keyword=&typename=${home_catalog.catalogname}">${home_catalog.catalogname}</a>
			</li>
		</s:iterator>
	</ul>
</div>

