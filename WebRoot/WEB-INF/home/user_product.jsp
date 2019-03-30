<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>${session.moko_user.username}丨我的商品</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="icon" type="image/png" sizes="32x32" href="/wkauction/resource/admin/images/favicon.ico">
	<style type="text/css">
		body{background-color:#fff;}
		
		.user_box{width:1000px;height:;margin:50px auto 0 auto;padding:30px 0;box-shadow: 1px 3px 3px rgba(0, 0, 0, 0.1);border: 1px solid rgb(212,212,212);background-color: #fff;}
		.user_box h2{font-size:30px;font-weight:400;display:block;text-indent: 30px;}
		.user_box h2 a{padding:15px;border-radius:5px;font-size:15px;display:inline-block;margin: 0 0 0 17px;background:rgb(0,174,239);color:#fff;text-decoration: none;}
		.user_box h2 a:hover{background:rgb(0,137,200);}
		.user_box span{color:#999;font-size:14px;display:block;text-indent: 30px;}
		
		.product{transition:ease .3s;border:1px solid #e2e2e2;}
		.product:hover{box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.3);}
		
		.user_detail{width:1000px;height:auto;background:none;margin:0px auto 50px auto;}
		
		.user_detail p{position: relative;width:100%;height: 40px;line-height: 20px;font-size:15px;border-radius:5px;background-color: #fafafa;margin-bottom:15px;}
		.user_detail p .user_detail_span1{color:#000;position: absolute;display:inline-block;left:0;top:0;}
		.user_detail p .user_detail_span2{color:#666;position: absolute;display:inline-block;right:0;top:0;}
		.user_detail_span2 a{text-decoration: none;color:#ff7c19;}
		.user_detail p span{padding:10px;}
		
		.user_detail div a{position:absolute;font-size:15px;bottom:25px;right:50px;width:100px;heihgt:40px;background:rgb(220,82,54);color:#fff;display: inline-block;border-radius:20px;line-height: 30px;text-align: center;transition:ease .3s;text-decoration: none;}
		.user_detail div a:hover{background:rgb(245,0,1);}
		.span1{position:absolute;bottom:25px;left:25px;width:300px;heihgt:40px;border-radius:5px;background:rgb(220,82,54);color:#fff;display: inline-block;line-height: 30px;text-align: center;text-decoration: none;}
		.span2{position:absolute;bottom:25px;left:425px;width:;heihgt:40px;color:#666;display: inline-block;line-height: 30px;text-align: center;text-decoration: none;}
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
	   			我发布的商品：${session.moko_user.username}
	   		</h2>
	   		<span>所在地：${session.moko_user.address}</span>
	   	</div>
		
		<div class="user_detail">
			
			<s:iterator value="#request['user_productinfos']" var="user_productinfo">
				<div class="product_copy">
					<input class="picture_val" type="hidden" value="${user_productinfo[7]}"/>
					<input class="title_val" type="hidden" value="${user_productinfo[1]}"/>
					<input class="remark_val" type="hidden" value="${user_productinfo[2]}"/>
					<input class="typename_val" type="hidden" value="${user_productinfo[9]}"/>
					<input class="price_val" type="hidden" value="${user_productinfo[8]}"/>
					<input class="id_val" type="hidden" value="${user_productinfo[0]}"/>
					<input class="endtime_val" type="hidden" value="${user_productinfo[6]}"/>
				</div>
			</s:iterator>
			<script src="https://cdn.jsdelivr.net/npm/vue@2.6.10/dist/vue.js"></script>
			<ul id="el">
		        <li v-for="item in list" style="list-style: none;">
			        <div class="product" style="width:100%;height:200px;background:#fff;margin:10px 0px;">
						<div style="width:200px;height:200px;background:#eee;float:left;">
							<img :src='item.picture_val' width="200" height="200"/>
						</div>
						<div style="width:800px;height:200px;background:#fff;float:left;position: relative;">
							<div style="font-size:20px;font-weight:regular;padding:25px 20px 0 25px;">{{ item.title_val }}</div>
							<div style="font-size:16px;font-weight:regular;padding:20px 20px 0 25px;white-space:nowrap; text-overflow:ellipsis; overflow:hidden;">{{item.remark_val}}</div>
							<div style="font-size:16px;font-weight:regular;padding:20px 20px 0 25px;">{{ item.typename_val }}</div>
							<div style="font-size:18px;font-weight:regular;padding:20px 20px 0 25px;">
								<span class="span1">距离结束时间：<small>{{ item.jishi }}</small></span>
								<span class="span2" style="color:rgb(0,174,239);">￥{{ item.price_val }}元</span>
								<a :href="'productDetail?goodid=' + item.id_val">查看拍品</a>
							</div>
						</div>
					</div>
				</li>
		    </ul>
		
			<script type="text/javascript">
				var json = [];
		
				var i = 1;
				jQuery('.product_copy').each(function(e) {
					var product_copy = jQuery(this);
					product_copy.each(function(){
						var now = new Date();
						var now_t = now.getTime()/1000;
						var now_int = parseInt(now_t);
					
						var picture_val = product_copy.find('.picture_val').val();
						var title_val = product_copy.find('.title_val').val();
						var remark_val = product_copy.find('.remark_val').val();
						var typename_val = product_copy.find('.typename_val').val();
						var price_val = product_copy.find('.price_val').val();
						var id_val = product_copy.find('.id_val').val();
						
						var endtime_val = product_copy.find('.endtime_val').val();
						//console.log(endtime_val);
						var endtime_date = new Date(endtime_val);
						var endtime_timestamp = endtime_date.getTime()/1000;
						var end_int = parseInt(endtime_timestamp);
						
						var tar = end_int-now_int;
						
						var j = {};
					    j.id = i;
					    j.picture_val = picture_val;
					    j.title_val = title_val;
					    j.remark_val = remark_val;
					    j.typename_val = typename_val;
					    j.price_val = price_val;
					    j.id_val = id_val;
					    j.time = tar;
					    json.push(j);
					});
					i++;
				});
				
				var endtime = {list:json};
				console.log(endtime);
			</script>
			<script>
			new Vue({
			        el: '#el',
			        //data:{"list":[{"id":1,"word":"hello world","time":3898962534},{"id":2,"word":"hello world","time":335334},{"id":3,"word":"hello world","time":-7786266},{"id":4,"word":"hello world","time":-7872666},{"id":5,"word":"hello world","time":-8045466}]},
			        data:endtime,
			        //方法体
			        methods:
			        {
			            num: function (n) {
			                return n < 10 ? '0' + n : '' + n
			            },
			            timeToData:function ( maxtime ) {
			                second = Math.floor( maxtime % 60);       //计算秒
			                minite = Math.floor((maxtime / 60) % 60); //计算分
			                hour = Math.floor((maxtime / 3600) % 24 ); //计算小时
			                day = Math.floor((maxtime / 3600) / 24);//计算天
			                if(day<=0){
			                	day = 0;
			                }
			                if(hour<=0){
			                	hour = 0;
			                }
			                if(minite<=0){
			                	minite = 0;
			                }
			                if(second<=0){
			                	second = 0;
			                }
			                return day+'天'+this.num(hour)+'时'+this.num(minite)+'分'+this.num(second)+'秒';
			            },
			            getTime:function () {
			                var that = this;
			                setInterval(function ()
			                {
			                    that.list.forEach(function (value) {
			                        var shijian = that.timeToData(value.time);
			                        if( typeof value.jishi == 'undefined' )
			                        {
			                            that.$set(value,'jishi',shijian);
			                        }else
			                        {
			                            value.jishi = shijian;
			                        }
			                        if( value.time>0 )
			                        {
			                            -- value.time;
			                        }else
			                        {
			                            value.time = 0;
			                        }
			                    })
			                }, 1000);
			            }
			        },
			        //页面打开渲染之前就调用
			        created: function () {
			            var that = this;
			            that.getTime();
			        }
			    });
			</script>
		</div>
	    
		<jsp:include page="/WEB-INF/home/foot.jsp"/>
	</s:else>
  </body>
</html>