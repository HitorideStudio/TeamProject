<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page import="hmjm.bean.product.*" %>

<%-- addProduct.jsp 처리--%>

<%request.setCharacterEncoding("UTF-8");%>

<jsp:useBean id="vo" scope="page" class="hmjm.bean.product.productVO"/>
<jsp:setProperty name="vo" property="*" />

<%
	productDAO pdao = productDAO.getInstance();
	pdao.insertProduct(vo);	/*작성한 정보를 삽입*/
	

	//최종 시퀀스 값이 얼마인지 구해야한다.(세션은 string형으로 받고,주어야하기때문에 형변환)
	String productNum = String.valueOf(pdao.getProductNum());
		
	//세션set(상품 고유 번호(시퀀스)를 넘긴다.)
	//int형을 곧바로 String 으로 캐스트 변환하려고하기때문에 에러발생 ->String.valueOf()로 해결
	session.setAttribute("productNum",String.valueOf(productNum));	
%>

<script>
	var num ="<%=productNum%>";
	alert("수업이 등록되었습니다.");
</script>
<META http-equiv=refresh content="0;url=/TeamProject/Product/addClasstime.jsp">