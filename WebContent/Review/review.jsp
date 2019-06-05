<%@ page contentType = "text/html; charset=UTF-8" %>
<%@ page import = "hmjm.bean.dao.reviewDAO" %>
<%@ page import = "hmjm.bean.vo.reviewVO" %>
<%@ page import = "java.util.List" %>
<%@ page import = "java.text.SimpleDateFormat" %>

<%!
    int pageSize = 5; //한 화면에 보여줄 리스트 갯수
%>

<%
	String id = (String)session.getAttribute("loginId");
	String pageNum = request.getParameter("pageNum");
	
    if (pageNum == null) { pageNum = "1"; }

    int currentPage = Integer.parseInt(pageNum);
    int startRow = (currentPage - 1) * pageSize + 1;
    int endRow = currentPage * pageSize;
    int count = 0;
    int number= 0;

    List articleList = null;
    reviewDAO dbPro = reviewDAO.getInstance();
    count = dbPro.getArticleCount();
    if (count > 0) {
        articleList = dbPro.getArticles(startRow, endRow);
    }
	number=count-(currentPage-1)*pageSize;
%>
<html>
<link href="style.css" rel="stylesheet" type="text/css">

<body align="center">
<b>글목록(전체 글:<%=count%>)</b>
<%if (count == 0) {%>
	<table width="800" border="1" cellpadding="0" cellspacing="0" align="center">
		<tr><td align="center">작성된 후기가 없습니다.</td></tr>
	</table>

<%}else{%>
	<table border="2" width="800" cellpadding="0" cellspacing="0" align="center"> 
	<%for (int i = 0 ; i < articleList.size() ; i++) {
		reviewVO article = (reviewVO)articleList.get(i);%>
		<tr>
		    <td align="center"  width="50" ><%=number--%></td>
		    <td align="left" width="375" colspan="3"><%=article.getR_re()%></td>
		    <td align="center"  width="100"><%=article.getR_name()%></td>
		    <td align="center"  width="100"><%=article.getR_reg()%></td>
		</tr>
		
		<tr>
			<td align="center">커리큘럼<br/>
			<%int curr = article.getR_s_curr();
			for(int cu=0; cu<curr; cu++){%>	<img src="./images/star.jpg"> <%}%> </td>

			<td align="center">준비성<br/>
			<%int pre = article.getR_s_pre();
			for(int pr=0; pr<pre; pr++){%> <img src="./images/star.jpg"> <%}%> </td>

			<td align="center">시간준수<br/>
			<%int tk = article.getR_s_tk();
			for(int t=0; t<tk; t++){%> <img src="./images/star.jpg"> <%}%> </td>

			<td align="center">전달력<br/>
			<%int deli = article.getR_s_deli();
			for(int de=0; de<deli; de++){%>	<img src="./images/star.jpg"> <%}%> </td>

			<td align="center">친절도<br/>
			<%int kind = article.getR_s_kind();
			for(int ki=0; ki<kind; ki++){%> <img src="./images/star.jpg"> <%}%> </td>
			
			<td align="center">
			<%String login = article.getR_name();
			if (id!=null){
				if(id.equals(login)) {%>
					<input type="button" value="글수정" 
						onclick="document.location.href='reviewUpdateForm.jsp?num=<%=article.getR_num()%>&pageNum=<%=pageNum%>'"/>
					<input type="button" value="글삭제" 
						onclick="document.location.href='reviewDeleteForm.jsp?num=<%=article.getR_num()%>'">
			<%}}%> </td>
		</tr>
	<%}%>
</table>
	<%}
if (count > 0) {
	int pageCount = count / pageSize + ( count % pageSize == 0 ? 0 : 1);
    int startPage = (int)(currentPage/10)*10+1;
	int pageBlock=10;
    int endPage = startPage + pageBlock-1;
    if (endPage > pageCount) endPage = pageCount;
	if (startPage > 10) {%>
		<a href="review.jsp?pageNum=<%= startPage - 10 %>">[이전]</a>
	<%}
	for (int i = startPage ; i <= endPage ; i++) {  %>
		<a href="review.jsp?pageNum=<%= i %>">[<%= i %>]</a>
	<%}
	if (endPage < pageCount) {%>
		<a href="review.jsp?pageNum=<%= startPage + 10 %>">[다음]</a>
	<%}
}%>
<br/><br/>
<%if(session.getAttribute("loginId")!=null){ %>
	<jsp:include page="reviewWriteForm.jsp" />
<%}%>
</body>
</html>

