<%@ page language="java" import="java.util.*" pageEncoding="utf8"%>
<%@ page import="com.dao.*,com.dao.impl.*,com.actions.*,com.models.*" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>嘛嘛零食网-产品详情</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" href="<%=path %>/table/qiantai/styles/index.css" type="text/css"/>
	<link type="text/css" rel="stylesheet" href="<%=path %>/table/qiantai/styles/details.css" />

  </head>
  
 <script type="text/javascript">

function getEventObject(W3CEvent) {   //事件标准化函数
 return W3CEvent || window.event;
}


function getPointerPosition(e) {   //兼容浏览器的鼠标x,y获得函数
 e = e || getEventObject(e);
 var x = e.pageX || (e.clientX + (document.documentElement.scrollLeft || document.body.scrollLeft));
 var y = e.pageY || (e.clientY + (document.documentElement.scrollTop || document.body.scrollTop));
 
 return { 'x':x,'y':y };
}

function setOpacity(elem,level) {   //兼容浏览器设置透明值
 if(elem.filters) {
  elem.style.filter = 'alpha(opacity=' + level * 100 + ')';
 } else {
  elem.style.opacity = level;
 }
}

function css(elem,prop) {    //css设置函数,可以方便设置css值,并且兼容设置透明值
 for(var i in prop) {
  if(i == 'opacity') {
   setOpacity(elem,prop[i]);
  } else {
   elem.style[i] = prop[i];
  }
 }
 return elem;
}

var magnifier = {
 m : null,
 
 init:function(magni){
  var m = this.m = magni || {
   cont : null,  //装载原始图像的div
   img : null,   //放大的图像
   mag : null,   //放大框
   scale : 15   //比例值,设置的值越大放大越大,但是这里有个问题就是如果不可以整除时,会产生些很小的白边,目前不知道如何解决
  }
  
  css(m.img,{ 
   'position' : 'absolute',
   'width' : (m.cont.clientWidth * m.scale) + 'px',    //原始图像的宽*比例值 
   'height' : (m.cont.clientHeight * m.scale) + 'px'    //原始图像的高*比例值
   })
  
  css(m.mag,{
   'display' : 'none',
   'width' : m.cont.clientWidth + 'px',   //m.cont为原始图像,与原始图像等宽
   'height' : m.cont.clientHeight + 'px',
   'position' : 'absolute',
   'left' : m.cont.offsetLeft + m.cont.offsetWidth + 20 + 'px',  //放大框的位置为原始图像的右方远10px
   'top' : m.cont.offsetTop + 'px'
   })
  
  var borderWid = m.cont.getElementsByTagName('div')[0].offsetWidth - m.cont.getElementsByTagName('div')[0].clientWidth;  //获取border的宽
  
  css(m.cont.getElementsByTagName('div')[0],{   //m.cont.getElementsByTagName('div')[0]为浏览框
   'display' : 'none',        //开始设置为不可见
   'width' : m.cont.clientWidth / m.scale - borderWid + 'px',   //原始图片的宽/比例值 - border的宽度
   'height' : m.cont.clientHeight / m.scale - borderWid + 'px',  //原始图片的高/比例值 - border的宽度
   'opacity' : 0.5     //设置透明度
   })
  
  m.img.src = m.cont.getElementsByTagName('img')[0].src;   //让原始图像的src值给予放大图像
  m.cont.style.cursor = 'crosshair';
  
  m.cont.onmouseover = magnifier.start;
  
 },
 
 start:function(e){
  
  if(document.all){    //只在IE下执行,主要避免IE6的select无法覆盖
   magnifier.createIframe(magnifier.m.img);
  }
  
  this.onmousemove = magnifier.move;  //this指向m.cont
  this.onmouseout = magnifier.end;
 },
 
 move:function(e){
  var pos = getPointerPosition(e);  //事件标准化
  
  this.getElementsByTagName('div')[0].style.display = '';
  
  css(this.getElementsByTagName('div')[0],{
   'top' : Math.min(Math.max(pos.y - this.offsetTop - parseInt(this.getElementsByTagName('div')[0].style.height) / 2,0),this.clientHeight - this.getElementsByTagName('div')[0].offsetHeight) + 'px',
   'left' : Math.min(Math.max(pos.x - this.offsetLeft - parseInt(this.getElementsByTagName('div')[0].style.width) / 2,0),this.clientWidth - this.getElementsByTagName('div')[0].offsetWidth) + 'px'   //left=鼠标x - this.offsetLeft - 浏览框宽/2,Math.max和Math.min让浏览框不会超出图像
   })
  
  magnifier.m.mag.style.display = '';
  
  css(magnifier.m.img,{
   'top' : - (parseInt(this.getElementsByTagName('div')[0].style.top) * magnifier.m.scale) + 'px',
   'left' : - (parseInt(this.getElementsByTagName('div')[0].style.left) * magnifier.m.scale) + 'px'
   })
  
 },
 
 end:function(e){
  this.getElementsByTagName('div')[0].style.display = 'none';
  magnifier.removeIframe(magnifier.m.img);  //销毁iframe
  
  magnifier.m.mag.style.display = 'none';
 },
 
 createIframe:function(elem){
  var layer = document.createElement('iframe');
  layer.tabIndex = '-1';
  layer.src = 'javascript:false;';
  elem.parentNode.appendChild(layer);
  
  layer.style.width = elem.offsetWidth + 'px';
  layer.style.height = elem.offsetHeight + 'px';
 },
 
 removeIframe:function(elem){
  var layers = elem.parentNode.getElementsByTagName('iframe');
  while(layers.length >0){
   layers[0].parentNode.removeChild(layers[0]);
  }
 }
}

