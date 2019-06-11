<%@ page language="java" contentType="text/html; charset=EUC-KR" %>
<%@ page import = "hmjm.bean.product.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>강의 상세페이지</title>
</head>
<%
	int num = Integer.parseInt(request.getParameter("p_num"));
	String pageNum = request.getParameter("pageNum");
	
	try{
		productDAO dbPro = productDAO.getInstance();
		productVO vo = dbPro.getProduct(num);
	

%>
<body>
	<h1>강의 상세 페이지</h1>
	<p><%=vo.getP_num() %>:::::::::::::이거 강의번호를 신청할때 넘겨야한다</p><br>
	강의제목:::::::: <%=vo.getP_classname() %><br>
	강사소개:::::::: <%=vo.getP_self() %><br>
	카테고리:::::::: <%=vo.getP_category() %><br>
	강사이메일:::::::: <%=vo.getP_email() %><br><br>
	<a href ="./check.jsp?p_num=<%=vo.getP_num() %>">강의신청</a>
<% 
 }catch(Exception e){} 
%>
	
</body>
</html>