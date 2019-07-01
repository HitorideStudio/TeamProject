<%@ page contentType = "text/html; charset=UTF-8" %>
<%@ page import = "hmjm.bean.review.reviewDAO" %>
<%@ page import = "java.sql.Timestamp" %>
<% request.setCharacterEncoding("UTF-8");%>

<%
	int num = Integer.parseInt(request.getParameter("num"));
	String pageNum = request.getParameter("pageNum");
	int pnum = Integer.parseInt(request.getParameter("p_num"));
	
	reviewDAO dbPro = reviewDAO.getInstance();
	int check = dbPro.deleteArticle(num);
	
	if(check==1){%>
		<meta http-equiv="Refresh" content="0;url=/hmjm/Review/reviewMore.jsp?p_num=<%=pnum%>" >
	<%}
%>