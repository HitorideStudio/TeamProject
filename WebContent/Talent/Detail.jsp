<%@ page language="java" contentType="text/html; charset=EUC-KR" %>
<%@ page import = "hmjm.bean.product.*" %>
<%@ page import = "hmjm.bean.buy.*" %>
<%@ page import = "hmjm.bean.classtime.*" %>
<%@ page import = "hmjm.bean.classimg.*" %>
<%@ page import = "java.util.List" %>
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
		
		classtimeDAO time = classtimeDAO.getInstance();
		classtimeVO t = time.getClasstime(num);
		String t_email = vo.getP_email();//���� �г����� �ҷ���������
		
		classimgDAO aa  = classimgDAO.getInstance();
		classimgVO bb = aa.getImg(num);
		
		//���� �ҷ����� �ҷ��� �ߴµ� �̰� �ƴ� ��....
		int startRow = 1;
		int endRow = 1;
		int count = 0;
		int number=0;
		List classimgList = null;
		classimgDAO pic = classimgDAO.getInstance();
		count = pic.getClassimgCount(num);
		if (count > 0) {
			classimgList = pic.getClassimg(startRow, endRow);
		}
	

%>
<jsp:include page="../Home/header.jsp" />
<body>

	<h1>���� �� ������</h1>
	<p><%=vo.getP_num() %>:::::::::::::�̰� ���ǹ�ȣ�� ��û�Ҷ� �Ѱܾ��Ѵ�</p><br>
	<h1><%=vo.getP_classname() %></h1><br>
	����Ұ�:::::::: <%=vo.getP_self() %><br>
	ī�װ�:::::::: <%=vo.getP_category() %><br>
	�����̸���:::::::: <%=vo.getP_email() %><br><br>
	�����׽�Ʈ���>>><%=bb.getCi_name() %>
	
	<%if(count == 0){
	}else{%>
	<% for(int i = 0 ; i < classimgList.size(); i++){
		classimgVO g = (classimgVO)classimgList.get(i);%>
		
		<%=bb.getCi_name() %>
		
		<%}%>
		<%}%>
	<div>
	�������ɽð�::::::::
			<%if(t.getCt_mon()==null){%>
			<%}else{%>
			��: <%=t.getCt_mon() %>
			<%} %>
			<%if(t.getCt_tue()==null){%>
			<%}else{%>
			ȭ: <%=t.getCt_tue() %>
			<%} %>
			<%if(t.getCt_wed()==null){%>
			<%}else{%>
			��: <%=t.getCt_wed() %>
			<%} %>
			<%if(t.getCt_thu()==null){%>
			<%}else{%>
			��: <%=t.getCt_thu() %>
			<%} %>
			<%if(t.getCt_fri()==null){%>
			<%}else{%>
			��: <%=t.getCt_fri() %>
			<%} %>
			<%if(t.getCt_sta()==null){%>
			<%}else{%>
			��: <%=t.getCt_sta() %>
			<%} %>
			
			<%if(t.getCt_sun()==null){%>
			<%}else{%>
			��: <%=t.getCt_sun() %>
			<%} %>
			
			<%if(t.getCt_day()==null){%>
			<%}else{%>
			���̼���<%=t.getCt_day() %>
			<%} %>
		</div><br>
	<a href ="./check.jsp?p_num=<%=vo.getP_num() %>">���ǽ�û</a>
	
<% 
 }catch(Exception e){} 
%>
<jsp:include page="/Home/footer.jsp" />	
</body>
</html>