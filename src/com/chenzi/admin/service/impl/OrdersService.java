package com.chenzi.admin.service.impl;

import java.util.List;
import com.chenzi.admin.dao.IOrdersDAO;
import com.chenzi.admin.service.IOrdersService;
import com.chenzi.admin.vo.Orders;

public class OrdersService implements IOrdersService {
	private IOrdersDAO ordersDAO;
	
	public IOrdersDAO getOrdersDAO() {
		return ordersDAO;
	}
	public void setOrdersDAO(IOrdersDAO ordersDAO) {
		this.ordersDAO = ordersDAO;
	}
	
	@Override
	public int getTotalOrders() {
		return ordersDAO.getTotalOrders();
	}
	
	@Override
	public List getOrdersPaging(Integer currentPage, int pageSize) {
		return ordersDAO.getOrdersPaging(currentPage, pageSize);
	}
	
	@Override
	public int getTotalOrdersBykeyword(String keyword) {
		return ordersDAO.getTotalOrdersBykeyword(keyword);
	}
	
	@Override
	public List getOrdersPagingBykeyword(String keyword, Integer currentPage,int pageSize) {
		return ordersDAO.getOrdersPagingBykeyword(keyword,currentPage,pageSize);
	}
		

	
	
	

}
