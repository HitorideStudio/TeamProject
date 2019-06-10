<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "hmjm.bean.product.*" %>
<%@ page import = "java.util.List" %>

<!DOCTYPE html>
<%
int pageSize = 5;

String pageNum = request.getParameter("pageNum");
if (pageNum == null) {
    pageNum = "1";
}

int currentPage = Integer.parseInt(pageNum);
int startRow = (currentPage - 1) * pageSize + 1;	// 시작페이지 카운트
int endRow = currentPage * pageSize;  	// 1~10까지 가져오기위한거
int count = 0;
int number=0;

List productList = null;
productDAO dbPro = productDAO.getInstance();
count = dbPro.getProductCount();
if (count > 0) {
    productList = dbPro.getProduct(startRow, endRow);
}

number=count-(currentPage-1)*pageSize;


%>


<html>
<head>
<meta charset="UTF-8">
<title>강의목록 테스트</title>
</head>
<body>
<p>강의목록 테스트</p>
<p>등록강좌수:<%=count %></p>


<%if (count == 0 ){%>
	<p>등록된 강의가 없습니다<p>
<%}else{
	for(int i = 0 ; i <productList.size(); i++){
		productVO vo = (productVO)productList.get(i); 
		
%>
		<p><%=vo.getP_num()%></p>
		<p>강의이름 :
		<a href ="../Talent/Detail.jsp?p_num=<%=vo.getP_num() %>& pageNum=<%=currentPage %>">
		<%=vo.getP_classname() %></a>
		</p>
		
	<% }%>
	

<%}%>


<%
    if (count > 0) {
        int pageCount = count / pageSize + ( count % pageSize == 0 ? 0 : 1);
		 
        int startPage = (int)(currentPage/1)*5+1;
		int pageBlock=5;
        int endPage = startPage + pageBlock-1;
        if (endPage > pageCount) endPage = pageCount;
        
        if (startPage > 1) {    %>
        <a href="listTest.jsp?pageNum=<%= startPage - 5 %>">[이전]</a>
<%      }
        for (int i = startPage ; i <= endPage ; i++) {  %>
        <a href="listTest.jsp?pageNum=<%= i %>">[<%= i %>]</a>
<%
        }
        if (endPage < pageCount) {  %>
        <a href="listTest.jsp?pageNum=<%= startPage + 5 %>">[다음]</a>
<%
        }
    }
%>



</body>
</html>