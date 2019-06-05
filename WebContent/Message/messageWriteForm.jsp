<%@ page contentType="text/html; charset=utf-8" %>

<html>
<head>
<link href="style.css" rel="stylesheet" type="text/css">
<script language="JavaScript" src="script.js"></script>
</head>
<% 
	String id = (String)session.getAttribute("loginId");
	int num=0;
	try{  
    	if(request.getParameter("s_num")!=null){
		num=Integer.parseInt(request.getParameter("s_num"));
		}
%>
<body>
<form method="post" name="messageWriteForm" action="messageWritePro.jsp" onsubmit="return writeSave()">
		<input type="hidden" name="s_num" value="<%=num%>">
	<table width="800" border="1" cellspacing="0" cellpadding="0" align="center">
		<tr><td width="100" align="center">보내는사람</td>
	    	<td width="330"><input type="text" size="10" name="s_send" value="<%=id%>" readonly>
	    	<td width="100" align="center">받는사람</td>
	    	<td width="330"><input type="text" size="10" name="s_receive" required></td>
		</tr>
	  
		<tr><td width="70" align="center">내 용</td>
		  	<td width="330"><textarea name="s_content" rows="5" cols="50" required></textarea></td>
		</tr>
	</table>
	
	<table align="center">  
		<tr><td colspan=2 align="center"> 
				<input type="submit" value="보내기"/>
				<input type="reset" value="취소"/></td>
		</tr>
	</table>    
<%}catch(Exception e){}%>     
</form>   
</body>
</html>      
