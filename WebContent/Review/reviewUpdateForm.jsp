<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import = "hmjm.bean.dao.reviewDAO" %>
<%@ page import = "hmjm.bean.vo.reviewVO" %>
<%@ page import = "java.util.List" %>
<%@ page import = "java.text.SimpleDateFormat" %>
<html>
<head>
<link href="style.css" rel="stylesheet" type="text/css">

</head>

<% 
	int num = Integer.parseInt(request.getParameter("num"));
	String pageNum = request.getParameter("pageNum");
	String id = (String)session.getAttribute("loginId");
	
	try{  
    	if(request.getParameter("r_num")!=null){
		num=Integer.parseInt(request.getParameter("r_num"));
		}
    	reviewDAO dbPro = reviewDAO.getInstance();
    	reviewVO article =  dbPro.updateGetArticle(num);
%>
   
<body>  
<form method="post" name="writeform" action="reviewUpdatePro.jsp?pageNum=<%=pageNum%>" onsubmit="return writeSave()">
	<input type="hidden" name="r_num" value="<%=num%>">
<table width="800" border="1" cellspacing="0" cellpadding="0" align="center">
	
	<tr><td  width="100" align="center">이 름</td>
    	<td width="330"><input type="text" size="10" maxlength="10" name="r_name" value="<%=article.getR_name() %>" readonly>
    					<input type="hidden" name="r_num" value="<%=article.getR_num()%>"></td>
	</tr>
  
	<tr><td width="70" align="center" >내 용</td>
	  	<td width="330" ><textarea name="r_re" rows="10" cols="100"><%=article.getR_re()%></textarea></td>
	</tr>
</table>
<table width="800" border="1" cellspacing="0" cellpadding="0" align="center">
	<tr><td align="center">커리큘럼:<br/>
			<%int curr = article.getR_s_curr();
			if (curr == 1){	%>
				1<input type="radio" name="r_s_curr" value="1" checked="checked"/><br/>
				2<input type="radio" name="r_s_curr" value="2"/><br/>
				3<input type="radio" name="r_s_curr" value="3"/><br/>
				4<input type="radio" name="r_s_curr" value="4"/><br/>
				5<input type="radio" name="r_s_curr" value="5"/><br/>
			<%}else if (curr== 2){	%>
				1<input type="radio" name="r_s_curr" value="1"/><br/>
				2<input type="radio" name="r_s_curr" value="2" checked="checked"/><br/>
				3<input type="radio" name="r_s_curr" value="3"/><br/>
				4<input type="radio" name="r_s_curr" value="4"/><br/>
				5<input type="radio" name="r_s_curr" value="5"/><br/>
			<%}else if (curr== 2){	%>
				1<input type="radio" name="r_s_curr" value="1"/><br/>
				2<input type="radio" name="r_s_curr" value="2"/><br/>
				3<input type="radio" name="r_s_curr" value="3" checked="checked"/><br/>
				4<input type="radio" name="r_s_curr" value="4"/><br/>
				5<input type="radio" name="r_s_curr" value="5"/><br/>
			<%}else if (curr== 2){	%>
				1<input type="radio" name="r_s_curr" value="1"/><br/>
				2<input type="radio" name="r_s_curr" value="2"/><br/>
				3<input type="radio" name="r_s_curr" value="3"/><br/>
				4<input type="radio" name="r_s_curr" value="4" checked="checked"/><br/>
				5<input type="radio" name="r_s_curr" value="5"/><br/>
			<%}else{%>
				1<input type="radio" name="r_s_curr" value="1"/><br/>
				2<input type="radio" name="r_s_curr" value="2"/><br/>
				3<input type="radio" name="r_s_curr" value="3"/><br/>
				4<input type="radio" name="r_s_curr" value="4"/><br/>
				5<input type="radio" name="r_s_curr" value="5" checked="checked"/><br/>
			<%} %>
		</td>
		
		<td align="center">준비성:<br/>
			<%int pre = article.getR_s_pre();
			if (pre == 1){	%>
			    1<input type="radio" name="r_s_pre" value="1" checked="checked"/><br/>
				2<input type="radio" name="r_s_pre" value="2"/><br/>
				3<input type="radio" name="r_s_pre" value="3"/><br/>
				4<input type="radio" name="r_s_pre" value="4"/><br/>
				5<input type="radio" name="r_s_pre" value="5"/><br/>
			<%}else if (pre == 2){	%>
				1<input type="radio" name="r_s_pre" value="1"/><br/>
				2<input type="radio" name="r_s_pre" value="2" checked="checked"/><br/>
				3<input type="radio" name="r_s_pre" value="3"/><br/>
				4<input type="radio" name="r_s_pre" value="4"/><br/>
				5<input type="radio" name="r_s_pre" value="5"/><br/>
			<%}else if (pre == 3){	%>
				1<input type="radio" name="r_s_pre" value="1"/><br/>
				2<input type="radio" name="r_s_pre" value="2"/><br/>
				3<input type="radio" name="r_s_pre" value="3" checked="checked"/><br/>
				4<input type="radio" name="r_s_pre" value="4"/><br/>
				5<input type="radio" name="r_s_pre" value="5"/><br/>
			<%}else if (pre == 4){	%>
				1<input type="radio" name="r_s_pre" value="1"/><br/>
				2<input type="radio" name="r_s_pre" value="2"/><br/>
				3<input type="radio" name="r_s_pre" value="3"/><br/>
				4<input type="radio" name="r_s_pre" value="4" checked="checked"/><br/>
				5<input type="radio" name="r_s_pre" value="5"/><br/>
			<%}else{%>
				1<input type="radio" name="r_s_pre" value="1"/><br/>
				2<input type="radio" name="r_s_pre" value="2"/><br/>
				3<input type="radio" name="r_s_pre" value="3"/><br/>
				4<input type="radio" name="r_s_pre" value="4"/><br/>
				5<input type="radio" name="r_s_pre" value="5" checked="checked"/><br/>
			<%} %>
		</td>	
		
		<td align="center">시간준수:<br/>
			<%int tk = article.getR_s_tk();
			if (tk == 1){	%>
				1<input type="radio" name="r_s_tk" value="1" checked="checked"/><br/>
				2<input type="radio" name="r_s_tk" value="2"/><br/>
				3<input type="radio" name="r_s_tk" value="3"/><br/>
				4<input type="radio" name="r_s_tk" value="4"/><br/>
				5<input type="radio" name="r_s_tk" value="5"/><br/>
			<%}else if (tk== 2){	%>
				1<input type="radio" name="r_s_tk" value="1"/><br/>
				2<input type="radio" name="r_s_tk" value="2" checked="checked"/><br/>
				3<input type="radio" name="r_s_tk" value="3"/><br/>
				4<input type="radio" name="r_s_tk" value="4"/><br/>
				5<input type="radio" name="r_s_tk" value="5"/><br/>
			<%}else if (tk== 3){	%>
				1<input type="radio" name="r_s_tk" value="1"/><br/>
				2<input type="radio" name="r_s_tk" value="2"/><br/>
				3<input type="radio" name="r_s_tk" value="3" checked="checked"/><br/>
				4<input type="radio" name="r_s_tk" value="4"/><br/>
				5<input type="radio" name="r_s_tk" value="5"/><br/>
			<%}else if (tk== 4){	%>
				1<input type="radio" name="r_s_tk" value="1"/><br/>
				2<input type="radio" name="r_s_tk" value="2"/><br/>
				3<input type="radio" name="r_s_tk" value="3"/><br/>
				4<input type="radio" name="r_s_tk" value="4" checked="checked"/><br/>
				5<input type="radio" name="r_s_tk" value="5"/><br/>
			<%}else{	%>
				1<input type="radio" name="r_s_tk" value="1"/><br/>
				2<input type="radio" name="r_s_tk" value="2"/><br/>
				3<input type="radio" name="r_s_tk" value="3"/><br/>
				4<input type="radio" name="r_s_tk" value="4"/><br/>
				5<input type="radio" name="r_s_tk" value="5" checked="checked"/><br/>
			<%} %>
		</td>
		
		<td align="center">전달력:<br/>
			<%int deli = article.getR_s_deli();
			if (deli == 1){	%>
				1<input type="radio" name="r_s_deli" value="1" checked="checked"/><br/>
				2<input type="radio" name="r_s_deli" value="2"/><br/>
				3<input type="radio" name="r_s_deli" value="3"/><br/>
				4<input type="radio" name="r_s_deli" value="4"/><br/>
				5<input type="radio" name="r_s_deli" value="5"/><br/>
			<%}else if (deli== 2){	%>
				1<input type="radio" name="r_s_deli" value="1"/><br/>
				2<input type="radio" name="r_s_deli" value="2" checked="checked"/><br/>
				3<input type="radio" name="r_s_deli" value="3"/><br/>
				4<input type="radio" name="r_s_deli" value="4"/><br/>
				5<input type="radio" name="r_s_deli" value="5"/><br/>
			<%}else if (deli== 3){	%>
				1<input type="radio" name="r_s_deli" value="1"/><br/>
				2<input type="radio" name="r_s_deli" value="2"/><br/>
				3<input type="radio" name="r_s_deli" value="3" checked="checked"/><br/>
				4<input type="radio" name="r_s_deli" value="4"/><br/>
				5<input type="radio" name="r_s_deli" value="5"/><br/>
			<%}else if (deli== 4){	%>
				1<input type="radio" name="r_s_deli" value="1"/><br/>
				2<input type="radio" name="r_s_deli" value="2"/><br/>
				3<input type="radio" name="r_s_deli" value="3"/><br/>
				4<input type="radio" name="r_s_deli" value="4" checked="checked"/><br/>
				5<input type="radio" name="r_s_deli" value="5"/><br/>
			<%}else{	%>
				1<input type="radio" name="r_s_deli" value="1"/><br/>
				2<input type="radio" name="r_s_deli" value="2"/><br/>
				3<input type="radio" name="r_s_deli" value="3"/><br/>
				4<input type="radio" name="r_s_deli" value="4"/><br/>
				5<input type="radio" name="r_s_deli" value="5" checked="checked"/><br/>
			<%} %>
		</td>
		
		<td align="center">친절도:<br/>
			<%int kind = article.getR_s_kind();
			if (kind == 1){	%>
				1<input type="radio" name="r_s_kind" value="1" checked="checked"/><br/>
				2<input type="radio" name="r_s_kind" value="2"/><br/>
				3<input type="radio" name="r_s_kind" value="3"/><br/>
				4<input type="radio" name="r_s_kind" value="4"/><br/>
				5<input type="radio" name="r_s_kind" value="5"/><br/>
			<%}else if (kind == 2){	%>
				1<input type="radio" name="r_s_kind" value="1"/><br/>
				2<input type="radio" name="r_s_kind" value="2" checked="checked"/><br/>
				3<input type="radio" name="r_s_kind" value="3"/><br/>
				4<input type="radio" name="r_s_kind" value="4"/><br/>
				5<input type="radio" name="r_s_kind" value="5"/><br/>
			<%}else if (kind == 3){	%>
				1<input type="radio" name="r_s_kind" value="1"/><br/>
				2<input type="radio" name="r_s_kind" value="2"/><br/>
				3<input type="radio" name="r_s_kind" value="3" checked="checked"/><br/>
				4<input type="radio" name="r_s_kind" value="4"/><br/>
				5<input type="radio" name="r_s_kind" value="5"/><br/>
			<%}else if (kind == 4){	%>
				1<input type="radio" name="r_s_kind" value="1"/><br/>
				2<input type="radio" name="r_s_kind" value="2"/><br/>
				3<input type="radio" name="r_s_kind" value="3"/><br/>
				4<input type="radio" name="r_s_kind" value="4" checked="checked"/><br/>
				5<input type="radio" name="r_s_kind" value="5"/><br/>
			<%}else{ %>
				1<input type="radio" name="r_s_kind" value="1"/><br/>
				2<input type="radio" name="r_s_kind" value="2"/><br/>
				3<input type="radio" name="r_s_kind" value="3"/><br/>
				4<input type="radio" name="r_s_kind" value="4"/><br/>
				5<input type="radio" name="r_s_kind" value="5" checked="checked"/><br/>
			<%} %>
		</td></tr>
</table>
<table align="center">  
	<tr><td colspan=2 align="center"> 
			<input type="submit" value="수정하기" >  
		</td>
	</tr>
</table>    
<%}catch(Exception e){}%>     
</form>      
</body>
</html>      
