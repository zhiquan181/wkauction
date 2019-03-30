package com.chenzi.admin.action;

import java.util.List;
import java.util.Map;

import com.chenzi.admin.service.ICatalogService;
import com.chenzi.admin.util.PagerCatalog;
import com.chenzi.admin.vo.Catalog;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class CatalogAction extends ActionSupport{
	private static final long serialVersionUID = 3702285027814147509L;
	private Catalog catalog;
	protected ICatalogService catalogService;
	
	protected Integer currentPage=1;
	private int catalogid;
	private String keyword;
	private int editorid;
	
	public Catalog getCatalog() {
		return catalog;
	}

	public void setCatalog(Catalog catalog) {
		this.catalog = catalog;
	}

	public ICatalogService getCatalogService() {
		return catalogService;
	}

	public void setCatalogService(ICatalogService catalogService) {
		this.catalogService = catalogService;
	}

	public Integer getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(Integer currentPage) {
		this.currentPage = currentPage;
	}

	public int getCatalogid() {
		return catalogid;
	}

	public void setCatalogid(int catalogid) {
		this.catalogid = catalogid;
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
	public String catalogListPaging() throws Exception{
		System.out.println("当前页码："+currentPage);
		int totalSize = catalogService.getTotalCatalog();
		PagerCatalog pager = new PagerCatalog(currentPage,totalSize);
		List catalogs = catalogService.getCatalogPaging(currentPage, pager.getPageSize());
		Map request = (Map)ActionContext.getContext().get("request");
		request.put("catalogs",catalogs);
		request.put("pager",pager);
		System.out.println(catalogs);
		return SUCCESS;
	}
	
	// 类别管理新增编辑操作
	public String catalogInsertEdit() throws Exception{
		return SUCCESS;
	}
	
	// 类别管理新增操作
	public String catalogInsert() throws Exception{
		int state = catalogService.catalogInsert(catalog);
		if(state>0){
			return SUCCESS;
		}
		return ERROR;
	}
	
	// 类别管理删除操作
	public String catalogDelete() throws Exception{
		int state = catalogService.catalogDelete(this.catalogid);
		if(state>0){
			return SUCCESS;
		}
		return ERROR;
	}
	
	// 类别管理修改编辑操作
	public String catalogUpdateEdit() throws Exception{
		Catalog au=catalogService.catalogUpdateEdit(this.catalogid);
		if(au!=null){
			Map session=ActionContext.getContext().getSession();
			session.put("catalog_update", au);
			return SUCCESS;
		}
		return ERROR;
	}
	
	// 类别管理修改操作
	public String catalogUpdate() throws Exception{
		int state = catalogService.catalogUpdate(catalog);
		System.out.println(state);
		if(state>0){
			return SUCCESS;
		}
		return ERROR;
	}
	
	// 类别管理查询操作
	public String catalogQuery() throws Exception{
		System.out.println("当前页码："+currentPage);
		int totalSize = catalogService.getTotalCatalogBykeyword(keyword);
		PagerCatalog pager = new PagerCatalog(currentPage,totalSize);
		List catalogs = catalogService.getCatalogPagingBykeyword(keyword,currentPage, pager.getPageSize());
		Map request = (Map)ActionContext.getContext().get("request");
		request.put("catalogs",catalogs);
		request.put("pager",pager);
		System.out.println(catalogs);
		return SUCCESS;
	}

}
