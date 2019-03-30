<%@ page language="java" import="java.util.*" pageEncoding="utf8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>拍卖系统丨后台登录中心</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="icon" type="image/png" sizes="32x32" href="/wkauction/resource/admin/images/favicon.ico">
	<script type="text/javascript" src="/wkauction/resource/admin/js/jquery-3.3.1.min.js"></script>
	<style type="text/css">
		*{margin:0;padding:0;border:0;}
		body{font-family:"微软雅黑";background-color:rgb(210,214,222);}
		body center{width:400px;position:relative;z-index:1;margin:250px auto 0 auto;background-color:rgba(255,255,255,.5);border:1px solid #eee;border-radius:5px;font-family: 微软雅黑;}
		body center form{width:400px;height:auto;margin:0 auto;padding:40px 0;color:#000;}
		body center form div p{padding:10px 0;height:40px;position:relative;}
		body center form div p .input{width:85%;height:40px;outline: none;text-indent:1em;font-family: 微软雅黑;font-size: 16px;border: 1px solid #ccc;}
		
		.form_title{color:#aaa;}
		
		.checkCode_Box{width:340px;height:40px;display:inline-block;margin:auto;position:relative;left:30px;}
		
		.checkCode{width:150px;height:40px;float:left;outline: none;text-indent:1em;font-family: 微软雅黑;font-size: 16px;border: 1px solid #ccc;}
		.refreshimg{border:none;outline:none;display:inline-block;line-height:40px;font-size:14px;width:130px;height:40px;float:left;background:none;cursor:pointer;}
		.refreshimg:hover{color:rgb(130,5,4);}
		.checkCode_Box img{width:60px;display:inline-block;float:right;margin:10px auto;cursor:pointer;}
		
		
		body center form div p span{width:200px;height:40px;display:inline-block;float:left;}
		body center form div p .submit{width:85%;height:40px;cursor:pointer;outline: none;color:#fff;font-family: 微软雅黑;font-size: 16px;background:rgb(35,183,229);}
		body center form input:focus {outline: thin dotted \9;border: 1px solid #ccc;}
		body center form div p .submit:hover{background:rgb(40,193,235);}
		
		#c{position:absolute;z-index:0;top:0;}
	</style>

  </head>
  
  <body>
  	<s:if test="#session.auser_active==null">
  		<center>
			    <form action="alogin" methor="post" name="form">
			    	<p class="form_title">基于SSH+Vue的网上拍卖系统的设计与实现</p>
			    	<div>
				    	<p><input class="input" type="text" name="auser.username" value="" placeholder="账号" required="required"/></p>
				    	<p><input class="input" type="password" name="auser.password" value="" placeholder="密码" required="required"/></p>
				    	<p>
				    		<span class="checkCode_Box">
				    			<input class="checkCode" id="checkCode" name="checkCode" placeholder="请输入验证码" value="" type="text" required="required"/>
				    			<img id="createImage" src="createImage" onclick="refresh(this)" title="点击图片刷新验证码"/>
				    			<a class="refreshimg" onclick="refreshimg()">看不清，换一个</a>
				    		</span>
				    	</p>
				    	<p><input class="submit" type="submit" value="登录" onclick="return check()"/></p>
				    	<span id="checkCode_span"></span>
			    	</div>
			    	<script type="text/javascript">
					     function refresh(obj){
					         obj.src="createImage.action?id="+Math.random();
					     }
					     function refreshimg(){
					     var obj_img = document.getElementById("createImage");
					         obj_img.src="createImage.action?id="+Math.random();
					     }
					     
					     function check() {   
							var checkCode = document.getElementById("checkCode").value;
							if(checkCode == ""&&checkCode==null) {
								alert("请填写图形验证码");
								return false;
							}
							return true;
						}
					</script>
			    </form>
	    </center>
  	</s:if>
  	<s:else>
  		<script language="javascript"type="text/javascript"> 
			window.location.href="http://localhost:8080/wkmoko/adminManager"; 
		</script>
	</s:else>
	
	<canvas id="c" width="300" height="150"></canvas> 
	
	<script type="text/javascript">		
	$(document).ready(function() {			
		var canvas = document.getElementById("c");
		var ctx = canvas.getContext("2d");
		var c = $("#c");
		var w,h;
		var pi = Math.PI;
		var all_attribute = {
			num:100,            			 // 个数
			start_probability:0.1,		     // 如果数量小于num，有这些几率添加一个新的     		     
			radius_min:1,   			     // 初始半径最小值
			radius_max:2,   			     // 初始半径最大值
			radius_add_min:.3,               // 半径增加最小值
			radius_add_max:.5,               // 半径增加最大值
			opacity_min:0.3,                 // 初始透明度最小值
			opacity_max:0.5, 				 // 初始透明度最大值
			opacity_prev_min:.003,            // 透明度递减值最小值
			opacity_prev_max:.005,            // 透明度递减值最大值
			light_min:40,                 // 颜色亮度最小值
			light_max:70,                 // 颜色亮度最大值
		};
		var style_color = find_random(0,360);  
		var all_element =[];
		window_resize();
		function start(){
			window.requestAnimationFrame(start);
			style_color+=.1;
			ctx.fillStyle = 'hsl('+style_color+',100%,97%)';
			ctx.fillRect(0, 0, w, h);
			if (all_element.length < all_attribute.num && Math.random() < all_attribute.start_probability){
				all_element.push(new ready_run);
			}
			all_element.map(function(line) {
				line.to_step();
			})
		}
		function ready_run(){
			this.to_reset();
		}
		ready_run.prototype = {
			to_reset:function(){
				var t = this;
				t.x = find_random(0,w);
				t.y = find_random(0,h);
				t.radius = find_random(all_attribute.radius_min,all_attribute.radius_max);
				t.radius_change = find_random(all_attribute.radius_add_min,all_attribute.radius_add_max);
				t.opacity = find_random(all_attribute.opacity_min,all_attribute.opacity_max);
				t.opacity_change = find_random(all_attribute.opacity_prev_min,all_attribute.opacity_prev_max);
				t.light = find_random(all_attribute.light_min,all_attribute.light_max);
				t.color = 'hsl('+style_color+',100%,'+t.light+'%)';
			},
			to_step:function(){
				var t = this;
				t.opacity -= t.opacity_change;
				t.radius += t.radius_change;
				if(t.opacity <= 0){
					t.to_reset();
					return false;
				}
				ctx.fillStyle = t.color;
				ctx.globalAlpha = t.opacity;
				ctx.beginPath();
				ctx.arc(t.x,t.y,t.radius,0,2*pi,true);
				ctx.closePath();
				ctx.fill();
				ctx.globalAlpha = 1;
			}
		}
		function window_resize(){
			w = window.innerWidth;
			h = window.innerHeight;
			canvas.width = w;
			canvas.height = h;
		}
		$(window).resize(function(){
			window_resize();
		});
		function find_random(num_one,num_two){
			return Math.random()*(num_two-num_one)+num_one;
		}
		(function() {
			var lastTime = 0;
			var vendors = ['webkit', 'moz'];
			for(var xx = 0; xx < vendors.length && !window.requestAnimationFrame; ++xx) {
				window.requestAnimationFrame = window[vendors[xx] + 'RequestAnimationFrame'];
				window.cancelAnimationFrame = window[vendors[xx] + 'CancelAnimationFrame'] ||
											  window[vendors[xx] + 'CancelRequestAnimationFrame'];
			}
		
			if (!window.requestAnimationFrame) {
				window.requestAnimationFrame = function(callback, element) {
					var currTime = new Date().getTime();
					var timeToCall = Math.max(0, 16.7 - (currTime - lastTime));
					var id = window.setTimeout(function() {
						callback(currTime + timeToCall);
					}, timeToCall);
					lastTime = currTime + timeToCall;
					return id;
				};
			}
			if (!window.cancelAnimationFrame) {
				window.cancelAnimationFrame = function(id) {
					clearTimeout(id);
				};
			}
		}());
		start();
	});
	</script>
  </body>
</html>
