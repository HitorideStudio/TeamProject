package hmjm.filter;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.FileWriter;
import java.util.Date;


import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;

public class URIFilter implements Filter {
	
	
	PrintWriter writer = null;
	Date day = null;
	
	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		try {
			//해당 경로로 들어가 기록하도록한다.
			writer = new PrintWriter(new FileWriter("d://log//market.log"), true);
			
			
			
		}catch(Exception e) {
			e.printStackTrace();			
		}
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) 
			throws IOException, ServletException {
		
		HttpServletRequest req = (HttpServletRequest)request;
		
		//날짜 입력
		day = new Date();
		writer.print("["+day+"] ");				
		
	    writer.println(req.getRequestURI());   //어떤 페이지가 실행되는지 기록한다.
	   
	    chain.doFilter(request, response);	//흐름이 이어지도록 연결.

		
		
		
		
	}
	
	@Override
	public void destroy() {	
		
		writer.close();//연결끊기
	}
}
