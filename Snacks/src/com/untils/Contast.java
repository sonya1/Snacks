package com.untils;

import org.apache.struts2.ServletActionContext;

public class Contast {
	public static String getPath(){
		return ServletActionContext.getRequest().getRealPath("");
	}
	public static int PAGESIZE = 3 ;
	public static String myPath = getPath()+"/images";
}

