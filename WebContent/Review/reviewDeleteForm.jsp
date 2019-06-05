<%@ page language="java" contentType="text/html; charset=UTF-8"%>

<%
  int num = Integer.parseInt(request.getParameter("num"));
  String pageNum = request.getParameter("pageNum");
%>
<form method="POST" name="deleteform" action="reviewDeletePro.jsp?num=<%=num%>">
<form method="POST" name="deleteform" action="reviewDeletePro.jsp?pageNum=<%=pageNum%>">
	<table>
		<tr><td>리뷰를 삭제하시겠습니까?
				<input type="hidden" name="r_num" value="<%=num%>">
			</td></tr>
			
		<tr><td><input type="submit" value="리뷰삭제" >
      			<input type="button" value="돌아가기" 
      			onclick="document.location.href='review.jsp'">
      		</td></tr>    
	</table>
</form>