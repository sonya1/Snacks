<%@ page language="java" import="java.util.*,com.models.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib uri="/struts-tags" prefix="s"%>
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
        <td width="1101" background="../<%=path%>/table/tab/images/tab_05.gif"><img src="../<%=path%>/table/tab/images/311.gif" width="16" height="16" /> <span class="STYLE4">公告列表<s:property value="message" escape="false"/></span> </td> 
        <td width="281" background="../<%=path%>/table/tab/images/tab_05.gif"><table border="0" align="right" cellpadding="0" cellspacing="0">
            <tr>
              <td width="100"><table width="90%" border="0" cellpadding="0" cellspacing="0">
                  <tr>
                    <td class="STYLE1"><img src="../<%=path%>/table/tab/images/001.gif" width="14" height="14" /></td>
                    <td class="STYLE1"><div align="center"> <a href="<%=path %>/table/news/news_input.jsp">  添加公告</a></div></td>
                  </tr>
              </table></td>
            </tr>
        </table></td>
        <td width="14"><img src="../<%=path%>/table/tab/images/tab_07.gif" width="14" height="30" /></td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="9" background="../<%=path%>/table/tab/images/tab_12.gif">&nbsp;</td>
        <td bgcolor="#f3ffe3"><table width="99%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#c0de98" onmouseover="changeto()"  onmouseout="changeback()">
          <tr>
            <td width="13%" height="26" background="../<%=path%>/table/tab/images/tab_14.gif" class="STYLE1"><div align="center" class="STYLE2 STYLE1">公告ID</div></td>
            <td width="14%" height="18" background="../<%=path%>/table/tab/images/tab_14.gif" class="STYLE1"><div align="center" class="STYLE2 STYLE1">公告标题</div></td>
            <td width="34%" height="18" background="../<%=path%>/table/tab/images/tab_14.gif" class="STYLE1"><div align="center" class="STYLE2 STYLE1">公告内容</div></td>
            <td width="13%" height="18" background="../<%=path%>/table/tab/images/tab_14.gif" class="STYLE1"><div align="center" class="STYLE2 STYLE1">添加时间</div></td>
            <td width="13%" height="18" background="../<%=path%>/table/tab/images/tab_14.gif" class="STYLE1"><div align="center" class="STYLE2">编辑</div></td>
            <td width="13%" height="18" background="../<%=path%>/table/tab/images/tab_14.gif" class="STYLE1"><div align="center" class="STYLE2">删除</div></td>
          </tr>
          
          <s:iterator value="News" status="news">
          <tr>
            <td height="18" bgcolor="#FFFFFF"><div align="center" class="STYLE2 STYLE1"><s:property value="News[#news.index].id" /></div></td>
            <td height="18" bgcolor="#FFFFFF"><div align="center" class="STYLE2 STYLE1"><s:property value="News[#news.index].title" /></div></td>
            <td height="18" bgcolor="#FFFFFF"><div align="center" class="STYLE2 STYLE1"><s:property value="News[#news.index].content" /></div></td>
            <td height="18" bgcolor="#FFFFFF"><div align="center" class="STYLE2 STYLE1"><s:property value="News[#news.index].date" /></div></td>
            <td height="18" bgcolor="#FFFFFF"><div align="center"><img src="../<%=path%>/table/tab/images/037.gif" width="9" height="9" />
            
            <span class="STYLE1"> [</span><a href='<%=path%>/news/news_input?id=<s:property value="News[#news.index].id" />'>编辑</a><span class="STYLE1">]</span></a></div></td>
            <td height="18" bgcolor="#FFFFFF"><div align="center"><span class="STYLE2"><img src="../<%=path%>/table/tab/images/010.gif" width="9" height="9" /> </span><span class="STYLE1">[</span><a href='<%=path%>/news/news_delete?id=<s:property value="News[#news.index].id" />'>删除</a><span class="STYLE1">]</span></div></td>
          </tr>
          </s:iterator>
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
