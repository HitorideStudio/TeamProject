<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="hmjm.bean.product.*"%>

<%
	request.setCharacterEncoding("UTF-8");
%>
<html>
<head>
<link rel="stylesheet" href="/hmjm/css/bootstrap.min.css" />
<title>수업 등록</title>
<script language="javascript" src="script.js"></script>
<script language="javascript" type="text/javascript">
	/*유효성 검사_ 수정 해야함.*/
	function writeSave() {
		var form = document.addClassimgForm;
		if (form.file0.value == "") {
			alert("하나 이상의 수업 사진을 등록 하세요.");
			form.file0.focus();
			return false;
		}
	}

	/*버튼클릭시, 이미지 추가 하기*/
	function addImageFile() {
		fileCnt = document.getElementById('fileCnt').value;
		fileCnt++;
		html = '';
		html += '<input type="file" id="file'+fileCnt+'" name="file'+fileCnt+'"  value=""/>';

		var div = document.createElement('div');
		div.innerHTML = html;
		document.getElementById('FileAdd').appendChild(div);
		document.getElementById('fileCnt').value = fileCnt;
	}
</script>

<style>
input[type=number] {
	width: 80px;
}

a {
	font-weight: bold;
}
</style>

</head>

<body>
	<jsp:include page="/Home/header.jsp" />
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">수업 사진 등록</h1>
		</div>
	</div>
	<div class="container">

		<%-- enctype="multipart/form-data" 파일이나 대용량 데이터 보낼때 데이터 전송 방식 --%>

		<form name="addClassimgForm" action="addClassimgPro.jsp" method="post"
			enctype="multipart/form-data" onsubmit="return writeSave()">

			<div class="form-group row">
				<label class="col-sm-2">수업 사진 등록하기</label>
				<div class="col-sm-5">
					<input id="file0" type="file" name="file" class="form-control"
						value />
				</div>
				<br>
			</div>

			<div class="form-group row">
				<div class="col-sm-5">
					<div id="FileAdd"></div>
					<a onclick="addImageFile();">추가 +</a> <input type="hidden"
						id="fileCnt" name="fileCnt" value="0">
				</div>
				<br>
			</div>
			<div class="col-sm-offset-2 col-sm-10 ">
				<input type="submit" value="사진 등록"> &nbsp;&nbsp;&nbsp; <input
					type="reset" value="모든 내용 취소">
			</div>
		</form>

	</div>
	<jsp:include page="/Home/footer.jsp" />
</body>
</html>
