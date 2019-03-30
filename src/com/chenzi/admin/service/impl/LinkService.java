package com.chenzi.admin.service.impl;

import java.util.List;
import com.chenzi.admin.dao.ILinkDAO;
import com.chenzi.admin.service.ILinkService;
import com.chenzi.admin.vo.Auser;
import com.chenzi.admin.vo.Link;

public class LinkService implements ILinkService {
	private ILinkDAO linkDAO;
	
	public ILinkDAO getLinkDAO() {
		return linkDAO;
	}
	public void setLinkDAO(ILinkDAO linkDAO) {
		this.linkDAO = linkDAO;
	}
	
	@Override
	public int getTotalLink() {
		return linkDAO.getTotalLink();
	}
	
	@Override
	public List getLinkPaging(Integer currentPage, int pageSize) {
		return linkDAO.getLinkPaging(currentPage, pageSize);
	}
	
	@Override
	public int linkInsert(Link link,int editorid) {
		return linkDAO.linkInsert(link,editorid);
	}
	
	@Override
	public int linkDelete(int linkid) {
		return linkDAO.linkDelete(linkid);
	}
	
	@Override
	public Link linkUpdateEdit(int linkid) {
		return linkDAO.linkUpdateEdit(linkid);
	}
	
	@Override
	public int linkUpdate(Link link,int editorid) {
		return linkDAO.linkUpdate(link,editorid);
	}
	
	@Override
	public int getTotalLinkBykeyword(String keyword) {
		return linkDAO.getTotalLinkBykeyword(keyword);
	}
	
	@Override
	public List getLinkPagingBykeyword(String keyword, Integer currentPage,int pageSize) {
		return linkDAO.getLinkPagingBykeyword(keyword,currentPage,pageSize);
	}
		

	
	
	

}
