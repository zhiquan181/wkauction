<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>拍卖系统丨${session.moko_user.username}的个人中心</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="icon" type="image/png" sizes="32x32" href="/wkauction/resource/admin/images/favicon.ico">
	<style type="text/css">
		body{background-color:#fff;}
		
		.user_box{width:1000px;height:;margin:50px auto 0 auto;padding:30px 0;box-shadow: 1px 3px 3px rgba(0, 0, 0, 0.1);border: 1px solid rgb(212,212,212);background-color: #fff;}
		.user_box h2{font-size:30px;font-weight:400;display:block;text-indent: 30px;}
		.user_box h2 a{padding:15px;border-radius:5px;font-size:15px;display:inline-block;margin: 0 0 0 17px;background:rgb(0,174,239);color:#fff;text-decoration: none;}
		.user_box h2 a:hover{background:rgb(0,137,200);}
		.user_box span{color:#999;font-size:14px;display:block;text-indent: 30px;}
		.user_detail{width:1000px;min-height:920px;margin:10px auto 50px auto;}
		.user_detail_top{width:100%;height:500px;background:#fff;margin-bottom:10px;box-shadow: 1px 3px 3px rgba(0, 0, 0, 0.1);border: 1px solid rgb(212,212,212);}
		.user_detail_top_left{width:50%;height:100%;background:;float:left;}
		.user_detail_top_left img{width:200px;height:200px;display:block;background:#f8f8f8;margin:150px auto;}
		.user_detail_top_right{width:50%;height:100%;background:;float:right;}
		.user_detail_top_right p{font-size:14px;font-weight:bold;line-height:30px;padding:20px 0px;}
		
		.user_detail_bottom{width:100%;height:auto;margin-top:10px;box-shadow: 1px 3px 3px rgba(0, 0, 0, 0.1);}
		.user_detail_bottom table{border-collapse:collapse;}
		.user_detail_bottom table a{text-decoration: none;position:relative;width:333px;text-align:center;height:333px;display:inline-block;color:#666;transition:ease .3s;}
		.user_detail_bottom table a:hover{box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.3);}
		.user_detail_bottom table a span{position: absolute;width:100%;height:auto;display:block;text-align:center;left:0;top:220px;}
		table, td, th{border: 1px solid rgb(212,212,212);background:#fff;}
		
		.user_1{background-image: url("./resource/home/images/g10.png");background-repeat: no-repeat;background-position: center;background-size:80px;}
		.user_2{background-image: url("./resource/home/images/g1.png");background-repeat: no-repeat;background-position: center;background-size:80px;}
		.user_3{background-image: url("./resource/home/images/g6.png");background-repeat: no-repeat;background-position: center;background-size:80px;}
		.user_4{background-image: url("./resource/home/images/g9.png");background-repeat: no-repeat;background-position: center;background-size:80px;}
		.user_5{background-image: url("./resource/home/images/g4.png");background-repeat: no-repeat;background-position: center;background-size:80px;}
		.user_6{background-image: url("./resource/home/images/g11.png");background-repeat: no-repeat;background-position: center;background-size:80px;}
	</style>
  </head>
  
  <body>
    <s:if test="#session.moko_user==null">
    	<script language="javascript"type="text/javascript"> 
			alert("您的登录回话已过期，请重新登录！"); 
			window.location.href="http://localhost:8080/wkauction/"; 
		</script>
	</s:if>
	<s:else>
		<jsp:include page="/WEB-INF/home/head.jsp"/>
		
	    <div class="user_box">
	   		<h2>
	   			个人中心：${session.moko_user.username}
	   		</h2>
	   		<span>所在地：${session.moko_user.address}</span>
	   	</div>
	    <div class="user_detail">
	    	<div class="user_detail_top">
	    		<div class="user_detail_top_left">
	    			<s:if test="#session.moko_user_headimg==null">
	    				<img src="${session.moko_user.picture}" onerror="onerror=null;src='/wkauction/resource/home/images/zwtx.png'"/>
	    			</s:if>
	    			<s:else>
	    				<img src="${session.moko_user_headimg}" onerror="onerror=null;src='/wkauction/resource/home/images/zwtx.png'"/>
	    			</s:else>
	    		</div>
	    		<div class="user_detail_top_right">
	    			<p>性别/${session.moko_user.sex}</p>
	    			<p>出生日期/<s:date name="#session.moko_user.birthday" format="yyyy-MM-dd" /></p>
	    			<p>电子邮箱/${session.moko_user.email}</p>
	    			<p>手机号码/${session.moko_user.phone}</p>
	    			<p>所在地/${session.moko_user.address}</p>
	    			<p>擅长/${session.moko_user.specialty}</p>
	    		</div>
	    	</div>
	    	<div class="user_detail_bottom">
	    		<table>
	    			<tbody>
		    			<tr>
		    				<td><a class="user_1" href="userUpdateHomeEdit?userid=${session.moko_user.id}"><span>修改个人资料</span></a></td>
		    				<td><a class="user_2" href="userUpdateHeadImgEdit"><span>修改头像</span></a></td>
		    				<td><a class="user_3" href="productInsertHomeEdit"><span>发布商品</span></a></td>
		    			</tr>
		    			<tr>
		    				<td><a class="user_4" href="productInfoHome?userid=${session.moko_user.id}"><span>我发布的商品</span></a></td>
		    				<td><a class="user_5" href="ordersUserInfo?userid=${session.moko_user.id}"><span>我的竞拍记录</span></a></td>
		    				<td><a class="user_6" href="ordersUsertSuccess?userid=${session.moko_user.id}"><span>我的订单</span></a></td>
		    			</tr>
	    			</tbody>
	    		</table>
	    	</div>
	    </div>
	    
	    
	    <jsp:include page="/WEB-INF/home/foot.jsp"/>
    </s:else>
  </body>
</html>
