package com.chenzi.admin.service;

import java.util.List;
import com.chenzi.admin.vo.Catalog;
public interface ICatalogService {	
	public int getTotalCatalog();
	public List getCatalogPaging(Integer currentPage, int pageSize);	

	public int catalogInsert(Catalog catalog);
	
	public int catalogDelete(int catalogid);
	
	public Catalog catalogUpdateEdit(int catalogid);

	public int catalogUpdate(Catalog catalog);

	public int getTotalCatalogBykeyword(String keyword);
	public List getCatalogPagingBykeyword(String keyword, Integer currentPage,int pageSize);
	
}
