package com.chenzi.admin.action;

import java.util.List;
import java.util.Map;

import com.chenzi.admin.service.IArticleService;
import com.chenzi.admin.util.PagerArticle;
import com.chenzi.admin.vo.Article;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class ArticleAction extends ActionSupport{
	private static final long serialVersionUID = 3702285027814147509L;
	private Article article;
	protected IArticleService articleService;
	
	protected Integer currentPage=1;
	private int articleid;
	private String keyword;
	private int editorid;

	public Article getArticle() {
		return article;
	}

	public void setArticle(Article article) {
		this.article = article;
	}

	public IArticleService getArticleService() {
		return articleService;
	}

	public void setArticleService(IArticleService articleService) {
		this.articleService = articleService;
	}

	public Integer getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(Integer currentPage) {
		this.currentPage = currentPage;
	}

	public int getArticleid() {
		return articleid;
	}

	public void setArticleid(int articleid) {
		this.articleid = articleid;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public int getEditorid() {
		return editorid;
	}

	public void setEditorid(int editorid) {
		this.editorid = editorid;
	}

	// 新闻资讯列表分页
	public String articleListPaging() throws Exception{
		System.out.println("当前页码："+currentPage);
		int totalSize = articleService.getTotalArticle();
		PagerArticle pager = new PagerArticle(currentPage,totalSize);
		List articles = articleService.getArticlePaging(currentPage, pager.getPageSize());
		Map request = (Map)ActionContext.getContext().get("request");
		request.put("articles",articles);
		request.put("pager",pager);
		System.out.println(articles);
		return SUCCESS;
	}
	
	// 新闻资讯新增编辑操作
	public String articleInsertEdit() throws Exception{
		return SUCCESS;
	}
	
	// 新闻资讯新增操作
	public String articleInsert() throws Exception{
		int state = articleService.articleInsert(article,editorid);
		if(state>0){
			return SUCCESS;
		}
		return ERROR;
	}
	
	// 新闻资讯删除操作
	public String articleDelete() throws Exception{
		int state = articleService.articleDelete(this.articleid);
		if(state>0){
			return SUCCESS;
		}
		return ERROR;
	}
	
	// 新闻资讯修改编辑操作
	public String articleUpdateEdit() throws Exception{
		Article au=articleService.articleUpdateEdit(this.articleid);
		if(au!=null){
			Map session=ActionContext.getContext().getSession();
			session.put("article_update", au);
			return SUCCESS;
		}
		return ERROR;
	}
	
	// 新闻资讯修改操作
	public String articleUpdate() throws Exception{
		int state = articleService.articleUpdate(article,editorid);
		System.out.println(state);
		if(state>0){
			return SUCCESS;
		}
		return ERROR;
	}
	
	// 新闻资讯查询操作
	public String articleQuery() throws Exception{
		System.out.println("当前页码："+currentPage);
		int totalSize = articleService.getTotalArticleBykeyword(keyword);
		PagerArticle pager = new PagerArticle(currentPage,totalSize);
		List articles = articleService.getArticlePagingBykeyword(keyword,currentPage, pager.getPageSize());
		Map request = (Map)ActionContext.getContext().get("request");
		request.put("articles",articles);
		request.put("pager",pager);
		System.out.println(articles);
		return SUCCESS;
	}

}
