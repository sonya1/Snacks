<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="com.dao.*,com.dao.impl.*,com.actions.*,com.models.*" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>嘛嘛零食网-购物车详情</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" href="<%=path %>/table/qiantai/styles/index.css" type="text/css"/>
	<link type="text/css" rel="stylesheet" href="<%=path %>/table/qiantai/styles/cart.css" />
	<link type="text/css" rel="stylesheet" href="<%=path %>/table/qiantai/styles/houtai.css" />
	
	<script language="JavaScript">
	function jump(){
		document.searchNum.submit();
	}
	
	</script>
	</head>
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
<h3 class="position">当前位置：首页>>购物车</h3>
	<div class="gonggao">
		<div class="con">
		<div class="title">我的购物车</div>
		 <table  cellspacing="20px" cellpadding="10px">
		 		<tr>
						<td width="12%"><h3>时间</h3></td>
						<td width="14%"><h3>食品图片</h3></td>
						<td width="16%"><h3>名称</h3></td>
						<td width="12%"><h3>单价</h3></td>
						<td width="12%"><h3>购买数量</h3></td>
						<td width="12%"><h3>总价</h3></td>
						<td width="10%"><h3>删除</h3></td>
						<td width="12%"><h3>立即购买</h3></td>
				</tr>
				<%	
						GoodsDao goodsdao = new GoodsDaoImpl();
						Goods goods = new Goods();
						%>
						<% for(int i=0;i<carts.size();i++){
							Cart cart = carts.get(i);
							int gid = cart.getGid();
							goods = goodsdao.selectOneGoods(gid);
							
						%>
		<tr>
				<td><span><%=cart.getDate() %></span></td>
				<td><img src="<%=path%><%=goods.getPicture() %>" width="50px" height="50px"></td>
				<td><span><%=goods.getName() %></span></td>
				<td><span>￥<%=goods.getPrice() %></span></td>
				<td><span><%=cart.getCount() %></span></td>
				<td><span>￥<%=cart.getPrice() %></span></td>
				<td><span><a href="<%=path%>/cart/cart_deleteCart?id=<%=cart.getId() %>">
						<button onClick="return confirm('确定删除?')">删除</button></a>
				</span></td>
				<td><form action="<%=path %>/orders/orders_add" >
					<input type="hidden" name="gid" value="<%=goods.getId() %>">
					<input type="hidden" name="uid" value="<s:property value="#session.user.id"/>">
					<input type="hidden" name="danjia" value="<%=goods.getPrice()%>">
                	<input type="hidden" name="shuliang" id="shuliang" >
					<input type="submit" value="立即购买" onClick="return confirm('确定购买？')">
					</form>
					</td>
		</tr>
		
		
		
		<%} 
		
		
		
					}else{%>
					您的购物车中有&nbsp;<a href="<%=path %>/table/qiantai/nei/cart.jsp" class="b_cart">0</a>&nbsp;件商品
					</td>
					</tr>
					<%} %>
			
				</table>
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
全国统一服务电话：400-600-0404<br/>[<a href="<%=path%>/table/login.jsp" >管理员入口</a>]</font>
</center>    
</div>
</body>
</html>


