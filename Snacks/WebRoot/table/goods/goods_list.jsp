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

<link href="<%=path %>/table/qiantai/styles/houtai.css" rel="stylesheet" type="text/css">
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
        <td width="1101" background="../<%=path%>/table/tab/images/tab_05.gif"><img src="../<%=path%>/table/tab/images/311.gif" width="16" height="16" /> <span class="STYLE4">食品列表<s:property value="message" escape="false"/></span> </td> 
        <td width="281" background="../<%=path%>/table/tab/images/tab_05.gif"><table border="0" align="right" cellpadding="0" cellspacing="0">
            <tr>
              <td width="100"><table width="90%" border="0" cellpadding="0" cellspacing="0">
                  <tr>
                    <td class="STYLE1"><img src="../<%=path%>/table/tab/images/001.gif" width="14" height="14" /></td>
                    <td class="STYLE1"><div align="center"> <a href="<%=path %>/table/goods/goods_input.jsp">  添加食品</a></div></td>
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
            <td width="10%" height="26" background="../<%=path%>/table/tab/images/tab_14.gif" class="STYLE1"><div align="center" class="STYLE2 STYLE1">食品名称</div></td>
            <td width="16%" height="18" background="../<%=path%>/table/tab/images/tab_14.gif" class="STYLE1"><div align="center" class="STYLE2 STYLE1">食品图片</div></td>
            <td width="10%" height="18" background="../<%=path%>/table/tab/images/tab_14.gif" class="STYLE1"><div align="center" class="STYLE2 STYLE1">食品价格</div></td>
            <td width="20%" height="18" background="../<%=path%>/table/tab/images/tab_14.gif" class="STYLE1"><div align="center" class="STYLE2 STYLE1">食品细节</div></td>
            <td width="10%" height="18" background="../<%=path%>/table/tab/images/tab_14.gif" class="STYLE1"><div align="center" class="STYLE2 STYLE1">食品总量</div></td>
            <td width="10%" height="18" background="../<%=path%>/table/tab/images/tab_14.gif" class="STYLE1"><div align="center" class="STYLE2 STYLE1">食品销量</div></td>
            <td width="10%" height="18" background="../<%=path%>/table/tab/images/tab_14.gif" class="STYLE1"><div align="center" class="STYLE2 STYLE1">食品类型</div></td>
            <td width="7%" height="18" background="../<%=path%>/table/tab/images/tab_14.gif" class="STYLE1"><div align="center" class="STYLE2">编辑</div></td>
            <td width="7%" height="18" background="../<%=path%>/table/tab/images/tab_14.gif" class="STYLE1"><div align="center" class="STYLE2">删除</div></td>
          </tr>
          
          <s:iterator value="goodss" status="goods">
          <tr>
            <td height="18" bgcolor="#FFFFFF"><div align="center" class="STYLE2 STYLE1"><s:property value="goodss[#goods.index].name" /></div></td>
            <td height="18" bgcolor="#FFFFFF"><div align="center" class="STYLE2 STYLE1"><img width="150px" height="100px" src='<%=path %><s:property value="goodss[#goods.index].picture"/>'/></div></td>
            <td height="18" bgcolor="#FFFFFF"><div align="center" class="STYLE2 STYLE1"><s:property value="goodss[#goods.index].price" /></div></td>
            <td height="18" bgcolor="#FFFFFF"><div align="center" class="STYLE2 STYLE1"><s:property value="goodss[#goods.index].details" /></div></td>
            <td height="18" bgcolor="#FFFFFF"><div align="center" class="STYLE2 STYLE1"><s:property value="goodss[#goods.index].total"/></div></td>
            <td height="18" bgcolor="#FFFFFF"><div align="center" class="STYLE2 STYLE1"><s:property value="goodss[#goods.index].sales" /></div></td>
            <td height="18" bgcolor="#FFFFFF"><div align="center" class="STYLE2 STYLE1"><s:property value="goodss[#goods.index].tid" /></div></td>
            <td height="18" bgcolor="#FFFFFF"><div align="center"><img src="../<%=path%>/table/tab/images/037.gif" width="9" height="9" />
            
            <span class="STYLE1"> [</span><a href='<%=path%>/goods/goods_selectOne?id=<s:property value="goodss[#goods.index].id" />'>编辑</a><span class="STYLE1">]</span></a></div></td>
            <td height="18" bgcolor="#FFFFFF"><div align="center"><span class="STYLE2"><img src="../<%=path%>/table/tab/images/010.gif" width="9" height="9" /> </span><span class="STYLE1">[</span><a href='<%=path%>/goods/goods_deleteGoods?id=<s:property value="goodss[#goods.index].id" />'>删除</a><span class="STYLE1">]</span></div></td>
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


<%
 	int pageNum = Integer.parseInt(request.getAttribute("pageNum").toString());
    int allPageNum = Integer.parseInt(request.getAttribute("allPageNum").toString());
     %>
	<div class="aa">
     <div class="bb">
       <table class="cc">
       <tr>
		    <td width="40px">
		    <s:if test="pageNum<=0">
		   首页
		    </s:if>
		    <s:else>
		    <a href="<%=path%>/goods/goods_list?pageNum=0">首 页</a>
		    </s:else>
		    </td>
		    <td width="40px">
		    <s:if test="pageNum<=0">
		   上一页
		    </s:if>
		    <s:else>
		    <a href="<%=path%>/goods/goods_list?pageNum=<%=pageNum-1%>">上一页</a>
		    </s:else>
		    </td>
		    <td width="40px">
		    <s:if test="pageNum >= allPageNum">
		    下一页
		    </s:if>
		    <s:else>
		    <a href="<%=path%>/goods/goods_list?pageNum=<%=pageNum+1%>">下一页</a>
		    </s:else>
		    </td>
		    <td width="40px">
		    <s:if test="pageNum>=allPageNum">
		   尾页
		    </s:if>
		    <s:else>
		    <a href="<%=path%>/goods/goods_list?pageNum=<s:property value="allPageNum" />">尾  页</a>
		    </s:else>
		    </td>
		    <td width="80px">
		    <form action="<%=path %>/goods/goods_list" method="post" name="searchNum" >
		    <%int i = pageNum+1;%>
		    <%int j = allPageNum+1;%>
		    <select name="pageNum" onChange="jump()">
		    	<% for(int k =1;k<=j;k++){%><option value="<%=k-1 %>" <% if(k==i){%>selected="selected"<%} %>><%=k %></option><%} %> 
		    </select>
		    </form>
		    </td>
		    </tr>
		   </table>
		   </div>
    </div>
</body>
</html>
