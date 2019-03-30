<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>

<div class="article">
	<div class="article_box">
		<h2>新闻资讯</h2>
	</div>
	
	<ul>
		<s:iterator value="#request['home_articles']" var="home_article">
			<li>
				<span class="article_span1"><a href="articleDetail?articleid=${home_article.articleid}">${home_article.title}</a></span>
				<span class="article_span2"><s:date name="#home_article.createat" format="yyyy-MM-dd" /></span>
			</li>
		</s:iterator>
	</ul>
</div>