package com.actions;

import java.util.Date;
import java.util.List;

import com.dao.GoodsDao;
import com.dao.OrdersDao;
import com.dao.UserDao;
import com.dao.impl.GoodsDaoImpl;
import com.dao.impl.OrdersDaoImpl;
import com.dao.impl.UserDaoImpl;
import com.models.Goods;
import com.models.Orders;
import com.models.User;

public class OrdersAction {
	private int id;
	private Date date;
	private int uid;
	private int gid;
	
	private int count;
	private int price;
	
	private int danjia;
	private int shuliang;
	
	private int pageNum;
	private int allPageNum;
	private int searchNum;
	
	private List<Orders> orders;
	private Orders order = new Orders();
	private OrdersDao orderdao = new OrdersDaoImpl();
	
	private GoodsDao goodsDao = new GoodsDaoImpl();
	private Goods goods = new Goods();

	UserDao userdao=new UserDaoImpl();
	User u = new User();
	GoodsDao goodsdao=new GoodsDaoImpl();
	Goods g = new Goods();
	
	public String add(){         //
		order.setUid(uid);
		order.setGid(gid);
		if(uid==0){
			 return "Failure";
		}
		order.setCount(shuliang);
		
		//食品销量  改变
		goods = goodsDao.selectOneGoods(gid);
		goods.setSales((goods.getSales()+shuliang));
		goodsDao.modifyOneGoods(goods);
		
		
		order.setPrice(danjia*shuliang);
		order.setDate(new Date());
		
		boolean n = orderdao.addOrder(order);
		if(n){
			return "addSuccess";
		}
		  return "addFailure";
	}
	
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

	public String list(){        //
		if(searchNum>0){
			pageNum = searchNum-1;
		}
		orders = orderdao.listOrder(pageNum);
System.out.print("in the list()...." + orders.size());
		allPageNum = orderdao.calculateAllNum();
		return "list";
	}
	
	public String list1(){        //前台
		orders = orderdao.selectAll();
		return "list1";
	}
	
	public String list2(){        //后台
		orders = orderdao.selectAll();
		return "list2";
	}
	

	
	public String deleteOrder(){                //
		boolean n = orderdao.deteleOneOrder(id);
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
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
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
	public List<Orders> getOrders() {
		return orders;
	}
	public void setOrders(List<Orders> orders) {
		this.orders = orders;
	}
	public Orders getOrder() {
		return order;
	}
	public void setOrder(Orders order) {
		this.order = order;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public OrdersDao getOrderdao() {
		return orderdao;
	}

	public void setOrderdao(OrdersDao orderdao) {
		this.orderdao = orderdao;
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
