package com.chenzi.home.dao;

import java.util.List;

import com.chenzi.admin.vo.Goods;
import com.chenzi.admin.vo.User;

public interface IUserDAO {
	public List getLimitUser();
	
	public int userInsert(User user);
	
	public User validateUser(String username,String password);

	public User getUserByuserid(int userid);
	
	public int userUpdate(User user);
	
	public int getTotalUser();
	public List getUserPaging(Integer currentPage, int pageSize);	
	
	public int userUpdateImg(User user);
	
	public String getUserheadimgByuserid(Integer userid);

	public int productInsert(User u, Goods goods);

	public List getGoodsinfoByuserid(int userid);

	public Goods getGoodBygoodid(int goodid);

	public List getLimitproducts();

	public int getTotalGoods(String keyword,String typename);
	public List getTotalGoodsPaging(Integer currentPage,String keyword,String typename,int pageSize);
}
