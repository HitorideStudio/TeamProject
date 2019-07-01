<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="hmjm.bean.review.reviewDAO"%>
<%@ page import="hmjm.bean.review.reviewVO"%>
<%@ page import="hmjm.bean.product.productDAO"%>
<%@ page import="hmjm.bean.product.productVO"%>
<%@ page import="java.util.List"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<%!int rpageSize = 5; //한 화면에 보여줄 리스트 갯수%>

<%
	String id = (String) session.getAttribute("loginId");
	String rpageNum = request.getParameter("pageNum");
	int pnum = Integer.parseInt(request.getParameter("p_num"));

	if (rpageNum == null) {	rpageNum = "1";	}

	int rcurrentPage = Integer.parseInt(rpageNum);
	int rstartRow = (rcurrentPage - 1) * rpageSize + 1;
	int rendRow = rcurrentPage * rpageSize;
	int recount = 0;
	int number = 0;
	
	List articleList = null;
	reviewDAO dbPro = reviewDAO.getInstance();
	recount = dbPro.getArticleCount(pnum);

	if (recount > 0) { articleList = dbPro.getArticles(pnum, rstartRow, rendRow); }
	number = recount - (rcurrentPage - 1) * rpageSize;

	int rcount = 0; //판매글 리뷰 갯수 초기화
	rcount = dbPro.reviewCount(pnum);

	double avg = dbPro.avgScore(pnum); //리뷰 별점의 평균점수
%>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</head>
<style>
.review {
	background-color: #beebed;
}
.star {
	background-color: #bedced;
}
</style>
<body style="text-align: center;">
	<p><%=dbPro.reviewCount(pnum)%>개 리뷰가 존재합니다.</p>
	<%--별 아이콘 찍기 --%>
	<p>
		평균점수:
		<%for (int i = 0; i < avg; i++) {%>
			<span><img src="/hmjm/Images/Icon/star_f.png" /></span>
		<%}	%>
		<span><%=avg%> / 5.0</span>
		<%if (rcount == 0) {%>
			<table style="width: 800px" border="1" cellpadding="0" cellspacing="0" align="center">
				<tr><td align="center">작성된 후기가 없습니다.</td></tr>
			</table>
		<%} else {%>
	<table border="2" width="900" cellpadding="0" cellspacing="0" align="center">
		<%for (int i = 0; i < articleList.size(); i++) {
			reviewVO article = (reviewVO) articleList.get(i);%>
			<tr class="review">
				<td align="center" width="50"><%=number--%></td>
				<td align="left" width="375" colspan="3"><%=article.getR_re()%></td>
				<td align="center" width="100"><%=article.getR_name()%></td>
				<td align="center" width="100"><%=article.getR_reg()%></td>
			</tr>
			<%-- 점수에 따라 별 갯수 1~5개 --%>
			<tr class="star">
				<td align="center" width="150">커리큘럼<br />
					<%int curr = article.getR_s_curr();
					for (int cu = 0; cu < curr; cu++) {%>
						<img src="/hmjm/Images/Icon/star_f.png">
					<%}
		 			for (int j = 0; j < 5 - curr; j++) {%>
		 				<img src="/hmjm/Images/Icon/star_empty.png">
		 			<%} %>
				</td>
				<td align="center" width="150">준비성<br />
					<%int pre = article.getR_s_pre();
	 				for (int pr = 0; pr < pre; pr++) {%>
	 					<img src="/hmjm/Images/Icon/star_f.png">
	 				<%}
	 				for (int j = 0; j < 5 - pre; j++) {%>
	 				<img src="/hmjm/Images/Icon/star_empty.png">
	 				<%}%>
				</td>

				<td align="center" width="150">시간준수<br />
					<%int tk = article.getR_s_tk();
 					for (int t = 0; t < tk; t++) {%>
 						<img src="/hmjm/Images/Icon/star_f.png">
 					<%}
 					for (int j = 0; j < 5 - tk; j++) {%>
 						<img src="/hmjm/Images/Icon/star_empty.png">
 					<%}%>
				</td>

				<td align="center" width="150">전달력<br />
					<%int deli = article.getR_s_deli();
 					for (int de = 0; de < deli; de++) {%>
 						<img src="/hmjm/Images/Icon/star_f.png">
 					<%}
 					for (int j = 0; j < 5 - deli; j++) {%>
 						<img src="/hmjm/Images/Icon/star_empty.png">
 					<%}%>
				</td>

				<td align="center" width="150">친절도<br />
					<%int kind = article.getR_s_kind();
 					for (int ki = 0; ki < kind; ki++) {%>
 						<img src="/hmjm/Images/Icon/star_f.png">
 					<%}
 					for (int j = 0; j < 5 - curr; j++) {%>
 						<img src="/hmjm/Images/Icon/star_empty.png">
 					<%}%>
				</td>

				<%-- 로그인을 한상태 + 작성글의 아이디와 로그인 아이디가 일치할때만 수정/삭제 가능--%>
				<td align="center">
					<%String login = article.getR_name();
					if (id != null) {
					if (id.equals(login) || id.equals("admin")) {%>
						<button type="button" class="btn btn-primary btn-sm"
							onclick="document.location.href='/hmjm/Review/reviewUpdateForm.jsp?num=<%=article.getR_num()%>&rpageNum=<%=rpageNum%>&p_num=<%=pnum%>'">수정</button>
						<button type="button" class="btn btn-danger btn-sm"
							onclick="document.location.href='/hmjm/Review/reviewDeleteForm.jsp?num=<%=article.getR_num()%>&p_num=<%=pnum%>'">삭제</button>
					<%}}%>
				</td>
			</tr>
		<%}}%>
	</table>
	<br />
	<button type="button" class="btn btn-secondary"
		onClick="window.open('/hmjm/Review/reviewMore.jsp?p_num=<%=pnum%>','_blank','toolbar=no,location=no,status=no,menubar=no,scrollbars=auto,resizable=no,directories=no,width=770,height=600')">더보기</button>
	<br /><br />
	<%
		/*
		1. 로그인 확인
		2. buy테이블에서 b_email 확인 
		3. 리뷰 작성 아이디 중복확인
		로그인 true, b_email true , 중복 false 일때 reviewWriteForm include  
		*/

		//리뷰 작성 아이디 중복확인
		reviewDAO chk = reviewDAO.getInstance();
		int check = chk.checkArticle(pnum, id);
		int bcheck = chk.buyCheck(pnum, id);

		if (id != null) { //로그인 상태일 때
			if (check == 0) { //작성된 리뷰 중 중복 아이디가 없을 때
				if (bcheck != 0) {%>
					<%-- 구매확인 true일때 --%>
					<jsp:include page="/Review/reviewWriteForm.jsp" />
				<%} else {%>
					<%-- 구매자가 아닐경우 출력 --%>
					<p>강의 신청부터...</p>
				<%}
			} else {%>
				<%-- 중복아이디가 있으면 출력 --%>
				<p>리뷰는 한번만...</p>
			<%}
		} else {%>
			<%-- 로그아웃 상태면 출력 --%>
			<p>로그인 좀...</p>
		<%}%>

	<%-- 관리자 로그인 상태일 때 --%>
	<%if (id != null) {
		if (id.equals("admin")) {%>
		<jsp:include page="/Review/reviewWriteForm.jsp" />
		<%}
	}%>
</body>
</html>

