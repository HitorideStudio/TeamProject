<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import = "hmjm.bean.dao.*" %>
<%@ page import = "hmjm.bean.vo.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>튜터정보 수정</title>
<script type="text/javascript">
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

		String m_email = (String)session.getAttribute("loginId");
		memberDAO manager = memberDAO.getInstance();
		memberVO c = manager.getMember(m_email);
		tutorDAO vo = tutorDAO.getInstance();
		tutorVO e = vo.getMember(m_email);
%>
<div>
<form action ="tutorRegisterPro.jsp" name="tutor" method="post" align="center"
enctype="multipart/form-data">
	
 	<br><br>
	<div >		
	<ul>*****튜터 정보 수정*****</ul>
	<ul>
		이메일 <%=e.getT_email()%>
	</ul>
	<ul>
		프로필사진
		<input type ="file"  name="t_selfimg" value="<%=e.getT_selfimg()%>" />
	</ul>
	<ul>
		별명^_^
		<input type ="text" name ="t_nick" value="<%=e.getT_nick()%>"/>
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

	<input type ="submit" value="튜터 정보 수정" >
</form>

</div>
</body>
</html>