package com.dao.impl;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.dao.GoodsDao;
import com.models.Goods;
import com.models.Type;
import com.untils.Constants;
import com.untils.JDBCUtil;

public class GoodsDaoImpl implements GoodsDao{

	public boolean addGoods(Goods goods) {	
		Connection conn = JDBCUtil.getConnection();
		String sql = "insert into goods(id,name,picture,price,details,total,sales,tid)values(?,?,?,?,?,?,?,?)";
		int n = JDBCUtil.executeUpdate(conn, sql,new Object[]{goods.getId(),goods.getName(),goods.getPicture(),goods.getPrice(),goods.getDetails(),goods.getTotal(),goods.getSales(),goods.getTid()});
		JDBCUtil.free(null, null, conn);
		if(n>0){
			return  true;
		}
		return  false;
	}

	public int calculateAllNum() {	
		Connection conn=JDBCUtil.getConnection();
		String sql="select * from goods";
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

	public boolean deteleOneGoods(int id) {	//ɾ��һ����Ʒ
		Connection conn=JDBCUtil.getConnection();
		String sql="delete from goods where id=?";
		int n=JDBCUtil.executeUpdate(conn, sql, new Object[]{id});
		JDBCUtil.free(null, null, conn);
		if(n>0){ 	
			return true;
		}
		return false;
	}

	public List<Goods> listGoods(int pageNum) {	//�������в�Ʒ������һ�����ϣ���ҳ����Ϊ����
		Connection conn=JDBCUtil.getConnection();
		String sql="select * from goods limit ?,?";
		ResultSet rs=JDBCUtil.executeSelect(conn, sql, new Object[]{pageNum*Constants.PAGESIZE,Constants.PAGESIZE});
		List<Goods> list=new ArrayList<Goods>();
		try{
			while(rs.next()){
				Goods goods = new Goods();
				goods.setId(rs.getInt(1));
				goods.setName(rs.getString(2));
				goods.setPicture(rs.getString(3));
				goods.setPrice(rs.getInt(4));
				goods.setDetails(rs.getString(5));
				
				goods.setTotal(rs.getInt(6));
				goods.setSales(rs.getInt(7));
				goods.setTid(rs.getInt(8));
				list.add(goods);
			}
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			JDBCUtil.free(rs, null, conn);
		}
		return list;
	}

	public boolean modifyOneGoods(Goods goods) {	//
		Connection conn = JDBCUtil.getConnection();
		String sql = "update goods set name=?,price=?,details=?,total=?,sales=?,tid=? where id=?";
		int n = JDBCUtil.executeUpdate(conn, sql, new Object[]{goods.getName(),goods.getPrice(),goods.getDetails(),goods.getTotal(),goods.getSales(),goods.getTid(),goods.getId()});
		JDBCUtil.free(null, null, conn);
		if(n>0){
			return true;
		}
		return false;
	}

	public List<Goods> selectAll() {	//
		Connection conn=JDBCUtil.getConnection();
		String sql="select * from goods";
		ResultSet rs=JDBCUtil.executeSelect(conn, sql, new Object[]{});
		List<Goods> list=new ArrayList<Goods>();
		try{
			while(rs.next()){
				Goods goods = new Goods();
				goods.setId(rs.getInt(1));
				goods.setName(rs.getString(2));
				goods.setPicture(rs.getString(3));
				goods.setPrice(rs.getInt(4));
				goods.setDetails(rs.getString(5));
				goods.setTotal(rs.getInt(6));
				goods.setSales(rs.getInt(7));
				goods.setTid(rs.getInt(8));
				list.add(goods);
			}
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			JDBCUtil.free(rs, null, conn);
		}
		return list;
	}

	public Goods selectOneGoods(int id) {	//����һ����Ʒ
		Connection conn=JDBCUtil.getConnection();
		String sql="select * from goods where id=?";
		ResultSet rs=JDBCUtil.executeSelect(conn, sql, new Object[]{id});
		Goods goods = new Goods();
		try{
			if(rs.next()){
				goods.setId(rs.getInt(1));
				goods.setName(rs.getString(2));
				goods.setPicture(rs.getString(3));
				goods.setPrice(rs.getInt(4));
				goods.setDetails(rs.getString(5));
				goods.setTotal(rs.getInt(6));
				goods.setSales(rs.getInt(7));
				goods.setTid(rs.getInt(8));
			}
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			JDBCUtil.free(rs, null, conn);
		}
		return goods;
	}

	
	public List<Goods> selectByType(int tid) {
		Connection conn=JDBCUtil.getConnection();
		String sql="select * from goods where tid=?";
		ResultSet rs=JDBCUtil.executeSelect(conn, sql, new Object[]{tid});
		List<Goods> list=new ArrayList<Goods>();
		try{
			while(rs.next()){
				Goods goods = new Goods();
				goods.setId(rs.getInt(1));
				goods.setName(rs.getString(2));
				goods.setPicture(rs.getString(3));
				goods.setPrice(rs.getInt(4));
				goods.setDetails(rs.getString(5));
				goods.setTotal(rs.getInt(6));
				goods.setSales(rs.getInt(7));
				goods.setTid(rs.getInt(8));
				list.add(goods);
			}
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			JDBCUtil.free(rs, null, conn);
		}
		return list;
	}

	public List<Goods> selectAllBysales() {
		Connection conn=JDBCUtil.getConnection();
		String sql="select * from goods order by sales desc";
		ResultSet rs=JDBCUtil.executeSelect(conn, sql, new Object[]{});
		List<Goods> list=new ArrayList<Goods>();
		try{
			while(rs.next()){
				Goods goods = new Goods();
				goods.setId(rs.getInt(1));
				goods.setName(rs.getString(2));
				goods.setPicture(rs.getString(3));
				goods.setPrice(rs.getInt(4));
				goods.setDetails(rs.getString(5));
				goods.setTotal(rs.getInt(6));
				goods.setSales(rs.getInt(7));
				goods.setTid(rs.getInt(8));
				list.add(goods);
			}
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			JDBCUtil.free(rs, null, conn);
		}
		return list;
	}
}
