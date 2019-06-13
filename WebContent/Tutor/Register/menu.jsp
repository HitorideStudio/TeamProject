<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page import="hmjm.bean.member.*"%>
<%@ page import="hmjm.bean.tutor.*"%>
<!DOCTYPE html>
<html>
<head>
<title>튜터등록 메뉴k</title>
<style>
#menu {
    background: #e3e3e3;
    padding: 100px 100px 100px 100px;
}

.menu_new {width: 500;}



.eachButton {display:table-cell;}

</style>

<style>
* {box-sizing: border-box}

/* Set height of body and the document to 100% */
body, html {
  height: 100%;
  margin: 0;
  font-family: Arial;
}

/* Style tab links */
.tablink {
  background-color: #555;
  color: white;
  float: left;
  border: none;
  outline: none;
  cursor: pointer;
  padding: 14px 16px;
  font-size: 17px;
  width: 50%;
}

.tablink:hover {
  background-color: #777;
}

/* Style the tab content (and add height:100% for full page content) */
.tabcontent {
  color: white;
  display: none;
  padding: 100px 20px;
  height: 100%;
}

#Home {background-color: red;}
#News {background-color: green;}
#Contact {background-color: blue;}
#About {background-color: orange;}
</style>

<script>
function openPage(pageName,elmnt,color) {
  var i, tabcontent, tablinks;
  tabcontent = document.getElementsByClassName("tabcontent");
  for (i = 0; i < tabcontent.length; i++) {
    tabcontent[i].style.display = "none";
  }
  tablinks = document.getElementsByClassName("tablink");
  for (i = 0; i < tablinks.length; i++) {
    tablinks[i].style.backgroundColor = "";
  }
  document.getElementById(pageName).style.display = "block";
  elmnt.style.backgroundColor = color;
}

// Get the element with id="defaultOpen" and click on it
document.getElementById("defaultOpen").click();
</script>

</head>
<body>
	
	<jsp:include page="/Home/header.jsp" />
	
	<button class="tablink" onclick="openPage('Home', this, 'red')">튜터</button>
	<button class="tablink" onclick="openPage('About', this, 'orange')">수강</button>
	
	<div>
		<div >
		<%
			if (session.getAttribute("loginId") == null) {
		%>
			<script>
				alert("로그인 후 이용바랍니다.");
				window.location = '/TeamProject/Log/loginForm.jsp';
			</script>

		<%
			} else {   
				String m_email = (String) session.getAttribute("loginId");
				memberDAO manager = memberDAO.getInstance();
				memberVO c = manager.getMember(m_email);
				tutorDAO vo = tutorDAO.getInstance();
				tutorVO e = vo.getMember(m_email);
		%>
		<div>
			
			
				<div id="Home" class="tabcontent">
					<%
				if (e == null) {
			%>
			<input type="button" value="튜터등록"
				onclick="javascript:window.location='/TeamProject/Tutor/tutorRegister2.jsp'">

			<%} else {%>
			<input type="button" value="튜터수정"
				onclick="javascript:window.location='/TeamProject/Tutor/tutorModifyForm.jsp'">
			<%}%>
			
				</div>
				<div id="About" class="tabcontent">
				<% if( e == null){%>
				<input type="button" value="튜터 등록 먼저 하세요"
				onclick="javascript:window.location='/TeamProject/Tutor/tutorRegister2.jsp'">
				<%} else {%>
					<input type="button" value="강의등록"
				onclick="javascript:window.location='/TeamProject/Product/addProduct.jsp'">
				<%} 
				} %>
				</div>
			</div>		
		</div>
	</div>
	
	
		<jsp:include page="/Home/footer.jsp" />
	
</body>
</html>