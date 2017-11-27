package com.dao.impl;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.dao.CartDao;
import com.models.Cart;
import com.untils.Constants;
import com.untils.JDBCUtil;

public class CartDaoImpl implements CartDao{

	public boolean addCart(Cart cart) {		
		Connection conn = JDBCUtil.getConnection();
		String sql = "insert into cart(date,uid,gid,count,price)values(?,?,?,?,?)";
		int n = JDBCUtil.executeUpdate(conn, sql,new Object[]{cart.getDate(),cart.getUid(),cart.getGid(),cart.getCount(),cart.getPrice()});
		JDBCUtil.free(null, null, conn);
		if(n>0){
			return  true;
		}
		return  false;
	}

	public int calculateAllNum() {
		Connection conn=JDBCUtil.getConnection();
		String sql="select * from cart";
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
	
	public boolean deteleOneCart(int id) {		//ɾ���Ʒ
		Connection conn=JDBCUtil.getConnection();
		String sql="delete from cart where id=?";
		int n=JDBCUtil.executeUpdate(conn, sql, new Object[]{id});
		JDBCUtil.free(null, null, conn);
		if(n>0){ 	
			return true;
		}
		return false;
	}

	public List<Cart> listCart(int pageNum) {		//���ҹ��ﳵ�е����в�Ʒ
		Connection conn=JDBCUtil.getConnection();
		String sql="select * from cart limit ?,?";
		ResultSet rs=JDBCUtil.executeSelect(conn, sql, new Object[]{pageNum*Constants.PAGESIZE,Constants.PAGESIZE});
		List<Cart> list=new ArrayList<Cart>();
		try{
			while(rs.next()){
				Cart cart=new Cart();
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

	public boolean modifyOneCart(Cart cart) {		//�޸Ĺ��ﳵ�еĲ�Ʒ
		Connection conn = JDBCUtil.getConnection();
		String sql = "update cart set uid=?,gid=?,cout=?,date=? where id=?";
		int n = JDBCUtil.executeUpdate(conn, sql, new Object[]{cart.getUid(),cart.getGid(),cart.getCount(),cart.getDate(),cart.getId()});
		JDBCUtil.free(null, null, conn);
		if(n>0){
			return true;
		}
		return false;
	}

	public List<Cart> selectAll() {		//���ҹ��ﳵ�е�����Ʒ�ƣ��޲���
		Connection conn=JDBCUtil.getConnection();
		String sql="select * from cart";
		ResultSet rs=JDBCUtil.executeSelect(conn, sql, new Object[]{});
		List<Cart> list=new ArrayList<Cart>();
		try{
			while(rs.next()){
				Cart cart=new Cart();
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

	public Cart selectOneCart(int id) {		//����һ�����ﳵ�еĵĲ�Ʒ
		Connection conn=JDBCUtil.getConnection();
		String sql = "select * from cart where gid=?";
		ResultSet rs = JDBCUtil.executeSelect(conn, sql, new Object[]{id});
		Cart cart = new Cart();
		try{
			if(rs.next()){
				cart.setId(rs.getInt(1));
				cart.setDate(rs.getDate(2));
				cart.setUid(rs.getInt(3));
				cart.setGid(rs.getInt(4));
				cart.setCount(rs.getInt(5));
				cart.setPrice(rs.getInt(6));
			}
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			JDBCUtil.free(rs, null, conn);
		}
		return cart;
	}

	public List<Cart> selectuCart(int uid) {
		Connection conn=JDBCUtil.getConnection();
		String sql = "select * from cart where uid=?";
		ResultSet rs = JDBCUtil.executeSelect(conn, sql, new Object[]{uid});
		List<Cart> list=new ArrayList<Cart>();
		try{
			while(rs.next()){
				Cart cart=new Cart();
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

	public boolean delete(int gid) {
		Connection conn=JDBCUtil.getConnection();
		String sql="delete from cart where gid=?";
		int n=JDBCUtil.executeUpdate(conn, sql, new Object[]{gid});
		JDBCUtil.free(null, null, conn);
		if(n>0){ 	
			return true;
		}
		return false;
	}

	
	public Cart selectOneCartBygid(int gid) {
		Connection conn=JDBCUtil.getConnection();
		String sql = "select * from cart where gid=?";
		ResultSet rs = JDBCUtil.executeSelect(conn, sql, new Object[]{gid});
		Cart cart = new Cart();
		try{
			if(rs.next()){
				cart.setId(rs.getInt(1));
				cart.setDate(rs.getDate(2));
				cart.setUid(rs.getInt(3));
				cart.setGid(rs.getInt(4));
				cart.setCount(rs.getInt(5));
				cart.setPrice(rs.getInt(6));
			}
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			JDBCUtil.free(rs, null, conn);
		}
		return cart;
	}
	
}
