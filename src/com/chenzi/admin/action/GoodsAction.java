package com.chenzi.admin.action;

import java.util.List;
import java.util.Map;

import com.chenzi.admin.service.IGoodsService;
import com.chenzi.admin.util.PagerGoods;
import com.chenzi.admin.vo.Goods;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class GoodsAction extends ActionSupport{
	private static final long serialVersionUID = 3702285027814147509L;
	private Goods goods;
	protected IGoodsService goodsService;
	
	protected Integer currentPage=1;
	private int goodsid;
	private String keyword;
	private int editorid;
	
	public Goods getGoods() {
		return goods;
	}

	public void setGoods(Goods goods) {
		this.goods = goods;
	}

	public IGoodsService getGoodsService() {
		return goodsService;
	}

	public void setGoodsService(IGoodsService goodsService) {
		this.goodsService = goodsService;
	}

	public Integer getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(Integer currentPage) {
		this.currentPage = currentPage;
	}

	public int getGoodsid() {
		return goodsid;
	}

	public void setGoodsid(int goodsid) {
		this.goodsid = goodsid;
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
	public String goodsListPaging() throws Exception{
		System.out.println("当前页码："+currentPage);
		int totalSize = goodsService.getTotalGoods();
		PagerGoods pager = new PagerGoods(currentPage,totalSize);
		List goodss = goodsService.getGoodsPaging(currentPage, pager.getPageSize());
		Map request = (Map)ActionContext.getContext().get("request");
		request.put("goodss",goodss);
		request.put("pager",pager);
		System.out.println(goodss);
		return SUCCESS;
	}

	// 类别管理查询操作
	public String goodsQuery() throws Exception{
		System.out.println("当前页码："+currentPage);
		int totalSize = goodsService.getTotalGoodsBykeyword(keyword);
		PagerGoods pager = new PagerGoods(currentPage,totalSize);
		List goodss = goodsService.getGoodsPagingBykeyword(keyword,currentPage, pager.getPageSize());
		Map request = (Map)ActionContext.getContext().get("request");
		request.put("goodss",goodss);
		request.put("pager",pager);
		System.out.println(goodss);
		return SUCCESS;
	}

}