window.onload = function(){
 magnifier.init({
       cont : document.getElementById('magnifier'),
       img : document.getElementById('magnifierImg'),
       mag : document.getElementById('mag'),
       scale : 3
       });
}

</script>

<script language="javascript"> 
function selectInput(choose,danjia) 
{  
	if(danjia >= 100){
		danjia = danjia * 0.8;   //8折
	}
    var oDiv = document.getElementById("zongjia");
    var shu = document.getElementById("shuliang");
    var shu1 = document.getElementById("shuliang1");
    oDiv.innerHTML = choose.value * danjia;
    shu.value = choose.value;
    shu1.value = choose.value;
    //alert("aaa"+shu.value);
} 
</script> 
<body>
<div class="head">
	<div class="header">
        <table border="1" cellpadding="10px" class="t1">
            <tr>
                <td><a href="#" class="weibologin"></a><a href="#">微博登录</a></td>
                <td><a href="#" class="qqlogin"></a><a href="#">qq登录</a></td>
                <td><a href="<%=path %>/table/qiantai/shou/regist.jsp" class="se">注册</a></td>
                <td><a href="<%=path %>/table/qiantai/shou/login.jsp" class="se">登录</a></td>
            	<td><a href="<%=path %>/user/user_exit" class="se">退出系统</a></td>
            </tr>
        </table>
        <img src="<%=path %>/table/qiantai/img/logo.png"  class="h-logo"/>
        <div class="h-right">
        	<span style="margin-bottom:10px"><font color="#666">亲爱的</font><font color="#f69"><s:property value="#session.user.username"/></font><font color="#666">,</font></span>
        	<img src="<%=path %>/table/qiantai/img/cart.jpg" style="width:21px;height:20px;"/>
            <%
        		Object obj = session.getAttribute("user");
        		int uid =0 ;
						if(obj!=null){
							User us = (User)obj;
							uid = us.getId();
						}
        		CartDao cartdao = new CartDaoImpl();
						if(uid!=0){
						List<Cart> carts = cartdao.selectuCart(uid);
	       	 %>
            您的购物车中有&nbsp;<a href="<%=path %>/table/qiantai/nei/cart.jsp" class="b_cart"><%=carts.size() %></a>&nbsp;件商品
        <%}else{ %>
        您的购物车中有&nbsp;<a href="<%=path %>/table/qiantai/nei/cart.jsp" class="b_cart">0</a>&nbsp;件商品
         <%} %>
        </div>
	</div>
    
    <div class="navi" id="nav">
        <div class="nav">
            <ul class="nav1">
                <li class="active1"><a href="<%=path %>/table/qiantai/index.jsp">首页</a></li>
                <li><a href="<%=path %>/table/qiantai/shou/suoyou.jsp">所有零食</a></li>
                <li><a href="<%=path %>/table/qiantai/shou/jieshao.jsp">公司介绍</a></li>
                <li><a href="<%=path %>/table/qiantai/shou/gonggao.jsp">公告中心</a></li>
                <li><a href="<%=path %>/table/qiantai/shou/rongyu.jsp">荣誉资质</a></li>
                <li><a href="<%=path %>/table/qiantai/shou/us.jsp">关于我们</a></li>
                
                <div class="search">
                    <input type="text" value placeholder="按类别搜零食……" class="inp"/>
                    <input type="submit" class="button" value=""/>
                </div>
            </ul>
              
        </div>
    </div>
