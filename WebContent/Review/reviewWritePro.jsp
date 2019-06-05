<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import = "hmjm.bean.dao.reviewDAO" %>
<%@ page import = "java.sql.Timestamp" %>

<% request.setCharacterEncoding("UTF-8");%>

<jsp:useBean id="article" scope="page" class="hmjm.bean.vo.reviewVO">
   <jsp:setProperty name="article" property="*"/>
</jsp:useBean>
 
<%
	String id = (String)session.getAttribute("loginId");
	reviewDAO dbPro = reviewDAO.getInstance();
    dbPro.insertArticle(article);
    response.sendRedirect("review.jsp");
%>
