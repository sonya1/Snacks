package com.dao;

import java.util.List;

import com.models.News;

public interface NewsDao {
	public boolean addInform(News inform);
	public List<News> listInform(int pageNum);//
	public List<News> selectAll();//
	public boolean modifyOneInform(News inform);    //
	public boolean deteleOneInform(int id);		//
	public News selectOneInform(int id);		//
	
	public int calculateAllNum();
}
