<%@ page contentType="text/html; charset=euc-kr"%>
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
	//tutorDAO tdao = tutorDAO.getInstance();		
	//tutorVO tvo = tdao.getMember(preUser);
%>
<html>
<head>
<title>수업 등록</title>
<script language="javascript" src="script.js"></script>
<script language="javascript" type="text/javascript">
	/*모든 요소 유효성 검사*/
	function writeSave(){
		var form = document.addProductForm;
		
		if(form.p_classname.value==""){		
			  alert("수업의 이름을 입력하십시요.");
			  form.p_classname.focus();
			  return false;
		}
		if(form.p_category.value==""){		
			  alert("카테고리를 지정해주세요");
			  form.p_category.focus();
			  return false;
		}
		if(form.p_self.value==""){	
			  alert("자신 자신을 표현해 주세요.");
			  form.p_self.focus();
			  return false;
		}
		if(form.p_class1.value==""){		
			  alert("수업에 대한 소개를 해주세요.");
			  form.p_class1.focus();
			  return false;
		}
		if(form.p_class2.value==""){		
			  alert("수업에 대한 소개를 해주세요.");
			  form.p_class2.focus();
			  return false;
		}
		if(form.p_class3.value==""){		
			  alert("수업에 대한 소개를 해주세요.");
			  form.p_class3.focus();
			  return false;
		}
		if(form.p_class4.value==""){		
			  alert("수업에 대한 소개를 해주세요.");
			  form.p_class4.focus();
			  return false;
		}
		if(form.p_time.value==""){		
			  alert("소요 시간을 지정해주세요.");
			  form.p_time.focus();
			  return false;
		}
		if(form.p_cost.value==""){		
			  alert("지불해야할 가격을 지정해주세요.");
			  form.p_cost.focus();
			  return false;
		}
		/*id값으로 체크 여부 확인*/
		if(document.getElementById("oto").checked != true 
				&& document.getElementById("otm").checked != true ){		
			  alert("참여 인원에 대한 정보를 체크해주세요.");
			  return false;
		}
		if(document.getElementById("otm").checked==true){//1:N 체크되었을때
			if(form.p_count_min.value==""){		
				  alert("수업에 참여가능한 최소 인원을 지정해주세요.");
				  form.p_count_min.focus();
				  return false;
			}
			if(form.p_count_max.value==""){		
				  alert("수업에 참여가능한 최대 인원을 지정해주세요.");
				  form.p_count_max.focus();
				  return false;
			}		
		}	
	}
	
	/*라디오 버튼 value값 조건비교로, 보여주기/숨김*/
	function div_onoff(v,id){
		if(v=="2")
			document.getElementById(id).style.display="";//보여줌
		else
			document.getElementById(id).style.display="none";//숨김		
	}
	
</script>

<style>
input[type=number] {
	width: 80px;
}



</style>
</head>

<%--
	p_num 수업번호는 자동으로 생성 후 부여할 것(input="hidden"..?)
	t_email 이메일 튜터 table에서 가져올것
	private String imgsrc;	//이미지파일을 가져오기위한 변수 추가 작성   
--%>
<body>
	<jsp:include page="/Home/header.jsp"/>
	<b>수업등록</b>
	<br>
	<div class="container">
		<form method="post" name="addProductForm" action="processAddProduct.jsp"
			onsubmit="return writeSave()">

			<div>
				<label>[이름]</label><%=mvo.getM_name()%>
			</div>
			<%-- 
	<div>
		<label>닉네임</label><%=tvo.getT_nick()%>
	</div>
	--%>
			<div>
				<label>[이메일]</label><%=mvo.getM_email()%>
			</div>

			<div>
				<%--목록 그룹 --%>
				<label>수업 명</label> <input type="text" size="40" maxlength="50"
					name="p_classname" placeholder="이목을 끌 톡톡튀는 수업명을 입력하세요!">
			</div>

			<div>
				<%--목록 그룹:select로 고를 수 있도록 구현할것 --%>
				<label>카테고리(대>소)</label> <select id="p_category" name="p_category">
					<optgroup label="인기수업">
						<option value="archi">ㅇㅇ</option>
						<option value="computer" selected>ㅇㅇ</option>
					</optgroup>
					<optgroup label="디자인">
						<option value="history">ㅇㅇ</option>
						<option value="lang">ㅇㅇ</option>
					</optgroup>
					<optgroup label="실무역량">
						<option value="history">ㅇㅇ</option>
						<option value="lang">ㅇㅇ</option>
					</optgroup>
					<optgroup label="뷰티">
						<option value="history">ㅇㅇ</option>
						<option value="lang">ㅇㅇ</option>
					</optgroup>
					<optgroup label="영상">
						<option value="history">ㅇㅇ</option>
						<option value="lang">ㅇㅇ</option>
					</optgroup>
					<optgroup label="외국어">
						<option value="history">ㅇㅇ</option>
						<option value="lang">ㅇㅇ</option>
					</optgroup>
					<optgroup label="음악">
						<option value="history">ㅇㅇ</option>
						<option value="lang">ㅇㅇ</option>
					</optgroup>
					<optgroup label="라이프스일">
						<option value="history">ㅇㅇ</option>
						<option value="lang">ㅇㅇ</option>
					</optgroup>
					<optgroup label="기타">
						<option value="history">ㅇㅇ</option>
						<option value="lang">ㅇㅇ</option>
					</optgroup>
				</select><br />
			</div>

			<div>
				<%--목록 그룹 /rows="15" cols="100"로 설정하기--%>
				<label>강사소개</label><br>
				<textarea name="p_self" rows="3" cols="5"></textarea>
			</div>
			
			<div>
				<h3>소개하기</h3>
				<label>튜터정보</label><br>
				<textarea name="p_class1" rows="3" cols="5"></textarea>
				<br> <label>수업소개</label><br>
				<textarea name="p_class2" rows="3" cols="5"></textarea>
				<br> <label>수업 대상</label><br>
				<textarea name="p_class3" rows="3" cols="5"></textarea>
				<br> <label>커리큘럼</label><br>
				<textarea name="p_class4" rows="3" cols="5"></textarea>
			</div>

			<div>
				<label>소요시간</label> <input type="number" name="p_time" min=1>
			</div>
			
			<div>
				<label>가격</label> <input type="number" name="p_cost" step="1000"
					min=0>원
			</div>
			
			<div>
				<label>인원</label><br> 
				<input type="radio" name="howmany"
					id="oto" value="1" onclick="div_onoff(this.value,'con');">1:1 강습<br>
				<input type="radio" name="howmany" 
					id="otm" value="2" onclick="div_onoff(this.value,'con');">1:N 강습<br>
				<div id="con" style="display: none">
					최소인원: <input type="number" name="p_count_min" min=1><br>
					최대인원: <input type="number" name="p_count_max" min=2><br>
				</div>
			</div>

			<div>
				<label>PS</label><br>
				<textarea name="p_memo" rows="5" cols="100"></textarea>
			</div>

			<input type="submit" value="수업 등록">&nbsp;&nbsp;&nbsp;
			<input type="reset" value="모든 내용 취소"> &nbsp;&nbsp;&nbsp;
			<input type="button" value="목록보기" OnClick="window.location='list.jsp'">
		</form>
	</div>
	<jsp:include page="/Home/footer.jsp"/>
</body>
</html>
