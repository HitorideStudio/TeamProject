<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="hmjm.bean.classimg.classimgDAO"%>
<%@ page import="hmjm.bean.product.productDAO"%>

<%--파일을 업로드 시키기위함 --%>
<%@page import="java.io.File" %>
<%@page import="java.util.Enumeration" %>
<%-- cos.jar파일에 있는 라이브러리 import, 중복된 파일이름에 대한 정책 --%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>

<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="imgvo" scope="page" class="hmjm.bean.classimg.classimgVO"/>
<jsp:setProperty name="imgvo" property="*"/>

<%--성민 작성0614 --%>
<%
		//상품번호 세션으로 받아오기
		String productNum = (String)session.getAttribute("productNum");
		String directory = application.getRealPath("/Images/ClassImg/");
		
		//상품번호, 경로 확인 용
		//System.out.println("상품번호 받아오는가 :"+productNum);
		//System.out.println("=uploadFilePath="+directory);
		
		//test용, 추후 삭제할것
		System.out.println("addClassimgPro.jsp: 세션상품번호"+productNum);
		
		int maxSize = 1024 *1024 * 100;	//최대 용량
		String encType = "utf-8";
		MultipartRequest multipartRequest = null;
		try{
			multipartRequest = new MultipartRequest(request, directory,
					maxSize, encType, new DefaultFileRenamePolicy());
			
			/*이미지 여러개 업로드하기*/
			Enumeration<?> fileNames = multipartRequest.getFileNames();
			while(fileNames.hasMoreElements()){
				
				String parameter = (String)fileNames.nextElement();
				String fileName = multipartRequest.getOriginalFileName(parameter);
				String fileRealName = multipartRequest.getFilesystemName(parameter);
				
				//파일 이 없을경우, 계속 실행시키기위함
				if(fileName == null) continue;
				
				/*시큐어 코딩*/
				if(!fileName.endsWith(".jpg") && !fileName.endsWith(".png")
						&& !fileName.endsWith(".bmp")&& !fileName.endsWith(".gif")){
					
					File file = new File(directory + fileRealName);
					file.delete();
					%>
					<script>
						var filename="<%= file.getName()%>"
						alert(filename+"는 업로드할 수 없는 확장자의 파일입니다.");
					</script>
					<%
					
				}else{
					classimgDAO cidao = classimgDAO.getInstance();
					
					int ci_num = Integer.parseInt(productNum);
					cidao.insertClassimg1(ci_num, fileName, fileRealName);
					%>
					<script>
						var ci_num ="<%=ci_num%>";
						var fileName ="<%=fileName%>";
						var fileRealName ="<%=fileRealName%>";
						alert("[상품번호 :"+ci_num+"]\n[파일명:"+fileName+"]이 등록되었습니다.");
					</script>
					
					<META http-equiv=refresh content="0; url=/TeamProject/Home/main.jsp">
<%				}
			}
			
		}catch(Exception e){	e.printStackTrace(); }
%>
		