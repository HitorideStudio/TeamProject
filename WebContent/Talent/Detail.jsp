<%@ page language="java" contentType="text/html; charset=EUC-KR" %>
<%@ page import = "hmjm.bean.product.*" %>
<%@ page import = "hmjm.bean.buy.*" %>
<%@ page import = "hmjm.bean.classtime.*" %>
<%@ page import = "hmjm.bean.classimg.*" %>
<%@ page import = "java.util.List" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>강의 상세페이지kkkk</title>
</head>

<%

	String id = (String) session.getAttribute("loginId");
	int num = Integer.parseInt(request.getParameter("p_num"));
	String pageNum = request.getParameter("pageNum");
	
	
		productDAO dbPro = productDAO.getInstance();
		productVO vo = dbPro.getProduct(num);
		
		classtimeDAO time = classtimeDAO.getInstance();
		classtimeVO t = time.getClasstime(num);
		String t_email = vo.getP_email();//강사 닉네임을 불러오기위해
		
		classimgDAO aa  = classimgDAO.getInstance();
		classimgVO bb = aa.getImg(num);
		
		
		
		//사진 불러오기 할려고 했는데 이건 아닌 듯....미완성
		if (pageNum == null) { pageNum = "1"; }
		int pageSize = 10;
		int currentPage = Integer.parseInt(pageNum);
		int startRow = (currentPage - 1) * pageSize + 1;
		int endRow = currentPage * pageSize;
		int count = 0;
		int number=0;
		
		List classimgList = null;
		classimgDAO pic = classimgDAO.getInstance();
		count = pic.getClassimgCount(num);
		
		if (count > 0) {
			classimgList = pic.getClassimg(num,startRow, endRow);
		}
	

%>
<jsp:include page="../Home/header.jsp" />
<body>

	<h1>강의 상세 페이지</h1>
	<p><%=vo.getP_num() %>:::::::::::::이거 강의번호를 신청할때 넘겨야한다</p><br>
	<h1><%=vo.getP_classname() %></h1><br>
	강사소개:::::::: <%=vo.getP_self() %><br>
	카테고리:::::::: <%=vo.getP_category() %><br>
	강사이메일:::::::: <%=vo.getP_email() %><br><br>
<% 	try{%>	
	<% if(bb.getCi_name()==null){%>
	error
	<%}else{ %>
	
		<%if(count == 0){%>
		test
		<%}else{%>
			<% for(int i = 0 ; i < classimgList.size(); i++){
			classimgVO g = (classimgVO)classimgList.get(i);%>
		
			<img src="/Images/classimg/<%=g.getCi_name()%>"
			width="50%" height="50%">
			<%}%>
		<%}%>
	<%}%>


	<div>
	수업가능시간::::::::
			<%if(t.getCt_mon()==null){%>
			<%}else{%>
			월: <%=t.getCt_mon() %>
			<%} %>
			<%if(t.getCt_tue()==null){%>
			<%}else{%>
			화: <%=t.getCt_tue() %>
			<%} %>
			<%if(t.getCt_wed()==null){%>
			<%}else{%>
			수: <%=t.getCt_wed() %>
			<%} %>
			<%if(t.getCt_thu()==null){%>
			<%}else{%>
			목: <%=t.getCt_thu() %>
			<%} %>
			<%if(t.getCt_fri()==null){%>
			<%}else{%>
			금: <%=t.getCt_fri() %>
			<%} %>
			<%if(t.getCt_sta()==null){%>
			<%}else{%>
			토: <%=t.getCt_sta() %>
			<%} %>
			
			<%if(t.getCt_sun()==null){%>
			<%}else{%>
			일: <%=t.getCt_sun() %>
			<%} %>
			
			<%if(t.getCt_day()==null){%>
			<%}else{%>
			데이수업<%=t.getCt_day() %>
			<%} %>

<% 
	}catch(Exception e){} 
%>	
			
		</div><br>
	<a href ="./check.jsp?p_num=<%=vo.getP_num() %>">강의신청</a>
	

<jsp:include page="/Home/footer.jsp" />	
</body>
</html>