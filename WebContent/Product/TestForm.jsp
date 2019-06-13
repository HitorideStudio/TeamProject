<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%--/*test용 파일, 추후 삭제할것_성민*/ --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>jsp파일 업로드</title>
</head>
<body>
	<form action="TestPro.jsp" name="testForm" method="post" align="center"
		enctype="multipart/form-data">
		파일:<input type="file" name="file"> <input type="submit"
			vlaue="전송" />
	</form>
</body>
</html>