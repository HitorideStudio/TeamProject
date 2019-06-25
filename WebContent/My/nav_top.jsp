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
#userImg{
	border-radius:50%;
	width:100px;
	
}
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
	buyVO o = buyer.getBuyOrder(m_email);//구매자 있는지 확인할 때
	int count = 0;
	int countp = 0;
	int countOrder = 0;
	count = buyer.buyCount2(m_email);
	countOrder = buyer.buyCount3(m_email);
	countp = product.getProductCount2(m_email);
	%>
<body>
	<table id="top" border="1">
		<tr>
			<td class="section">
			<%if(e == null){ %>
			<img src="../Images/TutorImg/user.png" width="50%" /><%=m_email %><br>
			<a href="/TeamProject/Tutor/Register/menu.jsp">튜터 등록하세요</a><br>
			<%} else {%>
			
				<img id="userImg" src="../Images/TutorImg/<%=e.getT_selfimg()%>" /> <%--해당 이메일의 닉네임 --%> <%=c.getM_name()%> 님<br> 
				<button class="btn click" 
						onClick="location.href='/TeamProject/Tutor/tutorModifyForm.jsp'">튜터 정보 수정
					</button>
				
				<%}%>
				<button class="btn click"
					onClick="location.href='/TeamProject/My/profile.jsp'">정보 수정</button>
				
				
				<button class="btn click"
					onClick="location.href='/TeamProject/Log/logout.jsp'">로그 아웃</button>
			</td>
			
			<td class="section">
				<div class="sec_box">
					
					<div class="nav_inner_colBox">
						<img class="nav_icon" alt="" src="/TeamProject/Images/Icon/journal.png">
						<p>받은수업신청서</p>
						<%if(e == null){ %>
						<p>튜터:미등록</p>
						<%} else {
							if(p == null){ %>
							<p>아직<br> 나의 수업이 없어요</p>
							<%}else{
							if(b == null){ %>
								<p>(<%=countOrder %>)건</p>
								<%}else{ %>
									<p>(<%=countOrder %>)건</p>
						<button class="btn click" onClick="location.href='/TeamProject/My/myClass.jsp?p_num=<%=b.getB_productnumber()%>'">리스트 보기</button>
								<%}%>
							<%}%>
							<%}%>
					</div>
					<div class="sec_box_ele">
						<img class="icon" alt="" src="/TeamProject/Images/Icon/kakao.jpg">
						<p>신청한 수업</p>
						<%if(b == null){ %>
							<p>수업을 신청하세요.</p>
							<%}else{ %>
							<p>(<%=count %>)건</p>
							<button class="btn click" onClick="location.href='/TeamProject/My/myClass.jsp?p_num=<%=b.getB_productnumber() %>'">리스트보기</button>
							<%}%>
					</div>
					<div class="sec_box_ele">
						<img class="icon" alt="" src="/TeamProject/Images/Icon/kakao.jpg">
						<p>내 수업</p>
						<%if(p == null){ %>
							<p>아직<br> 나의 수업이  없어요</p>
							<%}else{%>
							<p>(<%=countp %>)건</p>
							<button class="btn click" onClick="location.href='/TeamProject/My/myClass.jsp?p_num=<%=p.getP_num() %>'">리스트보기</button>
							<%}%>
					</div>

				</div>
			</td>
			<td class="section">
				<div>
					<span>등록된 전화번호  <%=c.getM_phone() %></span>
					<button class="btn click" onClick="location.href='/TeamProject/My/profile.jsp'">수정하기</button>
				</div>
				<div>
					<span>등록 된 이메일<%=m_email%></span>
					
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
					<span>계정 정보:</span><button class="btn click" onClick="location.href='/TeamProject/Account/resetPassword.jsp'">비밀번호변경</button>
				</div>

			</td>
		</tr>
	</table>

</body>
</html>