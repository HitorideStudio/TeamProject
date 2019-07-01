<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import = "hmjm.bean.review.reviewDAO" %>
<%@ page import = "java.sql.Timestamp" %>
<% request.setCharacterEncoding("UTF-8");%>

<jsp:useBean id="article" scope="page" class="hmjm.bean.review.reviewVO">
   <jsp:setProperty name="article" property="*"/>
</jsp:useBean>

<%
    String pageNum = request.getParameter("pageNum");
	int pnum = Integer.parseInt(request.getParameter("p_num"));
	reviewDAO dbPro = reviewDAO.getInstance();
    int check = dbPro.updateArticle(article);
    if(check==1){
%>
	
	<script>
		alert("수정완료");
	</script>
	
	<meta http-equiv="Refresh" content="0;url=/hmjm/Review/reviewMore.jsp?p_num=<%=pnum%>" >
<% }%>
      
