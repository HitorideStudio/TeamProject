<%@ page contentType="text/html; charset=euc-kr"%>
<%@ page import="hmjm.bean.member.*"%>
<%@ page import="hmjm.bean.tutor.*"%>

<%-- 19.06.04失肯 拙失 , 耕刃失, --%>
<%--

 --%>
<%
	request.setCharacterEncoding("UTF-8");
	String preUser = (String) session.getAttribute("loginId");//薄仙 室芝,戚五析戚 級嬢姶
	//析鋼政煽 舛左
	memberDAO mdao = memberDAO.getInstance();
	memberVO mvo = mdao.getMember(preUser);

	//透斗 去系 舛左, 爽汐熱檎 拭君降持. 酔識 爽汐含焼客
	//nick葵 閤焼神奄是敗
	tutorDAO tdao = tutorDAO.getInstance();		
	tutorVO tvo = tdao.getMember(preUser);
	
	
%>
<html>
<head>

<title>呪穣 去系</title>
<script language="javascript" src="script.js"></script>
<script language="javascript" type="text/javascript">
	/*乞窮 推社 政反失 伊紫*/
	function writeSave() {
		var form = document.addProductForm;

		if (form.p_classname.value == "") {
			alert("呪穣税 戚硯聖 脊径馬淑獣推.");
			form.p_classname.focus();
			return false;
		}
		if (form.p_category.value == "") {
			alert("朝砺壱軒研 走舛背爽室推");
			form.p_category.focus();
			return false;
		}
		if (form.p_self.value == "") {
			alert("切重 切重聖 妊薄背 爽室推.");
			form.p_self.focus();
			return false;
		}
		if (form.p_class1.value == "") {
			alert("呪穣拭 企廃 社鯵研 背爽室推.");
			form.p_class1.focus();
			return false;
		}
		if (form.p_class2.value == "") {
			alert("呪穣拭 企廃 社鯵研 背爽室推.");
			form.p_class2.focus();
			return false;
		}
		if (form.p_class3.value == "") {
			alert("呪穣拭 企廃 社鯵研 背爽室推.");
			form.p_class3.focus();
			return false;
		}
		if (form.p_class4.value == "") {
			alert("呪穣拭 企廃 社鯵研 背爽室推.");
			form.p_class4.focus();
			return false;
		}
		if (form.p_time.value == "") {
			alert("社推 獣娃聖 走舛背爽室推.");
			form.p_time.focus();
			return false;
		}
		if (form.p_cost.value == "") {
			alert("走災背醤拝 亜維聖 走舛背爽室推.");
			form.p_cost.focus();
			return false;
		}
		if (form.p_cost.value == "") {/*戚耕走*/
			alert("走災背醤拝 亜維聖 走舛背爽室推.");
			form.p_cost.focus();
			return false;
		}
		/*id葵生稽 端滴 食採 溌昔*/
		if (document.getElementById("oto").checked != true
				&& document.getElementById("otm").checked != true) {
			alert("凧食 昔据拭 企廃 舛左研 端滴背爽室推.");
			return false;
		}
		if (document.getElementById("otm").checked == true) {//1:N 端滴鞠醸聖凶
			if (form.p_count_min.value == "") {
				alert("呪穣拭 凧食亜管廃 置社 昔据聖 走舛背爽室推.");
				form.p_count_min.focus();
				return false;
			}
			if (form.p_count_max.value == "") {
				alert("呪穣拭 凧食亜管廃 置企 昔据聖 走舛背爽室推.");
				form.p_count_max.focus();
				return false;
			}
		}
	}

	/*虞巨神 獄動 value葵 繕闇搾嘘稽, 左食爽奄/需沿*/
	function div_onoff(v, id) {
		if (v == "2")
			document.getElementById(id).style.display = "";//左食捜
		else
			document.getElementById(id).style.display = "none";//需沿		
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
	p_num 呪穣腰硲澗 切疑生稽 持失 板 採食拝 依(input="hidden"..?)
	t_email 戚五析 透斗 table拭辞 亜閃臣依
	private String imgsrc;	//戚耕走督析聖 亜閃神奄是廃 痕呪 蓄亜 拙失   
--%>
<body>

	<jsp:include page="/Home/header.jsp" />


	<div id="menu" >
		<h1 class="display-3">呪穣 去系</h1>
	</div>

	<div class="container">
		<form method="post" name="addProductForm"
			action="addProductPro.jsp" onsubmit="return writeSave()">

			<div class="form-group row">
				<label class="col-sm-2">戚硯</label>
				<div class="col-sm-3">
					<input type="text" readonly name="p_classname" class="form-control"
						value="<%=mvo.getM_name()%>">
				</div>
			</div>

			<div class="form-group row">
				<label class="col-sm-2">莞革績</label>
				<div class="col-sm-3">
					<%--tvo.getT_nick()--%>
					<input type="text" readonly name="p_nick" class="form-control"
						value="<%=tvo.getT_nick()%>">
				</div>
			</div>

			<div class="form-group row">
				<label class="col-sm-2">戚五析</label>
				<div class="col-sm-3">
					<input type="text" readonly name="p_email" class="form-control"
						value="<%=mvo.getM_email()%>">
				</div>
			</div>

			<div class="form-group row">
				<label class="col-sm-2">朝砺壱軒</label>
				<div class="col-sm-3">
					<%--鯉系 益血:select稽 壱研 呪 赤亀系 姥薄拝依 --%>
					<select id="p_category" name="p_category">
						<optgroup label="昔奄呪穣">
							<option value="archi">しし</option>
							<option value="computer" selected>しし</option>
						</optgroup>
						<optgroup label="巨切昔">
							<option value="history">しし</option>
							<option value="lang">しし</option>
						</optgroup>
						<optgroup label="叔巷蝕勲">
							<option value="history">しし</option>
							<option value="lang">しし</option>
						</optgroup>
						<optgroup label="坂銅">
							<option value="history">しし</option>
							<option value="lang">しし</option>
						</optgroup>
						<optgroup label="慎雌">
							<option value="history">しし</option>
							<option value="lang">しし</option>
						</optgroup>
						<optgroup label="須厩嬢">
							<option value="history">しし</option>
							<option value="lang">しし</option>
						</optgroup>
						<optgroup label="製焦">
							<option value="history">しし</option>
							<option value="lang">しし</option>
						</optgroup>
						<optgroup label="虞戚覗什析">
							<option value="history">しし</option>
							<option value="lang">しし</option>
						</optgroup>
						<optgroup label="奄展">
							<option value="history">しし</option>
							<option value="lang">しし</option>
						</optgroup>
					</select>
				</div>
			</div>

			<div class="form-group row">
				<label class="col-sm-2">悪紫 社鯵</label>
				<div class="col-sm-5">
					<textarea name="p_self" rows="2" cols="50"></textarea>
				</div>
			</div>
			<h2>悪税 社鯵</h2>
			<div class="form-group row">
				<label class="col-sm-2">透斗 舛左</label>
				<div class="col-sm-3">
					<textarea name="p_class1" rows="2" cols="50"></textarea>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">呪穣 社鯵</label>
				<div class="col-sm-3">
					<textarea name="p_class2" rows="2" cols="50"></textarea>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">呪穣 企雌</label>
				<div class="col-sm-3">
					<textarea name="p_class3" rows="2" cols="50"></textarea>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">朕軒擢軍</label>
				<div class="col-sm-3">
					<textarea name="p_class4" rows="2" cols="50"></textarea>
				</div>
			</div>

			<div class="form-group row">
				<label class="col-sm-2">社推獣娃</label>
				<div class="col-sm-3">
					<input type="number" name="p_time" min=1>
				</div>
			</div>

			<div class="form-group row">
				<label class="col-sm-2">亜維</label>
				<div class="col-sm-3">
					<input type="number" name="p_cost" step="1000" min=0>据
				</div>
			</div>

			<div class="form-group row">
				<label class="col-sm-2">昔据</label>
				<div class="col-sm-3">
					<input type="radio" name="howmany"
						id="oto" value="1" onclick="div_onoff(this.value,'con');">1:1悪柔<br> 
					<input type="radio" name="howmany" id="otm" value="2"
						onclick="div_onoff(this.value,'con');">1:N 悪柔<br>
					
					<div id="con" style="display: none">
						置社昔据: <input type="number" name="p_count_min" min=1><br>
						置企昔据: <input type="number" name="p_count_max" min=1>
					</div>
				</div>
			</div>

			<div class="form-group row">
				<label class="col-sm-2">PS</label>
				<div class="col-sm-3">
					<textarea name="p_memo" rows="2" cols="50"></textarea>
				</div>
			</div>

			<div class="form-group row">
				<label class="col-sm-2">呪穣 紫遭</label>
				<div class="col-sm-5">
					<input type="file" name="" class="form-control">
				</div>
			</div>

			<div class="form-group row">
				<div class="col-sm-offset-2 col-sm-10 ">
					<input type="submit" value="呪穣 去系">&nbsp;&nbsp;&nbsp; <input
						type="reset" value="乞窮 鎧遂 昼社"> &nbsp;&nbsp;&nbsp; <input
						type="button" value="鯉系左奄" OnClick="window.location='list.jsp'">
				</div>
			</div>

		</form>
	</div>
	
		<jsp:include page="/Home/footer.jsp" />
	
</body>
</html>
