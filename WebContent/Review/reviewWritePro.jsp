<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import = "hmjm.bean.review.reviewDAO" %>
<%@ page import = "java.sql.Timestamp" %>

<% request.setCharacterEncoding("UTF-8");%>

<jsp:useBean id="article" scope="page" class="hmjm.bean.review.reviewVO">
   <jsp:setProperty name="article" property="*"/>
</jsp:useBean>
 
<%
	String id = (String)session.getAttribute("loginId");
	int pnum = Integer.parseInt(request.getParameter("p_num"));
	
	reviewDAO dbPro = reviewDAO.getInstance();
    dbPro.insertArticle(article);
    response.sendRedirect("/hmjm/Talent/Detail.jsp?p_num="+pnum);
%>
