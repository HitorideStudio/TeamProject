<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
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
<style>
body {
  font-family: Arial, Helvetica, sans-serif;
  background-color: #f8f9fa;
  margin:0 auto;
  
}

* {
  box-sizing: border-box;
}


/* Add padding to containers */
.container {
  
  width: 100%;
  padding: 30px;
  background-color: white;//
}

/* Full-width input fields */
input[type=text], input[type=password] {
  width: 100%;
  padding: 15px;
  margin: 5px 0 22px 0;
  display: inline-block;
  border: none;
  background: #f1f1f1;
}

input[type=text]:focus, input[type=file]:focus {
  background-color: #ddd;
  outline: none;
}

/* Overwrite default styles of hr */
hr {
  border: 1px solid #f1f1f1;
  margin-bottom: 25px;
}

/* Set a style for the submit button */
.registerbtn {
  background-color: #4CAF50;
  color: white;
  padding: 16px 20px;
  margin: 8px 0;
  border: none;
  cursor: pointer;
  width: 100%;
  opacity: 0.9;
}

.registerbtn:hover {
  opacity: 1;
}

/* Add a blue text color to links */
a {
  color: dodgerblue;
}

/* Set a grey background color and center the text of the "sign in" section */
.signin {
  background-color: #f1f1f1;
  text-align: center;
}
</style>
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
    <h1>기본정보입력</h1>
    <p>튜터정보를 입력하세요</p>
    <hr>
    
    <label for="email"><b>프로필사진</b></label>
    <input type="file"  autofocus name="t_selfimg"required/><hr>

    <label for="email"><b>Email</b></label>
    <input type="text" placeholder="이메일을 입력하세요" name="t_email"value="<%=(String)session.getAttribute("loginId")%>"/>
    
    <label for="email"><b>별명</b></label>
    <input type="text" placeholder="별명을 입력하세요" name ="t_nick" required>
    
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
	<br>
	<div id="CertAdd"></div>
 		<a onclick="addFile();" class="addbtn"><b>추가 +</b></a>
		<input type="hidden" id="fileCnt" name="fileCnt" value="0">
   
    <hr>
    
    
	<input type ="submit" value="튜터등록" class="registerbtn">
    
  </div>
  
  <div class="container signin">
    
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
