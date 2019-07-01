<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import = "hmjm.bean.review.reviewDAO" %>
<%@ page import = "hmjm.bean.review.reviewVO" %>
<%@ page import = "java.util.List" %>
<%@ page import = "java.text.SimpleDateFormat" %>
<% request.setCharacterEncoding("UTF-8");%>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</head>

<% 
	int num = Integer.parseInt(request.getParameter("num"));
	int pnum = Integer.parseInt(request.getParameter("p_num"));
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
<!-- 리뷰를 수정할 때는 이름, 내용, 점수를 이전에 작성한 그대로 불러옴 -->
<form method="post" name="writeform" action="/hmjm/Review/reviewMoreUpdatePro.jsp?p_num=<%=pnum %>">
	<input type="hidden" name="r_num" value="<%=num%>">
<table width="800" border="1" cellspacing="0" cellpadding="0" align="center">
	
	<tr><td  width="100" align="center">이 름</td>
    	<td width="330"><%=article.getR_name()%>
    					<input type="hidden" name="r_num" value="<%=article.getR_num()%>"></td>
	</tr>
  
	<tr><td width="70" align="center" >내 용</td>
	  	<td width="330" ><textarea name="r_re" rows="7" cols="100"><%=article.getR_re()%></textarea></td>
	</tr>
</table>
<!-- 저장된 점수를 불러와서 이전 점수 그대로 체크 -->
<table width="800" border="1" cellspacing="0" cellpadding="0" align="center">
	<tr><td align="center" width="160">커리큘럼:<br/>
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
		
		<td align="center" width="160">준비성:<br/>
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
		
		<td align="center" width="160">시간준수:<br/>
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
		
		<td align="center" width="160">전달력:<br/>
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
		
		<td align="center" width="160">친절도:<br/>
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
			<button type="submit" class="btn btn-primary">수정하기</button>  
		</td>
	</tr>
</table>    
<%}catch(Exception e){}%>     
</form>      
</body>
</html>      
