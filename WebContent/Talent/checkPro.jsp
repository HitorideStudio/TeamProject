<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.Enumeration"%>
<%@ page import ="java.sql.*" %>
<%@ page import ="hmjm.bean.buy.*" %>

<% request.setCharacterEncoding("utf-8"); %>

<jsp:useBean id="vo" class ="hmjm.bean.buy.buyVO">
	<jsp:setProperty name="vo" property="*" />
</jsp:useBean>	

<%
	buyDAO buyer = buyDAO.getInstance();
	buyer.insertBuy(vo);

%>

		<script>
	    	alert("결석하지 말고 파이팅!!");
	    </script>
	    <META http-equiv=refresh content="0;url=../My/application.jsp">