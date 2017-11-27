package com.models;

import java.util.Date;

public class News {
	private int id;
	private String title;
	private String content;
	private Date date;
	public News(){
			
	}
	public News(int id,String title,String content,Date date){
		this.id = id ;
		this.title = title ;
		this.date = date ;
		this.content = content ;
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

}
