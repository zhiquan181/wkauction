package com.chenzi.admin.action;

import java.util.List;
import java.util.Map;
import com.chenzi.admin.service.IAuserService;
import com.chenzi.admin.util.PagerAuser;
import com.chenzi.admin.vo.Auser;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class AdminAction extends ActionSupport{
	private static final long serialVersionUID = 6647355905852044083L;
	private Auser auser;
	protected IAuserService auserService;
	
	protected Integer currentPage=1;
	private int userid;
	private String keyword;
	
	private String checkCode;//从网页中获取的
	
	public Auser getAuser() {
		return auser;
	}

	public void setAuser(Auser auser) {
		this.auser = auser;
	}

	public IAuserService getAuserService() {
		return auserService;
	}

	public void setAuserService(IAuserService auserService) {
		this.auserService = auserService;
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
	
	public String getCheckCode() {
		return checkCode;
	}

	public void setCheckCode(String checkCode) {
		this.checkCode = checkCode;
	}
	


	
	// 系统管理员登录方法
	public String dologin() throws Exception{
		Map session=ActionContext.getContext().getSession();
		boolean pass= false;
		
		//System.out.println( auser.getUsername()+" "+auser.getPassword() );
		Auser u=auserService.validateAuser(auser.getUsername(), auser.getPassword());
		
		String checkCodetrue = (String)session.get("checkCode");
		//System.out.println("正确的的验证码："+checkCodetrue);
		//System.out.println("网页输入的验证码："+checkCode);
		
		if(checkCodetrue.equalsIgnoreCase(checkCode)){
			if(u!=null){
				session.put("auser_active", u);
				// System.out.println(u.getUsername()+" "+u.getPassword());
				
				pass=true;
				System.out.println(pass);
				
				return SUCCESS;
			}
			else{
				pass=false;
				System.out.println(pass);
				return ERROR;
			}
		}
		else{
			return ERROR;
		}
		
	}
	
	// 系统管理员登录注销方法
	public String dologout() throws Exception{
		Map session=ActionContext.getContext().getSession();
		session.remove("auser_active");
		//session.clear();
		return SUCCESS;
	}
	
	// 系统管理员跳转登录页面
	public String adminRedirect() throws Exception{
		return SUCCESS;
	}
	
	// 系统管理员登陆成功跳转页面
	public String adminManager() throws Exception{
		return SUCCESS;
	}

	// 系统管理员列表分页
	public String auserListPaging() throws Exception{
		System.out.println("当前页码："+currentPage);
		int totalSize = auserService.getTotalAuser();
		PagerAuser pager = new PagerAuser(currentPage,totalSize);
		List ausers = auserService.getAuserPaging(currentPage, pager.getPageSize());
		Map request = (Map)ActionContext.getContext().get("request");
		request.put("ausers",ausers);
		request.put("pager",pager);
		System.out.println(ausers);
		return SUCCESS;
	}
	
	// 系统管理员新增编辑操作
	public String auserInsertEdit() throws Exception{
		return SUCCESS;
	}
	
	// 系统管理员新增操作
	public String auserInsert() throws Exception{
		int state = auserService.auserInsert(auser);
		System.out.println(state);
		if(state>0){
			return SUCCESS;
		}
		return ERROR;
	}
	
	// 系统管理员删除操作
	public String auserDelete() throws Exception{
		int state = auserService.auserDelete(this.userid);
		if(state>0){
			return SUCCESS;
		}
		return ERROR;
	}
	
	// 系统管理员修改编辑操作
	public String auserUpdateEdit() throws Exception{
		Auser au=auserService.auserUpdateEdit(this.userid);
		if(au!=null){
			Map session=ActionContext.getContext().getSession();
			session.put("auser_update", au);
			return SUCCESS;
		}
		return ERROR;
	}
	
	// 系统管理员修改操作
	public String auserUpdate() throws Exception{
		int state = auserService.auserUpdate(auser);
		System.out.println(state);
		if(state>0){
			return SUCCESS;
		}
		return ERROR;
	}
	
	// 系统管理员查询操作
	public String auserQuery() throws Exception{
		System.out.println("当前页码："+currentPage);
		int totalSize = auserService.getTotalAuserBykeyword(keyword);
		PagerAuser pager = new PagerAuser(currentPage,totalSize);
		List ausers = auserService.getAuserPagingBykeyword(keyword,currentPage, pager.getPageSize());
		Map request = (Map)ActionContext.getContext().get("request");
		request.put("ausers",ausers);
		request.put("pager",pager);
		System.out.println(ausers);
		return SUCCESS;
	}

}
