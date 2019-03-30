package com.chenzi.home.action;

import java.util.List;
import java.util.Map;
import com.chenzi.admin.vo.Catalog;
import com.chenzi.home.service.ICatalogService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class CatalogAction extends ActionSupport{
	private static final long serialVersionUID = 1L;
	private int catalogid;
	protected ICatalogService cataloghomeService;
	
	public int getCatalogid() {
		return catalogid;
	}

	public void setCatalogid(int catalogid) {
		this.catalogid = catalogid;
	}
	
	public ICatalogService getCataloghomeService() {
		return cataloghomeService;
	}	

	public void setCataloghomeService(ICatalogService cataloghomeService) {
		this.cataloghomeService = cataloghomeService;
	}

	// 首页遍历显示限制50个分类栏目
	public String catalogInfo() throws Exception{
		List catalogs = cataloghomeService.getLimitCatalog();
		Map request = (Map)ActionContext.getContext().get("request");
		request.put("home_catalogs",catalogs);
		return SUCCESS;
	}
	
	// 首页遍历显示限制50个分类栏目
	public String catalogSelect() throws Exception{
		List catalogs = cataloghomeService.getLimitCatalog();
		Map request = (Map)ActionContext.getContext().get("request");
		request.put("home_catalogs",catalogs);
		return SUCCESS;
	}
}
