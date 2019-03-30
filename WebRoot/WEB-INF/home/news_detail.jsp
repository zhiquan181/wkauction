<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>MOKO丨<s:property value="#request['home_article_detail'].title"/></title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="icon" type="image/png" sizes="32x32" href="/wkauction/resource/admin/images/favicon.ico">
	<link rel="stylesheet" href="/wkauction/resource/home/css/global.css">
	<link rel="stylesheet" href="/wkauction/resource/home/css/index.css">
	<style type="text/css">
		body{background-color:#f8f8f8;}
	
		.article_detail_nav{font-size:24px;border-bottom:1px solid #eee;text-align:center;padding:25px;}
		.article_detail_nav span{font-size:13px;color:#888;}
		.article_detail{width:1040px;height:900px;margin:50px auto;background:#fff;box-shadow: 0px 4px 4px rgba(0, 0, 0, 0.1);}
		.article_detail_content{padding:20px;line-height:30px;text-indent:2em;}
	</style>
  </head>
  <body>
  	<jsp:include page="/WEB-INF/home/head.jsp"/>
  	
  	<div class="article_detail">
  		<div class="article_detail_nav">
  			${home_article_detail.title}<span>&nbsp;<s:date name="#request['home_article_detail'].createat" format="yyyy-MM-dd" /></span>
  		</div>
  		<div class="article_detail_content">
  			${home_article_detail.content}
  		</div>
  	</div>
  	
  	<s:action name="articleInfo" namespace="/" executeResult="true"></s:action>
    <s:action name="linkInfo" namespace="/" executeResult="true"></s:action>
  	<jsp:include page="/WEB-INF/home/foot.jsp"/>
    
  </body>
</html>
