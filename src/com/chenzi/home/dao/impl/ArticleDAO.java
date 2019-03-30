package com.chenzi.home.dao.impl;

import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import com.chenzi.admin.dao.BaseDAO;
import com.chenzi.admin.vo.Article;
import com.chenzi.home.dao.IArticleDAO;

public class ArticleDAO extends BaseDAO implements IArticleDAO{

	@Override
	public List getLimitArticle() {
		Session session = getSession();
		String hql = "from Article u order by articleid asc";
		Query query = session.createQuery(hql);
	    query.setMaxResults(10);
		List articles=query.list();
		session.close();
		return articles;
	}

	@Override
	public Article getArticleByarticleid(int articleid) {
		Session session = getSession();
		String hql = "from Article u where u.articleid=?";
		Query query = session.createQuery(hql);
		query.setParameter(0, articleid);
		List<?> articles=query.list();
		Article at = (Article)articles.get(0);
		session.close();
		return at;
	}
}
