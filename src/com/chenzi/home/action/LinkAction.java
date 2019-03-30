package com.chenzi.home.action;

import java.util.List;
import java.util.Map;
import com.chenzi.admin.vo.Link;
import com.chenzi.home.service.ILinkService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class LinkAction extends ActionSupport{
	private static final long serialVersionUID = 1L;
	private int linkid;
	protected ILinkService linkhomeService;
	
	public int getLinkid() {
		return linkid;
	}

	public void setLinkid(int linkid) {
		this.linkid = linkid;
	}
	
	public ILinkService getLinkhomeService() {
		return linkhomeService;
	}	

	public void setLinkhomeService(ILinkService linkhomeService) {
		this.linkhomeService = linkhomeService;
	}

	// 首页遍历显示限制10个新闻资讯
	public String linkInfo() throws Exception{
		List links = linkhomeService.getLimitLink();
		Map request = (Map)ActionContext.getContext().get("request");
		request.put("home_links",links);
		return SUCCESS;
	}
}
