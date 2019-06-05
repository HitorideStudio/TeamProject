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
    	if(request.getParameter("r_num")!=null){
		num=Integer.parseInt(request.getParameter("r_num"));
		}
%>
   
<body>
<form method="post" name="writeform" action="reviewWritePro.jsp" onsubmit="return writeSave()">
	<input type="hidden" name="r_num" value="<%=num%>">
<table width="800" border="1" cellspacing="0" cellpadding="0" align="center">
	<tr><td width="100" align="center">이 름</td>
    	<td width="330"><input type="text" size="10" maxlength="10" name="r_name" value="<%=id %>" readonly></td></tr>
  
	<tr><td width="70" align="center" >내 용</td>
	  	<td width="330" ><textarea name="r_re" rows="10" cols="100"></textarea></td></tr>
</table>
<table width="800" border="1" cellspacing="0" cellpadding="0" align="center">
	<tr><td align="center">커리큘럼<br/>
					1<input type="radio" name="r_s_curr" value="1"/><br/>
					2<input type="radio" name="r_s_curr" value="2"/><br/>
					3<input type="radio" name="r_s_curr" value="3"/><br/>
					4<input type="radio" name="r_s_curr" value="4"/><br/>
					5<input type="radio" name="r_s_curr" value="5" checked="checked"/><br/></td>
					
		<td align="center">준비성<br/>
				    1<input type="radio" name="r_s_pre" value="1"/><br/>
					2<input type="radio" name="r_s_pre" value="2"/><br/>
					3<input type="radio" name="r_s_pre" value="3"/><br/>
					4<input type="radio" name="r_s_pre" value="4"/><br/>
					5<input type="radio" name="r_s_pre" value="5" checked="checked"/><br/></td>
					
		<td align="center">시간준수<br/>
					1<input type="radio" name="r_s_tk" value="1"/><br/>
					2<input type="radio" name="r_s_tk" value="2"/><br/>
					3<input type="radio" name="r_s_tk" value="3"/><br/>
					4<input type="radio" name="r_s_tk" value="4"/><br/>
					5<input type="radio" name="r_s_tk" value="5" checked="checked"/><br/></td>
					
		<td align="center">전달력<br/>
					1<input type="radio" name="r_s_deli" value="1"/><br/>
					2<input type="radio" name="r_s_deli" value="2"/><br/>
					3<input type="radio" name="r_s_deli" value="3"/><br/>
					4<input type="radio" name="r_s_deli" value="4"/><br/>
					5<input type="radio" name="r_s_deli" value="5" checked="checked"/><br/></td>
					
		<td align="center">친절도<br/>
					1<input type="radio" name="r_s_kind" value="1"/><br/>
					2<input type="radio" name="r_s_kind" value="2"/><br/>
					3<input type="radio" name="r_s_kind" value="3"/><br/>
					4<input type="radio" name="r_s_kind" value="4"/><br/>
					5<input type="radio" name="r_s_kind" value="5" checked="checked"/><br/></td>
	</tr>
</table>
<table align="center">  
	<tr><td colspan=2 align="center"> 
			<input type="submit" value="글쓰기"/>  
		</td>
	</tr>
</table>    
<%}catch(Exception e){}%>     
</form>   
</body>
</html>      
