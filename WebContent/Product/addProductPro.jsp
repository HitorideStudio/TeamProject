<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page import="hmjm.bean.product.*" %>

<%-- addProduct.jsp 처리--%>

<%	request.setCharacterEncoding("UTF-=8"); 	%>

<jsp:useBean id="vo" scope="page" class="hmjm.bean.product.productVO"/>
<jsp:setProperty name="vo" property="*" />

<%
	productDAO dao = productDAO.getInstance();
	dao.insertProduct(vo);	/*작성한 정보를 삽입*/
%>

<script>
	alert("수업이 등록되었습니다.");
</script>
<META http-equiv=refresh content="0;url=/Tutor/Register/'menu.jsp">