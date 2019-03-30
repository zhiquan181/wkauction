package com.chenzi.admin.dao.impl;

import java.util.Date;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import com.chenzi.admin.dao.BaseDAO;
import com.chenzi.admin.dao.IOrdersDAO;


public class OrdersDAO extends BaseDAO implements IOrdersDAO {	
	@Override
	public int getTotalOrders() {
		Session session = getSession();
		String hql = "from Orders u";
		Query query = session.createQuery(hql);
		List orders=query.list();
		int totalSize = orders.size();
		session.close();
		return totalSize;
	}
	@Override
	public List getOrdersPaging(Integer currentPage, int pageSize) {
		Session session = getSession();
		String hql = "from Orders u Order By u.id asc";
		Query query = session.createQuery(hql);
		//	确定游标
		int startRow = (currentPage-1)*pageSize;
		query.setFirstResult(startRow);
		query.setMaxResults(pageSize);
		List orders=query.list();
		session.close();
		return orders;
	}

	@Override
	public int getTotalOrdersBykeyword(String keyword) {
		Session session = getSession();
		String hql = "from Orders u where u.goods.title like '%"+keyword+"%'";
		Query query = session.createQuery(hql);
		List orders=query.list();
		int totalSize = orders.size();
		session.close();
		return totalSize;
	}
	@Override
	public List getOrdersPagingBykeyword(String keyword, Integer currentPage, int pageSize) {
		Session session = getSession();
		String hql = "from Orders u where u.goods.title like '%"+keyword+"%' Order By u.id asc";
		Query query = session.createQuery(hql);
		//	确定游标
		int startRow = (currentPage-1)*pageSize;
		query.setFirstResult(startRow);
		query.setMaxResults(pageSize);
		List orders=query.list();
		session.close();
		return orders;
	}
	
}
