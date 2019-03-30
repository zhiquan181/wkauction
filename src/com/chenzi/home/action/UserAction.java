package com.chenzi.home.action;


import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletResponse;



import net.sf.json.JSONObject;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;

import com.chenzi.home.service.IUserService;
import com.chenzi.admin.util.PagerArticle;
import com.chenzi.admin.vo.Article;
import com.chenzi.admin.vo.Goods;
import com.chenzi.admin.vo.User;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class UserAction extends ActionSupport{
	private static final long serialVersionUID = 1L;
	private User user;
	private int userid;
	protected IUserService userhomeService;
	protected Integer currentPage=1;
	private String keyword=null;
	private String typename;
	private Goods goods;
	private int goodid;
	

	
	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public int getId() {
		return userid;
	}

	public void setUserid(int userid) {
		this.userid = userid;
	}

	public IUserService getUserhomeService() {
		return userhomeService;
	}

	public void setUserhomeService(IUserService userhomeService) {
		this.userhomeService = userhomeService;
	}

	public Integer getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(Integer currentPage) {
		this.currentPage = currentPage;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	
	public void setTypename(String typename){
		this.typename = typename;
	}
	
	public String getTypename(){
		return typename;
	}
	
	public Goods getGoods() {
		return goods;
	}

	public void setGoods(Goods goods) {
		this.goods = goods;
	}
	
	public void setGoodid(int goodid){
		this.goodid = goodid;
	}

	public int getGooid(){
		return goodid;
	}
	
	
	// 跳转网站首页
	public String homeRedirect() throws Exception{
		return SUCCESS;
	}
	
	// 跳转登录页面
	public String loginRedirect() throws Exception{
		return SUCCESS;
	}
	
	// 首页遍历显示限制16个会员
	public String userInfo() throws Exception{
		List users = userhomeService.getLimitUser();
		Map request = (Map)ActionContext.getContext().get("request");
		request.put("home_users",users);
		return SUCCESS;
	}
	
	// 浏览
	public String browseUser() throws Exception{
		User u = userhomeService.getUserByuserid(userid);
		if(u!=null){
			Map request = (Map)ActionContext.getContext().get("request");
			request.put("home_user_detail",u);
			return SUCCESS;
		}
		return ERROR;
	}
	
	// 会员注册
	public String userRegester() throws Exception{
		int state = userhomeService.userInsert(user);
		if(state>0){
			return SUCCESS;
		}
		return ERROR;
	}
	
	// 会员登录
	public String userLogin() throws Exception{
		User u=userhomeService.validateUser(user.getUsername(), user.getPassword());
		if(u!=null){
			Map session=ActionContext.getContext().getSession();
			session.put("moko_user", u);
			//System.out.println(u.getUsername()+" "+u.getPassword());
			return SUCCESS;
		}
		return ERROR;
	}
	
	// 会员登录注销
	public String userLoginOut() throws Exception{
		Map session=ActionContext.getContext().getSession();
		session.remove("moko_user");
		session.remove("moko_user_headimg");
		//session.clear();
		return SUCCESS;
	}
	
	// 会员个人中心，根据session存不存在会员来获得用户资料
	public String userCenter() throws Exception{
		return SUCCESS;
	}
	
	// 会员修改个人资料编辑
	public String userUpdateHomeEdit() throws Exception{
		return SUCCESS;
	}
	
	// 会员修改个人资料
	public String userUpdateHome() throws Exception{
		Map session=ActionContext.getContext().getSession();
		session.remove("moko_user");
		//session.clear();
		User u = userhomeService.getUserByuserid(user.getId());
		if(u!=null){
			int state = userhomeService.userUpdate(user);
			// System.out.println(state);
			if(state>0){
				return SUCCESS;
			}
		}
		return ERROR;
	}
	
	// 会员修改个人头像编辑
	public String userUpdateHeadImgEdit() throws Exception{
		return SUCCESS;
	}
	
	// 会员修改个人头像
	public String userUpdateHeadImg() throws Exception{
		//System.out.println("修改用户头像："+user.getId()+" "+user.getPicture());
		User u = userhomeService.getUserByuserid(user.getId());
		Map session=ActionContext.getContext().getSession();
		
		if(u!=null){
			int state = userhomeService.userUpdateImg(user);
			// System.out.println(state);
			if(state>0){
				String headimg_str = userhomeService.getUserheadimgByuserid(user.getId());
				session.put("moko_user_headimg", headimg_str);
				return SUCCESS;
			}
		}
		session.put("moko_user_headimg", "");
		return ERROR;
	}

	
/***********************************************************************************/
	private File uploadImage;//得到上传的文件
	private String uploadImageContentType;//得到文件的类型
	private String uploadImageFileName;//得到文件的名称
	private String res;//用来返回json字符串的
	//下面节省了set和get方法，记得自行添加。
	public File getUploadImage() {
		return uploadImage;
	}

	public void setUploadImage(File uploadImage) {
		this.uploadImage = uploadImage;
	}

	public String getUploadImageContentType() {
		return uploadImageContentType;
	}

	public void setUploadImageContentType(String uploadImageContentType) {
		this.uploadImageContentType = uploadImageContentType;
	}

	public String getUploadImageFileName() {
		return uploadImageFileName;
	}

	public void setUploadImageFileName(String uploadImageFileName) {
		this.uploadImageFileName = uploadImageFileName;
	}

	public String getRes() {
		return res;
	}

	public void setRes(String res) {
		this.res = res;
	}
	
	//图片上传和显示图片
	public String postPhoto() throws Exception {
	    Map<String, String> photoData=new HashMap<String, String>();
	    /*
         * ServletActionContext.getServletContext().getRealPath("/")
         * 是当前【程序】在磁盘中的位置，
         * 如：D:\apache-tomcat-7.0.81\webapps\wkmoko
         */
	    
	    //把文件保存到服务器的路径
	    String realpath = ServletActionContext.getServletContext().getRealPath("/images/" );
	    File file = new File(realpath);
	    
	    // 没有此文件夹就创建
	    if (!file.exists())file.mkdirs();
	    	try {
	    		//使用uuid随机字符串
	    		String uuidStr = UUID.randomUUID().toString();
	    		//除去uuid字符串的-字符
		        String uuid = uuidStr.substring(0, 8) + uuidStr.substring(9, 13) + uuidStr.substring(14, 18) + uuidStr.substring(19, 23) + uuidStr.substring(24);
		        //从文件名称的后缀名.结束（如：hello.jpg=>把hello去掉,留下.jpg）
		        int beginIndex = uploadImageFileName.lastIndexOf(".");
		        uploadImageFileName = uuid+uploadImageFileName.substring(beginIndex);
		        
		        //复制上传的文件到服务器
		        FileUtils.copyFile(uploadImage, new File(file, uploadImageFileName));
		        
		        //把图片数据存在Map对象photoData中，用于返回前台的ajax数值
		        photoData.put("name",uploadImageFileName);
		        photoData.put("path","images"+"/"+uploadImageFileName);
		        //将要返回的map对象进行json处理
		        JSONObject jo = JSONObject.fromObject(photoData);
	 
		        //调用json对象的toString方法转换为字符串然后赋值给result
		        this.res = jo.toString();
		        //System.out.println(this.res);
	 
		        //返回字符串到前台，设置响应的内容类型
		        HttpServletResponse response=ServletActionContext.getResponse();
	            response.setContentType("text/html;charset=utf-8");
	            PrintWriter pw=response.getWriter();
	            pw.write(this.res);
	            pw.flush();
	            pw.close();
	    	}
	    	catch (IOException e) {
	    		e.printStackTrace();
	    	}
	    
	    //记得这里返回null，留意下面Struts.xml文件的怎么配置
	    return null;
	}
	
	//图片上传和显示图片
	public String postPhotoProduct() throws Exception {
	    Map<String, String> photoData=new HashMap<String, String>();
	    /*
         * ServletActionContext.getServletContext().getRealPath("/")
         * 是当前【程序】在磁盘中的位置，
         * 如：D:\apache-tomcat-7.0.81\webapps\wkmoko
         */
	    
	    //把文件保存到服务器的路径
	    String realpath = ServletActionContext.getServletContext().getRealPath("/images/product/" );
	    File file = new File(realpath);
	    
	    // 没有此文件夹就创建
	    if (!file.exists())file.mkdirs();
	    	try {
	    		//使用uuid随机字符串
	    		String uuidStr = UUID.randomUUID().toString();
	    		//除去uuid字符串的-字符
		        String uuid = uuidStr.substring(0, 8) + uuidStr.substring(9, 13) + uuidStr.substring(14, 18) + uuidStr.substring(19, 23) + uuidStr.substring(24);
		        //从文件名称的后缀名.结束（如：hello.jpg=>把hello去掉,留下.jpg）
		        int beginIndex = uploadImageFileName.lastIndexOf(".");
		        uploadImageFileName = uuid+uploadImageFileName.substring(beginIndex);
		        
		        //复制上传的文件到服务器
		        FileUtils.copyFile(uploadImage, new File(file, uploadImageFileName));
		        
		        //把图片数据存在Map对象photoData中，用于返回前台的ajax数值
		        photoData.put("name",uploadImageFileName);
		        photoData.put("path","images"+"/product/"+uploadImageFileName);
		        //将要返回的map对象进行json处理
		        JSONObject jo = JSONObject.fromObject(photoData);
	 
		        //调用json对象的toString方法转换为字符串然后赋值给result
		        this.res = jo.toString();
		        //System.out.println(this.res);
	 
		        //返回字符串到前台，设置响应的内容类型
		        HttpServletResponse response=ServletActionContext.getResponse();
	            response.setContentType("text/html;charset=utf-8");
	            PrintWriter pw=response.getWriter();
	            pw.write(this.res);
	            pw.flush();
	            pw.close();
	    	}
	    	catch (IOException e) {
	    		e.printStackTrace();
	    	}
	    
	    //记得这里返回null，留意下面Struts.xml文件的怎么配置
	    return null;
	}
/***********************************************************************************/
	//会员发布商品信息编辑
	public String productInsertHomeEdit() throws Exception{
		return SUCCESS;
	}
	
	//会员发布商品信息
	public String productInsertHome() throws Exception{
		User u = userhomeService.getUserByuserid(userid);
		//System.out.println("u:"+u);
		if(u!=null){
			int state = userhomeService.productInsert(u, goods);
			if(state>0){
					return SUCCESS;
			}else{
				return ERROR;
			}
		}
		else{
			return ERROR;
		}
	}
	
	//会员已发布的商品信息记录
	public String productInfoHome() throws Exception{
		 System.out.println("UserAction:"+userid);
		if(userid>0){
			List<?> lr = userhomeService.getGoodsinfoByuserid(userid);
			//System.out.println("lr"+lr);
			if(lr!=null){
				Map request = (Map)ActionContext.getContext().get("request");
				request.put("user_productinfos",lr);
				return SUCCESS;
			}
			else{
				Map request = (Map)ActionContext.getContext().get("request");
				request.put("user_productinfos",lr);
				return SUCCESS;
			}	
		}
		else{
			List lr = null;
			Map request = (Map)ActionContext.getContext().get("request");
			request.put("user_productinfos",lr);
			return SUCCESS;
		}
	}
	
	//会员已发布的商品信息记录
	public String productDetail() throws Exception{
		Goods good = userhomeService.getGoodBygoodid(goodid);
		if(good!=null){
			Map request = (Map)ActionContext.getContext().get("request");
			request.put("home_goods_detail",good);
			return SUCCESS;
		}
		return ERROR;
	}
	
	//限制下显示8个商品在首页
	public String productInfo() throws Exception{
		List products = userhomeService.getLimitproducts();
		Map request = (Map)ActionContext.getContext().get("request");
		request.put("home_products",products);
		return SUCCESS;
	}
	
	
	// 拍品列表分页
	public String productAllPaging() throws Exception{
		System.out.println("当前页码："+currentPage);
		System.out.println("关键字："+keyword);
		System.out.println("类型名："+typename);
		
		if(keyword.length()==0){
			keyword = "";
		}
		
		int totalSize = userhomeService.getTotalGoods(keyword,typename);
		PagerArticle pager = new PagerArticle(currentPage,totalSize);
		List allgoods = userhomeService.getTotalGoodsPaging(currentPage,keyword,typename,pager.getPageSize());
		Map request = (Map)ActionContext.getContext().get("request");
		request.put("allgoods",allgoods);
		request.put("pager",pager);
		System.out.println(allgoods);
		return SUCCESS;
	}
}
