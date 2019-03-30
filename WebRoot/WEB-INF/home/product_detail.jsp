<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>${home_goods_detail.title}丨商品详情</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="icon" type="image/png" sizes="32x32" href="/wkauction/resource/admin/images/favicon.ico">
	<link href="/wkauction/resource/home/css/font-awesome.min.css" rel="stylesheet">
	<style type="text/css">
		body{background-color:#fff;}
		
		.goods_detail{width:1040px;min-height:900px;margin:50px auto;background:none;}
		
		.user_box{width:1000px;height:;margin:50px auto 0 auto;}
		.user_box h2{font-size:30px;font-weight:400;display:block;}
		.user_box h2 a{padding:15px;border-radius:5px;font-size:15px;display:inline-block;margin: 0 0 0 17px;background:rgb(0,174,239);color:#fff;text-decoration: none;}
		.user_box h2 a:hover{background:rgb(0,137,200);}
		
		.goods_detail_top{width:100%;height:600px;background:#fff;margin-bottom:10px;box-shadow: 1px 2px 3px rgba(0, 0, 0, 0.1);border: 1px solid rgb(212,212,212);}
		.goods_detail_top_left{width:50%;height:500px;background:;float:left;position: relative;}
		.goods_detail_top_left img{width:300px;height:300px;display:block;background:#f8f8f8;margin:150px auto;}
		.goods_detail_top_right{width:50%;height:500px;background:;float:right;}
		.goods_detail_top_right p{font-size:14px;font-weight:bold;line-height:30px;padding:20px 20px;}
		
		.goods_detail_middle{width:100%;height:;background:#fff;box-shadow: 1px 2px 3px rgba(0, 0, 0, 0.1);border: 1px solid rgb(212,212,212);}
		.goods_detail_middle h1{text-align: center;line-height: 80px;font-weight: 200;}
		
		.goods_detail_bottom{width:100%;height:;background:#fff;box-shadow: 1px 2px 3px rgba(0, 0, 0, 0.1);border-left: 1px solid rgb(212,212,212);border-right: 1px solid rgb(212,212,212);border-bottom: 1px solid rgb(212,212,212);}
		.goods_detail_bottom p h1{text-align: center;line-height: 80px;font-weight: 200;}
		
		.result{text-align: center;}
		.result button{font-size: 15px;outline:none;transition:ease .3s;border:none;cursor:pointer;margin:0px auto 40px auto;width: 100px;heihgt: 40px;background: #ff7c19;color: #fff;display: inline-block;border-radius: 20px;line-height: 30px;}
		.result button:hover{background-color:orange;}
		
		.bidform{width:500px;height:350px;position:fixed;z-index:1;top:0;bottom:0;left:0;right:0;margin:auto;display:none;background-color: rgba(255,255,255,.6);box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.3);}
		.bidform form{font-family: 微软雅黑;font-size: 16px;position: relative;}
		.bidform form i{padding:8px 10px;font-size:15px;position:absolute;z-index:999;color:#666;cursor:pointer;transition:ease .3s;}
		.bidform form i:hover{background-color:rgb(211,36,36);color:#fff;}
		.bidform form p{text-align: center;padding: 20px 0;}
		.bidform form p input{width:250px;height:50px;font-size:15px;outline: none;border:1px solid #eee;transition: all .3s ease;}
		.bidform form p input:focus {border-color: rgba(82, 168, 236, 0.8);outline: thin dotted \9;box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075), 0 0 8px rgba(82, 168, 236, 0.6);}
		.bid_price{text-indent:2em;background-color: rgba(255,255,255,.6);}
		.bid_submit{background-color: rgba(255,124,25,.8);color:#fff;cursor:pointer;}
		.bid_submit:hover{background: orange;}
	</style>
  </head>
  <body>
  	<s:if test="#session.moko_user==null">
    	<script language="javascript"type="text/javascript"> 
			alert("您还未登录，请登录后再查看商品与竞价！"); 
			window.location.href="http://localhost:8080/wkauction/login.jsp"; 
		</script>
	</s:if>
	<s:else>
	  	<jsp:include page="/WEB-INF/home/head.jsp"/>
	  	    
	    <div class="goods_detail">
	    	<div class="goods_detail_top">
	    		<div class="goods_detail_top_left">
	    			<img src="${home_goods_detail.picture}" onerror="onerror=null;src='/wkauction/resource/home/images/zwtx.png'"/>
	    		</div>
	    		<div class="goods_detail_top_right">
	    			<input class="goodid" type="hidden" value="${home_goods_detail.id}"/>
	    			<p>名称：${home_goods_detail.title}</p>
	    			<p>描述：${home_goods_detail.remark}</p>
	    			<p>拍卖人：${home_goods_detail.user.username}</p>
	    			<p>开始时间：${home_goods_detail.createat}</p>
	    			<p>结束时间：<span style="color:red;">${home_goods_detail.endtime}</span></p>
	    			<p>商品状态：<span class="status">${home_goods_detail.status}</span></p>
	    			<p>类别：${home_goods_detail.typename}</p>
	    			<p>起拍价：￥<span class="price1" style="color:red;">${home_goods_detail.price}</span>元</p>
	    		</div>
	    	</div>
	    	
	    	<div class="goods_detail_middle">
	    		<s:action name="ordersProductInfo" namespace="/" executeResult="true">
	    			<s:param name="goodsid">
	    				<s:property value="#request.home_goods_detail.id"></s:property>
	    			</s:param>
	    		</s:action>
	    	</div>
	    	
	    	<div class="goods_detail_bottom">
	    		<p class="result"></p>
	    	</div>
	    	    	
	    	<script type="text/javascript">
	    		var status = $(".status").text();
	    		if(status == 1){
	    			//console.log(status);
	    			$(".result").html("<h1>商品拍卖正在进行中，欢迎参与竞价！</h1>"+
	    			"<button class='bid_btn'>我要竞价</button>");
	    		}
	    		
	    		$(".bid_btn").click(function(){
	    			$(".bidform").fadeToggle(200);
	    		});
	    		    			
	    		if(status == 0){
	    			//console.log(status);
	    			$(".result").html("<h1>商品拍卖已结束！</h1>");
	    		}
	    			
	    		var price1 = parseInt($(".price1").text());
	    		//console.log(price1);
	    		
	    		function validate(){
					var regu1 = /^[1-9]+[0-9]*$/;
					/*注意：
					/^表示开始
					$/表示结束
					*表示最少0个内容
					第一位不能为0，那就从1开始[1-9]
					后边是所有数字都可以用[0-9]，最少出现0次，所以用* */
			    	var re1 = new RegExp(regu1);
			    	//var bid_price = parseInt($(".bid_price").val());
			    	var bid_price = $(".bid_price").val();
			    	var bid_price_target = re1.test(bid_price);
			    	//console.log(bid_price_target);

			    	if(bid_price==null || bid_price==''|| !bid_price_target){
						alert('价格不允许为空，价格不允许0开头，且只允许输入数字！我说的！！！');
						$(".bid_price").focus();
						return false;
					}
					else if(bid_price<=price1){
						alert('输入的价格必须大于起拍价！');
						$(".bid_price").focus();
						return false;
					}
			    	else{
			    		//console.log(bid_price);
			    		return true;
			    	}
				}
				
				var li = $(".goods_detail_middle .bid_ul").find("a");
				console.log(li.length);
				var max = li.length-1;
				console.log(max);
				
				if(status == 0 && li.length<=0){
					$('.goods_detail_middle').append("<h1>商品已流拍！</h1>");
				}
				
				if(status == 1 && li.length<=0){
					$('.goods_detail_middle').append("<h1>暂未有人出价哦，赶紧第一个出价吧！</h1>");
				}
				
				if(status == 0 && li.length>0){
					var ordersid = $(".bid_ul").find(".max_orders_id").eq(max).val();
					console.log(ordersid);

					$('.goods_detail_middle').append("<h1>商品拍卖成功！</h1>");
					
					$.ajax({
					    url : '<%=basePath%>ordersFkstatus',
					    type: 'post',
					    data: {
					        'ordersid':ordersid
					    },
					    success: function(data) {
					        // TODO
					    }
					});

				}
	    	</script>
	  	</div>
	  	
	  	<div class="bidform">
	  		<form action="bidInsert" method="post">
	  			<i id="close" class="fa fa-close" title="关闭"></i>
	  			<p><input type="hidden" name="bid_goodsid" value="${home_goods_detail.id}"/></p>
	  			<p><input type="hidden" name="bid_userid" value="${session.moko_user.id}"/></p>
	  			<p><input type="text" class="bid_price" name="bid_price" value="" autocomplete="off" placeholder="请输入出标价格！" maxlength="11"/>
	  			<p><input type="submit" class="bid_submit" onclick="return validate()" value="完成"/></p>
	  		</form>
	  	</div>
	  	
	  	<script type="text/javascript">
	  		$("#close").click(function(){
    			$(".bidform").fadeOut(100);
    		});
	  	</script>
	  	
	  	<jsp:include page="/WEB-INF/home/foot.jsp"/>
	  </s:else>
  </body>
</html>
