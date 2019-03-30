package com.chenzi.admin.dao.impl;

import java.util.Date;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.chenzi.admin.dao.BaseDAO;
import com.chenzi.admin.dao.IArticleDAO;
import com.chenzi.admin.vo.Auser;
import com.chenzi.admin.vo.Article;

public class ArticleDAO extends BaseDAO implements IArticleDAO {	
	@Override
	public int getTotalArticle() {
		Session session = getSession();
		String hql = "from Article u";
		Query query = session.createQuery(hql);
		List articles=query.list();
		int totalSize = articles.size();
		session.close();
		return totalSize;
	}
	@Override
	public List getArticlePaging(Integer currentPage, int pageSize) {
		Session session = getSession();
		String hql = "from Article u";
		Query query = session.createQuery(hql);
		//	确定游标
		int startRow = (currentPage-1)*pageSize;
		query.setFirstResult(startRow);
		query.setMaxResults(pageSize);
		List articles=query.list();
		session.close();
		return articles;
	}
	
	@Override
	public int articleInsert(Article article,int editorid) {
		System.out.println(article.getContent());
		Session session = getSession();
		Transaction tx = session.beginTransaction();
		String sql1="from Auser u where u.userid=?";
		Query q1=session.createQuery(sql1);
		q1.setParameter(0, editorid);
		List<?> ausers=q1.list();
		//SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        Date date = new Date();
        //String Date = sdf.format(date);
		Auser au=(Auser)ausers.get(0);
		if(au!=null){
			Article lu = new Article(au,article.getTitle(),article.getContent(),date,1);
			session.save(lu);
		}else{
			return 0;
		}
		// session.flush();
		tx.commit();
        session.close();
		return 1;
	}
	
	@Override
	public int articleDelete(int articleid) {
		Session session = getSession();
		Transaction tx = session.beginTransaction();
		Article u =(Article)session.get(Article.class,articleid); 
		session.delete(u);
		tx.commit();
		session.close();
		return 1;
	}
	
	@Override
	public Article articleUpdateEdit(int articleid) {
		Session session = getSession();
		Transaction tx = session.beginTransaction();
		Article u =(Article)session.get(Article.class,articleid);
		session.close();
		return u;
	}

	@Override
	public int articleUpdate(Article article,int editorid) {
		Session session = getSession();
		Transaction tx = session.beginTransaction();
		String sql1="from Auser u where u.userid=?";
		Query q1=session.createQuery(sql1);
		q1.setParameter(0, editorid);
		List<?> ausers = q1.list();
		Auser auser = (Auser)ausers.get(0);
		if(auser!=null){
			System.out.println("auser："+auser);
			Article artc = (Article)session.get(Article.class,article.getArticleid());
			System.out.println("artcList："+artc);
			if(artc!=null){
				artc.setArticleid(article.getArticleid());
				artc.setTitle(article.getTitle());
				artc.setContent(article.getContent());
				artc.setCreateat(new Date());
				artc.setAuser(auser);
			}
			else{
				return 0;
			}
		}
		else{
			return 0;
		}
        tx.commit();
        session.close();
		return 1;
	}

	@Override
	public int getTotalArticleBykeyword(String keyword) {
		Session session = getSession();
		String hql = "from Article u where u.title like '%"+keyword+"%'";
		Query query = session.createQuery(hql);
		List articles=query.list();
		int totalSize = articles.size();
		session.close();
		return totalSize;
	}
	@Override
	public List getArticlePagingBykeyword(String keyword, Integer currentPage, int pageSize) {
		Session session = getSession();
		String hql = "from Article u where u.title like '%"+keyword+"%'";
		Query query = session.createQuery(hql);
		//	确定游标
		int startRow = (currentPage-1)*pageSize;
		query.setFirstResult(startRow);
		query.setMaxResults(pageSize);
		List articles=query.list();
		session.close();
		return articles;
	}
	
}
