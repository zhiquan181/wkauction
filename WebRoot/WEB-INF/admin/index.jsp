<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>拍卖系统丨后台管理中心</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="icon" type="image/png" sizes="32x32" href="/wkauction/resource/admin/images/favicon.ico">
	<link rel="stylesheet" href="/wkauction/resource/admin/css/global.css">
	<style type="text/css">
		.admin_ul a,.admin_section a{color:#fff;}
	</style>
  </head>
  
  <body>
	<jsp:include page="/WEB-INF/admin/global_nav.jsp"/>
	
	<div class="admin_body">
		<ul class="admin_ul">
			<div><i style="display:block;width:100%;height:80px;"></i></div>
			<li><a href="adminManager" class="active">系统管理</a></li>
			<li><a href="userListPaging?currentPage=1">拍卖会员</a></li>
			<li><a href="catalogListPaging?currentPage=1">分类管理</a></li>
			<li><a href="goodsListPaging?currentPage=1">商品管理</a></li>
			<li><a href="ordersListPaging?currentPage=1">竞拍管理</a></li>
			<li><a href="auserListPaging?currentPage=1">系统用户</a></li>
			<li><a href="articleListPaging?currentPage=1">新闻资讯</a></li>
			<li><a href="linkListPaging?currentPage=1">友情链接</a></li>
		</ul>
		<div class="admin_section">
			<div class="admin_section_box">
				<div class="admin_section_box_content">
					<span>开发语言：Java</span>
					<span>系统服务器：Apache Tomcat 8.5</span>
					<span>数据库：Mysql5.8</span>
					<span>系统框架：SSH（Struts 2.1+Spring 3.0+Hibernate3.3）</span>
					<span>开发版本：1.1.5（开发版）</span>
					<span>学生：2015130241 王昆</span>
					<span>班级：2015级软件工程12班</span>
					<span>学校：广东科技学院</span>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
