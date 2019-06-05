<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import = "hmjm.bean.tutor.*"%>


<% request.setCharacterEncoding("utf-8"); %>

<jsp:useBean id="vo" class="hmjm.bean.tutor.tutorVO">
	<jsp:setProperty name="vo" property="*" />
</jsp:useBean>
<%
		
		String t_email = (String)session.getAttribute("loginId");
		vo.setT_email(t_email);
		
		tutorDAO manager = tutorDAO.getInstance();
		manager.updateTutor(vo);
		
%>
	<form>
		<script>
			alert("수정이 완료되었습니다");
			window.location = './Register/menu.jsp';
		</script>
	</form>
		
	   