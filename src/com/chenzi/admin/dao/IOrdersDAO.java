package com.chenzi.admin.dao;

import java.util.List;
import com.chenzi.admin.vo.*;
public interface IOrdersDAO {	
	public int getTotalOrders();
	public List getOrdersPaging(Integer currentPage, int pageSize);	

	public int getTotalOrdersBykeyword(String keyword);
	public List getOrdersPagingBykeyword(String keyword, Integer currentPage,int pageSize);
	
}