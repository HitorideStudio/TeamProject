<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import = "hmjm.bean.dao.messageDAO" %>
<%@ page import = "java.sql.Timestamp" %>

<% request.setCharacterEncoding("UTF-8");%>

<jsp:useBean id="message" scope="page" class="hmjm.bean.vo.messageVO">
   <jsp:setProperty name="message" property="*"/>
</jsp:useBean>
 
<%
	String id = (String)session.getAttribute("loginId");
	messageDAO dbPro = messageDAO.getInstance();
    dbPro.insertArticle(message);
    response.sendRedirect("message.jsp");
%>
