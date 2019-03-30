package com.chenzi.admin.action;

import java.util.List;
import java.util.Map;

import com.chenzi.admin.service.IOrdersService;
import com.chenzi.admin.util.PagerOrders;
import com.chenzi.admin.vo.Orders;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class OrdersAction extends ActionSupport{
	private static final long serialVersionUID = 3702285027814147509L;
	private Orders orders;
	protected IOrdersService ordersService;
	
	protected Integer currentPage=1;
	private int ordersid;
	private String keyword;
	private int editorid;
	
	public Orders getOrders() {
		return orders;
	}

	public void setOrders(Orders orders) {
		this.orders = orders;
	}

	public IOrdersService getOrdersService() {
		return ordersService;
	}

	public void setOrdersService(IOrdersService ordersService) {
		this.ordersService = ordersService;
	}

	public Integer getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(Integer currentPage) {
		this.currentPage = currentPage;
	}

	public int getOrdersid() {
		return ordersid;
	}

	public void setOrdersid(int ordersid) {
		this.ordersid = ordersid;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public int getEditorid() {
		return editorid;
	}

	public void setEditorid(int editorid) {
		this.editorid = editorid;
	}

	// 类别管理列表分页
	public String ordersListPaging() throws Exception{
		System.out.println("当前页码："+currentPage);
		int totalSize = ordersService.getTotalOrders();
		PagerOrders pager = new PagerOrders(currentPage,totalSize);
		List orderss = ordersService.getOrdersPaging(currentPage, pager.getPageSize());
		Map request = (Map)ActionContext.getContext().get("request");
		request.put("orderss",orderss);
		request.put("pager",pager);
		System.out.println(orderss);
		return SUCCESS;
	}

	// 类别管理查询操作
	public String ordersQuery() throws Exception{
		System.out.println("当前页码："+currentPage);
		int totalSize = ordersService.getTotalOrdersBykeyword(keyword);
		PagerOrders pager = new PagerOrders(currentPage,totalSize);
		List orderss = ordersService.getOrdersPagingBykeyword(keyword,currentPage, pager.getPageSize());
		Map request = (Map)ActionContext.getContext().get("request");
		request.put("orderss",orderss);
		request.put("pager",pager);
		System.out.println(orderss);
		return SUCCESS;
	}

}
