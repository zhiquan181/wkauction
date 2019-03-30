package com.chenzi.admin.dao;

import java.util.List;
import com.chenzi.admin.vo.*;
public interface ICatalogDAO {	
	public int getTotalCatalog();
	public List getCatalogPaging(Integer currentPage, int pageSize);	

	public int catalogInsert(Catalog catalog);
	
	public int catalogDelete(int id);
	
	public Catalog catalogUpdateEdit(int id);

	public int catalogUpdate(Catalog catalog);

	public int getTotalCatalogBykeyword(String keyword);
	public List getCatalogPagingBykeyword(String keyword, Integer currentPage,int pageSize);
	
}