<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>튜터등록</title>

<script type="text/JavaScript">

	function addFile(){
		fileCnt = document.getElementById('fileCnt').value;							
		fileCnt++;
		html = '';
		html += '<input id="Cert'+fileCnt+'" name="t_c'+fileCnt+'" placeholder="예)정보처리기사" type="text" value="" class="input_txt01 clearbt"/>';
		
		var div = document.createElement('div');
        div.innerHTML = html;
        document.getElementById('CertAdd').appendChild(div);							
		document.getElementById('fileCnt').value = fileCnt;
	}
	
	function checkLayer(val){
	
		if(val == 1){
			document.getElementById('schoolmajor').style.display="block";
		}else if(val == 2){
			document.getElementById('schoolmajor').style.display="none";
		}
	}
	</script>
	

</head>
<jsp:include page="/Home/header.jsp"/>
<body>
	
<%
	request.setCharacterEncoding("utf-8");
%>



<%if(session.getAttribute("loginId") != null){%>
<form action ="tutorRegisterPro.jsp" name="tutor" method="post" align="center"
enctype="multipart/form-data">
	
 
<div class="container">		
	<h1>튜터 등록</h1>
	<hr>
	<label><b>이메일</b></label>
		<input type="text" name="t_email" value="<%=(String)session.getAttribute("loginId")%>" />
		<br>
		
	<label><b>프로필 사진</b></label>
		<input type ="file" autofocus name="t_selfimg"required/>
		<br>
		
	<label><b>별__명</b></label>
		<input type ="text" name ="t_nick" required/>
		<br>
		
	<label><b>학교인증</b></label>
		<input id="univ" type="radio" name="t_idcard" value="1" checked onclick="checkLayer(1);">
	 		<div id="schoolmajor">
				<input type ="text" name ="t_school" 
				placeholder ="학교 예)서울대학교" />
				<input type ="text" name ="t_major" 
				placeholder ="전공 예)경영학과" />
     		</div>
     		<br>
	
		<label><b>신분인증</b></label>
			<input id="univ"  type="radio" name="t_idcard" value="2" onclick="checkLayer(2);">
			<br>
			
		<label><b>자격증</b></label>
			<input id= "Cert0" type ="text" name ="t_c" placeholder="예)정보처리기사"
			value class ="input_txt01" />
</div><br/>
	<div id="CertAdd"></div>
 		<a onclick="addFile();" class="addbtn">추가 +</a>
		<input type="hidden" id="fileCnt" name="fileCnt" value="0"><br><br><br>
		<div class="container signin">
			<input type ="submit" value="튜터등록" class="registerbtn">
		</div>
</form>	
<%}else{ //로그아웃시 main.jsp로 이동
				//session.invalidate();
			%>
					<script>
					alert("로그인부터");
					window.location='./loginForm.jsp';
						
					</script>
			<%}%>

	<jsp:include page="/Home/footer.jsp" />
</body>
	
</html>