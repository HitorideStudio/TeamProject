<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="hmjm.bean.product.*"%>
<%@ page import="hmjm.bean.classtime.*"%>
<%--성민 작성 --%>
<%-- addclasstime.jsp 처리--%>

<%	request.setCharacterEncoding("UTF-8"); %>

<jsp:useBean id="ctvo" scope="page" class="hmjm.bean.classtime.classtimeVO" />
<jsp:setProperty name="ctvo" property="*" />

<%
	classtimeDAO ctdao = classtimeDAO.getInstance();
	ctdao.insertClasstime(ctvo); /*작성한 정보를 삽입*/
	
	String productNum = request.getParameter("productNum");
	
%>

<script>
	var num ="<%=productNum%>";
	alert("[알림] 수업번호:"+num+" 상품의 시간 등록이  완료되었습니다.\n사진을 등록해주세요.");
</script>

<a href="/hmjm/Product/addClassimg.jsp">사진 등록하기</a>


<%--사진 등록from으로 넘어가기 --%>
<%-- 
<META http-equiv=refresh content="0; url=/hmjm/Product/addClassimg.jsp">

<META http-equiv=refresh content="0; url=/hmjm/Tutor/menu.jsp">
--%>