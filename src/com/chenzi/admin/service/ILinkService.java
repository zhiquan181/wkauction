package com.chenzi.admin.service;

import java.util.List;
import com.chenzi.admin.vo.Link;
public interface ILinkService {	
	public int getTotalLink();
	public List getLinkPaging(Integer currentPage, int pageSize);
	
	public int linkInsert(Link link,int editorid);
	
	public int linkDelete(int linkid);

	public Link linkUpdateEdit(int linkid);

	public int linkUpdate(Link link,int editorid);
	
	public int getTotalLinkBykeyword(String keyword);
	public List getLinkPagingBykeyword(String keyword, Integer currentPage,int pageSize);
	
}
