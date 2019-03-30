package com.chenzi.home.dao.impl;

import java.util.Date;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.chenzi.admin.dao.BaseDAO;
import com.chenzi.admin.vo.Goods;
import com.chenzi.admin.vo.Orders;
import com.chenzi.admin.vo.User;
import com.chenzi.home.dao.IOrdersDAO;

public class OrdersDAO extends BaseDAO implements IOrdersDAO{

	@Override
	public User getUserByBidUserid(int bid_userid) {
		Session session = getSession();
		User u =(User)session.get(User.class,bid_userid);
		session.close();
		return u;
	}

	@Override
	public Goods getGoodsByBidGoodsid(int bid_goodsid) {
		Session session = getSession();
		Goods g =(Goods)session.get(Goods.class,bid_goodsid);
		session.close();
		return g;
	}

	@Override
	public int bidInsert(Orders o) {
		Session session = getSession();
		Transaction tx = session.beginTransaction();
		session.save(o);
		tx.commit();
		session.close();
		return 1;
	}

	@Override
	public List getOrdersByBidGoodsid(int goodsid) {
		Session session = getSession();
		String hql = "from Orders o where o.goods.id = ? order by o.jprice asc";
		Query query = session.createQuery(hql);
		query.setParameter(0, goodsid);
		List orders = query.list();
		session.close();
		return orders;
	}

	@Override
	public List getOrdersByUserid(int userid) {
		Session session = getSession();
		String hql = "from Orders o where o.user.id = ? order by o.createat";
		Query query = session.createQuery(hql);
		query.setParameter(0, userid);
		List orders = query.list();
		session.close();
		return orders;
	}

	@Override
	public List getSuccessOrdersByUserid(int userid) {
		Session session = getSession();
		
//		SQLQuery query = session.createSQLQuery("SELECT MAX(Orders.jprice) " +
//				"Goods.title, Orders.createat, Orders.jprice " +
//				"FROM Goods " +
//				"INNER JOIN Orders ON Goods.id = Orders.goodsid " +
//				"WHERE Goods.status =? AND Orders.userid =? "+
//				"Order by Goods.createat;"
//				);
		String hql = "from Orders o where o.fkstatus = ? and o.user.id = ? order by o.createat";
		Query query = session.createQuery(hql);
		query.setParameter(0, 1);
		query.setParameter(1, userid);
		
		//String hql = "from Orders o where o.goods.status = 0 AND o.user.id = ? order by o.createat";
		//Query query = session.createQuery(hql);
		//query.setParameter(0, userid);
		List orders = query.list();
		session.close();
		return orders;
	}

	@Override
	public int ordersFkstatus(int ordersid) {
		Session session = getSession();
		Transaction tx = session.beginTransaction();
		Orders o = (Orders)session.get(Orders.class,ordersid);
		System.out.println("o："+o);
		if(o!=null){
			o.setFkstatus(1);
		}
		else{
			session.close();
			return 0;
		}
		tx.commit();
		session.close();
		return 1;
	}

	@Override
	public int ToPay(int payid) {
		Session session = getSession();
		Transaction tx = session.beginTransaction();
		Orders o = (Orders)session.get(Orders.class,payid);
		System.out.println("o："+o);
		if(o!=null){
			o.setPaystatus("已支付");
		}
		else{
			session.close();
			return 0;
		}
		tx.commit();
		session.close();
		return 1;
	}
}
