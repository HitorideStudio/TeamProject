<%@ page language="java" contentType="text/html; charset=EUC-KR" %>
<%@ page import = "hmjm.bean.product.*" %>
<%@ page import = "hmjm.bean.buy.*" %>
<%@ page import = "hmjm.bean.classtime.*" %>
<%@ page import = "hmjm.bean.classimg.*" %>
<%@ page import = "hmjm.bean.tutor.*" %>
<%@ page import = "java.util.List" %>
<%@ page import = "oracle.net.aso.b"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>���� ��������kkkk</title>
</head>

<%

	String id = (String) session.getAttribute("loginId");
	int num = Integer.parseInt(request.getParameter("p_num"));
	String pageNum = request.getParameter("pageNum");
	
	
		
		
		classtimeDAO time = classtimeDAO.getInstance();
		classtimeVO t = time.getClasstime(num);
		//String t_email = vo.getP_email();//���� �г����� �ҷ���������
		
		classimgDAO aa  = classimgDAO.getInstance();
		classimgVO bb = aa.getImg(num);
		
		//���������� ��û�� �������� �����ϱ� ���� �ҷ����� ��..�׽�Ʈ��
				tutorDAO tu = tutorDAO.getInstance();
				tutorVO ee = tu.getMember(id);
				
				System.out.println("Ʃ������**e**"+ee);
				
				buyDAO buyer = buyDAO.getInstance();
				buyVO b = buyer.getBuy(id);
				//buyVO c =buyer.getBuy2(num);
				System.out.println("��������**b**"+b);
				
				//System.out.println("�����Ѱ�찭�ǳѹ�**bbb**"+bbb);
				productDAO dbPro = productDAO.getInstance();
				productVO vo = dbPro.getProduct(num);
				productVO vc = dbPro.getProduct2(id,num);
				productVO vd = dbPro.getProduct4(id); //�����ؾ� �Ѵ�
				
				
				//���� ����� ���� ��ȣ	
		
		
		//���� �ҷ����� �ҷ��� �ߴµ� �̰� �ƴ� ��....�̿ϼ�
		if (pageNum == null) { pageNum = "1"; }
		int pageSize = 10;
		int currentPage = Integer.parseInt(pageNum);
		int startRow = (currentPage - 1) * pageSize + 1;
		int endRow = currentPage * pageSize;
		int count = 0;
		int number=0;
		
		List classimgList = null;
		classimgDAO pic = classimgDAO.getInstance();
		count = pic.getClassimgCount(num);
		
		if (count > 0) {
			classimgList = pic.getClassimg(num,startRow, endRow);
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
<% 	try{%>	
	<% if(bb.getCi_name()==null){%>
	error
	<%}else{ %>
	
		<%if(count == 0){%>
		test
		<%}else{%>
			<% for(int i = 0 ; i < classimgList.size(); i++){
			classimgVO g = (classimgVO)classimgList.get(i);%>
		
			<img src="/Images/classimg/<%=g.getCi_name()%>"
			width="50%" height="50%">
			<%}%>
		<%}%>
	<%}%>


	<div>
	�������ɽð�::::::::
	<%if(t == null){ %>
	<h1> �ð� �̵�� Ʃ��</h1>
	<%}else{ %>
			<%if(t.getCt_mon()==null){%>
			<%}else{%>
				��: <%=t.getCt_mon()%>
			<%}%>
			
			<%if(t.getCt_tue()==null){%>
			<%}else{%>
				ȭ: <%=t.getCt_tue()%>
				<%}%>
				
			<%if(t.getCt_wed()==null){%>
			<%}else{%>
				��: <%=t.getCt_wed()%>
			<%}%>
			
			<%if(t.getCt_thu()==null){%>
			<%}else{%>
				��: <%=t.getCt_thu()%>
			<%}%>
			
			<%if(t.getCt_fri()==null){%>
			<%}else{%>
				��: <%=t.getCt_fri() %>
			<%}%>
			
			<%if(t.getCt_sta()==null){%>
			<%}else{%>
				��: <%=t.getCt_sta()%>
			<%}%>
			
			<%if(t.getCt_sun()==null){%>
			<%}else{%>
				��: <%=t.getCt_sun() %>
				<% %>
				
			<%if(t.getCt_day()==null){%>
			<%}else{%>
				���̼���<%=t.getCt_day()%>
			<%}%>
	<%}%>
	<%}%>

<% 
	}catch(Exception e){} 
%>	
			
		</div><br>
<% if(bb==null){%>
	<h1>���� �̵�� Ʃ��</h1>
	<%}else{ %>
	
		<%if(count == 0){%>
		test
		<%}else{%>
			<% for(int i = 0 ; i < classimgList.size(); i++){
			classimgVO g = (classimgVO)classimgList.get(i);%>
			<img src="/hmjm/Images/Classimg/<%=g.getCi_name()%>" width="50%" >
			<%}%>
		<%}%>
	<%}%>
	

<br>
<%
if(id!=null){
	
	if(ee!=null){

		if(b!=null){int bbb = b.getB_productnumber();

				if(bbb==num){%>
					Ʃ��o ���� ������ ����
					<%}else{
							
							if(vd==null){%>
									<a href ="/TeamProject/Talent/check.jsp?p_num=<%=vo.getP_num() %>">
									Ʃ��o �Ǹű۾���>> ��û�ϱ�</a>
				
									<%}else{
										
										if(vc!=null){%>
											��������Ѱ���
										<%}else{%>
											<a href ="/hmjm/Talent/check.jsp?p_num=<%=vo.getP_num() %>">
											Ʃ��o �Ǹű�o �̰� �����ǰ� �ƴϴ�>>��û�ϱ�</a>
											<%}
										}
						}
			}else{%>
				<a href ="/TeamProject/Talent/check.jsp?p_num=<%=vo.getP_num() %>">Ʃ��o �����̷�x ��û�ϱ�</a>
				<%}

	}else{
	
			if(b!=null){int bbb = b.getB_productnumber();

				if(bbb==num){%>
					Ʃ��x ���� ������ ����
					<%}else{%>
						<a href ="/TeamProject/Talent/check.jsp?p_num=<%=vo.getP_num() %>">Ʃ��x�����̷�o ��û�ϱ�</a>
						<%}
			}else{%>
				<a href ="/TeamProject/Talent/check.jsp?p_num=<%=vo.getP_num() %>">Ʃ��x �����̷�x ��û�ϱ�</a>
				<%}

			}
	
	
	}else{%>
		<a href ="/hmjm/Talent/check.jsp?p_num=<%=vo.getP_num() %>">��α��� ��û�ϱ�</a>
		<%}


%>	
	

<jsp:include page="/Home/footer.jsp" />	
</body>
</html>