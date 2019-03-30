package com.chenzi.admin.service;

import java.util.List;
import com.chenzi.admin.vo.Goods;
public interface IGoodsService {	
	public int getTotalGoods();
	public List getGoodsPaging(Integer currentPage, int pageSize);	

	public int getTotalGoodsBykeyword(String keyword);
	public List getGoodsPagingBykeyword(String keyword, Integer currentPage,int pageSize);
	
}
