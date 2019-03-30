package com.chenzi.admin.dao.impl;

import java.util.Date;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import com.chenzi.admin.dao.BaseDAO;
import com.chenzi.admin.dao.IGoodsDAO;


public class GoodsDAO extends BaseDAO implements IGoodsDAO {	
	@Override
	public int getTotalGoods() {
		Session session = getSession();
		String hql = "from Goods u";
		Query query = session.createQuery(hql);
		List goods=query.list();
		int totalSize = goods.size();
		session.close();
		return totalSize;
	}
	@Override
	public List getGoodsPaging(Integer currentPage, int pageSize) {
		Session session = getSession();
		String hql = "from Goods u Order By u.id asc";
		Query query = session.createQuery(hql);
		//	确定游标
		int startRow = (currentPage-1)*pageSize;
		query.setFirstResult(startRow);
		query.setMaxResults(pageSize);
		List goods=query.list();
		session.close();
		return goods;
	}

	@Override
	public int getTotalGoodsBykeyword(String keyword) {
		Session session = getSession();
		String hql = "from Goods u where u.title like '%"+keyword+"%'";
		Query query = session.createQuery(hql);
		List goods=query.list();
		int totalSize = goods.size();
		session.close();
		return totalSize;
	}
	@Override
	public List getGoodsPagingBykeyword(String keyword, Integer currentPage, int pageSize) {
		Session session = getSession();
		String hql = "from Goods u where u.title like '%"+keyword+"%' Order By u.id asc";
		Query query = session.createQuery(hql);
		//	确定游标
		int startRow = (currentPage-1)*pageSize;
		query.setFirstResult(startRow);
		query.setMaxResults(pageSize);
		List goods=query.list();
		session.close();
		return goods;
	}
	
}
