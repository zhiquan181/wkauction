package com.chenzi.home.service.impl;

import java.util.List;

import com.chenzi.admin.vo.Goods;
import com.chenzi.admin.vo.User;
import com.chenzi.home.dao.IUserDAO;
import com.chenzi.home.service.IUserService;

public class UserService implements IUserService{
	private IUserDAO userhomeDAO;

	public IUserDAO getUserhomeDAO() {
		return userhomeDAO;
	}

	public void setUserhomeDAO(IUserDAO userhomeDAO) {
		this.userhomeDAO = userhomeDAO;
	}

	@Override
	public List getLimitUser() {
		return userhomeDAO.getLimitUser();
	}

	@Override
	public int userInsert(User user) {
		return userhomeDAO.userInsert(user);
	}

	@Override
	public User validateUser(String username,String password) {
		return userhomeDAO.validateUser(username,password);
	}

	@Override
	public User getUserByuserid(int userid) {
		return userhomeDAO.getUserByuserid(userid);
	}

	@Override
	public int userUpdate(User user) {
		return userhomeDAO.userUpdate(user);
	}

	@Override
	public int getTotalUser() {
		return userhomeDAO.getTotalUser();
	}

	@Override
	public List getUserPaging(Integer currentPage, int pageSize) {
		return userhomeDAO.getUserPaging(currentPage, pageSize);
	}

	@Override
	public int userUpdateImg(User user) {
		return userhomeDAO.userUpdateImg(user);
	}

	@Override
	public String getUserheadimgByuserid(Integer userid) {
		return userhomeDAO.getUserheadimgByuserid(userid);
	}

	@Override
	public int productInsert(User u, Goods goods) {
		return userhomeDAO.productInsert(u,goods);
	}

	@Override
	public List getGoodsinfoByuserid(int userid) {
		return userhomeDAO.getGoodsinfoByuserid(userid);
	}

	@Override
	public Goods getGoodBygoodid(int goodid) {
		return userhomeDAO.getGoodBygoodid(goodid);
	}

	@Override
	public List getLimitproducts() {
		return userhomeDAO.getLimitproducts();
	}

	@Override
	public int getTotalGoods(String keyword,String typename) {
		return userhomeDAO.getTotalGoods(keyword,typename);
	}

	@Override
	public List getTotalGoodsPaging(Integer currentPage,String keyword,String typename,int pageSize) {
		return userhomeDAO.getTotalGoodsPaging(currentPage,keyword,typename,pageSize);
	}

}
