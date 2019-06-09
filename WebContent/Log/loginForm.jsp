<%@ page language="java" contentType="text/html; charset=UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
	<title>Login</title>
	<script type="text/javascript" src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js" charset="utf-8"></script>
</head>

<body class="not-front">

	<jsp:include page="/Home/header.jsp"/>

	
<h1>Login</h1>




	
<h2><span>Welcome</span></h2>

<h3>Login Here</h3>

<div class="thumb1">
	<div class="thumbnail clearfix">
		<figure class=""><img src="images/about01.jpg" alt=""></figure>
		<div class="caption">
			
			
			<%if(session.getAttribute("loginId") == null){%>
			<form action="loginPro.jsp" method="post">
				<TABLE cellSpacing=1 cellPadding=1 width="260" border=0 align="center" >
  				  
				  <TR height="30">
				    <TD width="200" align=center>아이디</TD>
				    <TD width="150" align=center>
				    	<INPUT type="text" name="m_email" size="15" /></TD></TR>
				  <TR height="30">
				    <TD width="200" align=center>비밀번호</TD>
				    <TD width="150" align=center>
				    	<INPUT type="password" name="m_pw" size="15" /></TD></TR>
				  <TR height="30">
				    <TD colspan="2" align="middle">
				      <INPUT type="submit" value="로그인"/> 
				      <INPUT type="reset" value="다시입력"/>
				      <input type="button" value="회원가입" 
				      onclick="javascript:window.location='/TeamProject/Register/register.jsp'"></TD></TR>
				      </TABLE>
			<!-- 네이버아이디로로그인 버튼 노출 영역 -->
			<div id="naverIdLogin"></div>
			<!-- //네이버아이디로로그인 버튼 노출 영역 -->
			

			<script type="text/javascript">
				var naverLogin = new naver.LoginWithNaverId(
					{
						clientId: "trNOw1JZKuh2hg645_zG",
						callbackUrl: "http://localhost:8080/TeamProject/Log/callback.jsp",
						isPopup: false, /* 팝업을 통한 연동처리 여부 */
						loginButton: {color: "green", type: 3, height: 60} /* 로그인 버튼의 타입을 지정 */
					}
				);
	
				/* 설정정보를 초기화하고 연동을 준비 */
				naverLogin.init();
			</script>
			<!-- // 네이버아이디로로그인 초기화 Script -->
			</form>
			<%}else{ //로그아웃시 main.jsp로 이동
				session.invalidate();
			%>
					<script>
						history.go(-1);
					</script>
			<%}%>
</div>
</div>
</div>

			


<jsp:include page="/Home/footer.jsp" />
</body>
</html>