<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import = "hmjm.bean.dao.reviewDAO" %>
<%@ page import = "java.sql.Timestamp" %>

<% request.setCharacterEncoding("UTF-8");%>

<jsp:useBean id="article" scope="page" class="hmjm.bean.vo.reviewVO">
   <jsp:setProperty name="article" property="*"/>
</jsp:useBean>

<%
    String pageNum = request.getParameter("pageNum");
	reviewDAO dbPro = reviewDAO.getInstance();
    int check = dbPro.updateArticle(article);
    if(check==1){
%>
	<meta http-equiv="Refresh" content="0;url=review.jsp?pageNum=<%=pageNum%>" >
	<script language="JavaScript">
		alert("수정완료");
	</script>
	response.sendRedirect("review.jsp");
<% }%>
      
