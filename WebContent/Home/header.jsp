<%@ page language="java" contentType="text/html; charset=UTF-8"%>

<!DOCTYPE html>
<html lang="utf-8">
<head>
<title>헤더kkk</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
* {
  box-sizing: border-box;
}

/* Style the body */
body {
  font-family: Arial, Helvetica, sans-serif;
  margin: 0;
}

/* Header/logo Title */
.header {
  padding: 5px;
  text-align: center;
  background: #1abc9c;
  color: white;
}

/* Increase the font size of the heading */
.header h1 {
  font-size: 25px;
}

/* Style the top navigation bar */
.navbar {
  overflow: hidden;
  background-color: #333;
}

/* Style the navigation bar links */
.navbar a {
  float: left;
  display: block;
  color: white;
  text-align: center;
  padding: 14px 20px;
  text-decoration: none;
}

/* Right-aligned link */
.navbar a.right {
  float: right;
}

/* Change color on hover */
.navbar a:hover {
  background-color: #ddd;
  color: black;
}








/* Responsive layout - when the screen is less than 700px wide, make the two columns stack on top of each other instead of next to each other */
@media screen and (max-width: 700px) {
  .row {   
    flex-direction: column;
  }
}

/* Responsive layout - when the screen is less than 400px wide, make the navigation links stack on top of each other instead of next to each other */
@media screen and (max-width: 400px) {
  .navbar a {
    float: none;
    width: 100%;
  }
}
</style>
<script language="javascript">
		function openRealtimetalk(){
			url="/TeamProject/My/qnatutee.jsp";
			//새로운 윈도우로 열기
			open(url, "qnatutee",  "toolbar=no, location=no,status=no,menubar=no,resizable=no,width=400, height=660");
		}
	</script>
</head>
<%
	String loginbarName;	//로그인바	
	String logURL;
	
	String statebarName;	//로그인 여부에 따른 상태바
	String stateURL;
	
	if(session.getAttribute("loginId") == null){
		loginbarName="로그인";		
		logURL="/TeamProject/Log/loginForm.jsp";
		
  		statebarName ="회원가입";	
  		stateURL="/TeamProject/Register/register.jsp";
	}else{
		loginbarName="실시간 톡";	//로그아웃기능은, 수업신청서안에서 사용할것_by.sm
		logURL="/TeamProject/My/qnatutee.jsp";
		
		statebarName ="수업신청서";	
		stateURL="/TeamProject/My/application.jsp";
	}
%>
<body>

<div class="header">
  <h1>Shall We</h1>
  <p>우리 같이 배워볼까요?</p>
</div>

<div class="navbar">
 <a href="/TeamProject/Home/main.jsp"class="left">쉘위</a>
  <%//My/Application.jsp에 로그아웃기능 추가하면 삭제할것.
	if(session.getAttribute("loginId")!= null){%>
	<a href="/TeamProject/Log/logout.jsp"class="right">로그아웃</a><%}%>	
  <a href="/TeamProject/Tutor/Register/menu.jsp"class="right">튜터등록</a>
  <a href="<%=stateURL%>"class="right"><%=statebarName%></a>
				<%
					if(session.getAttribute("loginId")== null){%>
						<a href="<%=logURL%>"class="right"><%=loginbarName %></a>
					<%}else{%>
						<a href="" onclick="openRealtimetalk()"class="right"><%=loginbarName%></a>
						<a href="/TeamProject/My/application.jsp" class="right">내페이지</a> 
					<%}%>
</div>

</body>
</html>