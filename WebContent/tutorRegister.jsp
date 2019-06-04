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
<body>
<%
	request.setCharacterEncoding("utf-8");
%>


<div>
<%if(session.getAttribute("loginId") != null){%>
<form action ="tutorRegisterPro.jsp" name="tutor" method="post" align="center"
enctype="multipart/form-data">
	
 	<br><br>
	<div >		
	<ul>튜터 등록</ul>
	<ul>
		이메일
		<input type ="text" name ="t_email" value="<%=(String)session.getAttribute("loginId") %>" >
	</ul>
	<ul>
		프로필사진
		<input type ="file" autofocus name="t_selfimg"required/>
	</ul>
	<ul>
		별명^_^
		<input type ="text" name ="t_nick" required/>
	</ul>
	 
	<ul>
	
			학교인증
			<input id="univ" type="radio" name="t_idcard" value="1" checked onclick="checkLayer(1);">
	 		<div id="schoolmajor">
				<input type ="text" name ="t_school" 
				placeholder ="학교 예)서울대학교" />
				<input type ="text" name ="t_major" 
				placeholder ="전공 예)경영학과" />
     		</div>
	</ul>

	<ul>
		신분인증<input id="univ"  type="radio" name="t_idcard" value="2" onclick="checkLayer(2);">
	</ul>
	<ul>
		자격증
		<input id= "Cert0" type ="text" name ="t_c" placeholder="예)정보처리기사"
		value class ="input_txt01" />
	</ul>	
	

</div><br/>
<div id="CertAdd"></div>
 	<a onclick="addFile();" class="addbtn">추가 +</a>
	<input type="hidden" id="fileCnt" name="fileCnt" value="0"><br><br><br>

	<input type ="submit" value="튜터등록" >
</form>	
<%}else{ //로그아웃시 main.jsp로 이동
				//session.invalidate();
			%>
					<script>
					alert("로그인부터");
					window.location='./loginForm.jsp';
						
					</script>
			<%}%>



</div>
</body>
	


</html>