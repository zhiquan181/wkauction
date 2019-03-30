package com.chenzi.admin.service.impl;

import java.util.List;
import com.chenzi.admin.dao.IGoodsDAO;
import com.chenzi.admin.service.IGoodsService;
import com.chenzi.admin.vo.Goods;

public class GoodsService implements IGoodsService {
	private IGoodsDAO goodsDAO;
	
	public IGoodsDAO getGoodsDAO() {
		return goodsDAO;
	}
	public void setGoodsDAO(IGoodsDAO goodsDAO) {
		this.goodsDAO = goodsDAO;
	}
	
	@Override
	public int getTotalGoods() {
		return goodsDAO.getTotalGoods();
	}
	
	@Override
	public List getGoodsPaging(Integer currentPage, int pageSize) {
		return goodsDAO.getGoodsPaging(currentPage, pageSize);
	}
	
	@Override
	public int getTotalGoodsBykeyword(String keyword) {
		return goodsDAO.getTotalGoodsBykeyword(keyword);
	}
	
	@Override
	public List getGoodsPagingBykeyword(String keyword, Integer currentPage,int pageSize) {
		return goodsDAO.getGoodsPagingBykeyword(keyword,currentPage,pageSize);
	}
		

	
	
	

}
