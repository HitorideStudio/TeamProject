<%@ page language="java" contentType="text/html; charset=UTF-8"%>

<%
  int num = Integer.parseInt(request.getParameter("num"));
  String pageNum = request.getParameter("pageNum");
%>
<form method="POST" name="MsgDelForm" action="messageDeletePro.jsp?num=<%=num%>">
<form method="POST" name="MsgDelForm" action="messageDeletePro.jsp?pageNum=<%=pageNum%>">
	<table>
		<tr><td>쪽지를 삭제하시겠습니까?
				<input type="hidden" name="s_num" value="<%=num%>">
			</td></tr>
			
		<tr><td><input type="submit" value="쪽지삭제" >
      			<input type="button" value="돌아가기" 
      			onclick="document.location.href='message.jsp'">
      		</td></tr>    
	</table>
</form>