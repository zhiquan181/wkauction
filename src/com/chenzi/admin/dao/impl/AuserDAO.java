package com.chenzi.admin.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.chenzi.admin.dao.BaseDAO;
import com.chenzi.admin.dao.IAuserDAO;
import com.chenzi.admin.vo.Auser;
import com.chenzi.admin.vo.Link;

public class AuserDAO extends BaseDAO implements IAuserDAO {
	public Auser validateAuser(String username,String password) {
		// System.out.println(username+" "+password);
		String sql="from Auser u where u.username=? and u.password=?";
		Session session=getSession();
		Query q=session.createQuery(sql);
		q.setParameter(0, username);
		q.setParameter(1, password);
		List<?> ausers=q.list();
		if(ausers.isEmpty()){
			System.out.println("NULL");
			return null;
		}
		Auser u=(Auser)ausers.get(0);
		session.close();
		return u;
	}
	
	@Override
	public int getTotalAuser() {
		Session session = getSession();
		String hql = "from Auser u";
		Query query = session.createQuery(hql);
		List ausers=query.list();
		int totalSize = ausers.size();
		session.close();
		return totalSize;
	}
	@Override
	public List getAuserPaging(Integer currentPage, int pageSize) {
		Session session = getSession();
		String hql = "from Auser u";
		Query query = session.createQuery(hql);
		//	确定游标
		int startRow = (currentPage-1)*pageSize;
		query.setFirstResult(startRow);
		query.setMaxResults(pageSize);
		List ausers=query.list();
		session.close();
		return ausers;
	}
	
	@Override
	public int auserInsert(Auser auser) {
		Session session = getSession();
		Transaction tx = session.beginTransaction();
		Auser u = new Auser(auser.getUsername(),auser.getPassword(),auser.getSex(),auser.getWeight());
		session.save(u);
       // session.flush();
        tx.commit();
        session.close();
		return 1;
	}
	
	@Override
	public int auserDelete(int userid) {
		Session session = getSession();
		Transaction tx = session.beginTransaction();
		Auser u =(Auser)session.get(Auser.class,userid); 
		session.delete(u);
		tx.commit();
		session.close();
		return 1;
	}
	
	@Override
	public Auser auserUpdateEdit(int userid) {
		Session session = getSession();
		Transaction tx = session.beginTransaction();
		Auser u =(Auser)session.get(Auser.class,userid);
		session.close();
		return u;
	}

	@Override
	public int auserUpdate(Auser auser) {
		Session session = getSession();
		Transaction tx = session.beginTransaction();
		Auser u =(Auser)session.get(Auser.class,auser.getUserid()); 
		System.out.println(u);
		System.out.println(auser.getUserid());
		u.setUsername(auser.getUsername());
		u.setPassword(auser.getPassword());
		u.setSex(auser.getSex());
		u.setWeight(auser.getWeight());
		tx.commit();
		session.close();
		return 1;
	}

	@Override
	public int getTotalAuserBykeyword(String keyword) {
		Session session = getSession();
		String hql = "from Auser u where u.username like '%"+keyword+"%'";
		Query query = session.createQuery(hql);
		List ausers=query.list();
		int totalSize = ausers.size();
		session.close();
		return totalSize;
	}

	@Override
	public List getAuserPagingBykeyword(String keyword, Integer currentPage, int pageSize) {
		Session session = getSession();
		String hql = "from Auser u where u.username like '%"+keyword+"%'";
		Query query = session.createQuery(hql);
		//	确定游标
		int startRow = (currentPage-1)*pageSize;
		query.setFirstResult(startRow);
		query.setMaxResults(pageSize);
		List ausers=query.list();
		session.close();
		return ausers;
	}
	
}
