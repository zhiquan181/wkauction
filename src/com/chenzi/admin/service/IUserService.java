package com.chenzi.admin.service;

import java.util.List;
import com.chenzi.admin.vo.User;
public interface IUserService {	
	public int getTotalUser();
	public List getUserPaging(Integer currentPage, int pageSize);
	
	public int userInsert(User user);
	
	public int userDelete(int userid);

	public User userUpdateEdit(int userid);

	public int userUpdate(User user);
	
	public int getTotalUserBykeyword(String keyword);
	public List getUserPagingBykeyword(String keyword, Integer currentPage,int pageSize);
	
}
