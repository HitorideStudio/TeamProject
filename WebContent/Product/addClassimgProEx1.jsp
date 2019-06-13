<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="hmjm.bean.classimg.*"%>

<%--파일 업로드 처리를 위한 MultipartRequest 객체를 import --%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%--파일 중복처리 객체 import --%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="java.util.*" %>



<%@page import="java.io.File"%>
<%@page import="java.util.Enumeration"%>
<%@ page import="java.sql.*"%>
ㅡ


<% request.setCharacterEncoding("UFT-8"); %>
<jsp:useBean id="imgvo" scope="page" class="hmjm.bean.classimg.classimgVO"/>
<jsp:setProperty name="imgvo" property="*"/>

<%
	String uploadPath = request.getRealPath("/Images/ProductImg");
	out.println("절대 경로: "+uploadPath+"<br>");
	
	int maxSize = 2 * 1024 * 1024;	//파일 용량 제한:(20M)
	
	String fileName1 = ""; 			// 중복처리된 이름
	String originalName1 = ""; 		// 중복 처리전 실제 원본 이름
	String fileType = ""; 			// 파일 타입
	long fileSize = 0; 				// 파일 사이즈
	
	MultipartRequest multi = null;

		//?
	//ServletContext context = getServletContext();
	//realFolder = context.getRealPath(saveFolder);
		
	ArrayList<String> filename = new ArrayList<String>();
	
	try {
		//업로드 경로, 파일 최대  용량, 인코딩타입(한글처리), 중복파일명에 대한 기본 정책
		multi = new MultipartRequest(request,uploadPath, maxSize, "UTF-8", new DefaultFileRenamePolicy());
				
		
		
		//전송한 전체 파일이름들을 가져온다.
		Enumeration<?> files = multi.getFileNames();
		
	
		while (files.hasMoreElements()) {
			//form 태그에서  <input type="file" name="여기서 지정한 이름"/>을 가져온다.
			String file1 = (String) files.nextElement(); //파일 input에 저장한 이름을 가져옴
			
			//그에 해당하는 실제 파일 이름을 가져옴.
			originalName1 = multi.getFilesystemName(file1);
			
			//파일명이 중복될 경우 중복 정책에 의해 뒤에 1,2,3 처럼 붙어 unipue하게 파일명을 생성하는데, 
			//이때 생성도니 이름을 filesystemName이라 하여 그 이름 정보를 가져온다.(중복 처리)
			fileName1 = multi.getFilesystemName(file1);
			
			//파일 타입 정보를 가져옴
			fileType = multi.getContentType(file1);
			
			//input file name에 해당하는 실제 파일을 가져온다.
			File file = multi.getFile(file1);
			
			//그 파일 객체의 크기를 알아낸다.
			fileSize = file.length();
			
		}
	
	} catch (Exception e) {/*예외 처리*/
		e.printStackTrace();
	}
	
	//form 내의 input name=""의  value를 가져옴
	/*
    private int ci_num;			//고유넘버(순서를 위함)_시퀀스
	private int ci_classnum;	//수업번호(p_num)	
	private String ci_img;		//이미지 경로 
 	*/	
	//String ci_img = multi.getParameter("ci_img");
	//int p_time = Integer.parseInt(multi.getParameter("p_time"));
	
	
	//imvo.setCi_img(ci_img);

%>
<%
	//해당 상품의 번호를 받아온다.
	//int proudctnum =Integer.parseInt(request.getParameter("productnum"));//form에서 보낸거받기
	//imgvo.setCi_classnum(proudctnum);
	
//	classimgDAO dao = classimgDAO.getInstance();
//	dao.insertClassimg(imgvo);
	
	
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
업로드 된 파일명 :

<%for(int i=0; i<filename.size();i++){%>
<strong><%=filename.get(i)%></strong>
<%}%>
</body>
</html>