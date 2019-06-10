<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page import="hmjm.bean.member.*"%>
<%@ page import="hmjm.bean.tutor.*"%>
<!DOCTYPE html>
<html>
<head>
<title>튜터등록 메뉴k</title>
<style>
#menu {
    background: #e3e3e3;
    padding: 100px 100px 100px 100px;
}

.menu_new {width: 500;}



.eachButton {display:table-cell;}

</style>
</head>
<body>
	
	<jsp:include page="/Home/header.jsp" />
	
	<div id="menu">
		<div class="eachButton" align="center">
		<%
			if (session.getAttribute("loginId") == null) {
		%>
			<script>
				alert("로그인 후 이용바랍니다.");
				window.location = '/TeamProject/Log/loginForm.jsp';
			</script>

		<%
			} else {   
				String m_email = (String) session.getAttribute("loginId");
				memberDAO manager = memberDAO.getInstance();
				memberVO c = manager.getMember(m_email);
				tutorDAO vo = tutorDAO.getInstance();
				tutorVO e = vo.getMember(m_email);
		%>
		<div>
			<b>확인용 이메일: <%=c.getM_email()%></b><br>
			<b>확인용 이름:<%=c.getM_name()%></b><br>
			<hr>
				<div>
					<%
				if (e == null) {
			%>
			<input type="button" value="튜터등록"
				onclick="javascript:window.location='/TeamProject/Tutor/tutorRegister2.jsp'">

			<%} else {%>
			<input type="button" value="튜터수정"
				onclick="javascript:window.location='/TeamProject/Tutor/tutorModifyForm.jsp'">
			<%}
			}%>
				
					<input type="button" value="강의등록"
				onclick="javascript:window.location='/TeamProject/Product/addProduct.jsp'">
				</div>
			</div>		
		</div>
	</div>
	
	<div>
		<jsp:include page="/Home/footer.jsp" />
	</div>
</body>
</html>