<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<style type="text/css">
<!--
.goods_detail_middle ul{width:100%;height:auto;clear: both;background-color:#fafafa;}
.goods_detail_middle li{float: left;padding:10px 0;background-color:#fafafa;list-style: none;text-align: center;border-bottom: 1px solid rgb(212,212,212);}
.li_1{width:10%;}
.li_2{width:50%;}
.li_3{width:20%;}
.li_4{width:20%;}
-->
</style>



<ul>
	<li class="li_1" align="center">竞价者</li>
	<li class="li_2" align="center">商品名称</li>
	<li class="li_3" align="center">创建时间</li>
	<li class="li_4" align="center">竞价</li>
</ul>
	
<ul class="bid_ul">
<s:iterator value="#request['home_orders_product']" var="home_order_product">
	<a>
		<input class="max_orders_id" type="hidden" value="${home_order_product.id}"/>
		<li class="li_1">${home_order_product.user.username}</li>
		<li class="li_2">${home_order_product.goods.title}</li>
		<li class="li_3">${home_order_product.createat}</li>
		<li class="li_4">${home_order_product.jprice}</li>
	</a>
</s:iterator>
</ul>

