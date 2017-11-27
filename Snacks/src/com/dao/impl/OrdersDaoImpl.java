package com.dao.impl;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.dao.OrdersDao;
import com.models.Cart;
import com.models.Orders;
import com.untils.Constants;
import com.untils.JDBCUtil;

public class OrdersDaoImpl implements OrdersDao{

	public boolean addOrder(Orders order) {		
		Connection conn = JDBCUtil.getConnection();
		String sql = "insert into orders(date,uid,gid,count,price)values(?,?,?,?,?)";
		int n = JDBCUtil.executeUpdate(conn, sql,new Object[]{order.getDate(),order.getUid(),order.getGid(),order.getCount(),order.getPrice()});
		JDBCUtil.free(null, null, conn);
		if(n>0){
			return  true;
		}
		return  false;
	}

	public int calculateAllNum() {
		Connection conn=JDBCUtil.getConnection();
		String sql="select * from orders";
		ResultSet rs=JDBCUtil.executeSelect(conn, sql, new Object[]{});
		int allPageNum=0;
		try{
			while(rs.next()){
				allPageNum++;
			}
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			JDBCUtil.free(rs, null, conn);
		}
		if(allPageNum%Constants.PAGESIZE==0){
			return allPageNum/Constants.PAGESIZE-1;
		}else{
			return allPageNum/Constants.PAGESIZE;
		}
	}

	public boolean deteleOneOrder(int id) {
		Connection conn=JDBCUtil.getConnection();
		String sql="delete from orders where id=?";
		int n=JDBCUtil.executeUpdate(conn, sql, new Object[]{id});
		JDBCUtil.free(null, null, conn);
		if(n>0){ 	
			return true;
		}
		return false;
	}

	public List<Orders> listOrder(int pageNum) {
System.out.println("in the listOrder()...111");
		Connection conn = JDBCUtil.getConnection();
		String sql = "select * from orders limit ?,?";
		ResultSet rs=JDBCUtil.executeSelect(conn, sql, new Object[]{pageNum*Constants.PAGESIZE,Constants.PAGESIZE});
		List<Orders> list=new ArrayList<Orders>();
		try{
			while(rs.next()){
System.out.println("in the listOrder()...222");
				Orders order=new Orders();
				order.setId(rs.getInt(1));
				order.setDate(rs.getDate(2));
				order.setUid(rs.getInt(3));
				order.setGid(rs.getInt(4));
				order.setCount(rs.getInt(5));
				order.setPrice(rs.getInt(6));
				list.add(order);
			}
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			JDBCUtil.free(rs, null, conn);
		}
		return list;
	}

	public boolean modifyOneOrder(Orders order) {	
		Connection conn = JDBCUtil.getConnection();
		String sql = "update orders set date=?,uid=?,gid=?,count=?,price=? where id=?";
		int n = JDBCUtil.executeUpdate(conn, sql, new Object[]{order.getDate(),order.getUid(),order.getGid(),order.getCount(),order.getPrice(),order.getId()});
		JDBCUtil.free(null, null, conn);
		if(n>0){
			return true;
		}
		return false;
	}

	public List<Orders> selectAll() {
		Connection conn=JDBCUtil.getConnection();
		String sql="select * from orders";
		ResultSet rs=JDBCUtil.executeSelect(conn, sql, new Object[]{});
		List<Orders> list=new ArrayList<Orders>();
		try{
			while(rs.next()){
				Orders order=new Orders();
				order.setId(rs.getInt(1));
				order.setDate(rs.getDate(2));
				order.setUid(rs.getInt(3));
				order.setGid(rs.getInt(4));
				order.setCount(rs.getInt(5));
				order.setPrice(rs.getInt(6));
				list.add(order);
			}
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			JDBCUtil.free(rs, null, conn);
		}
		return list;
	}

	public Orders selectOneOrder(int id) {
		Connection conn=JDBCUtil.getConnection();
		String sql = "select * from orders where id=?";
		ResultSet rs = JDBCUtil.executeSelect(conn, sql, new Object[]{id});
		Orders order=new Orders();
		try{
			if(rs.next()){
				order.setId(rs.getInt(1));
				order.setDate(rs.getDate(2));
				order.setUid(rs.getInt(3));
				order.setGid(rs.getInt(4));
				order.setCount(rs.getInt(5));
				order.setPrice(rs.getInt(6));
			}
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			JDBCUtil.free(rs, null, conn);
		}
		return order;
	}
	
	public List<Orders> selectuOrders(int uid) {
		Connection conn=JDBCUtil.getConnection();
		String sql = "select * from orders where uid=?";
		ResultSet rs = JDBCUtil.executeSelect(conn, sql, new Object[]{uid});
		List<Orders> list=new ArrayList<Orders>();
		try{
			while(rs.next()){
				Orders cart=new Orders();
				cart.setId(rs.getInt(1));
				cart.setDate(rs.getDate(2));
				cart.setUid(rs.getInt(3));
				cart.setGid(rs.getInt(4));
				cart.setCount(rs.getInt(5));
				cart.setPrice(rs.getInt(6));
				list.add(cart);
			}
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			JDBCUtil.free(rs, null, conn);
		}
		return list;
	}
}
