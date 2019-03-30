<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>

<div class="link">
	<div class="link_box">
		<h2>友情链接</h2>
	</div>
	
	<ul>
		<s:iterator value="#request['home_links']" var="home_link">
			<li>
				<a href="${home_link.domain}" target="_blank">${home_link.title}</a>
			</li>
		</s:iterator>
	</ul>
</div>
