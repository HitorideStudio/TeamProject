<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import = "hmjm.bean.message.messageDAO" %>
<%@ page import = "java.sql.Timestamp" %>

<% request.setCharacterEncoding("UTF-8");%>

<jsp:useBean id="message" scope="page" class="hmjm.bean.message.messageVO">
   <jsp:setProperty name="message" property="*"/>
</jsp:useBean>
 
<%
	String id = (String)session.getAttribute("loginId");
	messageDAO dbPro = messageDAO.getInstance();
    dbPro.insertArticle(message);
    //response.sendRedirect("/hmjm/Message/message.jsp");
%>
<script>
	alert("쪽지 발송 완료!");
	history.go(-2);
</script>
