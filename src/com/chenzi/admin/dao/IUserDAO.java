package com.chenzi.admin.dao;

import java.util.List;
import com.chenzi.admin.vo.*;
public interface IUserDAO {	
	public int getTotalUser();
	public List getUserPaging(Integer currentPage, int pageSize);	

	public int userInsert(User user);
	
	public int userDelete(int userid);
	
	public User userUpdateEdit(int userid);

	public int userUpdate(User user);

	public int getTotalUserBykeyword(String keyword);
	public List getUserPagingBykeyword(String keyword, Integer currentPage,int pageSize);
	
}