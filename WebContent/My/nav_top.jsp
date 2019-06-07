<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import = "hmjm.bean.tutor.*" %>
<%@ page import = "hmjm.bean.member.*" %>
<!DOCTYPE html>
<html>
<head>
<title>상단 바</title>
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
	String m_email =(String)session.getAttribute("loginId");//이메일 값
	memberDAO manager = memberDAO.getInstance();
	memberVO c = manager.getMember(m_email);
	tutorDAO vo = tutorDAO.getInstance();
	tutorVO e = vo.getMember(m_email);
%>
<body>
	<table id="top" border="1">
		<tr>
			<td class="section">
				<%--등록한 이미지사진 불러오기 --%> <img src="/TeamProject/Images/Icon/user.png"
				width="90px" /> <%--해당 이메일의 닉네임 --%> <%=m_email%> 님<br> <a
				href="/TeamProject/My/profile.jsp">정보 수정</a>&nbsp;<a>튜터 정보 수정</a><br>
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
						<p>0건</p>
					</div>
					<div class="sec_box_ele">
						<img class="icon" alt="" src="/TeamProject/Images/Icon/kakao.jpg">
						<p>위시리스트</p>
						<p>0건</p>
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
				if (e == null) {
			%>
				<span>학교 정보:</span> 등록안됨
				<%} else {%>
					<span>학교 정보:</span> <%=e.getT_school() %>
					<%}%>
				
				</div>
				<div>
					<span>계정 정보:</span> <a href="/TeamProject/Account/resetPassword.jsp">비밀번호변경</a>
				</div>

			</td>
		</tr>
	</table>

</body>
</html>