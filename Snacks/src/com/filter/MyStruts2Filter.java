package com.filter;

import java.io.IOException;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.dispatcher.ng.filter.StrutsPrepareAndExecuteFilter;

public class MyStruts2Filter extends StrutsPrepareAndExecuteFilter{

	@Override
	public void doFilter(ServletRequest arg0, ServletResponse arg1,
			FilterChain chain) throws IOException, ServletException {

		HttpServletRequest request = (HttpServletRequest) arg0 ;
		String uri = request.getRequestURI() ;
System.out.println("uri---->"+uri);
		if(uri.equals("/xuexiao/editor/jsp/upload_json.jsp")||uri.equals("/xuexiao/editor/jsp/file_manager_json.jsp")){
System.out.println("进入了........");
        	chain.doFilter(arg0, arg1);
		}
		else{
			super.doFilter(arg0, arg1, chain);
		}
	}
}
