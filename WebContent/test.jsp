<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="java.sql.*" %>    
<%@ page import ="hmjm.bean.member.*" %>
<%@ page import ="hmjm.bean.tutor.*" %>
<jsp:useBean id="vo" class="hmjm.bean.tutor.tutorVO">
	<jsp:setProperty name="vo" property="*" />
</jsp:useBean>

<%
	String t_email= request.getParameter("t_email");
	
	tutorDAO dao = tutorDAO.getInstance();
	
	boolean result = dao.tutorCheck(t_email);
	
	if(result){
		session.setAttribute("registedTutor",t_email);
		response.sendRedirect("main.jsp");
	}else{%>
	

		<script>
	    		alert("이거나오면 오류인..데");
	    		history.go(-1);
	    	</script><% 
		

		
	}%>
if(b!=null){int bbb = b.getB_productnumber();
		
				if(bbb==num){%>
					튜터o 내가 구매한 강의
					}else{
						튜터o구매이력x 신청하기
						}
			}else{
				튜터o 구매이력x 신청하기
				}
			
			
			
	if(ee!=null){
		
		if(b!=null){int bbb = b.getB_productnumber();
		
				if(bbb==num){%>
					튜터o 내가 구매한 강의
					}else{
						튜터o구매이력x 신청하기
						}
			}else{
				튜터o 구매이력x 신청하기
				}
	
		}else{
			
			if(b!=null){int bbb = b.getB_productnumber();
		
				if(bbb==num){%>
					튜터o 내가 구매한 강의
					}else{
						튜터o구매이력x 신청하기
						}
			}else{
				튜터o 구매이력x 신청하기
				}
		
			}		
			
	////////////////////////////////////////////////////////		
			
		if(id!=null){
			
			if(ee!=null){
		
				if(b!=null){int bbb = b.getB_productnumber();
		
						if(bbb==num){
							튜터o 내가 구매한 강의
							}else{
								튜터o구매이력o 신청하기
								}
					}else{
						튜터o 구매이력x 신청하기
						}
	
			}else{
			
					if(b!=null){int bbb = b.getB_productnumber();
		
						if(bbb==num){
							튜터x 내가 구매한 강의
							}else{
								튜터x구매이력o 신청하기
								}
					}else{
						튜터x 구매이력x 신청하기
						}
		
					}
			
			
			}else{
				비로그인 신청하기
				}	
			
			
			
			
			
				
					