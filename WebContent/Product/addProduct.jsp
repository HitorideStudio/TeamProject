<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="hmjm.bean.member.*"%>
<%@ page import="hmjm.bean.tutor.*"%>

<%-- 19.06.04성민 작성 , 미완성, --%>
<%--

 --%>

<%
	request.setCharacterEncoding("UTF-8");
	String preUser = (String) session.getAttribute("loginId");//현재 세션,이메일이 들어감
	//일반유저 정보
	memberDAO mdao = memberDAO.getInstance();
	memberVO mvo = mdao.getMember(preUser);

	//튜터 등록 정보, 주석풀면 에러발생. 우선 주석달아둠
	//nick값 받아오기위함
	tutorDAO tdao = tutorDAO.getInstance();		
	tutorVO tvo = tdao.getMember(preUser);
	
	
%>
<html>
<head>
<meta charset="UTF-8">
<title>수업 등록</title>
<script language="javascript" src="script.js"></script>
<script language="javascript" type="text/javascript">
	/*모든 요소 유효성 검사*/
	function writeSave() {
		var form = document.addProductForm;

		if (form.p_classname.value == "") {
			alert("수업의 이름을 입력하십시요.");
			form.p_classname.focus();
			return false;
		}
		if (form.p_category.value == "") {
			alert("카테고리를 지정해주세요");
			form.p_category.focus();
			return false;
		}
		if (form.p_self.value == "") {
			alert("자신 자신을 표현해 주세요.");
			form.p_self.focus();
			return false;
		}
		if (form.p_class1.value == "") {
			alert("수업에 대한 소개를 해주세요.");
			form.p_class1.focus();
			return false;
		}
		if (form.p_class2.value == "") {
			alert("수업에 대한 소개를 해주세요.");
			form.p_class2.focus();
			return false;
		}
		if (form.p_class3.value == "") {
			alert("수업에 대한 소개를 해주세요.");
			form.p_class3.focus();
			return false;
		}
		if (form.p_class4.value == "") {
			alert("수업에 대한 소개를 해주세요.");
			form.p_class4.focus();
			return false;
		}
		if (form.p_time.value == "") {
			alert("소요 시간을 지정해주세요.");
			form.p_time.focus();
			return false;
		}
		if (form.p_cost.value == "") {
			alert("지불해야할 가격을 지정해주세요.");
			form.p_cost.focus();
			return false;
		}
		if (form.p_cost.value == "") {/*이미지*/
			alert("지불해야할 가격을 지정해주세요.");
			form.p_cost.focus();
			return false;
		}
		/*id값으로 체크 여부 확인*/
		if (document.getElementById("oto").checked != true
				&& document.getElementById("otm").checked != true) {
			alert("참여 인원에 대한 정보를 체크해주세요.");
			return false;
		}
		if (document.getElementById("otm").checked == true) {//1:N 체크되었을때
			if (form.p_count_min.value == "") {
				alert("수업에 참여가능한 최소 인원을 지정해주세요.");
				form.p_count_min.focus();
				return false;
			}
			if (form.p_count_max.value == "") {
				alert("수업에 참여가능한 최대 인원을 지정해주세요.");
				form.p_count_max.focus();
				return false;
			}
		}
	}

	/*라디오 버튼 value값 조건비교로, 보여주기/숨김*/
	function div_onoff(v, id) {
		if (v == "2")
			document.getElementById(id).style.display = "";//보여줌
		else
			document.getElementById(id).style.display = "none";//숨김		
	}
	
	/***************카테고리 정하기*************************/
	function categoryChange(e) {
		//상품이름	
		  var good_a = ["포토샵", "일러스트레이터"];
		  var good_b = ["프리미어", "에프터이펙트"];
		  var good_c = ["영어", "중국어"];
		  //value값
		  var cc = ["101","102"];
		  var dd = ["201","202"];
		  var ee = ["301","302"];
		  
		  
		  var target = document.getElementById("p_category");
		 
		  if(e.value == "a") {var d = good_a; var ss = cc;}
		  
		  else if(e.value == "b"){ var d = good_b; var ss = dd;}
		  else if(e.value == "c"){ var d = good_c; var ss = ee;}
		  target.options.length = 0;
		 
		  for (x in d&&ss ) {
		    var opt = document.createElement("option");
		    opt.value = ss[x];
		    opt.innerHTML = d[x];
		    target.appendChild(opt);
		  } 	  
		}
</script>

