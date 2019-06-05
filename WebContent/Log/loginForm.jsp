<%@ page language="java" contentType="text/html; charset=UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
	<title>Login</title>
</head>

<body class="not-front">
<div id="main">
	<jsp:include page="/Home/header.jsp"/>


<div id="inner">

<div class="top2_wrapper">
<div class="bg1"><img src="images/bg1.jpg" alt="" class="img"></div>
<div class="top2_inner">
<div class="container">
<div class="top2 clearfix">
	
<h1>Login</h1>

</div>	
</div>	
</div>
</div>

<div id="content">
<div class="container">
<div class="row">
<div class="span9">
	
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
				      onclick="javascript:window.location='/hmjm/Register/register.jsp'"></TD></TR>
				</TABLE>
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

</div>

</div>

</div>	
</div>

<jsp:include page="/Home/footer.jsp" />
</body>
</html>