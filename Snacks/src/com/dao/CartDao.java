package com.dao;

import java.util.List;
import com.models.Cart;

public interface CartDao {
	public boolean addCart(Cart cart);//添加产品
	public List<Cart> listCart(int pageNum);//查找购物车中的所有产品
	public List<Cart> selectAll();//查找购物车中的所有品牌（无参数）
	public boolean modifyOneCart(Cart cart);    //修改购物车中的产品
	public boolean deteleOneCart(int id);		//删除产品
	public boolean delete(int gid);		//按产品id删除产品
	public Cart selectOneCart(int id);		//查找一个购物车中的的产品
	public Cart selectOneCartBygid(int gid);		//根据gid查找一个购物车中的的产品
	public List<Cart> selectuCart(int uid);		//查找一个购物车中的的产品
	
	public int calculateAllNum();
}
