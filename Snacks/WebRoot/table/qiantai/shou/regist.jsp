<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>嘛嘛零食-注册</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" href="<%=path %>/table/qiantai/styles/regist.css" type="text/css"/>

  </head>
  
  <body>
<div class="con">
	<a href="#"><img src="<%=path %>/table/qiantai/img/logo.png" /></a>
    <div class="left">
    <h2>注册嘛嘛零食</h2>
    <form action="<%=path %>/user/user_regist" method="post">
    	<input type="text" placeholder="昵称" class="input" name="username"/>
        <input type="password" placeholder="密码" class="input" name="password"/><br />
         <input type="submit" value="立即注册" /><br />
        <input type="checkbox" id="agree" checked="checked"/>&nbsp;<label for="agree">同意嘛嘛注册条款</label>
    </form>
    </div>
    <div class="right">
    <p>用嘛嘛账号&nbsp;&nbsp;<a href="<%=path %>/table/qiantai/shou/login.jsp">登录</a></p><br />
    <p style="font-size:13px;">您还可以用以下方式直接登录:</p><br />
    <ul>
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
</body>
</html>
