package com.chenzi.admin.dao;

import java.util.List;
import com.chenzi.admin.vo.*;
public interface ILinkDAO {	
	public int getTotalLink();
	public List getLinkPaging(Integer currentPage, int pageSize);	

	public int linkInsert(Link link,int editorid);
	
	public int linkDelete(int linkid);
	
	public Link linkUpdateEdit(int linkid);

	public int linkUpdate(Link link,int editorid);

	public int getTotalLinkBykeyword(String keyword);
	public List getLinkPagingBykeyword(String keyword, Integer currentPage,int pageSize);
	
}