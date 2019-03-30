package com.chenzi.admin.service.impl;

import java.util.List;
import com.chenzi.admin.dao.ICatalogDAO;
import com.chenzi.admin.service.ICatalogService;
import com.chenzi.admin.vo.Catalog;

public class CatalogService implements ICatalogService {
	private ICatalogDAO catalogDAO;
	
	public ICatalogDAO getCatalogDAO() {
		return catalogDAO;
	}
	public void setCatalogDAO(ICatalogDAO catalogDAO) {
		this.catalogDAO = catalogDAO;
	}
	
	@Override
	public int getTotalCatalog() {
		return catalogDAO.getTotalCatalog();
	}
	
	@Override
	public List getCatalogPaging(Integer currentPage, int pageSize) {
		return catalogDAO.getCatalogPaging(currentPage, pageSize);
	}
	
	@Override
	public int catalogInsert(Catalog catalog) {
		return catalogDAO.catalogInsert(catalog);
	}
	
	@Override
	public int catalogDelete(int catalogid) {
		return catalogDAO.catalogDelete(catalogid);
	}
	
	@Override
	public Catalog catalogUpdateEdit(int catalogid) {
		return catalogDAO.catalogUpdateEdit(catalogid);
	}
	
	@Override
	public int catalogUpdate(Catalog catalog) {
		return catalogDAO.catalogUpdate(catalog);
	}
	
	@Override
	public int getTotalCatalogBykeyword(String keyword) {
		return catalogDAO.getTotalCatalogBykeyword(keyword);
	}
	
	@Override
	public List getCatalogPagingBykeyword(String keyword, Integer currentPage,int pageSize) {
		return catalogDAO.getCatalogPagingBykeyword(keyword,currentPage,pageSize);
	}
		

	
	
	

}
