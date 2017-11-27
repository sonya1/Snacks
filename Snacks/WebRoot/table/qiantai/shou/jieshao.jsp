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
    
    <title>嘛嘛零食网-公司介绍</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link type="text/css" rel="stylesheet" href="<%=path %>/table/qiantai/styles/index.css" />
	<link type="text/css" rel="stylesheet" href="<%=path %>/table/qiantai/styles/jieshao.css" />


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
                <li><a href="<%=path %>/table/qiantai/shou/suoyou.jsp">所有零食</a></li>
                <li class="active1"><a href="<%=path %>/table/qiantai/shou/jieshao.jsp">公司介绍</a></li>
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
	<h3 class="position">当前位置：首页>>公司介绍</h3>
	<div class="jieshao">
    	<div class="con">
            <div class="title">公司介绍</div>
            <img src="<%=path %>/table/qiantai/img/dalogo.png" style="float:left"/>
            <div class="zi1">
            <p>嘛嘛零食有限公司成立于2015年，总部设在黑龙江省哈尔滨市。
            主要生产儿童奶、瓶装饮用水、乳饮料和茶饮料等四大品类，现共有三十多个品种。
            产品以其优良的品质荣获“浙江省著名商标”和“免检企业”等荣誉称号，产品覆盖全国市场。
             创业十年，小家伙创造了举世瞩目的成就，市场迅速成长。<br />
        <p>1999年，公司研究发明了实用新型专利——“旋转式吸管瓶盖”。该专利直接用于果奶、AD钙奶上，
        产品上市不到半年，以其“不用吸管就能喝”的独特饮用方式引爆整个行业。<br />
        <p>1999年至2002年公司为了保护自己的知识产权，“旋转式吸管瓶盖”进行了艰难的维权行动，
        并取得完全的胜利。<br />
        <p>2003年公司又推出了彩糖系列产品，其彩糖和果奶的完美组合，属世界首创。<br />
        <p>2008年公司继续秉承创新理念，推出“小家伙小馒头维奶”，凭借“吃吃馒头，喝喝奶，
        能当点心的小馒头维奶”口号，一举打入市场，赢得消费者的强烈关注和喜爱。此外，
        小家伙瓶装饮用水经过多年的发展，已占据较大的市场份额，其中纯之恋薄荷味饮用
        水以其独特的薄荷口味更是吸引了消费者的眼球，成为公司又一主打产品。<br />
        <p>到目前，小家伙公司拥有浙江、湖北、山东三大生产基地，并于2007年7月成立了华东、
        华中、华北等三个营销部。<br />
        <p>根据公司战略发展规划，小家伙公司正按照既定目标，为“争创世界知名品牌做百年
        企业”而努力奋斗！
       		 </div>
    
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
全国统一服务电话：400-600-0404<br/>[<a href="<%=path %>/table/login.jsp" >管理员入口</a>]</font></center>  
</div>
</body>
</html>



