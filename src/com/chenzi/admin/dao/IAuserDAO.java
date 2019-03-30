package com.chenzi.admin.dao;

import java.util.List;
import com.chenzi.admin.vo.*;
public interface IAuserDAO {
	public Auser validateAuser(String username,String password);
	
	public int getTotalAuser();
	public List getAuserPaging(Integer currentPage, int pageSize);	

	public int auserInsert(Auser auser);
	
	public int auserDelete(int userid);
	
	public Auser auserUpdateEdit(int userid);

	public int auserUpdate(Auser auser);

	public int getTotalAuserBykeyword(String keyword);
	public List getAuserPagingBykeyword(String keyword, Integer currentPage,int pageSize);
	
}