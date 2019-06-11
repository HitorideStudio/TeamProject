<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page import ="hmjm.bean.product.*"%>
<%@ page import = "hmjm.bean.tutor.*" %>
<%@ page import = "hmjm.bean.member.*" %>
<!DOCTYPE html>
<html>
<head>
<title>재능 수강 신청하기--k</title>
</head>
<style>
 .btn_red {
    width: 100px;
    display: inline-block;
    margin-top: 0px;
    background: red;
    color: #fff;
    font-size: 20px;
    padding: 20px 0 20px 0;
    transition: all 0.3s ease 0s;
    cursor: pointer;
    border: 0px;
    text-align: center;}
 .btn_b {
    width: 100px;
    display: inline-block;
    margin-top: 0px;
    background: #aaa;
    color: black;
    font-size: 20px;
    padding: 20px 0 20px 0;
    transition: all 0.3s ease 0s;
    cursor: pointer;
    border: 0px;
    text-align: center;  } 
</style>
<script type="text/javascript">
	
	$(function(){
		$('.date_ch').change(function(){
			if($(this).val()=="첫 수업 일자를 선택해주세요")
			{
				$('#StartDateTime').val('');
				var index = $(this).attr('id').substr(4,1);
				index = "#StartDateTime"+index;
				$(index).val('');
			}
			else
			{
				$('#StartDateTime').val($(this).val());
				var index = $(this).attr('id').substr(4,1);
				index = "#StartDateTime"+index;
				$(index).val($(this).val());
			}
			//alert($(this).prop('selectedIndex'));
			//alert($(this).attr('id').substr(4,1));
			/*var index = $(this).attr('id').substr(4,1);
			index = "#StartDateTime"+index;
			$(index).val($(this).val());*/
			
		});
	});

	function setMode()
	{
		if (($('#StartDateTime').val()=='')&&($('#optionCount').val()!="0")&&($('#StartRegion').val()!="온라인"))
		{
			alert('첫 수업 일자를 선택해주세요');
		}
		else{
			$('#StartInfo').submit();
		}
		
	}

</script>


<%
	int num = Integer.parseInt(request.getParameter("p_num"));
	String pageNum = request.getParameter("pageNum");
	productDAO dbPro = productDAO.getInstance();
	productVO vo = dbPro.getProduct(num);
	
	String t_email = vo.getP_email();//강사 닉네임을 불러오기위해
	
	tutorDAO m =tutorDAO.getInstance();
	tutorVO v = m.getMember(t_email);

%>
	
<body>
	
	<%if(session.getAttribute("loginId") != null){%>
	
	<!--  넘어온 수업정보를 넘기는 폼인것 같은데 아직 확실히 잘 모르겠음
	<form id="StartInfo" name="form" action="/Talent/Apply/6466" method="POST">
			<input type="hidden" id="StartRegion" name="StartRegion" value="강남">
			<input type="hidden" id="StartDateTime" name="StartDateTime" value="오후7:30~오후10:30 (2019-06-12)">
	</form>-->
	<div>
	  <form method="post" name="checkForm"
	  action="checkPro" >
		<h1>수업에서 수강신청하기 누르면 나옴</h1>
		<p>내아이디:
		<input type="text" readonly name="b_email" 
		 value=" <%=(String)session.getAttribute("loginId") %>"></p><br>
		
		<input type="hidden" readonly name="b_productnumber" 
		 value="  <%=vo.getP_num() %>">
		 
		<p>수업이름:
		<input type="text" readonly name="b_class" 
		 value=" <%=vo.getP_classname() %>"></p><br>
		
		<p>선생님 별명: <%=v.getT_nick() %><p>
		<p>선생님 이메일: <%=vo.getP_email() %></p>
		<p>^^^위에 수업번호를 선택해서 넘어왔다고 생각하고^^^</p>
		
	</div>
		<br>
	<div>
		<div>
			<p>위치<input type="text"  name="b_place" ></p>
		</div>
		<div>
			<p>요일<input type="text"  name="b_day" ></p>
		</div>
		
	</div>
	

	
	<div class="btn_red" onclick="setMode()">결제하기</div>
	<input type="hidden" id="optionCount" name="optionCount" value="1">
	<div class="btn_b" onclick="javascript:window.location='../Home/main.jsp'">일단 취소</div>
	<%}else{ //로그아웃시 main.jsp로 이동
				//session.invalidate();
			%>
					<script>
					alert("로그인부터");
					window.location='../Log/loginForm.jsp';
						
					</script>
			<%}%>
</body>
</html>