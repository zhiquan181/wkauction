package com.chenzi.admin.service;

import java.util.List;
import com.chenzi.admin.vo.Article;
public interface IArticleService {	
	public int getTotalArticle();
	public List getArticlePaging(Integer currentPage, int pageSize);	

	public int articleInsert(Article article,int editorid);
	
	public int articleDelete(int articleid);
	
	public Article articleUpdateEdit(int articleid);

	public int articleUpdate(Article article,int editorid);

	public int getTotalArticleBykeyword(String keyword);
	public List getArticlePagingBykeyword(String keyword, Integer currentPage,int pageSize);
	
}
