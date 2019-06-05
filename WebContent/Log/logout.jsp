<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<%
	session.invalidate(); // 현재 IP,port 브라우저번호와 관련된 세션 전체 삭제
	
	Cookie [] cookies = request.getCookies();
	for(Cookie c : cookies){
		String key = c.getName();
		if(key.equals("cookieId")){
			c.setMaxAge(0);
			response.addCookie(c);
		}
		if(key.equals("cookiePw")){
			c.setMaxAge(0);
			response.addCookie(c);
		}
		if(key.equals("cookieAuto")){
			c.setMaxAge(0);
			response.addCookie(c);
		}
	}
	
	response.sendRedirect("/hmjm/Home/main.jsp");
%>