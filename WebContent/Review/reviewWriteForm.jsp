<%@ page contentType="text/html; charset=utf-8" %>
<% request.setCharacterEncoding("UTF-8");%>
<html>
<head>
<link href="style.css" rel="stylesheet" type="text/css">
<script language="JavaScript" src="script.js"></script>
</head>
<style>
.reWrite {
	background-color: #beebed;
}
.reStar {
	background-color: #bedced;
}
</style>
<% 
	String id = (String)session.getAttribute("loginId");
	int pnum = Integer.parseInt(request.getParameter("p_num"));
    
	int num=0;
	try{  
    	if(request.getParameter("r_num")!=null){
		num=Integer.parseInt(request.getParameter("r_num"));
	}
%>
   
<body>
<form method="post" name="writeform" action="/hmjm/Review/reviewWritePro.jsp?p_num=<%=pnum%>" onsubmit="return writeSave()">
	<input type="hidden" name="r_num" value="<%=num%>">
	<input type="hidden" name="pr_num" value="<%=pnum%>">
<table class="reWrite" style="width:800px" border="1" cellspacing="0" cellpadding="0" align="center">
	<!-- 리뷰 작성자 이름은 아이디 자동입력 -->
	<tr><td align="center">이 름</td>
    	<td><%=id%>
    		<input type="hidden" size="10" maxlength="10" name="r_name" value="<%=id%>" readonly></td></tr>
  
	<tr><td align="center" >내 용</td>
	  	<td><textarea name="r_re" rows="7" cols="90"></textarea></td></tr>
</table>
<!-- 점수 5점 기본선택 -->
<table class="reStar" style="width:800px" border="1" cellspacing="0" cellpadding="0" align="center">
	<tr><td align="center" width="160">커리큘럼<br/>
					1<input type="radio" name="r_s_curr" value="1"/><br/>
					2<input type="radio" name="r_s_curr" value="2"/><br/>
					3<input type="radio" name="r_s_curr" value="3"/><br/>
					4<input type="radio" name="r_s_curr" value="4"/><br/>
					5<input type="radio" name="r_s_curr" value="5" checked="checked"/><br/></td>
					
		<td align="center" width="160">준비성<br/>
				    1<input type="radio" name="r_s_pre" value="1"/><br/>
					2<input type="radio" name="r_s_pre" value="2"/><br/>
					3<input type="radio" name="r_s_pre" value="3"/><br/>
					4<input type="radio" name="r_s_pre" value="4"/><br/>
					5<input type="radio" name="r_s_pre" value="5" checked="checked"/><br/></td>
					
		<td align="center" width="160">시간준수<br/>
					1<input type="radio" name="r_s_tk" value="1"/><br/>
					2<input type="radio" name="r_s_tk" value="2"/><br/>
					3<input type="radio" name="r_s_tk" value="3"/><br/>
					4<input type="radio" name="r_s_tk" value="4"/><br/>
					5<input type="radio" name="r_s_tk" value="5" checked="checked"/><br/></td>
					
		<td align="center" width="160">전달력<br/>
					1<input type="radio" name="r_s_deli" value="1"/><br/>
					2<input type="radio" name="r_s_deli" value="2"/><br/>
					3<input type="radio" name="r_s_deli" value="3"/><br/>
					4<input type="radio" name="r_s_deli" value="4"/><br/>
					5<input type="radio" name="r_s_deli" value="5" checked="checked"/><br/></td>
					
		<td align="center" width="160">친절도<br/>
					1<input type="radio" name="r_s_kind" value="1"/><br/>
					2<input type="radio" name="r_s_kind" value="2"/><br/>
					3<input type="radio" name="r_s_kind" value="3"/><br/>
					4<input type="radio" name="r_s_kind" value="4"/><br/>
					5<input type="radio" name="r_s_kind" value="5" checked="checked"/><br/></td>
	</tr>
</table>
<table align="center">  
	<tr><td colspan=2 align="center">
			<button type="submit" class="btn btn-success">리뷰 작성하기</button>
			  
		</td>
	</tr>
</table>    
<%}catch(Exception e){}%>     
</form>   
</body>
</html>      