</div>


<div class="content">
	<div class="con">
    	<div class="de_left" id="magnifier">
        		<%
        			int id = Integer.parseInt(request.getParameter("id"));
        			GoodsDao goodsDao = new GoodsDaoImpl();
        			Goods goods = new Goods();
        			goods = goodsDao.selectOneGoods(id);
        			String picture = goods.getPicture();
        		 %>
                <img src="<%=path %>/table/goods/<%=picture %>" id="img"/>
                <div id="alixixi_com"></div>
           
        </div>
        
        <div id="mag"><img id="magnifierImg" /></div>
        
        
        <div class="de_right">
        	<h3><%=goods.getName() %></h3>
            <div class="detail"><%=goods.getDetails() %></div>
            
            <ul>
            	<li>价格：<%=goods.getPrice() %>  &nbsp;&nbsp; 
            	<% 
            		if(goods.getPrice() >= 100){   // 大于100打八折
            	%>
            	<span>8折&nbsp;最后一天</span></li>
            	<%
            	}
            	 %>
            	
            	<li>销量：<%=goods.getSales() %></li>
                <li>库存：1000 </li>
                <li>购买数量：<select id="num" onchange="selectInput(this,<%=goods.getPrice() %>)">
								<option value="1">1</option>
								<option value="2">2</option>
								<option value="3">3</option>
								<option value="4">4</option>
								<option value="5">5</option>
							</select></li>
				<li>总价：<span id="zongjia"></span> </li>
               <li>
                
                
                <form action="<%=path %>/cart/cart_add">
					<input type="hidden" name="gid" value="<%=goods.getId() %>">
					<input type="hidden" name="uid" value="<s:property value="#session.user.id"/>">
					<input type="hidden" name="danjia" value="<%=goods.getPrice()%>">
                	<input type="hidden" name="shuliang" id="shuliang" >
					<input type="submit" value="加入购物车" onClick="return confirm('确定加入购物？')">
					<br/>
				</form>
				<form action="<%=path %>/orders/orders_add" >
					<input type="hidden" name="gid" value="<%=goods.getId() %>">
					<input type="hidden" name="uid" value="<s:property value="#session.user.id"/>">
					<input type="hidden" name="danjia" value="<%=goods.getPrice()%>">
                	<input type="hidden" name="shuliang" id="shuliang1" >
 					<input type="submit" value="立即购买" onClick="return confirm('确定购买？')">
				</form>
            </ul>
        </div>
    </div>
</div>

<div class="footer">
	<div class="foot1">
        <ul>
            <li>关于我们&nbsp;|</li>
            <li>联系我们&nbsp;|</li>
            <li>网站地图&nbsp;|</li>
            <li>投诉监督&nbsp;|</li>
            <li>企业服务</li>
        </ul>
	</div>
<center>
    <img src="<%=path %>/table/qiantai/img/footer1.gif" /><img src="<%=path %>/table/qiantai/img/footer2.jpg" /><img src="<%=path %>/table/qiantai/img/footer3.png" /><br />
	<font color="#ff6600" size="-1">Copyright © 零食网 2009 - 2012, All Rights Reserved  粤ICP备10229181号 许可证：粤B2-20110008<br />
全国统一服务电话：400-600-0404<br/>[<a href="<%=path %>/table/login.jsp" >管理员入口</a>]</font>
</center>    
</div>
</body>
</html>