<style>
input[type=number] {
	width: 80px;
}
#menu {
    background: #e3e3e3;
    padding: 50px 0 50px 0;
}
.container{
	background: #e3e3b1;
    padding: 50px 0 50px 0;

}
</style>
</head>
<%--
	p_num 수업번호는 자동으로 생성 후 부여할 것(input="hidden"..?)
	t_email 이메일 튜터 table에서 가져올것
	private String imgsrc;	//이미지파일을 가져오기위한 변수 추가 작성   
--%>
<body>

	<jsp:include page="/Home/header.jsp" />


	<div id="menu" >
		<h1 class="display-3">수업 등록</h1>
	</div>

	<div class="container">
		<form method="post" name="addProductForm"
			action="addProductPro.jsp" onsubmit="return writeSave()">

			<div class="form-group row">
				<label class="col-sm-2">수업제목</label>
				<div class="col-sm-3">
					<input type="text" name="p_classname" class="form-control">
				</div>
			</div>

			<div class="form-group row">
				<label class="col-sm-2">닉네임</label>
				<div class="col-sm-3">
					<%--tvo.getT_nick()--%>
					<input type="text" readonly name="p_nick" class="form-control"
						value="<%=tvo.getT_nick()%>">
				</div>
			</div>

			<div class="form-group row">
				<label class="col-sm-2">이메일</label>
				<div class="col-sm-3">
					<input type="text" readonly name="p_email" class="form-control"
						value="<%=mvo.getM_email()%>">
				</div>
			</div>
			<div class="form-group row">
			<label class="col-sm-2">카테고리</label>
				<select onchange="categoryChange(this)">
  					<option>카테고리를 선택해주세요</option>
  					<option value="a">디자인</option>
  					<option value="b">영상</option>
  					<option value="c">외국어</option>
			</select>
			<select id="p_category" name="p_category">
					<option  vlaue="" name="p_category">세부 카테고리를 선택해주세요</option>
			</select>
			</div>
			

			<div class="form-group row">
				<label class="col-sm-2">강사 소개</label>
				<div class="col-sm-5">
					<textarea name="p_self" rows="2" cols="50"></textarea>
				</div>
			</div>
			<h2>강의 소개</h2>
			
			<div class="form-group row">
				<label class="col-sm-2">튜터 정보</label>
				<div class="col-sm-3">
					<textarea name="p_class1" rows="2" cols="50"></textarea>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">수업 소개</label>
				<div class="col-sm-3">
					<textarea name="p_class2" rows="2" cols="50"></textarea>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">수업 대상</label>
				<div class="col-sm-3">
					<textarea name="p_class3" rows="2" cols="50"></textarea>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">커리큘럼</label>
				<div class="col-sm-3">
					<textarea name="p_class4" rows="2" cols="50"></textarea>
				</div>
			</div>

			<div class="form-group row">
				<label class="col-sm-2">소요시간</label>
				<div class="col-sm-3">
					<input type="number" name="p_time" min=1>
				</div>
			</div>

			<div class="form-group row">
				<label class="col-sm-2">가격</label>
				<div class="col-sm-3">
					<input type="number" name="p_cost" step="1000" min=0>원
				</div>
			</div>

			<div class="form-group row">
				<label class="col-sm-2">인원</label>
				<div class="col-sm-3">
					<input type="radio" name="howmany"
						id="oto" value="1" onclick="div_onoff(this.value,'con');">1:1강습<br> 
					<input type="radio" name="howmany" id="otm" value="2"
						onclick="div_onoff(this.value,'con');">1:N 강습<br>
					
					<div id="con" style="display: none">
						최소인원: <input type="number" name="p_count_min" min=1><br>
						최대인원: <input type="number" name="p_count_max" min=1>
					</div>
				</div>
			</div>

			<div class="form-group row">
				<label class="col-sm-2">PS</label>
				<div class="col-sm-3">
					<textarea name="p_memo" rows="2" cols="50"></textarea>
				</div>
			</div>

				
			</div>
		
			<div class="form-group row">
				<div class="col-sm-offset-2 col-sm-10 ">
					<input type="submit" value="수업 등록">&nbsp;&nbsp;&nbsp; <input
						type="reset" value="모든 내용 취소"> &nbsp;&nbsp;&nbsp; <input
						type="button" value="목록보기" OnClick="window.location='../Home/main.jsp'">
				</div>
			</div>
	</form>
		
	</div>
	
		<jsp:include page="/Home/footer.jsp" />
	
</body>
</html>
