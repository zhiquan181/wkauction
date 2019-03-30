package com.chenzi.admin.dao.impl;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.chenzi.admin.dao.BaseDAO;
import com.chenzi.admin.dao.ILinkDAO;
import com.chenzi.admin.vo.Auser;
import com.chenzi.admin.vo.Link;

public class LinkDAO extends BaseDAO implements ILinkDAO {	
	@Override
	public int getTotalLink() {
		Session session = getSession();
		String hql = "from Link u";
		Query query = session.createQuery(hql);
		List links=query.list();
		int totalSize = links.size();
		session.close();
		return totalSize;
	}
	@Override
	public List getLinkPaging(Integer currentPage, int pageSize) {
		Session session = getSession();
		String hql = "from Link u";
		Query query = session.createQuery(hql);
		//	确定游标
		int startRow = (currentPage-1)*pageSize;
		query.setFirstResult(startRow);
		query.setMaxResults(pageSize);
		List links=query.list();
		session.close();
		return links;
	}
	
	@Override
	public int linkInsert(Link link,int editorid) {
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
		Link lu = new Link(link.getTitle(),link.getDomain(),date);
		session.save(lu);
       // session.flush();
        tx.commit();
        session.close();
		return 1;
	}
	
	@Override
	public int linkDelete(int linkid) {
		Session session = getSession();
		Transaction tx = session.beginTransaction();
		Link u =(Link)session.get(Link.class,linkid); 
		session.delete(u);
		tx.commit();
		session.close();
		return 1;
	}
	
	@Override
	public Link linkUpdateEdit(int linkid) {
		Session session = getSession();
		Transaction tx = session.beginTransaction();
		Link u =(Link)session.get(Link.class,linkid);
		session.close();
		return u;
	}

	@Override
	public int linkUpdate(Link link,int editorid) {
		Session session = getSession();
		Transaction tx = session.beginTransaction();
		String sql1="from Auser u where u.userid=?";
		Query q1=session.createQuery(sql1);
		q1.setParameter(0, editorid);
		List<?> ausers=q1.list();
		Auser au=(Auser)ausers.get(0);
		Link lu =(Link)session.get(Link.class,link.getLinkid());
		lu.setLinkid(link.getLinkid());
		lu.setTitle(link.getTitle());
		lu.setDomain(link.getDomain());
		lu.setCreateat(new Date());
        tx.commit();
        session.close();
		return 1;
	}

	@Override
	public int getTotalLinkBykeyword(String keyword) {
		Session session = getSession();
		String hql = "from Link u where u.title like '%"+keyword+"%'";
		Query query = session.createQuery(hql);
		List links=query.list();
		int totalSize = links.size();
		session.close();
		return totalSize;
	}
	@Override
	public List getLinkPagingBykeyword(String keyword, Integer currentPage, int pageSize) {
		Session session = getSession();
		String hql = "from Link u where u.title like '%"+keyword+"%'";
		Query query = session.createQuery(hql);
		//	确定游标
		int startRow = (currentPage-1)*pageSize;
		query.setFirstResult(startRow);
		query.setMaxResults(pageSize);
		List links=query.list();
		session.close();
		return links;
	}
	
}
