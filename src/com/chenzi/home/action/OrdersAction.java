package com.chenzi.home.action;

import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.chenzi.admin.vo.Goods;
import com.chenzi.admin.vo.Orders;
import com.chenzi.admin.vo.User;
import com.chenzi.home.service.IOrdersService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class OrdersAction extends ActionSupport{
	private static final long serialVersionUID = 1L;
	private int bid_goodsid;
	private int bid_userid;
	private int bid_price;
	
	private int userid;
	private int goodsid;
	
	protected IOrdersService ordershomeService;

	public int getBid_goodsid() {
		return bid_goodsid;
	}

	public void setBid_goodsid(int bid_goodsid) {
		this.bid_goodsid = bid_goodsid;
	}

	public int getBid_userid() {
		return bid_userid;
	}

	public void setBid_userid(int bid_userid) {
		this.bid_userid = bid_userid;
	}

	public int getBid_price() {
		return bid_price;
	}

	public void setBid_price(int bid_price) {
		this.bid_price = bid_price;
	}
	
	public int getUserid() {
		return userid;
	}

	public void setUserid(int userid) {
		this.userid = userid;
	}

	public int getGoodsid() {
		return goodsid;
	}

	public void setGoodsid(int goodsid) {
		this.goodsid = goodsid;
	}

	public IOrdersService getOrdershomeService() {
		return ordershomeService;
	}

	public void setOrdershomeService(IOrdersService ordershomeService) {
		this.ordershomeService = ordershomeService;
	}

	public String bidInsert() throws Exception{
		
		System.out.println(bid_userid+" "+bid_goodsid);
		User u = ordershomeService.getUserByBidUserid(bid_userid);
		Goods g = ordershomeService.getGoodsByBidGoodsid(bid_goodsid);
		
		//使用uuid随机字符串
		String uuidStr = UUID.randomUUID().toString();
		//除去uuid字符串的-字符
        String uuid = uuidStr.substring(0, 8) + uuidStr.substring(9, 13) + uuidStr.substring(14, 18) + uuidStr.substring(19, 23) + uuidStr.substring(24);
        
		if(u!=null&&g!=null){
			Orders o = new Orders(u,g,new Date(),bid_price,0,"未支付",uuid);
			int state = ordershomeService.bidInsert(o);
			if(state>0){
				if(g!=null){
					Map request = (Map)ActionContext.getContext().get("request");
					request.put("home_goods_detail",g);
					return SUCCESS;
				}
				else{
					return ERROR;
				}
			}else{
				return ERROR;
			}
		}
		else{
			return ERROR;
		}
	}
	
	public String ordersProductInfo()throws Exception{
		System.out.println(" goodsid: "+goodsid);
		List orders = ordershomeService.getOrdersByBidGoodsid(goodsid);
		System.out.println(" orders: "+orders);
		Map request = (Map)ActionContext.getContext().get("request");
		request.put("home_orders_product",orders);
		return SUCCESS;
	}
	
	public String ordersUserInfo()throws Exception{
		System.out.println(" userid: "+userid);
		List orders = ordershomeService.getOrdersByUserid(userid);
		System.out.println(" orders: "+orders);
		Map request = (Map)ActionContext.getContext().get("request");
		request.put("home_orders_user",orders);
		return SUCCESS;
	}
	
	public String ordersUsertSuccess()throws Exception{
		System.out.println(" userid: "+userid);
		List orders = ordershomeService.getSuccessOrdersByUserid(userid);
		System.out.println(" orders: "+orders);
		Map request = (Map)ActionContext.getContext().get("request");
		request.put("home_orders_user_ok",orders);
		return SUCCESS;
	}
	
	public void ordersFkstatus()throws Exception{
		HttpServletRequest re = ServletActionContext.getRequest();
		String ordersid_str = re.getParameter("ordersid");
		int ordersid = Integer.parseInt(ordersid_str);
		System.out.println("ok : "+ordersid);
		int state = ordershomeService.ordersFkstatus(ordersid);
	}
	
	public String ToPay()throws Exception{
		HttpServletRequest re = ServletActionContext.getRequest();
		int userid = Integer.parseInt(re.getParameter("userid"));
		int payid = Integer.parseInt(re.getParameter("payid"));
		System.out.println(userid+" 支付 "+payid);
		int state = ordershomeService.ToPay(payid);
		return SUCCESS;
	}
}
