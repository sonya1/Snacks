package com.dao.impl;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.dao.NewsDao;
import com.models.News;
import com.untils.Constants;
import com.untils.JDBCUtil;

public class NewsDaoImpl implements NewsDao{

	public boolean addInform(News inform){
		Connection conn = JDBCUtil.getConnection();
		String sql = "insert into news(title,content,date)values(?,?,?)";
		int n = JDBCUtil.executeUpdate(conn, sql,new Object[]{inform.getTitle(),inform.getContent(),inform.getDate()});
		JDBCUtil.free(null, null, conn);
		if(n>0){
			return  true;
		}
		return  false;
	}

	public int calculateAllNum() {
		Connection conn=JDBCUtil.getConnection();
		String sql="select * from news";
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

	public boolean deteleOneInform(int id) {
		Connection conn=JDBCUtil.getConnection();
		String sql="delete from news where id=?";
		int n=JDBCUtil.executeUpdate(conn, sql, new Object[]{id});
		JDBCUtil.free(null, null, conn);
		if(n>0){ 	
			return true;
		}
		return false;
	}

	public List<News> listInform(int pageNum) {	//
		Connection conn=JDBCUtil.getConnection();
		String sql="select * from news limit ?,?";
		ResultSet rs=JDBCUtil.executeSelect(conn, sql, new Object[]{pageNum*Constants.PAGESIZE,Constants.PAGESIZE});
		List<News> list=new ArrayList<News>();
		try{
			while(rs.next()){
				News inform=new News();
				inform.setId(rs.getInt(1));
				inform.setTitle(rs.getString(2));
				inform.setContent(rs.getString(3));
				inform.setDate(rs.getDate(4));
				list.add(inform);
			}
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			JDBCUtil.free(rs, null, conn);
		}
		return list;
	}

	public boolean modifyOneInform(News inform) {
		Connection conn = JDBCUtil.getConnection();
		String sql = "update news set title=?,content=?,date=? where id=?";
		int n = JDBCUtil.executeUpdate(conn, sql, new Object[]{inform.getTitle(),inform.getContent(),inform.getDate(),inform.getId()});
		JDBCUtil.free(null, null, conn);
		if(n>0){
			return true;
		}
		return false;
	}

	public List<News> selectAll() {
		Connection conn=JDBCUtil.getConnection();
		String sql="select * from news";
		ResultSet rs=JDBCUtil.executeSelect(conn, sql, new Object[]{});
		List<News> list=new ArrayList<News>();
		try{
			while(rs.next()){
				News inform=new News();
				inform.setId(rs.getInt(1));
				inform.setTitle(rs.getString(2));
				inform.setContent(rs.getString(3));
				inform.setDate(rs.getDate(4));
				list.add(inform);
			}
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			JDBCUtil.free(rs, null, conn);
		}
		return list;
	}

	public News selectOneInform(int id) {
		Connection conn=JDBCUtil.getConnection();
		String sql="select * from news where id=?";
		ResultSet rs=JDBCUtil.executeSelect(conn, sql, new Object[]{id});
		News inform=new News();
		try{
			while(rs.next()){
				inform.setId(rs.getInt(1));
				inform.setTitle(rs.getString(2));
				inform.setContent(rs.getString(3));
				inform.setDate(rs.getDate(4));
			}
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			JDBCUtil.free(rs, null, conn);
		}
		return inform;
	}
	
}
