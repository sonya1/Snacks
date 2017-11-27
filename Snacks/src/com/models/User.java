package com.models;

public class User {
	private int id;
	private String username;      //用户名
	private String password;      //密码
	private int type;  //类型
	
	public User(){
		
	}
	public User(String username,String password){  //构造方法
		this.username = username;
		this.password = password;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
}
