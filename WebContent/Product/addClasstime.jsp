<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="hmjm.bean.member.*"%>
<%@ page import="hmjm.bean.tutor.*"%>
<%@ page import="hmjm.bean.product.*"%>

<%-- 19.06.11 성민 작성 , 미완성, --%>

<%
	request.setCharacterEncoding("UTF-8");
	
	String preUser = (String) session.getAttribute("loginId");		//현재 세션,이메일 존재
	String productNum = (String)session.getAttribute("productNum");	//현재 세션, 상품번호 존재
	
	//상품 이름 가져오기.
	productDAO pdao = productDAO.getInstance();
	productVO pvo = pdao.getProduct(Integer.parseInt(productNum));
%>


<html>
<head>
<link rel="stylesheet" href="/hmjm/css/bootstrap.min.css" />
<meta charset="UTF-8">
<title>수업  시간 등록</title>
<script language="javascript" src="script.js"></script>
<script language="javascript" type="text/javascript">
	
	/*유효성 검사*/
	function writeSave() {
		var form = document.addClassTimeForm;
		/*
		
		if (form.ct_place.value == "") {
			alert("수업 장소를 입력하세요.");
			form.ct_place.focus();
			return false;
		}
		if (form.ct_mon.value == "") {
			alert("월요일날 가능한 시간을 입력해주세요");
			form.ct_mon.focus();
			return false;
		}
		if (form.ct_tue.value == "") {
			alert("화요일날 가능한 시간을 입력해주세요");
			form.ct_tue.focus();
			return false;
		}
		if (form.ct_wed.value == "") {
			alert("수요일날 가능한 시간을 입력해주세요");
			form.ct_wed.focus();
			return false;
		}
		if (form.ct_thu.value == "") {
			alert("목요일날 가능한 시간을 입력해주세요");
			form.ct_thu.focus();
			return false;
		}
		if (form.ct_fri.value == "") {
			alert("금요일날 가능한 시간을 입력해주세요");
			form.ct_fri.focus();
			return false;
		}
		if (form.ct_sta.value == "") {
			alert("토요일날 가능한 시간을 입력해주세요");
			form.ct_sta.focus();
			return false;
		}
		if (form.ct_sun.value == "") {
			alert("일요일날 가능한 시간을 입력해주세요");
			form.ct_sun.focus();
			return false;
		}
		
		
		if (form.ct_day.value == "") {
			alert("가능한 날짜를 입력해주세요");
			form.ct_day.focus();
			return false;
		}
		*/
	}
</script>

<style>
input[type=number] {
	width: 80px;
}

</style>
</head>

<body>

	<jsp:include page="/Home/header.jsp" />
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3"> "<%=pvo.getP_classname()%>" :수업 시간 등록</h1>
		</div>
	</div>

	<div class="container">
		<form method="post" name="addClassTimeForm"
			action="addClasstimePro.jsp" onsubmit="return writeSave()">
			
			<input type="hidden" name="ct_classnum" value="<%=productNum %>" />
			
			<div class="form-group row">
				<label class="col-sm-2">수업 장소</label>
				<div class="col-sm-3">
					<select id="ct_place" name="ct_place">
						<option value="1">강남</option>
						<option value="2">신촌홍대</option>
						<option value="3">잠실</option>
					</select>
				</div>
			</div>

			<div class="form-group row">
				<label class="col-sm-2">월</label>
				<div class="col-sm-3">
					<input type="text" name="ct_mon" class="form-control">
				</div>
			</div>
			
			<div class="form-group row">
				<label class="col-sm-2">화</label>
				<div class="col-sm-3">
					<input type="text" name="ct_tue" class="form-control">
				</div>
			</div>
			
			<div class="form-group row">
				<label class="col-sm-2">수</label>
				<div class="col-sm-3">
					<input type="text" name="ct_wed" class="form-control">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">목</label>
				<div class="col-sm-3">
					<input type="text" name="ct_thu" class="form-control">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">금</label>
				<div class="col-sm-3">
					<input type="text" name="ct_fri" class="form-control">
				</div>
			</div>
						<div class="form-group row">
				<label class="col-sm-2">토</label>
				<div class="col-sm-3">
					<input type="text" name="ct_sta" class="form-control">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">일</label>
				<div class="col-sm-3">
					<input type="text" name="ct_sun" class="form-control">
				</div>
			</div>
			
			<div class="form-group row">
				<label class="col-sm-2">날짜</label>
				<div class="col-sm-3">
					<input type="date" name="ct_day" class="form-control">
				</div>
			</div>

			<div class="form-group row">
				<div class="col-sm-offset-2 col-sm-10 ">
					<input type="submit" value="시간 등록">&nbsp;&nbsp;&nbsp; <input
						type="reset" value="모든 내용 취소">
				</div>
			</div>
	</form>
		
	</div>
	
		<jsp:include page="/Home/footer.jsp" />
</body>
</html>