package com.dao;

import java.util.List;


import com.models.Goods;
import com.models.Type;

public interface GoodsDao {
	public boolean addGoods(Goods goods);	//添加产品
	public List<Goods> listGoods(int pageNum);		//查找所有产品
	public List<Goods> selectAll();		//查找所有产品(无参数)
	public boolean modifyOneGoods(Goods goods);    //修改产品
	public boolean deteleOneGoods(int id);		//删除产品
	public Goods selectOneGoods(int id);		//查找一个产品
	public List<Goods> selectByType(int tid);		//按tid查找产品
	public List<Goods> selectAllBysales();		//查找产品(按销量降序)
	public int calculateAllNum();
}