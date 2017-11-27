package com.dao;

import java.util.List;

import com.models.User;

public interface UserDao {
	public boolean insert(User u);   //用户注册，添加用户
	public boolean delete(int id);   //删除用户
	public User select(int id);      //根据id查用户
	public boolean update(User u);   //修改
	public List<User> selectAll();   //查所有
	public User selectByUser(int type) ;  //根据类型查
	public User selectByUserName(String username) ;  //根据用户名查
	public User login(User u);  //登录，根据User查User
	public List<User> findUserByPno(int pno); //根据页数查所有
}
