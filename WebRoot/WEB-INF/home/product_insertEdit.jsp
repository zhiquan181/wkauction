<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>${session.moko_user.username}丨发布商品信息</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="icon" type="image/png" sizes="32x32" href="/wkauction/resource/admin/images/favicon.ico">
	<style type="text/css">
		body{background-color:#fff);}
		
		.user_box{width:1000px;height:;margin:50px auto 0 auto;padding:30px 0;box-shadow: 1px 3px 3px rgba(0, 0, 0, 0.1);border: 1px solid rgb(212,212,212);background-color: #fff;}
		.user_box h2{font-size:30px;font-weight:400;display:block;text-indent: 30px;}
		.user_box h2 a{padding:15px;border-radius:5px;font-size:15px;display:inline-block;margin: 0 0 0 17px;background:rgb(0,174,239);color:#fff;text-decoration: none;}
		.user_box h2 a:hover{background:rgb(0,137,200);}
		.user_box span{color:#999;font-size:14px;display:block;text-indent: 30px;}
		
		#myform{}
		#myform #main input{display:none!important;}
		
		.product_update_Edit_box{width:1000px;height:auto;background:#fff;margin:10px auto 50px auto;box-shadow: 1px 3px 3px rgba(0, 0, 0, 0.1);border: 1px solid rgb(212,212,212);}
		.product_update_Edit_box form{width:100%;height:;margin:auto;padding:40px 0;}
	 	.product_update_Edit_box form p{text-align:center;margin:15px auto;}
	 	.product_update_Edit_box form p span{display:inline-block;width:100px;text-align:left;}
	 	.product_update_Edit_box form p .input{display:inline-block;text-indent:1em;width:800px;height:40px;border:1px solid #aaa;outline:none;font-size: 16px;}
	 	.product_update_Edit_box form p select{display:inline-block;text-indent:1em;width:800px;height:40px;border:1px solid #aaa;outline:none;font-size: 16px;}
	 	.product_update_Edit_box form p .submit{cursor:pointer;color:#fff;background:rgb(255,0,98);border:0;transition:ease .3s;width: 80px;height: 40px;border-radius: 5px;font-size: 16px;margin-left:15px;}
	 	.product_update_Edit_box form p .submit:hover{background: rgb(182,36,31);}
	 	.product_update_Edit_box form div{text-align: center;}
	 	.product_update_Edit_box form div img{cursor:pointer;}
	 	
	 	select{appearance: 9px;-webkit-appearance: 9px;-moz-appearance: 9px;}
	 	::-webkit-inner-spin-button{padding:9px;}
	 	::-webkit-calendar-picker-indicator{padding:14px 14px;}
	 	
	 	.product_submit{cursor:pointer;color:#fff;background:rgb(0,174,239);border:0;transition:ease .3s;width: 80px;height: 40px;border-radius: 5px;font-size: 16px;}
	 	.product_submit:hover{background: rgb(0,137,200);}
	</style>
  </head>
  
  <body>    
    <s:if test="#session.moko_user==null">
    	<script language="javascript"type="text/javascript"> 
			alert("您的登录回话已过期，请重新登录！"); 
			window.location.href="http://localhost:8080/wkauction"; 
		</script>
	</s:if>
	<s:else>
		<jsp:include page="/WEB-INF/home/head.jsp"/>
		
		<div class="user_box">
	   		<h2>
	   			发布商品：${session.moko_user.username}
	   			<!-- 
	   			<a href="userUpdateHomeEdit?userid=${session.moko_user.id}">修改资料</a>
	   			<a href="userUpdateHeadImgEdit">修改头像</a>
	   			<a href="productInsertHomeEdit">发布商品</a>
	   			<a href="productInsertHomeEdit">我的商品</a>
	   			<a href="productInsertHomeEdit">我的竞拍</a>
	   			<a href="productInsertHomeEdit">我的订单</a>
	   			 -->
	   		</h2>
	   		<span>所在地：${session.moko_user.address}</span>
	   	</div>
		
		<script type="text/javascript" src="/wkauction/resource/home/js/jquery-form.js"></script>
		
		<div id="main">
			<input id="file" type="file" name="uploadImage"/>
		</div>
			
		<div class="product_update_Edit_box">
			<form action="productInsertHome" method="post">
		  		<p><span>会员ID：</span><input type="text" class="input" name="userid" value="${session.moko_user.id}" readonly="readonly"/></p>
		  		<p><span>商品标题：</span><input type="text" class="input" name="goods.title" value="" required="required"/></p>
		  		<p><span>商品描述：</span><input type="text" class="input" name="goods.remark" value="" required="required"/></p>
		  		<p><span>选择分类：</span><s:action name="catalogSelect" namespace="/" executeResult="true"></s:action></p>
		  		<p><span>拍卖起价：</span><input type="text" class="input" name="goods.price" value="" maxlength="8" required="required" onkeyup="if(this.value.length==1){this.value=this.value.replace(/[^1-9]/g,'')}else{this.value=this.value.replace(/\D/g,'')}" onafterpaste="if(this.value.length==1){this.value=this.value.replace(/[^1-9]/g,'')}else{this.value=this.value.replace(/\D/g,'')}"/></p>
		  		<p><span>截止时间：</span><input type="datetime-local" class="input" name="goods.endtime" value="" required="required"/></p>
		  		<p><span>图片地址：</span><input id="productImg" type="text" class="input" name="goods.picture" value="" readonly="readonly"/></p>
		  		<p>（请上传商品图片，以获得图片地址）<small>使用AJAX异步请求无页面刷新上传图片，并且回显</small></p>
		  		<div>
			  		<img src="" id="previewImg" onerror="onerror=null;src='/wkauction/resource/home/images/upload.jpg'"/>
				</div>
				<div class="userUpdateHeadImg_detail">
					<span id="detail"></span>
					<!-- 显示百分比 -->
					<span id="percent"></span>
			 		<span class="bar"></span>
			 		
					<!-- 显示图片名字 -->
					<span id="filename"> </span>
					
					<!-- 显示图片 -->
					<span id="showing" > </span>
				</div>
				
		  		<p><input class="product_submit" type="submit" value="完成" onclick="return check()"/></p>
		  		<script language="javascript">
					function check() {
						var inputImg = document.getElementById("productImg").value;
						if(inputImg == "" && inputImg == null){
							alert("请上传图片！");
							return false;
						}
						return true;
					}
				</script>
		  	</form>
		  	
		  	<script type="text/javascript">
				<!--
				 $(function(){         
					var $percent=$("#percent");//获取进度百分比
					var $bar=$(".bar");//进度条
					var $file=$("#file");//上传的文件
					var $headimg=$("#headimg");//上传文件之后表单的文件名
					var $productImg=$("#productImg");
				   
					//动态添加form,利用wrap函数   
					$("#main").wrap("<form id='myform' method='post' enctype='multipart/form-data'></form>");
					
					//当文件改变时触发的事件
					$("#file").change(function(){ 
						window.alert("ok");
						var $var_option={
							//写在Struts.xml中配置的对应action
							url:'postPhotoProduct',
							//dataTpye:'json',
							//开始的上传触发的函数
							beforeSend:function(){
								$percent.show();//显示进度数
								var $percentVal='0%';//初始化进度
							},
							//上传过程中不断触发的函数
							uploadProgress:function(event,position,total,percentComplete){
								var $percentVal=percentComplete+'%';//percentComplete:改函数返回的进程数
								$percent.html($percentVal);
								$bar.width(percentComplete);//设置进度条view
							},
							//成功时触发的函数
							success:function(data){
								//把成功返回的字符串转成json数据；就是说要把字符串以json形式返回。
								/*
								 例如这个项目的返回信息可以这样：
								{"name":"2.png","path":"images/2.png"}
								*/
								var $data=jQuery.parseJSON(data);
				                //获取文件路径
				                var $img=$data.path;
				                
				                //动态添加标签
				                $("#detail").html("上传状态：");
				                $percent.html("上传成功");
				                $headimg.val($img);
				                $file.html($data.name);
				                $("#previewImg").prop("src",$img);
				                $("#productImg").val($img);
							},
							error:function(){
								$percent.html("上传失败");
							}
				         };
				         
						$("#myform").ajaxSubmit($var_option);
					});
				  });
				
				
				//-->
			</script>
				
			<script type="text/javascript">
				$("#previewImg").click(function(){
					$("#file").click();
				});
			</script>
		</div>
	</s:else>
	
	<jsp:include page="/WEB-INF/home/foot.jsp"/>
  </body>
</html>
