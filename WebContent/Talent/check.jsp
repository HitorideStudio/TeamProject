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
    text-align: center;
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
String m_email ="mfboy19@naver.com";//이메일 값

tutorDAO vo = tutorDAO.getInstance();
tutorVO e = vo.getMember(m_email);

productDAO product = productDAO.getInstance();
productVO p = product.getProduct(m_email);

%>
	
<body>
	
	<%if(session.getAttribute("loginId") != null){%>
	
	<!--  넘어온 수업정보를 넘기는 폼인것 같은데 아직 확실히 잘 모르겠음
	<form id="StartInfo" name="form" action="/Talent/Apply/6466" method="POST">
			<input type="hidden" id="StartRegion" name="StartRegion" value="강남">
			<input type="hidden" id="StartDateTime" name="StartDateTime" value="오후7:30~오후10:30 (2019-06-12)">
	</form>-->
	<div>
		<h1>수업에서 수강신청하기 누르면 나옴</h1>
		<p>수업번호: <%=p.getP_num() %></p>
		<p>^^^위에 수업번호를 선택해서 넘어왔다고 생각하고^^^</p>
		<p>클래스명: <%=p.getP_classname() %></p>
	</div>
		<br>
	<div>
		<div>
			<p>위치</p>
		</div>
		<div>
			<p>요일</p>
		</div>
		
	</div>
	
	
	
	
	
	
	
	
	
	
	

	
	<div class="btn_red" onclick="setMode()">결제하기</div>
	<input type="hidden" id="optionCount" name="optionCount" value="1">
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