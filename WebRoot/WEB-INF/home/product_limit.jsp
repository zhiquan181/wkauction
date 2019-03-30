<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<style type="text/css">
	.product{transition:ease .3s;border:1px solid #e2e2e2;}
	.product:hover{box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.3);}
	
	.user_detail{width:1040px;margin:20px auto 20px auto;}
	
	.user_detail p{position: relative;width:100%;box-shadow: 1px 2px 3px rgba(0, 0, 0, 0.1);height: 40px;line-height: 20px;font-size:15px;border-radius:5px;background-color: #fafafa;margin-bottom:15px;}
	.user_detail p .user_detail_span1{color:#000;position: absolute;display:inline-block;left:0;top:0;}
	.user_detail p .user_detail_span2{color:#666;position: absolute;display:inline-block;right:0;top:0;}
	.user_detail_span2 a{text-decoration: none;color:#ff7c19;}
	.user_detail p span{padding:10px;}
	
	.user_detail div a{position:absolute;font-size:15px;bottom:25px;right:50px;width:100px;heihgt:40px;background:rgb(220,82,54);color:#fff;display: inline-block;border-radius:20px;line-height: 30px;text-align: center;transition:ease .3s;text-decoration: none;}
	.user_detail div a:hover{background:rgb(245,0,1);}
	.span1{position:absolute;bottom:25px;left:25px;width:300px;heihgt:40px;border-radius:5px;background:rgb(220,82,54);color:#fff;display: inline-block;line-height: 30px;text-align: center;text-decoration: none;}
	.span2{position:absolute;bottom:25px;left:425px;width:;heihgt:40px;color:#666;display: inline-block;line-height: 30px;text-align: center;text-decoration: none;}
</style>

<div class="user_detail">
	<p>
		<span class="user_detail_span1">·&nbsp;&nbsp;最新拍品</span>
		<span class="user_detail_span2"><a href="productAllPaging?keyword=&typename=">全部拍品&nbsp;&nbsp;·</a></span>
	</p>
	
	<s:iterator value="#request['home_products']" var="home_product">
		<div class="product_copy">
			<input class="picture_val" type="hidden" value="${home_product.picture}"/>
			<input class="title_val" type="hidden" value="${home_product.title}"/>
			<input class="remark_val" type="hidden" value="${home_product.remark}"/>
			<input class="typename_val" type="hidden" value="${home_product.typename}"/>
			<input class="price_val" type="hidden" value="${home_product.price}"/>
			<input class="id_val" type="hidden" value="${home_product.id}"/>
			<input class="endtime_val" type="hidden" value="${home_product.endtime}"/>
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
	
	<!-- 循环加载过多会导致CPU暴涨而死机
	<s:iterator value="#request['home_products']" var="home_product">
		<div class="product" style="width:100%;height:200px;background:#fff;margin:10px 0px;">
			<input class="endtime_val" type="hidden" value="${home_product.endtime}"/>
			<div style="width:200px;height:200px;background:#eee;float:left;">
				<img src="${home_product.picture}" width="200" height="200"/>
			</div>
			<div style="width:800px;height:200px;background:#fff;float:left;position: relative;">
				<div style="font-size:20px;font-weight:regular;padding:25px 20px 0 25px;">${home_product.title}</div>
				<div style="font-size:16px;font-weight:regular;padding:20px 20px 0 25px;white-space:nowrap; text-overflow:ellipsis; overflow:hidden;">${home_product.remark}</div>
				<div style="font-size:16px;font-weight:regular;padding:20px 20px 0 25px;">${home_product.typename}</div>
				<div style="font-size:18px;font-weight:regular;padding:20px 20px 0 25px;">
					<span class="span1">距离结束时间：<small></small></span>
					<span class="span2" style="color:rgb(220,82,54);">￥${home_product.price}元</span>
					<a href="productDetail?goodid=${home_product.id}">查看拍品</a>
				</div>
			</div>
		</div>
	</s:iterator>
 
    <script type="text/javascript">
        window.onload=clock;
        function clock(){
        	jQuery('.product').each(function(e) {
        		var product = jQuery(this);        	
        		product.each(function(){
        			var product_data = product.find('.endtime_val').val();//获取每个结束时间
        			//console.log(product_data);
	
					var today=new Date();//当前时间
						h=today.getHours(),
						m=today.getMinutes(),
						s=today.getSeconds();
		
					var stopTime=new Date(product_data),//每个结束时间
						stopH=stopTime.getHours(),
						stopM=stopTime.getMinutes(),
						stopS=stopTime.getSeconds();
						
					var shenyu=stopTime.getTime()-today.getTime(),//倒计时毫秒数
						shengyuD=parseInt(shenyu/(60*60*24*1000)),//转换为天
						D=parseInt(shenyu)-parseInt(shengyuD*60*60*24*1000),//除去天的毫秒数
						shengyuH=parseInt(D/(60*60*1000)),//除去天的毫秒数转换成小时
						H=D-shengyuH*60*60*1000,//除去天、小时的毫秒数
						shengyuM=parseInt(H/(60*1000)),//除去天的毫秒数转换成分钟
						M=H-shengyuM*60*1000;//除去天、小时、分的毫秒数		    
						S=parseInt((shenyu-shengyuD*60*60*24*1000-shengyuH*60*60*1000-shengyuM*60*1000)/1000);//除去天、小时、分的毫秒数转化为秒
						
				    var time =  parseInt(shenyu);
				    
				    if(time>0){
				    	product.find("small").text(shengyuD+"天"+shengyuH+"小时"+shengyuM+"分"+S+"秒");
				    }
				    else{
				    	product.find("small").text("0天0小时0分0秒");
				    }
				    product = null;
				    today = null;
				    stopTime = null;
				    shenyu = null;
				    time = null;
				    setInterval(clock,1000);
				});
        	});
        };
    </script>
    -->

</div>
