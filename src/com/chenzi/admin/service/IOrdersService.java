package com.chenzi.admin.service;

import java.util.List;
import com.chenzi.admin.vo.Orders;
public interface IOrdersService {	
	public int getTotalOrders();
	public List getOrdersPaging(Integer currentPage, int pageSize);	

	public int getTotalOrdersBykeyword(String keyword);
	public List getOrdersPagingBykeyword(String keyword, Integer currentPage,int pageSize);
	
}
