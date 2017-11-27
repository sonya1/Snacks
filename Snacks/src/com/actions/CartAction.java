package com.actions;

import java.util.Date;
import java.util.List;

import com.dao.CartDao;
import com.dao.GoodsDao;
import com.dao.UserDao;
import com.dao.impl.CartDaoImpl;
import com.dao.impl.GoodsDaoImpl;
import com.dao.impl.UserDaoImpl;
import com.models.Cart;
import com.models.Goods;
import com.models.User;

public class CartAction {//购物车action类
	private int id;
	private Date date;//订单时间
	private int uid;//用户id
	private int gid;//产品id
	private int count;//购买数量
	private int price;//产品总额
	
	private int danjia;
	private int shuliang;
	
	public int getDanjia() {
		return danjia;
	}

	public void setDanjia(int danjia) {
		this.danjia = danjia;
	}

	public int getShuliang() {
		return shuliang;
	}

	public void setShuliang(int shuliang) {
		this.shuliang = shuliang;
	}

	private int pageNum;
	private int allPageNum;
	private int searchNum;
	private List<Cart> carts;
	private Cart cart = new Cart();
	private CartDao cartdao = new CartDaoImpl();

	UserDao userdao=new UserDaoImpl();
	User u = new User();
	GoodsDao goodsdao=new GoodsDaoImpl();
	Goods g = new Goods();
	
	public String add(){         //添加产品
		Cart ct = new Cart();
		cart.setUid(uid);
		cart.setGid(gid);
		if(uid==0){
			 return "Failure";
		}
		u = userdao.select(uid);
		g = goodsdao.selectOneGoods(gid);
		cart.setCount(shuliang);
		cart.setPrice(danjia*shuliang);
		cart.setDate(new Date());
		boolean n = cartdao.addCart(cart);
		if(n){
			return "addSuccess";
			}
		  return "addFailure";
	}
	
	public String list(){        //查找所有
		if(searchNum>0){
			pageNum = searchNum-1;
		}
		carts = cartdao.listCart(pageNum);
		allPageNum = cartdao.calculateAllNum();
		return "list";
	}
	
	public String list1(){        //查找所有  ,,前台显示
		carts = cartdao.selectAll();
		return "list1";
	}
	public String list2(){        //查找所有  ,,后台显示
		carts = cartdao.selectAll();
		return "list2";
	}

	
	public String deleteCart(){                //删除
		boolean n = cartdao.deteleOneCart(id);
		  if(n)
			return "Success";
		  else{
			  return "Faliure";
		  }
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getUid() {
		return uid;
	}
	public void setUid(int uid) {
		this.uid = uid;
	}
	public int getGid() {
		return gid;
	}
	public void setGid(int gid) {
		this.gid = gid;
	}

	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public int getPageNum() {
		return pageNum;
	}
	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}
	public int getAllPageNum() {
		return allPageNum;
	}
	public void setAllPageNum(int allPageNum) {
		this.allPageNum = allPageNum;
	}
	public int getSearchNum() {
		return searchNum;
	}
	public void setSearchNum(int searchNum) {
		this.searchNum = searchNum;
	}
	public List<Cart> getCarts() {
		return carts;
	}
	public void setCarts(List<Cart> carts) {
		this.carts = carts;
	}
	public Cart getCart() {
		return cart;
	}
	public void setCart(Cart cart) {
		this.cart = cart;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public CartDao getCartdao() {
		return cartdao;
	}

	public void setCartdao(CartDao cartdao) {
		this.cartdao = cartdao;
	}

	public UserDao getUserdao() {
		return userdao;
	}

	public void setUserdao(UserDao userdao) {
		this.userdao = userdao;
	}

	public User getU() {
		return u;
	}

	public void setU(User u) {
		this.u = u;
	}

	public GoodsDao getGoodsdao() {
		return goodsdao;
	}

	public void setGoodsdao(GoodsDao goodsdao) {
		this.goodsdao = goodsdao;
	}

	public Goods getG() {
		return g;
	}

	public void setG(Goods g) {
		this.g = g;
	}

	
}
