<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>拍卖系统丨注册</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="icon" type="image/png" sizes="32x32" href="/wkauction/resource/admin/images/favicon.ico">
	<style type="text/css">
		/*初始化 start*/
		*{
			margin: 0;padding: 0;border: 0;
		}
		body{
			font-family: 微软雅黑;
			background-color: #f4f4f4;
		}
		/*初始化 end*/


		/*header start*/
		header{
			width: 100%;
			height: 180px;
			border-bottom: 1px solid #e2e2e2;
		}
		.header-left{
			width: 50%;
			height: 180px;
			float: left;
			text-align: center;
			background-image: url(./resource/images/chenziheng.jpg);
			background-size: 100%;
			background-repeat: no-repeat;
			/*text-align: center; 为对文本或者图片进行居中*/
		}
		.header-left>img{
			width: 200px;
			height: 100px;
			border-radius: 200px;
			margin-top: 20px;
		}
		.header-right{
			width: 50%;
			height: 180px;
			float: left;

		}
		.header-right>h1{
			font-weight: lighter;
			font-family: 微软雅黑;
			padding-top: 60px;
		}
		/*header end*/


		/*box start*/
		.box{
			width: 1000px;
			height: 1000px;
			margin: 0 auto;

		}
		.box-left{
			width: 50%;
			height: 280px;
			float: left;
			text-align: center;
			border-bottom: 1px solid #f4f4f4;
		}
		.box-left>p{
			padding-top: 80px;
		}
		.box-right{
			width: 50%;
			
			float: left;
			border-bottom: 1px solid #f4f4f4;
		}
		.box-bottom{
			width: 50%;
			height: 50px;
			text-align: center;
			margin: 0 auto;
			clear: both;
			position: relative;
			/*清除box-left和box-right-兄弟的浮动，不然你知道的*/
		}
		.box-bottom p{
			position: relative;
			top: 20px;
		}
		.box-right form{
			width: 100%;
			
		}
		.box-right  form input{ 
			outline: none;
			font-family: 微软雅黑;
			font-size: 16px;
			transition: all .5s ease;
		}
		.box-right form input:focus {
			border-color: rgba(82, 168, 236, 0.8);
			outline: thin dotted \9;
			box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075), 0 0 8px rgba(82, 168, 236, 0.6);
			/*margin-top: 10px;*/
		}
		.username,.password,.birthday,.email,.phone,.address,.specialty{
			width: 300px;
			height: 35px;
			padding-left:1em;
		}
		.birthday{
			padding: 0.3em 0;
		}
		.box-right form p{
			padding: 10px 0;
		}
		.box-right form p a{
			color:fuchsia;
		}
		.reset{
			width: 80px;
			height: 35px;
			color: white;
			background-color: orange;
			cursor:pointer;
		}
		.success{
			width: 80px;
			height: 35px;
			background-color: green;
			color: white;
			cursor:pointer;
		}
		h1{color: blue;transition: ease .3s}
		h1:hover{color: red;}
		/*box end*/
	</style>

	<script language="javascript">
		function check() 
		{   
			var username = document.getElementById("username").value;
			var password = document.getElementById("password").value;
			var birthday = document.getElementById("birthday").value;
			var email = document.getElementById("email").value;
			var phone = document.getElementById("phone").value;
			var address = document.getElementById("address").value;
			var specialty = document.getElementById("specialty").value;
			
			if(username == "") {
				alert("请输入用户名");
				return false;
			}
			
			if(password == "") {
				alert("请输入密码");
				return false;
			} 
			
			if(birthday == "") {
				alert("请输入出生日期");
				return false;
			}
			
			if(email == "") {
				alert("请输入邮箱");
				return false;
			} 
			
			if(phone == "") {
				alert("请输入手机号码");
				return false;
			}
			
			if(address == ""){
				alert("请输入居住地");
				return false;
			}
			
			if(specialty == ""){
				alert("请输入个人特长");
				return false;
			}
			
			alert("注册成功！");
			return true;
	}
	</script>

  </head>
  
  <body>
    <!-- header begin -->
	<header>
		<div class="header-left" >
			 <!-- <p><img src="chenziheng.jpg" width="835" height="200" /></p> -->
		</div>
		<div class="header-right">
			<h1 style="font-size: 80px" align='center'>CHENZI!</h1>
		</div>
		<div class="header-bottom">
			<p align=center ><em> </em></p>
		</div>
	</header>
	<!-- header end -->

	<!-- box begin -->
	<div class="box">
		<div class="box-left">
			
			<p><img src="/wkauction/resource/home/images/chenzi.jpg" width="300" height="300" /></p>
		</div>

		<div class="box-right">
			<fieldset>
					<form action="userRegester" method="post" anotype="multipart/form-data">
						<p><strong>申请账号:</strong>(用户昵称)</p>
						<input class="username" id="username" type="text" name="user.username" size="20"/><br>

						<p><strong>密码:</strong></p>
						<input class="password" id="password" type="password" name="user.password" size="20"/><br>
						
						<p><strong>出生日期:</strong></p>
						<input class="birthday" id="birthday" type="date" name="user.birthday" size="20"/><br>
						
						<p><strong>邮箱:</strong></p>
						<input class="email" id="email" type="email" name="user.email" size="20"/><br>
						
						<p><strong>手机:</strong></p>
						<input class="phone" id="phone" type="text" name="user.phone" maxlength="11" size="20"/><br>
						
						<p><strong>居住地:</strong></p>
						<input class="address" id="address" type="text" name="user.address" maxlength="20"/><br>
						
						<p><strong>个人特长:</strong></p>
						<input class="specialty" id="specialty" type="text" name="user.specialty" maxlength="20"/><br>

						<p>
							<a href="login.jsp" style="font-size: 14px;">去登陆</a>
							<a href="index.jsp" style="font-size: 14px;">去首页</a>
						</p>
						<!-- <label></label> -->
						
						<br/>
						<input type="reset" class="reset" value="重置"/>
						<input type="submit" class="success" value="注册" onclick="return check()"/>
						<!-- (按登陆跳转下一个页面) -->

						<p>
							<!-- 二维码 -->
							<!-- <img src="images/705336571568498794.jpg" width="121" height="116" align="absmiddle" /> -->
						</p>
						
					</form>
			</fieldset>
		</div>

		<div class="box-bottom">
			 <p>
			 	<a>关于拍卖</a>&nbsp;|&nbsp;
			 	<a>帮助中心</a>&nbsp;|&nbsp;
			 	<a>客服中心</a>&nbsp;|&nbsp;
			 </p>
		</div>
	</div>
	<!-- box end -->
  </body>
</html>
