<%@ page contentType = "text/html; charset=UTF-8" %>
<%@ page import = "hmjm.bean.dao.messageDAO" %>
<%@ page import = "java.sql.Timestamp" %>

<% request.setCharacterEncoding("UTF-8");%>

<%
  int num = Integer.parseInt(request.getParameter("num"));
  String pageNum = request.getParameter("pageNum");
  
  messageDAO dbPro = messageDAO.getInstance();
  int check = dbPro.deleteArticle(num);

  if(check==1){
%>
	<meta http-equiv="Refresh" content="0;url=message.jsp" >
  
<%} %>