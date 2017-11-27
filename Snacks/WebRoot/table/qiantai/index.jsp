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
    
    <title>嘛嘛零食网</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" href="<%=path %>/table/qiantai/styles/index.css" type="text/css"/>
	<link type="text/css" rel="stylesheet" href="<%=path %>/table/qiantai/styles/css.css" />
	<script src="<%=path %>/table/qiantai/js/jquery.js" type="text/javascript"></script>

  </head>
  
 <body>
<div class="head">
	<div class="header">
        <table border="1" cellpadding="10px" class="t1">
            <tr>
                <td><a href="#">微博登录</a></td>
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
                <li class="active1"><a href="<%=path %>/table/qiantai/index.jsp">首页</a></li>
                <li><a href="<%=path %>/table/qiantai/shou/suoyou.jsp">所有零食</a></li>
                <li><a href="<%=path %>/table/qiantai/shou/jieshao.jsp">公司介绍</a></li>
                <li><a href="<%=path %>/table/qiantai/shou/gonggao.jsp">公告中心</a></li>
                <li><a href="<%=path %>/table/qiantai/shou/rongyu.jsp">荣誉资质</a></li>
                <li><a href="<%=path %>/table/qiantai/shou/us.jsp">关于我们</a></li>
 
 
                
                <div class="search">
                    <input type="text" placeholder="按类别搜零食……" class="inp"/>
                    <input type="submit" class="button" value=""/>
                </div>
            </ul>
              
        </div>
    </div>
</div>




