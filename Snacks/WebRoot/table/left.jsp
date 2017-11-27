<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'left.jsp' starting page</title>
<script type="text/javascript" src="<%=path %>/table/js/jquery.js"></script>
<script type="text/javascript" src="<%=path %>/table/js/chili-1.7.pack.js"></script>
<script type="text/javascript" src="<%=path %>/table/js/jquery.easing.js"></script>
<script type="text/javascript" src="<%=path %>/table/js/jquery.dimensions.js"></script>
<script type="text/javascript" src="<%=path %>/table/js/jquery.accordion.js"></script>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">

  <script language="javascript">
	jQuery().ready(function(){
		jQuery('#navigation').accordion({
			header: '.head',
			navigation1: true, 
			event: 'click',
			fillSpace: true,
			animated: 'bounceslide'
		});
	});
</script>
<style type="text/css">
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}
#navigation {
	margin:0px;
	padding:0px;
	width:147px;
}
#navigation a.head {
	cursor:pointer;
	background:url(<%=path%>/table/<%=path%>/table/images/main_34.gif) no-repeat scroll;
	display:block;
	font-weight:bold;
	margin:0px;
	padding:5px 0 5px;
	text-align:center;
	font-size:12px;
	text-decoration:none;
}
#navigation ul {
	border-width:0px;
	margin:0px;
	padding:0px;
	text-indent:0px;
}
#navigation li {
	list-style:none; display:inline;
}
#navigation li li a {
	display:block;
	font-size:12px;
	text-decoration: none;
	text-align:center;
	padding:3px;
	TEXT-DECORATION: none
}
.STYLE2 {color: #43860c; font-size: 12px; }
a:link {font-size:12px; text-decoration:none; color:#43860c;}
a:visited {font-size:12px; text-decoration:none; color:#43860c;}
</style>
</head>

<body >
<table width="177" height="93%" border="0" cellpadding="0" cellspacing="0" >
  <tr >
    <td valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0" style="table-layout:fixed">
      <tr>
        <td height="26" background="<%=path%>/table/images/main_21.gif">&nbsp;</td>
      </tr>
    <td></td>
  </tr>
      <tr>
        <td  style="line-height:4px; background:url(<%=path%>/table/images/main_38.gif)">&nbsp;</td>
      </tr>
    </table>
<ul id="navigation">
       
         <li> <a class="head" target="rightFrame">用户信息管理</a>
          <ul>
  	  <li><a href="<%=path %>/user/user_list" target="I1"><span class="STYLE1">用户管理</span></a></li>
      <li><a href="<%=path %>/cart/cart_list" target="I1"><span class="STYLE1">购物车管理</span></a></li>
      <li><a href="<%=path %>/orders/orders_list" target="I1"><span class="STYLE1">订单管理</span></a></li>
      <li><a href="<%=path %>/news/news_list" target="I1"><span class="STYLE1">公告管理</span></a></li>
      </ul></li>
     <li> <a class="head" target="rightFrame">食品信息管理</a>
            <ul>
          		<li><a href="<%=path %>/type/type_list" target="I1"><span class="STYLE1">食品类型管理</span></a></li>
          		<li><a href="<%=path %>/goods/goods_list" target="I1"><span class="STYLE1">食品管理</span></a></li>
      	 	</ul>
        	
     <li><a class="head">版权信息</a>
      <ul>
        <li><a href="<%=path %>/table/qiantai/index.jsp" target="_blank"><span class="STYLE1">前台</span></a></li>
      </ul>
    </li>
  </ul>
  </td>
  </tr>
  </table>
</body>
</html>

