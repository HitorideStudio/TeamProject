<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import = "hmjm.bean.product.*" %>
<%@ page import = "java.util.List" %>
<%@ page import = "hmjm.bean.classimg.*" %>
<%@ page import="hmjm.bean.review.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>세부 카테고리</title>
<style type="text/css">
.sub{
	width: 1000px;
	height: 400px;
}
#list{
	width:1050px;
	height:300px;
	margin: 0 auto;
}
.rank {
    float: left;
    width: 300px;
    height: 200px;
    overflow: hidden;
    border: 1px #ddd solid;
    padding: 1px;
 
}

.pd_container {
	background-color: #E1E1E1;
	float: left;
	margin: 2px;
}

.pd_info {
	display: table-row;
}

.pd_infoEle {
	display: table-cell;
	margin-left: auto;
	margin-right: auto;
	padding: 5px;
}

#btCont {
	width:100%;
	height:200px;
	float: left;
}

#cont_img {
	width: 250px;
	height:200px;
}

/*a태그 관련 스타일 적용*/
a:link {
	color: black;
	text-decoration: none;
}

a:visited {
	color: black;
	text-decoration: none;
}

a:hovor {
	color: black;
	text-decoration: none;
}

.bt_msg1{
	text-align:center;
}
.bt_msg2{
	float:right
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
	reviewDAO rdao = reviewDAO.getInstance();
%>
<body>
<jsp:include page="/Home/header.jsp" />
<jsp:include page="category.jsp" />
<div class="sub">
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
			
			<div id="contents">
					<a href="/TeamProject/Talent/Detail.jsp?p_num=<%=v.getP_num()%>&pageNum=<%=currentPage %>">
				<div class="pd_container">
					<div class="pd_img">
						<img id="cont_img" src="/TeamProject/Images/Classimg/<%=bb.getCi_name() %>"  />
					</div>
					<div class="pd_info">
						<div class="pd_infoEle">
						<b>[<%=v.getP_classname() %>]</b>
						<p><img src="/TeamProject/Images/Icon/coin.png" /><%=v.getP_cost()%></p>
						
					
					<%
						long stScore = Math.round(rdao.avgScore(pn)); //반올림
							
							for (int y = 0; y < stScore; y++) {//별찍기%>
								<span><img src="/TeamProject/Images/Icon/star_f.png" /></span>
							<%}
							for (int y = 0; y < 5 - stScore; y++) {%>
									<span><img src="/TeamProject/Images/Icon/star_empty.png" /></span>
							<%}%>
							<%=rdao.avgScore(pn)%>(<%=rdao.reviewCount(pn)%>)
				</div>
			</div>
		</div>
		</a>
	</div><%--id=contents--%>
		<%}%>
		
	<%}%>
	<%}%>

	</div>
	
<jsp:include page="/Home/footer.jsp" />	
</body>
</html>