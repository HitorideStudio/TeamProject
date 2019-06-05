<%@ page language="java" contentType="text/html; charset=UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<title>HEADER</title>
<style>
/*#header{box-sizing: border-box;}*/
#header {
	margin: 0 auto;
	font-family: Arial, Helvetica, sans-serif;
}

.header_new {
	width: 1080;
	height: 80px;
	margin: 0 180px;	/*중간으로 배열하기위한값을 줌*/
}

.topnav {
	overflow: hidden;
	background-color: white;
}

/* 좌측 아이콘 */
.topnav .icon {
	float: left;
}

.topnav .icon img {
	width: 120px;
	cursor: pointer;
}

/* 우측 카테고리 */
.topnav .category {
	float: right;
}

.topnav .category a {
	float: left;
	display: block;
	color: black;
	text-align: center;
	padding-top: 20px;
	padding-right: 20px;
	margin-left: 10px; 	/*글자 사이간격*/
	text-decoration: none;
	font-size: 15px;
	font-weight: bold;
}

.topnav  .category a:hover {
	color: gray;
}

/* 검색 기능 */
.topnav .search-container {
	float: left;
}

.topnav input[type=text] {
	padding: 6px;
	margin-top: 20px;
	size: 25;
	maxlength: 30px;
	border: 2px;
}

.topnav .search-container button {
	float: left;
	padding: 6px 10px; 	/*버튼의 사이즈*/
	margin-top: 18px; 	/*버튼 배치*/
	margin-left: 10px;
	margin-right: 8px;
	font-size: 17px;
	border: none;
}

@media screen and (max-width: 600px) {
	.topnav .search-container {
		float: none;
	}
	.topnav a, .topnav input[type=text], .topnav .search-container button {
		float: none;
		display: block;
		text-align: left;
		width: 100%;
		margin: 0;
		padding: 14px;
	}
	.topnav input[type=text] {
		border: 1px solid #ccc;
	}
}
</style>
<script language="javascript">
		function openRealtimetalk(){
			url="/hmjm/My/qnatutee.jsp";
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
		logURL="/hmjm/Log/loginForm.jsp";
		
  		statebarName ="회원가입";	
  		stateURL="/hmjm/Register/register.jsp";
	}else{
		loginbarName="실시간 톡";	//로그아웃기능은, 수업신청서안에서 사용할것_by.sm
		logURL="/hmjm/My/qnatutee.jsp";
		
		statebarName ="수업신청서";	
		stateURL="/hmjm/My/application.jsp";
	}
%>
<body id="header">
	<div class="header_new">
		<div class="topnav">
			<div class="icon">
				<a href="/hmjm/Home/main.jsp"><img src="/hmjm/Images/logo.png" /></a>
			</div>

			<div class="search-container">
				<form action="/action_page.php">
					<!--/*input 창 양옆넓이 늘릴것*/  -->
					<input type="text" style="width: 400px;"
						placeholder="배우고 싶은 수업 또는 튜너를 검색해보세요!" name="search">
					<button type="submit">
						<i class="fa fa-search"></i>
					</button>
				</form>
			</div>

			<div class="category">
					<%
					//My/Application.jsp에 로그아웃기능 추가하면 삭제할것.
					if(session.getAttribute("loginId")!= null){%>
						<a href="/hmjm/Log/logout.jsp">로그아웃</a>
				<%}%>
				<a href="/hmjm/Tutor/Register/menu.jsp">튜터등록</a><!-- 등록페이지로 이동하게 수정 -->
				<a href="<%=stateURL%>"><%=statebarName%></a>
				<%
					if(session.getAttribute("loginId")== null){%>
						<a href="<%=logURL%>"><%=loginbarName %></a>
					<%}else{%>
						<a href="" onclick="openRealtimetalk()"><%=loginbarName%></a>
						<a href="/hmjm/My/application.jsp"><img src="/hmjm/Images/Icon/user.png" width="35px"/></a> 
					<%}%>
			</div>

		</div>
	</div>

</body>
</html>