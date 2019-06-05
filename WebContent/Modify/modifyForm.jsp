<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import = "hmjm.bean.dao.*" %>
<%@ page import = "hmjm.bean.vo.*" %>

<!DOCTYPE html>
<% request.setCharacterEncoding("UTF-8");%>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보수정^^</title>
</head>
<body>
	<script type="text/javascript"></script>

<%										
	String m_email = (String)session.getAttribute("loginId");
	//System.out.println("====="+m_email);
	memberDAO manager = memberDAO.getInstance();
	memberVO c = manager.getMember(m_email);
	
%>

<form action ="modifyPro.jsp" name="member" method="post" align ="center">
	
 <table width ="550" align ="center">
	<tr height ="80" bgcolor ="333F48">
		<th colspan ="3"><font color ="white">회원정보 수정</th>
	</tr>
	<tr height ="50">
		<th>이메일</th>
		<th><%=c.getM_email() %></th>
	</tr>
	<tr height ="50">
		<th>이 름</th>
		<th><input type="text" autofosus name="m_name" value="<%=c.getM_name()%>"></th>
	</tr>
	<tr height ="50">
		<th>전화번호</th>
		<th><input type="text" name="m_phone" value="<%=c.getM_phone()%>"></th>
	</tr>
	<tr height ="50">
		<th>비밀번호</th>
		<th><input type ="password" name ="m_pw" value="<%=c.getM_pw()%>"></th>
	</tr>
 </table><br>
	<input type ="submit" name="modify" value ="회원정보 수정" " style ="height:30px;width:100px;"><br><br>
	<input type ="button" value ="취소" " style ="height:30px;width:100px;"
	onclick="javascript:window.location='index.jsp'">


</form>


</body>
</html>