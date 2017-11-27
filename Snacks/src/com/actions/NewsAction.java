package com.actions;

import java.util.Date;
import java.util.List;

import com.dao.NewsDao;
import com.dao.impl.NewsDaoImpl;
import com.models.News;
import com.models.User;


public class NewsAction {
	private int id ;//ID
	
	private String title ;
	private String content ;
	private Date date ;
	
	private List news ;
	private News n ;
	private String msg;
	private NewsDao ndao  = new NewsDaoImpl();
	
	public String list(){
		news=ndao.selectAll();
		return "list";
	}
	public String add()throws Exception{
		News n=new News();
		//title = new String(title.getBytes("ISO-8859-1"),"utf-8");
		//content = new String(content.getBytes("ISO-8859-1"),"utf-8");
		n.setContent(content);
		date = new Date();
		n.setDate(date);
		n.setId(id);
		n.setTitle(title);
		boolean a=ndao.addInform(n);
		if(a){
			return "success";
			}
		  return "addFailure";
	}
	
	public String input(){
		n = ndao.selectOneInform(id);
		return "input";
	}
	
	public String update() throws Exception{
		n = new News(id,title,content,new Date());
		boolean update = ndao.modifyOneInform(n);
		if(update){
		return "success";
	}return "Faliure";
}
	public String delete(){
		boolean a=ndao.deteleOneInform(id);
		if(a){
				return "success";
			}
		    return "Faliure";
	}
	
	
	
	public String detail(){
		News n=ndao.selectOneInform(id);
		if(n.getTitle()!=null){
			return "detail";
		}return "Failure";
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	
	
	public News getN() {
		return n;
	}
	public void setN(News n) {
		this.n = n;
	}
	public NewsDao getNdao() {
		return ndao;
	}
	public void setNdao(NewsDao ndao) {
		this.ndao = ndao;
	}
	public List getNews() {
		return news;
	}
	public void setNews(List news) {
		this.news = news;
	}
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	
}
