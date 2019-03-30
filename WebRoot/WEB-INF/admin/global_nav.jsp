<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<link rel="icon" type="image/png" sizes="32x32" href="/wkauction/resource/admin/images/favicon.ico">
<div class="admin_nav">
	<span class="admin_nav_l"><a href="adminManager">System Center</a></span>
	<a class="admin_nav_r" href="http://localhost:8080/wkauction" target="_blank">网站首页</a>	
	<s:if test="#session.auser_active==null">
		<script language="javascript"type="text/javascript"> 
			alert("您的登录回话已过期，请重新登录！"); 
			window.location.href="adminRedirect"; 
		</script>
	</s:if>
	<s:else>
		<div class="admin_nav_m">
			<span href="javascript:void(0)">系统管理员：${session.auser_active.username}&nbsp;已登录</span>
			<span><a href="alogout">注销</a></span>
		</div>
	</s:else>
</div>

