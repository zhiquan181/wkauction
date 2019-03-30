package com.chenzi.admin.action;

import java.util.List;
import java.util.Map;

import com.chenzi.admin.service.IUserService;
import com.chenzi.admin.util.PagerUser;
import com.chenzi.admin.vo.User;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class UserAction extends ActionSupport{
	private static final long serialVersionUID = 1L;
	private User user;
	protected IUserService userService;
	
	protected Integer currentPage=1;
	private int userid;
	private String keyword;
	
	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public IUserService getUserService() {
		return userService;
	}

	public void setUserService(IUserService userService) {
		this.userService = userService;
	}

	public Integer getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(Integer currentPage) {
		this.currentPage = currentPage;
	}

	public int getUserid() {
		return userid;
	}

	public void setUserid(int userid) {
		this.userid = userid;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	// 会员列表分页
	public String userListPaging() throws Exception{
		System.out.println("当前页码："+currentPage);
		int totalSize = userService.getTotalUser();
		PagerUser pager = new PagerUser(currentPage,totalSize);
		List users = userService.getUserPaging(currentPage, pager.getPageSize());
		Map request = (Map)ActionContext.getContext().get("request");
		request.put("users",users);
		request.put("pager",pager);
		System.out.println(users);
		return SUCCESS;
	}
	
	// 会员新增编辑操作
	public String userInsertEdit() throws Exception{
		return SUCCESS;
	}
	
	// 会员新增操作
	public String userInsert() throws Exception{
		int state = userService.userInsert(user);
		if(state>0){
			return SUCCESS;
		}
		return ERROR;
	}
	
	// 会员删除操作
	public String userDelete() throws Exception{
		int state = userService.userDelete(this.userid);
		if(state>0){
			return SUCCESS;
		}
		return ERROR;
	}
	
	// 会员修改编辑操作
	public String userUpdateEdit() throws Exception{
		User au=userService.userUpdateEdit(this.userid);
		if(au!=null){
			Map session=ActionContext.getContext().getSession();
			session.put("user_update", au);
			return SUCCESS;
		}
		return ERROR;
	}
	
	// 会员修改操作
	public String userUpdate() throws Exception{
		int state = userService.userUpdate(user);
		System.out.println(state);
		if(state>0){
			return SUCCESS;
		}
		return ERROR;
	}
	
	// 会员查询操作
	public String userQuery() throws Exception{
		System.out.println("当前页码："+currentPage);
		int totalSize = userService.getTotalUserBykeyword(keyword);
		PagerUser pager = new PagerUser(currentPage,totalSize);
		List users = userService.getUserPagingBykeyword(keyword,currentPage, pager.getPageSize());
		Map request = (Map)ActionContext.getContext().get("request");
		request.put("users",users);
		request.put("pager",pager);
		System.out.println(users);
		return SUCCESS;
	}

}
