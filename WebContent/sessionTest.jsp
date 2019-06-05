<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>세션 테스트</title>
</head>
<body>

<%=(String)session.getAttribute("registedTutor") %>
<%=(String)session.getAttribute("loginId") %>

<input type="button" value="세션테스트" 
				      onclick="javascript:window.location='Tutor/Register/menu.jsp'">


</body>
</html>