<div class="content">
	<div class="left">
    	<div class="menu">
        	<h2>所有零食分类</h2>
            <ul>
            
            <%
            	TypeDao typeDao = new TypeDaoImpl();
            	List<Type> list = typeDao.selectAll();
            	for(int i=0;i<list.size();i++){
            %>	
            <li><a href="<%=path %>/table/qiantai/nei/lei.jsp?id=<%=list.get(i).getId() %>"><%=list.get(i).getName() %></a></li>
            	
            <% } %>
            </ul>
        </div>
        
    	<div class="inform menu">
        	<h2>小铺公告</h2>
            <ul>
            <marquee onMouseOver="this.stop()" onMouseOut="this.start()" direction="up"  scrollamount="3" >
            <%
            	NewsDao newsDao = new NewsDaoImpl();
            	List<News> list1 = newsDao.selectAll();
            	for(int i=0;i<list1.size();i++){
            		News news = list1.get(i);
            %>
            	<li><a href="<%=path %>/table/qiantai/nei/newsdetails.jsp?id=<%=news.getId() %>"><%=news.getTitle() %></a></li>
            <% }%>	
           </marquee>
            </ul>
        </div>
        
        <div class="jiang">
            <p class="try">试一试!</p><p class="zhuanpan">嘛嘛零食抽奖大转盘&nbsp;<img src="<%=path %>/table/qiantai/img/zhua.png" /></p>
            <ul class="choujiang">
            <table cellspacing="0" cellpadding="0" border="0">
            <tr height="30px"><td>精品小店免费试吃&nbsp;&nbsp;&nbsp;&nbsp;</td><td >正在进行<br/></td></tr>
            <tr height="30px"><td>手机话费充值</td><td>正在进行</td></tr>
            <tr height="30px"><td>苹果5S </td><td>抽奖结果 </td></tr>
            <tr height="30px"><td>小野发艺连锁</td><td>抽奖结果 </td></tr>
            <tr height="30px"><td>苹果5S </td><td>抽奖结果 </td></tr>
           </table>
            </ul>
		</div>


    </div>
    
    <div class="right">
               <div id="confirm"></div>
               <!-- 区块一开始 -->
            <div class="content1">
                <div class="top"></div>
                <div class="main cl">
                    <!-- FLASH切换图开始 -->
                    <div class="l_flash_pic">
                        <div id="ifocus">
                            <div id="ifocus_pic">
                                <div id="ifocus_piclist" style="left:0; top:0;">
                                    <ul>
                                        <li><img src="<%=path %>/table/qiantai/img/01.png" /></li>
                                        <li><img src="<%=path %>/table/qiantai/img/02.png"  /></li>
                                        <li><img src="<%=path %>/table/qiantai/img/03.png" /></li>
                                        <li><img src="<%=path %>/table/qiantai/img/04.png" /></li>
                                    </ul>
                                </div>
                                <div id="ifocus_opdiv"></div>
                                <div id="ifocus_tx">
                                    <ul>
                                        <li class="current">好丽友薯片，好丽友旗舰店</li>
                                        <li class="normal">【百草味】坚果零食干果</li>
                                        <li class="normal">可可新岛零食干果</li>
                                        <li class="normal">雅果坚果开心果</li>
                                    </ul>
                                </div>
                            </div>
                           
                    <!-- FLASH切换图结束 -->
                </div>
            </div>
      
      <div class="goods">
      <h2>热销食品</h2>
      	<ul>
        	
            
            <%
            	GoodsDao goodsDao = new GoodsDaoImpl();
            	Goods goods = new Goods();
            	List<Goods> list2 = goodsDao.selectAllBysales();
            	int j = list2.size();
            	int i = (j<8 ?j:8);
            	for(int q=0;q<i;q++){
            		goods = list2.get(q);
            		
            %>
            <a href="<%=path %>/table/qiantai/nei/gooddetails.jsp?id=<%=goods.getId() %>">
                <li>
                    <img src="<%=path %>/<%=goods.getPicture()%>" />
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
 <script type="text/javascript">
    $(document).ready(function() {
		   var currentIndex = 0;
            var DEMO; //函数对象
            var currentID = 0; //取得鼠标下方的对象ID
            var pictureID = 0; //索引ID
            $("#ifocus_piclist li").eq(0).show(); //默认
            autoScroll();
            $("#ifocus_btn li").hover(function() {
                StopScrolll();
                $("#ifocus_btn li").removeClass("current")//所有的li去掉当前的样式加上正常的样式
                $(this).addClass("current"); //而本身则加上当前的样式去掉正常的样式
                currentID = $(this).attr("id"); //取当前元素的ID
                pictureID = currentID.substring(currentID.length - 1); //取最后一个字符
                $("#ifocus_piclist li").eq(pictureID).fadeIn("slow"); //本身显示
                $("#ifocus_piclist li").not($("#ifocus_piclist li")[pictureID]).hide(); //除了自身别的全部隐藏
                $("#ifocus_tx li").hide();
                $("#ifocus_tx li").eq(pictureID).show();

            }, function() {
                //当鼠标离开对象的时候获得当前的对象的ID以便能在启动自动时与其同步
                currentID = $(this).attr("id"); //取当前元素的ID
                pictureID = currentID.substring(currentID.length - 1); //取最后一个字符
                currentIndex = pictureID;
                autoScroll();
            });
            //自动滚动
            function autoScroll() {
                $("#ifocus_btn li:last").removeClass("current");
                $("#ifocus_tx li:last").hide();
                $("#ifocus_btn li").eq(currentIndex).addClass("current");
                $("#ifocus_btn li").eq(currentIndex - 1).removeClass("current");
                $("#ifocus_tx li").eq(currentIndex).show();
                $("#ifocus_tx li").eq(currentIndex - 1).hide();
                $("#ifocus_piclist li").eq(currentIndex).fadeIn("slow");
                $("#ifocus_piclist li").eq(currentIndex - 1).hide();
                currentIndex++; currentIndex = currentIndex >= 4 ? 0 : currentIndex;
                DEMO = setTimeout(autoScroll, 2000);
            }
            function StopScrolll()//当鼠标移动到对象上面的时候停止自动滚动
            {
                clearTimeout(DEMO);
            }
	});
    </script>
