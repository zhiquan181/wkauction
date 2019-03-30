package com.chenzi.home.service;

import java.util.List;

import com.chenzi.admin.vo.Article;

public interface IArticleService {
	public List getLimitArticle();
	public Article getArticleByarticleid(int articleid);
}
