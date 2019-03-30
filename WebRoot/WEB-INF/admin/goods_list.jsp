<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>拍卖系统-后台管理中心</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="icon" type="image/png" sizes="32x32" href="/wkauction/resource/admin/images/favicon.ico">
	<link rel="stylesheet" href="/wkauction/resource/admin/css/global.css">
	<link rel="stylesheet" href="/wkauction/resource/admin/css/global_page.css">
	<style type="text/css">
		.admin_ul a,.admin_section a{color:#fff;}
	</style>
	<script type="text/javascript" src="/wkauction/resource/home/js/jquery-3.3.1.min.js"></script>
  </head>
  
  <body>
	<jsp:include page="/WEB-INF/admin/global_nav.jsp"/>
	
	<div class="admin_body">
		<ul class="admin_ul">
			<div><i style="display:block;width:100%;height:80px;"></i></div>
			<li><a href="adminManager">系统管理</a></li>
			<li><a href="userListPaging?currentPage=1">拍卖会员</a></li>
			<li><a href="catalogListPaging?currentPage=1">分类管理</a></li>
			<li><a href="goodsListPaging?currentPage=1" class="active">商品管理</a></li>
			<li><a href="ordersListPaging?currentPage=1">竞拍管理</a></li>
			<li><a href="auserListPaging?currentPage=1">系统用户</a></li>
			<li><a href="catalogListPaging?currentPage=1">新闻资讯</a></li>
			<li><a href="linkListPaging?currentPage=1">友情链接</a></li>
		</ul>
		<div class="admin_section">
			<div class="admin_section_box">
				<div class="admin_section_box_content">
					<p>后台中心&nbsp;&rsaquo;&rsaquo;&nbsp;分类管理</p>
					<div>
						<form action="goodsQuery" method="get">
							<span>
								<input type="hidden" name="currentPage" value="1"/>
								<input class="text" type="text" name="keyword" placeholder="${keyword}" autocomplete="off" value=""/>
								<input class="submit" type="submit" value="查询"/>
							</span>
						</form>
					</div>
					
					<table align="center" border="0" cellpadding="0" cellspacing="0">
						<tr align="center" height="26px">
							<th width="10%">ID</th>
							<th width="40%">商品名称</th>
							<th width="10%">商品类型</th>
							<th width="10%">商品价格</th>
							<th width="10%">商品状态</th>
							<th width="10%">截止时间</th>
							<th width="10%">发布人</th>
						</tr>
						
						<s:iterator value="#request['goodss']" var="a_goods">
							<tr align="center" height="26px" class="jquery_tr">
								<td>${a_goods.id}</td>
								<td class="goods_content">${a_goods.title}</td>
								<td>${a_goods.typename}</td>
								<td>${a_goods.price}</td>
								<td>${a_goods.status}</td>
								<td>${a_goods.endtime}</td>
								<td>${a_goods.user.username}</td>
							</tr>
						</s:iterator>
					</table>
				</div>
				
				<div class="paging_pager">
					<div class="paging_pager_bar">
						<s:set value="#request['pager']" var="pager"/>
						<!-- 首页 -->
						<s:if test="#pager.hasFirst">
						  <a class="pager_commom" href="goodsListPaging.action?currentPage=1">首页</a>
						</s:if>
						<s:else>
						  <a class="pager_commom pager_commom_not" href="javascript:volid(0)">首页</a>
						</s:else>
						
						<!-- 上一页 -->
						<s:if test="#pager.hasPrevious">
							<a class="pager_commom" href="goodsListPaging.action?currentPage=<s:property value="#pager.currentPage-1"/>">&lsaquo;</a>
						</s:if>
						<s:else>
							<a class="pager_commom pager_commom_not" href="javascript:volid(0)">&lsaquo;</a>
						</s:else>
						
						<!-- 当前页 -->
						<a class="pager_commom" href="goodsListPaging.action?currentPage=<s:property value="#pager.currentPage"/>"><s:property value="#pager.currentPage"/></a>
						
						<!-- 下一页 -->
						<s:if test="#pager.hasNext">
						  <a class="pager_commom" href="goodsListPaging.action?currentPage=<s:property value="#pager.currentPage+1"/>">&rsaquo;</a>
						</s:if>
						<s:else>
							<a class="pager_commom pager_commom_not">&rsaquo;</a>
						</s:else>
						
						<!-- 尾页 -->
						<s:if test="#pager.hasLast">
						  <a class="pager_commom" href="goodsListPaging.action?currentPage=<s:property value="#pager.totalPage"/>">尾页</a>
						</s:if>
						<s:else>
						  <a class="pager_commom pager_commom_not" href="javascript:volid(0)">尾页</a>
						</s:else>
						
						<span class="pager_total" href="javascript:volid(0)">共<s:property value="#pager.totalPage"/>页</span>
					</div>
				</div>
			    
			</div>

			
		</div>
	</div>
</body>
<script type="text/javascript">
	jQuery(".jquery_tr:even").css("background","#fff");
	jQuery(".jquery_tr:odd").css("background","rgb(249,250,252)");
</script>
</html>
