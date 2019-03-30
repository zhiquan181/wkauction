package com.chenzi.admin.service.impl;

import java.util.List;
import com.chenzi.admin.dao.IUserDAO;
import com.chenzi.admin.service.IUserService;
import com.chenzi.admin.vo.User;

public class UserService implements IUserService {
	private IUserDAO userDAO;
	
	public IUserDAO getUserDAO() {
		return userDAO;
	}
	public void setUserDAO(IUserDAO userDAO) {
		this.userDAO = userDAO;
	}
	
	@Override
	public int getTotalUser() {
		return userDAO.getTotalUser();
	}
	
	@Override
	public List getUserPaging(Integer currentPage, int pageSize) {
		return userDAO.getUserPaging(currentPage, pageSize);
	}
	
	@Override
	public int userInsert(User user) {
		return userDAO.userInsert(user);
	}
	
	@Override
	public int userDelete(int userid) {
		return userDAO.userDelete(userid);
	}
	
	@Override
	public User userUpdateEdit(int userid) {
		return userDAO.userUpdateEdit(userid);
	}
	
	@Override
	public int userUpdate(User user) {
		return userDAO.userUpdate(user);
	}
	
	@Override
	public int getTotalUserBykeyword(String keyword) {
		return userDAO.getTotalUserBykeyword(keyword);
	}
	
	@Override
	public List getUserPagingBykeyword(String keyword, Integer currentPage,int pageSize) {
		return userDAO.getUserPagingBykeyword(keyword,currentPage,pageSize);
	}
		

	
	
	

}
