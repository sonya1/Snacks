package com.dao.impl;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.dao.TypeDao;
import com.models.Type;

import com.untils.Constants;
import com.untils.JDBCUtil;

public class TypeDaoImpl implements TypeDao{

	public boolean addType(Type type) {
		Connection conn = JDBCUtil.getConnection();
		String sql = "insert into type(name)values(?)";
		int n = JDBCUtil.executeUpdate(conn, sql,new Object[]{type.getName()});
		JDBCUtil.free(null, null, conn);
		if(n>0){
			return  true;
		}
		return  false;
	}

	public List<Type> listType(int pageNum) {
		Connection conn=JDBCUtil.getConnection();
		String sql="select * from type limit ?,?";
		ResultSet rs=JDBCUtil.executeSelect(conn, sql, new Object[]{pageNum*Constants.PAGESIZE,Constants.PAGESIZE});
		List<Type> list=new ArrayList<Type>();
		try{
			while(rs.next()){
				Type type=new Type();
				type.setId(rs.getInt(1));
				type.setName(rs.getString(2));
				list.add(type);
			}

		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			JDBCUtil.free(rs, null, conn);
		}
		return list;
	}

	public int calculateAllNum() {
		Connection conn=JDBCUtil.getConnection();
		String sql="select * from type";
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

	public boolean modifyOneType(Type type) {
		Connection conn = JDBCUtil.getConnection();
		String sql = "update Type set name=? where id=?";
		int n = JDBCUtil.executeUpdate(conn, sql, new Object[]{type.getName(),type.getId()});
		JDBCUtil.free(null, null, conn);
		if(n>0){
			return true;
		}
		return false;
	}

	public boolean deteleOneType(int id) {
		Connection conn=JDBCUtil.getConnection();
		String sql="delete from type where id=?";
		int n=JDBCUtil.executeUpdate(conn, sql, new Object[]{id});
		JDBCUtil.free(null, null, conn);
		if(n>0){ 	
			return true;
		}
		return false;
	}

	public Type selectOneType(int id) {
		Connection conn=JDBCUtil.getConnection();
		String sql="select * from type where id=?";
		ResultSet rs=JDBCUtil.executeSelect(conn, sql, new Object[]{id});
		Type type = new Type();
		try{
			if(rs.next()){
				type.setId(rs.getInt(1));
				type.setName(rs.getString(2));
				}
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			JDBCUtil.free(rs, null, conn);
		}
		return type;
	}

	public List<Type> selectAll() {
		Connection conn=JDBCUtil.getConnection();
		String sql="select * from type";
		ResultSet rs=JDBCUtil.executeSelect(conn, sql, new Object[]{});
		List<Type> list = new ArrayList<Type>();
		try{
			while(rs.next()){
				Type type=new Type();
				type.setId(rs.getInt(1));
				type.setName(rs.getString(2));
				list.add(type);
			}
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			JDBCUtil.free(rs, null, conn);
		}
		return list;
	}
	
}
