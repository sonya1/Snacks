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
    
    <title>嘛嘛零食网-所有零食</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link type="text/css" rel="stylesheet" href="<%=path %>/table/qiantai/styles/index.css" /> <!--引用头部css-->
	<link type="text/css" rel="stylesheet" href="<%=path %>/table/qiantai/styles/suoyou.css" /> 


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
        <%}else{ %>
        您的购物车中有&nbsp;<a href="<%=path %>/table/qiantai/nei/cart.jsp" class="b_cart">0</a>&nbsp;件商品
         <%} %>
        </div>
	</div>
    
    <div class="navi" id="nav">
        <div class="nav">
            <ul class="nav1">
                <li><a href="<%=path %>/table/qiantai/index.jsp">首页</a></li>
                <li class="active1"><a href="<%=path %>/table/qiantai/shou/suoyou.jsp">所有零食</a></li>
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
	<h3 class="position">当前位置：首页>>所有零食</h3>
	<ul>
    	<%
            	GoodsDao goodsDao = new GoodsDaoImpl();
            	Goods goods = new Goods();
            	List<Goods> list2 = goodsDao.selectAll();
            	for(int i=0;i<list2.size();i++){
            		goods = list2.get(i);
            		
            %>
            <a href="<%=path %>/table/qiantai/nei/gooddetails.jsp?id=<%=goods.getId() %>">
                <li>
                    <img src="<%=path %>/table/goods<%=goods.getPicture()%>" />
                    <div class="zi">
                        <b><%=goods.getName()%></b><br />
                        嘛嘛网价格：<%=goods.getPrice()%>
                    </div>
                    <input type="button" value="立即购买"/>
                    <input type="button" value="加购物车" />
                </li>
            </a>
            
            
            <%} %>
            	
    
    </ul>
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


