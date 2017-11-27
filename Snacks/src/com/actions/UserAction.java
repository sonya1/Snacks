package com.actions;

import java.io.UnsupportedEncodingException;
import java.util.List;

import com.dao.UserDao;
import com.dao.impl.UserDaoImpl;
import com.models.User;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.untils.Contast;

public class UserAction {
	private int id;  //用户id
	private String username;//用户名
	private String password;//密码
	private User user;
	private List<User> users;
	private String message;
	private UserDao userDao = new UserDaoImpl();
	
	private int pno;//页数
	private int allPno;//总页数
	private int allNum;//
	boolean b=true;
	
	public String superLogin(){  //管理员登陆
        User superAdmin = userDao.selectByUser(1);
        if( username.equals(superAdmin.getUsername())&& password.equals(superAdmin.getPassword())){
        	return "loginSuccess";
		}
		return "SuperloginFailure";
	}
	
	public String regist(){  //用户注册
		User u = new User(username,password);
		if(username.equals(userDao.selectByUserName(username).getUsername())){
			return "registFailure";
		}
		boolean a = userDao.insert(u);
		if(a){
			return "registSuccess";
		}
		return "registFailure";
	}
	
	public String login() throws UnsupportedEncodingException{  //用户登录
		String uname = new String(username.getBytes("ISO-8859-1"),"utf-8");
		User u = new User(uname,password);
		user = userDao.login(u);
		if(user==null){
			return "loginFailure";
		}else{
			id=user.getId();
			username=user.getUsername();
			password = user.getPassword();
			ActionContext.getContext().getSession().put("user", user);
			ActionContext.getContext().getSession().put("id", id);
			return "success";
		}
	}
	
	public String list(){  //后台显示
		users = userDao.findUserByPno(pno);
		List ausers = userDao.selectAll();
		if(ausers.size()%Contast.PAGESIZE==0){
			allPno = ausers.size()/Contast.PAGESIZE-1;
		}else{
			allPno = ausers.size()/Contast.PAGESIZE;
		}
		allNum =ausers.size();
		return "list";
	}
	
	public String list1(){
		user = userDao.select(id);
		username=user.getUsername();
		password = user.getPassword();
		return "list1";
	}
	
	public String selectOne(){  //找到
		User u = new User(username,password);
		u=userDao.select(id);
		id=u.getId();
		username=u.getUsername();
		password = u.getPassword();
		return "modify";
	}
	
	public String update(){//修改
		User u = new User(username,password);
		u.setId(id);
		u.setUsername(username);
		u.setPassword(password);
		boolean n=userDao.update(u);
		if(n){
			this.message = "<font color='red'>修改成功</font>";
			return  "list1";
		}
		this.message = "<font color='red'>修改失败</font>";
		    return "modify";
	}
	
	public String delete(){                //删除用户
		boolean n=userDao.delete(id);
	  if(n)
		return "Success";
	  else{
		  return "deleteFaliure";
	  }		
	}
	
	public String exit(){ //退出系统
		ActionContext.getContext().getSession().put("id", null);
		ActionContext.getContext().getSession().put("user", null);
System.out.println("退出");
		return "exit";
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
	public UserDao getUserDao() {
		return userDao;
	}
	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public List<User> getUsers() {
		return users;
	}

	public void setUsers(List<User> users) {
		this.users = users;
	}

	public int getPno() {
		return pno;
	}

	public void setPno(int pno) {
		this.pno = pno;
	}

	public int getAllPno() {
		return allPno;
	}

	public void setAllPno(int allPno) {
		this.allPno = allPno;
	}

	public int getAllNum() {
		return allNum;
	}

	public void setAllNum(int allNum) {
		this.allNum = allNum;
	}

	public boolean isB() {
		return b;
	}

	public void setB(boolean b) {
		this.b = b;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}
}
