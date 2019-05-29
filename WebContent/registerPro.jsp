<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import ="java.sql.*"%>
<%@ page import ="tp.bean.dao.*" %>
<%@ page import ="tp.bean.vo.memberVO" %>

<% request.setCharacterEncoding("utf-8");%>

<jsp:useBean id="vo" class="tp.bean.vo.memberVO">
    <jsp:setProperty name="vo" property="*" />
</jsp:useBean>

<%		
		
		memberDAO manager = memberDAO.getInstance();
		manager.insertMember(vo);

	
	%>
			<script>
	    	alert("가입을 축하합니다!");
	    	</script>
	    	<META http-equiv=refresh content="0;url=loginForm.jsp">
	
	

	