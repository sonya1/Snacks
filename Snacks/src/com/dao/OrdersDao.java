package com.dao;

import java.util.List;

import com.models.Orders;


public interface OrdersDao {
	public boolean addOrder(Orders order);//添加产品
	public List<Orders> listOrder(int pageNum);//查找订单中的所有产品
	public List<Orders> selectAll();//查找订单中的所有品牌（无参数）
	public boolean modifyOneOrder(Orders order);    //修改订单中的产品
	public boolean deteleOneOrder(int id);		//删除产品
	public Orders selectOneOrder(int id);		//查找一个订单中的的产品
	
	public int calculateAllNum();
	public List<Orders> selectuOrders(int uid) ;
}
