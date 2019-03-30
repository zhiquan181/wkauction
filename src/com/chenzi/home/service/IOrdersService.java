package com.chenzi.home.service;

import java.util.List;
import com.chenzi.admin.vo.Goods;
import com.chenzi.admin.vo.Orders;
import com.chenzi.admin.vo.User;

public interface IOrdersService {

	User getUserByBidUserid(int bid_userid);

	Goods getGoodsByBidGoodsid(int bid_goodsid);

	int bidInsert(Orders o);

	List getOrdersByBidGoodsid(int goodsid);

	List getOrdersByUserid(int userid);

	List getSuccessOrdersByUserid(int userid);

	int ordersFkstatus(int ordersid);

	int ToPay(int payid);
}
