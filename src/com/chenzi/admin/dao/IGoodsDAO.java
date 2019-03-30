package com.chenzi.admin.dao;

import java.util.List;
import com.chenzi.admin.vo.*;
public interface IGoodsDAO {	
	public int getTotalGoods();
	public List getGoodsPaging(Integer currentPage, int pageSize);	

	public int getTotalGoodsBykeyword(String keyword);
	public List getGoodsPagingBykeyword(String keyword, Integer currentPage,int pageSize);
	
}