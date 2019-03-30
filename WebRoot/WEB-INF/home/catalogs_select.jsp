<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%><%@ taglib prefix="s" uri="/struts-tags" %><select class="" name="goods.typename">
	<s:iterator value="#request['home_catalogs']" var="home_catalog">
		<option>${home_catalog.catalogname}</option>
	</s:iterator>
</select>


