<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import = "tp.bean.dao.*" %>
<%@ page import = "tp.bean.vo.*" %>

<!DOCTYPE html>
<% request.setCharacterEncoding("UTF-8");%>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보수정</title>
</head>
<body>
	<jsp:include page="header.jsp"/>	
	<script type="text/javascript"></script>

<%										
	String m_email = (String)session.getAttribute("loginId");
	//System.out.println("====="+m_email); 오류확인용
	memberDAO manager = memberDAO.getInstance();
	memberVO c = manager.getMember(m_email);
	
%>

<form action ="modifyPro.jsp" name="member" method="post" align ="center">
	
<table width ="550" align ="center">
	<tr height ="80" bgcolor ="FDD262">
		<th  colspan ="3">회원정보 수정</th>
	</tr>
	<tr>
		<th height ="50">이메일</th>
		<th><%=c.getM_email() %></th>
	</tr>
	<tr>
		<th height ="50">이름</th>
		<th><input type="text" autofosus name="m_name" value="<%=c.getM_name()%>"></th>
	</tr>
	<tr>
		<th height ="50">전화번호</th>
		<th><input type="text" name="m_phone" value="<%=c.getM_phone()%>"></th>
	</tr>
	<tr>
		<th height ="50">비밀번호</th>
		<th><input type ="password" name ="m_pw" value="<%=c.getM_pw()%>"></th>
	</tr>
</table>
	<input type ="submit" name="modify" value ="회원정보 수정">
	<input type ="button" value ="취소" onclick="javascript:window.location='main.jsp'">


</form>


</body>
</html>