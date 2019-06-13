<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import = "hmjm.bean.tutor.*" %>
<%@ page import = "hmjm.bean.member.*" %>
<%@ page import = "hmjm.bean.product.*" %>
<%@ page import = "hmjm.bean.buy.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상단 바KKKK</title>
<style>
#top, table {
	width: 100%;
	height: 220px;
	margin: 0 auto;
	background-color: #e3e3b5;
	boarder: 1px solid;
	text-align: center;
}
.section {
	width: 400px;
	height: 150px;
	margin: 50px 0 0 30px;
}
.sec_box {display: table-row;}

.sec_box_ele {display: table-cell;}

a {/*밀줄 제거, 폰트 사이즈 변경, 윤곽 잡기(버튼처럼)*/}

#icon, img { /*아이콘 이미지 사이즈 */width: 50px;}

</style>
</head>
<%
	request.setCharacterEncoding("utf-8");

	String m_email =(String)session.getAttribute("loginId");//이메일 값
	memberDAO manager = memberDAO.getInstance();
	memberVO c = manager.getMember(m_email);
	
	tutorDAO vo = tutorDAO.getInstance();
	tutorVO e = vo.getMember(m_email);
	
	productDAO product = productDAO.getInstance();
	productVO p = product.getProducts(m_email);
	
	buyDAO buyer = buyDAO.getInstance();
	buyVO b = buyer.getBuy(m_email);
	%>
<body>
	<table id="top" border="1">
		<tr>
			<td class="section">
			<%if(e == null){ %>
			<img src="../Images/TutorImg/user.png" width="50%"/><%=m_email %><br>
			<a href="/TeamProject/Tutor/Register/menu.jsp">튜터 등록하세요</a><br>
			<%} else {%>
			<%=e.getT_num() %>
				<%--등록한 이미지사진 불러오기 --%> <img src="../Images/TutorImg/<%=e.getT_selfimg()%>"
				width="30%" height="30%" /> <%--해당 이메일의 닉네임 --%> <%=c.getM_name()%> 님<br> 
				<a href="/TeamProject/Tutor/Register/menu.jsp">튜터 정보 수정</a><br>
				
				<%}%>
				<a href="/TeamProject/My/profile.jsp">정보 수정</a>&nbsp;<br>
				
				
				<a href="/TeamProject/Log/logout.jsp">로그아웃</a>
			</td>
			
			<td class="section">
				<div class="sec_box">
					<div class="sec_box_ele">
						<img class="icon" alt="" src="/TeamProject/Images/Icon/kakao.jpg">
						<p>받은수업신청서</p>
						<p>0건</p>
					</div>
					<div class="sec_box_ele">
						<img class="icon" alt="" src="/TeamProject/Images/Icon/kakao.jpg">
						<p>신청한 수업</p>
						<%if(b == null){ %>
							<p>수업을 신청하세요^^</p>
							<%}else{ %>
						<p>수업이름: <%=b.getB_classname() %></p>
						<p>수업번호: <a href ="../Talent/Detail.jsp?p_num=<%=b.getB_productnumber() %>"><%=b.getB_productnumber() %></a> </p>
						<p>상세보기: <a href ="/TeamProject/My/myClass.jsp?p_num=<%=b.getB_productnumber() %>">테스트경로</a> </p>	
							<%}%>
					</div>
					<div class="sec_box_ele">
						<img class="icon" alt="" src="/TeamProject/Images/Icon/kakao.jpg">
						<p>나의 수업</p>
						<%if(p == null){ %>
							<p>아직 나의 수업이 없어요</p>
							<%}else{ %>
							<p>수업이름: <%=p.getP_classname() %></p>
							<p>수업번호: <a href ="../Talent/Detail.jsp?p_num=<%=p.getP_num() %>"><%=p.getP_num() %></a> </p>
							<p>상세보기: <a href ="/TeamProject/My/myClass.jsp?p_num=<%=p.getP_num() %>">테스트경로</a> </p>
							<%}%>
					</div>

				</div>
			</td>
			<td class="section">
				<div>
					<span>등록된 전화번호:</span> <%=c.getM_phone() %>
				</div>
				<div>
					<span>등록 된 이메일:</span>
					<%=m_email%>
				</div>
				<div>
				<%
				if (e == null) {%>
				<span>학교 정보:</span> 등록안됨
				<%} else {%>
					<span>학교 정보:</span> <%=e.getT_school() %>
					<%}%>
				
				</div>
				<div>
					<span>계정 정보:</span> <a href="/TeamProject/My/profile.jsp">비밀번호변경</a>
				</div>

			</td>
		</tr>
	</table>

</body>
</html>