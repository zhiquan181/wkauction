<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>${session.moko_user.username}丨我的竞拍记录</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="icon" type="image/png" sizes="32x32" href="/wkauction/resource/admin/images/favicon.ico">
	<link href="/wkauction/resource/home/css/font-awesome.min.css" rel="stylesheet">
	<style type="text/css">
	<!--
	.user_box{width:1000px;height:;margin:50px auto 0 auto;padding:30px 0;box-shadow: 1px 3px 3px rgba(0, 0, 0, 0.1);border: 1px solid rgb(212,212,212);background-color: #fff;}
	.user_box h2{font-size:30px;font-weight:400;display:block;text-indent: 30px;}
	.user_box h2 a{padding:15px;border-radius:5px;font-size:15px;display:inline-block;margin: 0 0 0 17px;background:rgb(0,174,239);color:#fff;text-decoration: none;}
	.user_box h2 a:hover{background:rgb(0,137,200);}
	.user_box span{color:#999;font-size:14px;display:block;text-indent: 30px;}
	
	.goods_detail{width:1000px;margin: 10px auto 50px auto;box-shadow: 1px 3px 3px rgba(0, 0, 0, 0.1);}
	.goods_detail_middle{}
	.goods_detail_middle ul{width:100%;height:auto;clear: both;background-color:#fafafa;}
	.goods_detail_middle li{float: left;padding:10px 0;background-color:#fafafa;list-style: none;text-align: center;border-bottom: 1px solid rgb(212,212,212);}
	
	.bid_ul{display: inline-table;}
	.li_1{width:10%;}
	.li_2{width:50%;}
	.li_3{width:20%;}
	.li_4{width:20%;}
	-->
	</style>
</head>
<body>

	<s:if test="#session.moko_user==null">
    	<script language="javascript"type="text/javascript"> 
			alert("您还未登录，请登录后再查看商品与竞价！"); 
			window.location.href="http://localhost:8080/wkauction/login.jsp"; 
		</script>
	</s:if>
	<s:else>
	  	<jsp:include page="/WEB-INF/home/head.jsp"/>
	  	
	  	<div class="user_box">
	   		<h2>
	   			我的竞拍记录：${session.moko_user.username}
	   		</h2>
	   		<span>所在地：${session.moko_user.address}</span>
	   	</div>
	   	
	   	<div class="goods_detail">
		   	<div class="goods_detail_middle">
				<ul>
					<li class="li_1" align="center">竞价者</li>
					<li class="li_2" align="center">商品名称</li>
					<li class="li_3" align="center">创建时间</li>
					<li class="li_4" align="center">竞价</li>
				</ul>
		
				<ul class="bid_ul">
					<s:iterator value="#request['home_orders_user']" var="home_order_user">
						<li class="li_1">${home_order_user.user.username}</li>
						<li class="li_2">${home_order_user.goods.title}</li>
						<li class="li_3">${home_order_user.createat}</li>
						<li class="li_4">${home_order_user.jprice}</li>
					</s:iterator>
				</ul>
			</div>
		</div>
		
		<jsp:include page="/WEB-INF/home/foot.jsp"/>
	</s:else>
</body>
</html>