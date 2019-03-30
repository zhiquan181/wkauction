<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>${session.moko_user.username}丨修改个人资料</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="icon" type="image/png" sizes="32x32" href="/wkmoko/resource/admin/images/favicon.ico">
	<style type="text/css">
		body{background-color:#fff;}
		
		.user_box{width:1000px;height:;margin:50px auto 0 auto;padding:30px 0;box-shadow: 1px 3px 3px rgba(0, 0, 0, 0.1);border: 1px solid rgb(212,212,212);background-color: #fff;}
		.user_box h2{font-size:30px;font-weight:400;display:block;text-indent: 30px;}
		.user_box h2 a{padding:15px;border-radius:5px;font-size:15px;display:inline-block;margin: 0 0 0 17px;background:rgb(0,174,239);color:#fff;text-decoration: none;}
		.user_box h2 a:hover{background:rgb(0,137,200);}
		.user_box span{color:#999;font-size:14px;display:block;text-indent: 30px;}
		
		.user_update_Edit_box{width:1000px;height:auto;background:#fff;margin:10px auto 50px auto;box-shadow: 1px 3px 3px rgba(0, 0, 0, 0.1);border: 1px solid rgb(212,212,212);}
		.user_update_Edit_box form{width:100%;height:;margin:auto;padding:40px 0;}
	 	.user_update_Edit_box form p{text-align:center;margin:15px auto;}
	 	.user_update_Edit_box form p span{display:inline-block;width:100px;text-align:left;}
	 	.user_update_Edit_box form p .input{display:inline-block;text-indent:1em;width:800px;height:40px;border:1px solid #aaa;outline:none;font-size: 16px;}
	 	.user_update_Edit_box form p .user_submit{cursor:pointer;color:#fff;background:rgb(0,174,239);border:0;transition:ease .3s;width: 80px;height: 40px;border-radius: 5px;font-size: 16px;margin-left:15px;}
	 	.user_update_Edit_box form p .user_submit:hover{background: rgb(0,137,200);}
	</style>
  </head>
  
  <body>    
    <s:if test="#session.moko_user==null">
    	<script language="javascript"type="text/javascript"> 
			alert("您的登录回话已过期，请重新登录！"); 
			window.location.href="http://localhost:8080/wkmoko/"; 
		</script>
	</s:if>
	<s:else>
		<jsp:include page="/WEB-INF/home/head.jsp"/>
		
		<div class="user_box">
	   		<h2>
	   			修改个人资料：${session.moko_user.username}
	   			<!-- 
	   			<a href="userUpdateHomeEdit?userid=${session.moko_user.id}">修改资料</a>
	   			<a href="userUpdateHeadImgEdit">修改头像</a>
	   			<a href="productInsertHomeEdit">发布商品</a>
	   			<a href="productInsertHomeEdit">我的商品</a>
	   			<a href="productInsertHomeEdit">我的竞拍</a>
	   			<a href="productInsertHomeEdit">我的订单</a>
	   			 -->
	   		</h2>
	   		<span>所在地：${session.moko_user.address}</span>
	   	</div>
		
		<div class="user_update_Edit_box">
			<form action="userUpdateHome" method="post">
	  		<input type="hidden" class="input" name="user.id" value="${session.moko_user.id}"/>
	  		<p><span>用户账号：</span><input type="text" class="input" name="user.username" value="${session.moko_user.username}" required="required"/></p>
	  		<p><span>性别：</span><input type="text" class="input" name="user.sex" value="${session.moko_user.sex}" maxlength="2" required="required"/></p>
	  		<p><span>用户密码：</span><input type="text" class="input"  name="user.password" value="${session.moko_user.password}" required="required"/></p>
	  		<p><span>当前生日：</span><input type="text" class="input" name="" value="<s:date name="#session.moko_user.birthday" format="yyyy-MM-dd" />" style="background:#e2e2e2;" readonly/></p>
	  		<p><span>更改生日：</span><input type="Date" class="input date" name="user.birthday" value="" required="required"/></p>
	  		<p><span>用户邮箱：</span><input type="email" class="input" name="user.email" value="${session.moko_user.email}" required="required"/></p>
	  		<p><span>用户手机：</span><input type="text" class="input" name="user.phone" value="${session.moko_user.phone}" maxlength="11" required="required"/></p>
	  		<p><span>居住地：</span><input type="text" class="input" name="user.address" maxlength="20" value="${session.moko_user.address}" required="required"/></p>
	  		<p><span>个人特长：</span><input type="text" class="input" name="user.specialty" maxlength="20" value="${session.moko_user.specialty}" required="required"/></p>
	  		<p><input class="user_submit" type="submit" value="完成"/></p>
	  	</form>
		</div>
	</s:else>
	
	<jsp:include page="/WEB-INF/home/foot.jsp"/>
  </body>
</html>
