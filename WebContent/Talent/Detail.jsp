<%@ page language="java" contentType="text/html; charset=EUC-KR" %>
<%@ page import = "hmjm.bean.product.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>���� ��������</title>
</head>

<%
	String id = (String) session.getAttribute("loginId");
	int num = Integer.parseInt(request.getParameter("p_num"));
	String pageNum = request.getParameter("pageNum");
	
	try{
		productDAO dbPro = productDAO.getInstance();
		productVO vo = dbPro.getProduct(num);
	

%>
<jsp:include page="../Home/header.jsp" />
<body>

	<h1>���� �� ������</h1>
	<p><%=vo.getP_num() %>:::::::::::::�̰� ���ǹ�ȣ�� ��û�Ҷ� �Ѱܾ��Ѵ�</p><br>
	��������:::::::: <%=vo.getP_classname() %><br>
	����Ұ�:::::::: <%=vo.getP_self() %><br>
	ī�װ�:::::::: <%=vo.getP_category() %><br>
	�����̸���:::::::: <%=vo.getP_email() %><br><br>
	
	<% if(vo.getP_email() == id){%>
	 ���� ����� �����Դϴ�
	 <%}else{%>
	<a href ="./check.jsp?p_num=<%=vo.getP_num() %>">���ǽ�û</a>
	<%}%>
<% 
 }catch(Exception e){} 
%>
<jsp:include page="/Home/footer.jsp" />	
</body>
</html>