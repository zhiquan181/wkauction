package com.chenzi.admin.service.impl;

import java.util.List;
import com.chenzi.admin.dao.IAuserDAO;
import com.chenzi.admin.service.IAuserService;
import com.chenzi.admin.vo.Auser;
import com.chenzi.admin.vo.Link;

public class AuserService implements IAuserService {
	private IAuserDAO auserDAO;
	
	public IAuserDAO getAuserDAO() {
		return auserDAO;
	}
	public void setAuserDAO(IAuserDAO auserDAO) {
		this.auserDAO = auserDAO;
	}
	public Auser validateAuser(String username, String password) {
		return auserDAO.validateAuser(username, password);
	}
	
	@Override
	public int getTotalAuser() {
		return auserDAO.getTotalAuser();
	}
	
	@Override
	public List getAuserPaging(Integer currentPage, int pageSize) {
		return auserDAO.getAuserPaging(currentPage, pageSize);
	}
	
	@Override
	public int auserInsert(Auser auser) {
		return auserDAO.auserInsert(auser);
	}
	
	@Override
	public int auserDelete(int userid) {
		return auserDAO.auserDelete(userid);
	}
	
	@Override
	public Auser auserUpdateEdit(int userid) {
		return auserDAO.auserUpdateEdit(userid);
	}
	
	@Override
	public int auserUpdate(Auser auser) {
		return auserDAO.auserUpdate(auser);
	}
	@Override
	public int getTotalAuserBykeyword(String keyword) {
		return auserDAO.getTotalAuserBykeyword(keyword);
	}
	
	@Override
	public List getAuserPagingBykeyword(String keyword, Integer currentPage,int pageSize) {
		return auserDAO.getAuserPagingBykeyword(keyword,currentPage,pageSize);
	}
		

	
	
	

}
