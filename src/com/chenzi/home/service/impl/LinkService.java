package com.chenzi.home.service.impl;

import java.util.List;

import com.chenzi.home.dao.ILinkDAO;
import com.chenzi.home.service.ILinkService;

public class LinkService implements ILinkService{
	private ILinkDAO linkhomeDAO;

	public ILinkDAO getLinkhomeDAO() {
		return linkhomeDAO;
	}

	public void setLinkhomeDAO(ILinkDAO linkhomeDAO) {
		this.linkhomeDAO = linkhomeDAO;
	}

	@Override
	public List getLimitLink() {
		return linkhomeDAO.getLimitLink();
	}

}
