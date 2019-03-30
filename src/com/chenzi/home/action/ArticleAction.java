package com.chenzi.home.action;

import java.util.List;
import java.util.Map;
import com.chenzi.admin.vo.Article;
import com.chenzi.home.service.IArticleService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class ArticleAction extends ActionSupport{
	private static final long serialVersionUID = 1L;
	private int articleid;
	protected IArticleService articlehomeService;
	
	public int getArticleid() {
		return articleid;
	}

	public void setArticleid(int articleid) {
		this.articleid = articleid;
	}
	
	public IArticleService getArticlehomeService() {
		return articlehomeService;
	}

	public void setArticlehomeService(IArticleService articlehomeService) {
		this.articlehomeService = articlehomeService;
	}

	// 首页遍历显示限制10个新闻资讯
	public String articleInfo() throws Exception{
		List articles = articlehomeService.getLimitArticle();
		Map request = (Map)ActionContext.getContext().get("request");
		request.put("home_articles",articles);
		return SUCCESS;
	}
	
	// 新闻资讯详情页面
	public String articleDetail() throws Exception{
		Article at = articlehomeService.getArticleByarticleid(articleid);
		if(at!=null){
			Map request = (Map)ActionContext.getContext().get("request");
			request.put("home_article_detail",at);
			return SUCCESS;
		}
		return ERROR;
		
	}
}
