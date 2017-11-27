package com.untils;

import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Properties;

import javax.sql.DataSource;

import org.apache.commons.dbcp.BasicDataSourceFactory;



public class JDBCUtil {
	private static Connection conn ;
	private static PreparedStatement pstmt;
	private static ResultSet rs;
	private static DataSource dataSource = null;
	
	static{
	 try{
		 Class.forName("com.mysql.jdbc.Driver");
		 Properties prop = new Properties();
		 InputStream in = JDBCUtil.class.getClassLoader().getResourceAsStream("dbcpconfig.properties");
		 prop.load(in);
		 dataSource = BasicDataSourceFactory.createDataSource(prop);
		 
	 }catch(Exception e){
		 e.printStackTrace();
	 }
	}
	
	
	public static Connection getConnection(){
	  try {
		conn = dataSource.getConnection();
		
		} catch (Exception e) {
			
			e.printStackTrace();
		}
		    return conn;
	}
	
	//executeSelect(conn,sql,new Object[]{quantity})
	
	public static ResultSet  executeSelect(Connection conn,String sql,Object[] args){
		try {
			pstmt = conn.prepareStatement(sql);
			for(int i=0;i<args.length;i++){
				pstmt.setObject(i+1,args[i]);
			}
			rs = pstmt.executeQuery();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return rs;
	}
	
	
	public static int executeUpdate(Connection conn,String sql,Object[] args){
		int n=0;
		try {
			pstmt = conn.prepareStatement(sql);
			for(int i=0;i<args.length;i++){
				pstmt.setObject(i+1,args[i]);
			}
			n = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return n;
	}
	
	
	public static void free(ResultSet rs,Statement stmt,Connection conn){
	try{
		if(rs!=null)
			rs.close();
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			try{
				if(stmt!=null)
				stmt.close();
			}catch(Exception e){
				e.printStackTrace();
			}finally{
			  try{	if(conn!=null)
					conn.close();
			  }catch(Exception e){
				  e.printStackTrace();
			  }
			 }
		}
	}
}
