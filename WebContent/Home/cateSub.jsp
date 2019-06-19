<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import = "hmjm.bean.product.*" %>
<%@ page import = "java.util.List" %>
<%@ page import = "hmjm.bean.classimg.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>세부 카테고리</title>
<style type="text/css">
.rank {
    float: left;
    width: 300px;
    height: 200px;
    overflow: hidden;
    border: 1px #ddd solid;
    padding: 1px;
}
</style>
</head>
<%
	String cate = request.getParameter("c_code");
	productDAO db = productDAO.getInstance();
	productVO c = db.getProduct3(cate);
	
	int pageSize = 10;

	String pageNum = request.getParameter("pageNum");
	if (pageNum == null) {pageNum = "1";}

	int currentPage = Integer.parseInt(pageNum);
	int startRow = (currentPage - 1) * pageSize + 1;	// 시작페이지 카운트
	int endRow = currentPage * pageSize;  	// 1~10까지 가져오기위한거
	int count = 0;
	int number=0;
	
	List cateSubList = null; 
	productDAO dbPro = productDAO.getInstance();
	count = dbPro.getProductCount();
	if (count > 0) {
		cateSubList = dbPro.getProductSub(cate,startRow, endRow);}	
	classimgDAO aa  = classimgDAO.getInstance();//강의등록사진 불러오기
%>
<body>
<jsp:include page="/Home/header.jsp" />
<jsp:include page="category.jsp" />
<div>
<%if(c == null){ %>
	미등록 카테고리
	<%}else{%>
	<%if (count == 0 ){%>
		<p>등록된 강의가 없습니다<p>
	<%}else{%>
		<% for(int i = 0 ; i <cateSubList.size(); i++){
			productVO v = (productVO)cateSubList.get(i); 
			int pn = v.getP_num();
			classimgVO bb = aa.getImg(pn);%>
			<div class="rank">
			수업번호::<%=v.getP_num() %>
			수업이름::<a href ="/TeamProject/Talent/Detail.jsp?p_num=<%=v.getP_num()%>"><%=v.getP_classname() %></a><br>
			<img src="/TeamProject/Images/Classimg/<%=bb.getCi_name() %>" width="100%"/>
			</div>
		<%}%>
	<%}%>
	<%}%>

	</div>
	
<jsp:include page="/Home/footer.jsp" />	
</body>
</html>