package com.chenzi.home.dao;

import java.util.List;
import com.chenzi.admin.vo.Article;

public interface IArticleDAO {
	public List getLimitArticle();
	public Article getArticleByarticleid(int articleid);
}
