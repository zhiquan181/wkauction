package com.chenzi.home.service.impl;

import java.util.List;
import com.chenzi.admin.vo.Goods;
import com.chenzi.admin.vo.Orders;
import com.chenzi.admin.vo.User;
import com.chenzi.home.dao.IOrdersDAO;
import com.chenzi.home.service.IOrdersService;

public class OrdersService implements IOrdersService{
	private IOrdersDAO ordershomeDAO;

	public IOrdersDAO getOrdershomeDAO() {
		return ordershomeDAO;
	}

	public void setOrdershomeDAO(IOrdersDAO ordershomeDAO) {
		this.ordershomeDAO = ordershomeDAO;
	}

	@Override
	public User getUserByBidUserid(int bid_userid) {
		return ordershomeDAO.getUserByBidUserid(bid_userid);
	}

	@Override
	public Goods getGoodsByBidGoodsid(int bid_goodsid) {
		return ordershomeDAO.getGoodsByBidGoodsid(bid_goodsid);
	}

	@Override
	public int bidInsert(Orders o) {
		return ordershomeDAO.bidInsert(o);
	}

	@Override
	public List getOrdersByBidGoodsid(int goodsid) {
		return ordershomeDAO.getOrdersByBidGoodsid(goodsid);
	}

	@Override
	public List getOrdersByUserid(int userid) {
		return ordershomeDAO.getOrdersByUserid(userid);
	}

	@Override
	public List getSuccessOrdersByUserid(int userid) {
		return ordershomeDAO.getSuccessOrdersByUserid(userid);
	}

	@Override
	public int ordersFkstatus(int ordersid) {
		return ordershomeDAO.ordersFkstatus(ordersid);
	}

	@Override
	public int ToPay(int payid) {
		return ordershomeDAO.ToPay(payid);
	}
}
