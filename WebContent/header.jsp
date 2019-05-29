<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>상단 메뉴 바</title>
</head>

<body>
	<div ><div >
	<header>
	<div>
		<a href="main.jsp" >shallwe</a>
	</div>
	<div><%--search용 추가 --%>
		<%--action="/index/Search/" --%>
		<form >
			<div>
						
			</div>
		</form>
	</div>
</header>
<%
	String loginbarName;	//로그인바	
	String logURL;
	
	String statebarName;	//로그인 여부에 따른 상태바
	String stateURL;
	
	if(session.getAttribute("loginId") == null){
		loginbarName="로그인";		
		logURL="loginForm.jsp";
		
  		statebarName ="회원가입";	
  		stateURL="register.jsp";
	}else{
		loginbarName="실시간 톡";	//로그아웃기능은, 수업신청서안에서 사용할것_성민씀
		logURL="My/Qnatutee.jsp";
		
		statebarName ="수업신청서";	
		stateURL="My/Application.jsp";
	}
%>

<%--웹 브라우저의 너비가 좁아지면, 목록형으로 나오게 된다. --%>
<div >
<div>
	<div >
		
		<div >
		
				<a href="index-1.jsp">튜터 등록</a>
				<a href="<%=stateURL%>"><%=statebarName%>
				<%
					if(session.getAttribute("loginId")== null){%>
					<a href="<%=logURL%>"><%=loginbarName %></a>
					<%}else{%>
						<a href="" onclick="openRealtimetalk()"><%=loginbarName%></a><%}%>
						
					<%if(session.getAttribute("loginId")!=null){ %>
					<select onchange="if(this.value) location.href=(this.value);" >
					<option selected>회원정보</option>
					<option value="./modifyForm.jsp" > 회원정보변경 </option>
					
				</select>
				<%} %>

				
					
					<%if(session.getAttribute("loginId")!= null){%>
						<a href="logout.jsp">로그아웃</a><%}%>
										
			
		</div>
	</div>
</div>
<div id="search">
	
<a href="#" class="searchBtn"></a>

<div >
	
</div>

</div>	
</div>

</div></div>
</body>
</html>
