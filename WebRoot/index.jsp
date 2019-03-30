<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>拍卖系统丨首页</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="icon" type="image/png" sizes="32x32" href="/wkauction/resource/admin/images/favicon.ico">
	<link rel="stylesheet" href="/wkauction/resource/home/css/index.css">
	<link rel="stylesheet" href="/wkauction/resource/home/css/swiper.min.css">
	<style type="text/css">
		.foot div>a{color:#fff;font-size:13px;}
	</style>
  </head>
  
  <body>
    <jsp:include page="/WEB-INF/home/head.jsp"/>
    
    <div class="swiper">
	    <!-- Swiper -->
		<div class="swiper-container">
		  <div class="swiper-wrapper">
		    <div class="swiper-slide"><img src="/wkauction/resource/home/images/banner1.jpg"/></div>
		    <div class="swiper-slide"><img src="/wkauction/resource/home/images/banner2.jpg"/></div>
		    <div class="swiper-slide"><img src="/wkauction/resource/home/images/banner3.jpg"/></div>
		  </div>
		  <div class="swiper-pagination"></div>
		</div>
	</div>
	<!-- Swiper JS -->
	<script src="/wkauction/resource/home/js/swiper.min.js"></script>
	<!-- Initialize Swiper -->
	<script>
	    var swiper = new Swiper('.swiper-container', {
	      spaceBetween: 30,
	      centeredSlides: true,
	      autoplay: {
	        delay: 2000,
	        disableOnInteraction: false,
	      },
	      pagination: {
	        el: '.swiper-pagination',
	        clickable: true,
	      },
	      navigation: {
	        nextEl: '.swiper-button-next',
	        prevEl: '.swiper-button-prev',
	      },
	    });
	</script>
	
	<s:action name="productInfo" namespace="/" executeResult="true"></s:action>
  	<s:action name="articleInfo" namespace="/" executeResult="true"></s:action>
    <s:action name="linkInfo" namespace="/" executeResult="true"></s:action>
    <jsp:include page="/WEB-INF/home/foot.jsp"/>
  </body>
</html>
