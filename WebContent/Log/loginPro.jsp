<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page import="hmjm.bean.member.memberDAO" %>

<%
	String m_email= request.getParameter("m_email");
	String m_pw= request.getParameter("m_pw");
	memberDAO dao = memberDAO.getInstance();
	
	boolean result = dao.loginCheck(m_email,m_pw);
	
	if(result){
		session.setAttribute("loginId",m_email);
		response.sendRedirect("/hmjm/Home/main.jsp");
	}else{%>
	
		<script>
			alert("id/pw확인");
			history.go(-1);
		</script>
		
	<%}%>
