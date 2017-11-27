package com.dao.impl;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.dao.UserDao;

import com.models.User;
import com.untils.Contast;
import com.untils.JDBCUtil;

public class UserDaoImpl implements UserDao{

	public boolean delete(int id) {
		Connection conn = JDBCUtil.getConnection();
		String sql = "delete from user where id=?";
		int n = JDBCUtil.executeUpdate(conn, sql, new Object[]{id});	
		JDBCUtil.free(null, null, conn);
		if(n>0){
			return true;
		}
		else
			return false;
	}

	public boolean insert(User u) {
		Connection conn = JDBCUtil.getConnection();
		String sql = "insert into user (username,password) value (?,?)";
		int n = JDBCUtil.executeUpdate(conn, sql, new Object[]{u.getUsername(),u.getPassword()});
		JDBCUtil.free(null, null, conn);
		if(n>0){
			return true;
		}
		else
			return false;
	}

	public User select(int id) {
		Connection conn=JDBCUtil.getConnection();
		String sql="select * from user where id=?";
		ResultSet rs=JDBCUtil.executeSelect(conn, sql, new Object[]{id});
		User u = new User();
		try{
			if(rs.next()){
				u.setId(rs.getInt(1));
				u.setUsername(rs.getString(2));
				u.setPassword(rs.getString(3));
			}
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			JDBCUtil.free(rs, null, conn);
		}
		return u;
	}

	public List<User> selectAll() {
		Connection conn = JDBCUtil.getConnection();
		String sql = "select * from user ";
		ResultSet rs=JDBCUtil.executeSelect(conn, sql, new Object[]{});
		List list=new ArrayList();
		try{
			while(rs.next()){
				User u = new User();
				u.setId(rs.getInt(1));
				u.setUsername(rs.getString(2));
				u.setPassword(rs.getString(3));
				list.add(u);
			}
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			JDBCUtil.free(rs, null, conn);
			return list;
		}
	}

	public boolean update(User u) {
		Connection conn=JDBCUtil.getConnection();
		String sql="update user set username=?,password=? where id=?";
		int n=JDBCUtil.executeUpdate(conn, sql, new Object[]{u.getUsername(),u.getPassword(),u.getId()});
		JDBCUtil.free(null, null, conn);
		if(n>0){
			return true;
		}
		return false;
	}

	public User selectByUser(int type){
		Connection conn = JDBCUtil.getConnection();
		String sql = "select * from user where type = ?";
		ResultSet rs = JDBCUtil.executeSelect(conn, sql, new Object[]{type});
		try {
			while(rs.next()){
			User u1 =new User();
				u1.setId(rs.getInt(1));
				u1.setUsername(rs.getString(2));
				u1.setPassword(rs.getString(3));
				return u1;
			}
		}catch (SQLException e) {
			e.printStackTrace();
		}finally{
			JDBCUtil.free(rs, null, conn);
		}
		return null;
	}

	public User login(User u) {
		Connection conn = JDBCUtil.getConnection();
		String sql = "select * from user where username = ? and password=?";
		ResultSet rs = JDBCUtil.executeSelect(conn, sql, new Object[]{u.getUsername(),u.getPassword()});
		try {
			while(rs.next()){
				User u1 =new User();
				u1.setId(rs.getInt(1));
				u1.setUsername(rs.getString(2));
				u1.setPassword(rs.getString(3));
				return u1;
			}
		}catch (SQLException e) {
			e.printStackTrace();
		}finally{
			JDBCUtil.free(rs, null, conn);
		}
		return null;
	}

	public List<User> findUserByPno(int pno) {
		Connection conn = JDBCUtil.getConnection() ;
		String sql ="select * from user where type=0 limit ?,? " ;
		int offset = pno*Contast.PAGESIZE ;
		ResultSet rs = JDBCUtil.executeSelect(conn, sql, new Object[]{offset,Contast.PAGESIZE});
		List list = new ArrayList();
		try{
			while(rs.next()){
				User u = new User();
				u.setId(rs.getInt(1));
				u.setUsername(rs.getString(2));
				u.setPassword(rs.getString(3));
				list.add(u);
			}
		}catch(Exception e){
			e.printStackTrace() ;
		}finally{
			JDBCUtil.free(rs, null, conn);
		}
		return list ;
	}

	public User selectByUserName(String username) {
		Connection conn=JDBCUtil.getConnection();
		String sql="select * from user where username=?";
		ResultSet rs=JDBCUtil.executeSelect(conn, sql, new Object[]{username});
		User u = new User();
		try{
			if(rs.next()){
				u.setId(rs.getInt(1));
				u.setUsername(rs.getString(2));
				u.setPassword(rs.getString(3));
			}
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			JDBCUtil.free(rs, null, conn);
		}
		return u;
	}


}
