package com.chenzi.home.service.impl;

import java.util.List;

import com.chenzi.home.dao.ICatalogDAO;
import com.chenzi.home.service.ICatalogService;

public class CatalogService implements ICatalogService{
	private ICatalogDAO cataloghomeDAO;

	public ICatalogDAO getCataloghomeDAO() {
		return cataloghomeDAO;
	}

	public void setCataloghomeDAO(ICatalogDAO cataloghomeDAO) {
		this.cataloghomeDAO = cataloghomeDAO;
	}

	@Override
	public List getLimitCatalog() {
		return cataloghomeDAO.getLimitCatalog();
	}

}
