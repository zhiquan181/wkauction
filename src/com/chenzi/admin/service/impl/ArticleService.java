package com.chenzi.admin.service.impl;

import java.util.List;
import com.chenzi.admin.dao.IArticleDAO;
import com.chenzi.admin.service.IArticleService;
import com.chenzi.admin.vo.Article;

public class ArticleService implements IArticleService {
	private IArticleDAO articleDAO;
	
	public IArticleDAO getArticleDAO() {
		return articleDAO;
	}
	public void setArticleDAO(IArticleDAO articleDAO) {
		this.articleDAO = articleDAO;
	}
	
	@Override
	public int getTotalArticle() {
		return articleDAO.getTotalArticle();
	}
	
	@Override
	public List getArticlePaging(Integer currentPage, int pageSize) {
		return articleDAO.getArticlePaging(currentPage, pageSize);
	}
	
	@Override
	public int articleInsert(Article article,int editorid) {
		return articleDAO.articleInsert(article,editorid);
	}
	
	@Override
	public int articleDelete(int articleid) {
		return articleDAO.articleDelete(articleid);
	}
	
	@Override
	public Article articleUpdateEdit(int articleid) {
		return articleDAO.articleUpdateEdit(articleid);
	}
	
	@Override
	public int articleUpdate(Article article,int editorid) {
		return articleDAO.articleUpdate(article,editorid);
	}
	
	@Override
	public int getTotalArticleBykeyword(String keyword) {
		return articleDAO.getTotalArticleBykeyword(keyword);
	}
	
	@Override
	public List getArticlePagingBykeyword(String keyword, Integer currentPage,int pageSize) {
		return articleDAO.getArticlePagingBykeyword(keyword,currentPage,pageSize);
	}
		

	
	
	

}
