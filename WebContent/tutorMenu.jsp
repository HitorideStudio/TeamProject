<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "hmjm.bean.dao.*" %>
<%@ page import = "hmjm.bean.vo.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>튜터등록 메뉴</title>
</head>
								 

<body>
<jsp:include page="header.jsp" />
	
<%if(session.getAttribute("loginId") == null){%>

		
	<script>
	alert("로그인부터");
	window.location='./loginForm.jsp';
		
	</script>
	<%}else{
	
	String m_email = (String)session.getAttribute("loginId");
	memberDAO manager = memberDAO.getInstance();
	memberVO c = manager.getMember(m_email);
	
	//String t_email = (String)session.getAttribute("loginId");
	//String t_email = request.getParameter((String)session.getAttribute("loginId"));
	tutorDAO vo = tutorDAO.getInstance();
	tutorVO e = vo.getMember(m_email);

%>

	<div>
	<%=c.getM_email()%>
	<%=c.getM_name()%>

	<%
		
		if(e==null){%>
		
			<input type="button" value="튜터등록" 
				      onclick="javascript:window.location='./tutorRegister.jsp'">
			
			
			<%}else{ %>
			<input type="button" value="튜터수정" 
				      onclick="javascript:window.location='./test.jsp'">
			
			
	<%}%>
	
	<%}%>
	
	<input type="button" value="강의등록" 
				      onclick="javascript:window.location='./main.jsp'">
	</div>
</body>
</html>