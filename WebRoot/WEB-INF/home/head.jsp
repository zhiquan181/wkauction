<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<link rel="stylesheet" href="/wkauction/resource/home/css/global.css">
<script type="text/javascript" src="/wkauction/resource/home/js/jquery-3.3.1.min.js"></script>
<style>
	.header_box_right ul li a{color:#444;}
	.header_box_right ul li .active{color:rgb(0,174,239);}
	.submit{color:#fff;background:rgb(0,174,239);}
</style>
<div class="navbar">
	<ul>
		<s:if test="#session.moko_user==null">
			<li><a href="login.jsp">登录</a></li>
		</s:if>
		<s:else>
			<li><a style="color:red;">${session.moko_user.username}&nbsp;已登录</a></li>
			<li><a style="color:red;" href="userCenter?userid=${session.moko_user.id}">个人中心</a></li>
			<li><a href="userLoginOut">注销</a></li>
		</s:else>
		<li><a href="register.jsp">注册</a></li>
	</ul>
</div>

<div class="header">
   	<div class="header_box">
   		<div class="header_box_left">
   			<a href="http://localhost:8080/wkauction/"><img src="/wkauction/resource/home/images/nav-logo-new.png"/></a>
   			<div class="header_box_left_span">所有分类&forall;
   				<div class="header_box_left_span_ul">
   					<s:action name="catalogInfo" namespace="/" executeResult="true"></s:action>
   				</div>
   			</div>
   		</div>
   		<div class="header_box_middle">
   			<form action="productAllPaging">
   				<p>
   					<input type="hidden" name="typename" value=""/>
   					<input class="search" name="keyword" type="text" placeholder="搜索拍卖商品..."/>
   					<input class="submit" type="submit" value="搜索"/>
   				</p>
   			</form>
   		</div>
   		<div class="header_box_right">
   			<ul>
   				<li><a href="http://localhost:8080/wkauction/" class="active">首页</a></li>
   				<li><a href="javascript:void(0)">关于拍卖</a></li>
   				<li><a href="javascript:void(0)">帮助中心</a></li>				
   			</ul>
   		</div>
   	</div>
</div>
<script type="text/javascript">
	$(document).ready(function (e) {
	    $('.header_box_left_span').hover(
	        function (e) {
	            $('.header_box_left_span_ul', this).stop(true, true).fadeToggle(200);
	            clearTimeout();
	        }, 
	        function (e) {
	            $('.header_box_left_span_ul', this).stop(true, true).fadeToggle(100);
	            clearTimeout(); 
	        }
	    );
	});
</script>