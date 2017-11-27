<%@ page language="java" import="java.util.*,com.dao.impl.*,com.dao.*,com.models.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'user_list.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<script language="JavaScript">
	function jump(){
		document.searchNum.submit();
	}
</script>
	<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}
.STYLE1 {font-size: 12px}
.STYLE4 {
	font-size: 12px;
	color: #1F4A65;
	font-weight: bold;
}

a:link {
	font-size: 12px;
	color: #06482a;
	text-decoration: none;

}
a:visited {
	font-size: 12px;
	color: #06482a;
	text-decoration: none;
}
a:hover {
	font-size: 12px;
	color: #FF0000;
	text-decoration: underline;
}
a:active {
	font-size: 12px;
	color: #FF0000;
	text-decoration: none;
}
.STYLE7 {font-size: 12}
.sub{ width:90px; height:20px; color: #528311;}
-->
</style>

<script>
var  highlightcolor='#eafcd5';
//此处clickcolor只能用win系统颜色代码才能成功,如果用#xxxxxx的代码就不行,还没搞清楚为什么:(
var  clickcolor='#51b2f6';
function  changeto(){
source=event.srcElement;
if  (source.tagName=="TR"||source.tagName=="TABLE")
return;
while(source.tagName!="TD")
source=source.parentElement;
source=source.parentElement;
cs  =  source.children;
//alert(cs.length);
if  (cs[1].style.backgroundColor!=highlightcolor&&source.id!="nc"&&cs[1].style.backgroundColor!=clickcolor)
for(i=0;i<cs.length;i++){
	cs[i].style.backgroundColor=highlightcolor;
}
}

function  changeback(){
if  (event.fromElement.contains(event.toElement)||source.contains(event.toElement)||source.id=="nc")
return
if  (event.toElement!=source&&cs[1].style.backgroundColor!=clickcolor)
//source.style.backgroundColor=originalcolor
for(i=0;i<cs.length;i++){
	cs[i].style.backgroundColor="";
}
}

function  clickto(){
source=event.srcElement;
if  (source.tagName=="TR"||source.tagName=="TABLE")
return;
while(source.tagName!="TD")
source=source.parentElement;
source=source.parentElement;
cs  =  source.children;
//alert(cs.length);
if  (cs[1].style.backgroundColor!=clickcolor&&source.id!="nc")
for(i=0;i<cs.length;i++){
	cs[i].style.backgroundColor=clickcolor;
}
else
for(i=0;i<cs.length;i++){
	cs[i].style.backgroundColor="";
}
}
</script>
</head>

<body>
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="30"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="15" height="30"><img src="../<%=path%>/table/tab/images/tab_03.gif" width="15" height="30" /></td>
        <td width="1101" background="../<%=path%>/table/tab/images/tab_05.gif"><img src="../<%=path%>/table/tab/images/311.gif" width="16" height="16" /> 
        
        <span class="STYLE4">
		  	<s:if test="name==null">
		    <b>添加食品类型</b>
		    </s:if>
		    <s:else>
		    <b>编辑食品类型</b></s:else>
		  	</span> </td> 
        </tr>
    </table></td>
  </tr>
  <tr>
    <td>
    <form <s:if test='name==null'> action="<%=path %>/type/type_add"</s:if>
       <s:else>action="<%= path %>/type/type_update"</s:else> 
        method="post"  enctype="multipart/form-data"> 
     
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="9" background="../<%=path%>/table/tab/images/tab_12.gif">&nbsp;</td>
        <td bgcolor="#f3ffe3"><table width="99%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#c0de98" onmouseover="changeto()"  onmouseout="changeback()">
          <tr>
            <td width="100%" height="18" background="../<%=path%>/table/tab/images/tab_14.gif" class="STYLE1"><div class="STYLE2 STYLE1" style="float:left; margin-left:50px; font-size:15px; line-hight:18px;">食品类型名称:&nbsp;</div><input type="text" name="name" value="<s:property value="name"/>"/></td>
         </tr>
          <tr >
            <td width="100%" height="28" background="../<%=path%>/table/tab/images/tab_14.gif" class="STYLE1"><div align="left" class="STYLE2 STYLE1" style="margin-left:130px;"><input type="hidden" name="id" value="<s:property value="id"/>">
			    <s:if test="name == null">
			    <input type="submit" value="添加食品类型" class="sub"/>
			    </s:if>
			    <s:else>
			    <input type="submit" value="提交" class="sub"/>    
			    </s:else>
			    <input type="reset" value="重置" class="sub"/>
  				</center></div></td>
           	</tr>
       
        </table></td>
        <td width="9" background="../<%=path%>/table/tab/images/tab_16.gif">&nbsp;</td>
      </tr>
    </table></td>
  </tr>
 
    </table></td>
  </tr>
</table>
</body>
</html>
