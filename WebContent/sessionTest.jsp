<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="hmjm.bean.member.*"%>
<%@ page import="hmjm.bean.tutor.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>세션 테스트</title>
</head>
<body>

<%=(String)session.getAttribute("registedTutor") %>
<%=(String)session.getAttribute("loginId") %>
<%

String m_email = (String) session.getAttribute("loginId");
memberDAO manager = memberDAO.getInstance();
memberVO c = manager.getMember(m_email);
tutorDAO vo = tutorDAO.getInstance();
tutorVO e = vo.getMember(m_email);

%>
<b>강사등록번호 확인용<%=e.getT_num() %></b>
<b>강사별명 확인용<%=e.getT_nick() %></b>
<input type="button" value="세션테스트" 
				      onclick="javascript:window.location='Tutor/Register/menu.jsp'">


</body>
</html>