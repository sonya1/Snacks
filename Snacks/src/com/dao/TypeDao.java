package com.dao;

import java.util.List;
import com.models.Type;

public interface TypeDao {	//产品类型
	public boolean addType(Type type);//添加产品类型
	public List<Type> listType(int pageNum);//查找所有产品
	public List<Type> selectAll();//查找所有产品（无参数）
	public boolean modifyOneType(Type type);    //修改产品类型
	public boolean deteleOneType(int id);		//删除产品类型
	public Type selectOneType(int id);		//查找一个产品类型
	
	public int calculateAllNum();
}
