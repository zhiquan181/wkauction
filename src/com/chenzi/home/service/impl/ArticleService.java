package com.chenzi.home.service.impl;

import java.util.List;

import com.chenzi.admin.vo.Article;
import com.chenzi.home.dao.IArticleDAO;
import com.chenzi.home.service.IArticleService;

public class ArticleService implements IArticleService{
	private IArticleDAO articlehomeDAO;

	public IArticleDAO getArticlehomeDAO() {
		return articlehomeDAO;
	}

	public void setArticlehomeDAO(IArticleDAO articlehomeDAO) {
		this.articlehomeDAO = articlehomeDAO;
	}

	@Override
	public List getLimitArticle() {
		return articlehomeDAO.getLimitArticle();
	}

	@Override
	public Article getArticleByarticleid(int articleid) {
		return articlehomeDAO.getArticleByarticleid(articleid);
	}
}
