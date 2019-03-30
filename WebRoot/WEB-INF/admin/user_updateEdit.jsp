<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>后台管理中心</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="icon" type="image/png" sizes="32x32" href="/wkauction/resource/admin/images/favicon.ico">
	<style type="text/css">
		*{margin:0;padding:0;border:0;}
		body{width:100%;height: 100%;background-color: #F3F5F8;font-family:"微软雅黑";}
		a{text-decoration: none;}	
		
		.admin_nav{width:100%;min-width:1346px;height:80px;line-height:80px;background:#fff;box-shadow: 1px 2px 15px rgba(0, 0, 0, 0.2);color:#000;position:fixed;z-index:4;}
		.admin_nav a{height:80px;display:inline-block;color:#fff;text-decoration: none;}
		.admin_nav a:hover{color:#fff;}
		.admin_nav .admin_nav_l{width:15%;float:left;text-align:center;font-size:20px;letter-spacing:3px;background:rgb(35,183,229);}
		
				
		.admin_nav .admin_nav_m{padding: 0 20px;float:right;font-size:15px;}
		.admin_nav .admin_nav_r{width:120px;height:40px;margin:20px;line-height:40px;background:rgb(60,141,188);float:right;text-align:center;color:#fff;border-radius:5px;}
		.admin_nav .admin_nav_r:hover{background: rgb(50,122,164);}
		.admin_box{display:none;width:200px;height:300px;background: rgba(130,5,4,.5);}
		.admin_nav .admin_nav_l:hover .admin_box{display:block}
		.admin_nav .admin_nav_m span a{color:#666;}
		
		.admin_ul{width:15%;height:100%;min-height:960px;display:;background: rgb(26,34,38);float:left;}
		.admin_ul li{list-style:none;height:50px;}
		.admin_ul li a{text-decration:none;height:50px;color:#fff;transition:all ease .3s;display:block;text-align:center;line-height:50px;}
		.admin_ul li a:hover{background:rgb(44,59,65);}
		.admin_ul li .active{background:rgb(35,45,49);}
		
		.admin_section{width:85%;height:100%;min-height:960px;float:left;position:relative;padding-top:0px;background:#f8f8f8;}
		.admin_section_box{width:90%;background:#fff;position:relative;border-radius: 5px;margin: 140px auto 0 auto;    box-shadow: 0px 3px 20px rgba(0, 0, 0, 0.2);}
		.admin_section_box_content{height:680px;}
		
	 	.admin_body h4{width:;background:;line-height:50px;text-indent:15px;display:block;font-size:16px;font-weight:400;border-bottom: 1px solid #e2e2e2;}
	 	form{width:100%;height:;margin:auto;padding:40px 0;}
	 	form p{text-align:center;margin:15px auto;}
	 	form p span{display:inline-block;width:100px;text-align:left;}
	 	form p .input{display:inline-block;line-height:40px;text-indent:1em;width:800px;height:40px;border:1px solid #aaa;outline:none;font-size: 16px;}
	 	form p .submit{cursor:pointer;color:#fff;background:rgb(60,141,188);border:0;transition:ease .3s;width: 80px;height: 40px;border-radius: 5px;font-size: 16px;margin-left:15px;}
	 	form p .submit:hover{background: rgb(50,122,164);}
	 	.date{text-indent:0em;padding: 0.5em 0;}
	</style>
  </head>
  
  <body>
    <jsp:include page="/WEB-INF/admin/global_nav.jsp"/>
    
    <div class="admin_body">
    	<ul class="admin_ul">
			<div><i style="display:block;width:100%;height:80px;"></i></div>
			<li><a href="adminManager">系统管理</a></li>
			<li><a href="userListPaging?currentPage=1" class="active">拍卖会员</a></li>
			<li><a href="catalogListPaging?currentPage=1">分类管理</a></li>
			<li><a href="">商品管理</a></li>
			<li><a href="">竞拍管理</a></li>
			<li><a href="auserListPaging?currentPage=1">系统用户</a></li>
			<li><a href="articleListPaging?currentPage=1">新闻资讯</a></li>
			<li><a href="linkListPaging?currentPage=1">友情链接</a></li>
		</ul>
		<div class="admin_section">
			<div class="admin_section_box">
				<div class="admin_section_box_content">
				
			  		<h4>后台中心&nbsp;&rsaquo;&rsaquo;&nbsp;拍卖会员&nbsp;&rsaquo;&rsaquo;&nbsp;修改拍卖会员</h4>
				  	<form action="userUpdate" method="post">
				  		<input type="hidden" class="input" name="user.id" value="${user_update.id}"/>
				  		<p><span>会员账号：</span><input type="text" class="input" name="user.username" value="${user_update.username}" required="required"/></p>
				  		<p><span>会员密码：</span><input type="text" class="input"  name="user.password" value="${user_update.password}" required="required"/></p>
				  		<p><span>出生日期：</span><input type="Date" class="input date" name="user.birthday" value="${user_update.birthday}" required="required"/></p>
				  		<p><span>用户邮箱：</span><input type="email" class="input" name="user.email" value="${user_update.email}" required="required"/></p>
				  		<p><span>用户手机：</span><input type="text" class="input" name="user.phone" value="${user_update.phone}" maxlength="11" required="required"/></p>
				  		<p><span>所在地：</span><input type="text" class="input" name="user.address" maxlength="20" value="${user_update.address}" required="required"/></p>
				  		<p><span>个人特长：</span><input type="text" class="input" name="user.specialty" maxlength="20" value="${user_update.specialty}" required="required"/></p>
				  		<p><input class="submit" type="submit" value="完成"/></p>
				  	</form>
				</div>
			</div>
		</div>
  	</div>
    
  </body>
</html>
