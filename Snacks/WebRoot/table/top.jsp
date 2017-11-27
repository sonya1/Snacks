<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'top.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
	padding:0;
	margin:0;
}
.STYLE1 {
	color: #43860c;
	font-size: 12px;
}
-->
</style></head>

<body>
<table width="100%" border="0" cellspacing="0" cellpadding="0" style="table-layout:fixed;">
  <tr>
    <td height="9" style="line-height:9px; background-image:url(<%=path%>/table/images/main_04.gif)"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td height="47" background="<%=path%>/table/images/main_09.gif"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="38" height="47" background="<%=path%>/table/images/main_06.gif">&nbsp;</td>
        <td width="59"><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td height="29" background="<%=path%>/table/images/main_07.gif">&nbsp;</td>
          </tr>
          <tr>
            <td height="9" background="<%=path%>/table/images/main_14.gif"><table width="100%" border="0" cellspacing="0" cellpadding="0" style="table-layout:fixed;">
              <tr>
                <td  style="width:1px;">&nbsp;</td>
                <td ><span class="STYLE1">admin</span></td>
              </tr>
            </table></td>
          </tr>
        </table></td>
        <td width="155" background="<%=path%>/table/images/main_08.gif">&nbsp;</td>
        <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td height="0" valign="bottom"><img src="<%=path%>/table/images/main_12.gif" width="367" height="23" border="0" usemap="#Map" /></td>
          </tr>
        </table></td>
       
      </tr>
    </table></td>
  </tr>
  <tr>
    <td height="5" style="line-height:5px; background-image:url(<%=path%>/table/images/main_18.gif)"><table width="100%" border="0" cellspacing="0" cellpadding="0">
  </tr>
</table>

<!--<map name="Map" id="Map"><area shape="rect" coords="3,1,49,22" href="#" /><area shape="rect" coords="52,2,95,21" href="#" /><area shape="rect" coords="102,2,144,21" href="#" /><area shape="rect" coords="150,1,197,22" href="#" /><area shape="rect" coords="210,2,304,20" href="#" /><area shape="rect" coords="314,1,361,23" href="#" /></map></body>
--></html>

