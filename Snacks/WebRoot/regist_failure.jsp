<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'login.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
	overflow:hidden;
}
.STYLE3 {color: #528311; font-size: 12px; }
.STYLE4 {
	color: #42870a;
	font-size: 12px;
}
.button{
color: #528311;
background:#e6f4d3;
width:50px;
height:22px;
border:0;
cursor:pointer;
}
-->
</style></head>

<body>
<table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0">
 
  <tr>
    <td bgcolor="#e5f6cf"></td>
  </tr>
  <tr>
    <td height="508" background="<%=path %>/table/images/login_03.gif"><table width="862" border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td height="230" >&nbsp;</td>
      </tr>
      <tr>
        <td height="95"><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
           
            <td width="183" background="#e6f4d3"><img src="<%=path %>/table/images/222.png" style="float:right;"/></td>
            <td width="255" height="50" background="#e6f4d3"><font size="+2" color="#666">用户名已存在，请重新注册</td>
         </tr>
         <tr><td>&nbsp;</td></tr>
        </table></td>
      </tr>
      <tr>
        <td height="247" valign="top" ><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
          	<td width="70%">&nbsp;</td>
            <td width="30%" height="60"><a href="<%=path %>/table/qiantai/shou/regist.jsp" class="zhz" style="font-size:18px;color:white;">返回注册</a></div></td>
         </tr>
          <tr>
            <td>&nbsp;</td>
            <td height="30"><table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="44%" height="20">&nbsp;</td>
               
              </tr>
            </table></td>
            <td>&nbsp;</td>
          </tr>
        </table></td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#a2d962">&nbsp;</td>
  </tr>
</table>

<map name="Map"><area shape="rect" coords="3,3,36,19" href="#"><area shape="rect" coords="40,3,78,18" href="#"></map>
</form></body>
</html>

