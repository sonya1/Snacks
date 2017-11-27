package com.actions;

import java.util.List;

import com.dao.TypeDao;
import com.dao.impl.TypeDaoImpl;
import com.models.Type;

public class TypeAction {
	private int id;
	private String name;
	private Type Type;
	private String message;
	private TypeDao TypeDao = new TypeDaoImpl();
	private List<Type> Types;
	
	public String list(){
		Types = TypeDao.selectAll();
		return "list";
	}
	
	public String add(){  //添加
		Type q = new Type(name);
		boolean a = TypeDao.addType(q);
		if(a){
			this.message = "<font color='red'>添加成功</font>";
			return "success";
		}else{
			this.message = "<font color='red'>添加失败</font>";
			return "addFailure";
		}
		
	}
	
	public String delete(){//删除
		boolean a = TypeDao.deteleOneType(id);
		if(a){
			this.message = "<font color='red'>删除成功</font>";
			return "success";
		}else{
			this.message = "<font color='red'>删除失败</font>";
			return "list";
		}
		
	}
	
	public String selectOne(){//找到
		Type q = new Type(name);
		q=TypeDao.selectOneType(id);
		id=q.getId();
		name=q.getName();
		return "modify";
	}
	
	public String update(){//修改
		Type q = new Type(name);
		q.setId(id);
		q.setName(name);
		boolean n=TypeDao.modifyOneType(q);
		if(n){
			this.message = "<font color='red'>修改成功</font>";
			return  "success";
		}
		this.message = "<font color='red'>修改失败</font>";
		    return "modify";
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Type getType() {
		return Type;
	}

	public void setType(Type Type) {
		this.Type = Type;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public TypeDao getTypeDao() {
		return TypeDao;
	}

	public void setTypeDao(TypeDao TypeDao) {
		this.TypeDao = TypeDao;
	}

	public List<Type> getTypes() {
		return Types;
	}

	public void setTypes(List<Type> Types) {
		this.Types = Types;
	}
	

}
