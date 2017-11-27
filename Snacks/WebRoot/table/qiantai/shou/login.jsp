<%@ page language="java" import="java.util.*" pageEncoding="utf8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>嘛嘛零食-登录</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link type="text/css" rel="stylesheet" href="<%=path %>/table/qiantai/styles/index.css" />
	<link type="text/css" rel="stylesheet" href="<%=path %>/table/qiantai/styles/login.css" />

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
            </ul>
              
        </div>
    </div>
</div>




<div class="content">
	<div class="left">
		<h1></h1>
        <form action="<%=path %>/user/user_login" method="post">
        	<font>账号：</font><input type="text" placeholder="注册时使用的邮箱或昵称" class="name" name="username"/><br />
            <font>密码：</font><input type="password" class="psw" name="password"/><br />
            <input type="submit" value="登&nbsp;录" class="login"/>
        </form>
	</div>
    <div class="right">
    <p>还没有嘛嘛账号&nbsp;&nbsp;<a href="<%=path %>/table/qiantai/shou/regist.jsp" style="color:#f60">立即注册</a></p><br />
    <p style="font-size:13px;">您还可以用以下方式直接登录:</p><br />
    <ul class="ul1">
    	<li class="sina"></li>
        <li class="qq"></li>
        <li class="taobao"></li>
        <li class="renren"></li>
        <li class="wangyi"></li>
        <li class="weibo"></li>
        <li class="douban"></li>
        <li class="baidu"></li>
    </ul>
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