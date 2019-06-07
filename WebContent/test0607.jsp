<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Page Title</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
* {
  box-sizing: border-box;
}

/* Style the body */
body {
  font-family: Arial, Helvetica, sans-serif;
  margin: 0;
}

/* Header/logo Title */
.header {
  padding: 20px;
  text-align: center;
  background: #1abc9c;
  color: white;
}

/* Increase the font size of the heading */
.header h1 {
  font-size: 40px;
}

/* Style the top navigation bar */
.navbar {
  overflow: hidden;
  background-color: #333;
}

/* Style the navigation bar links */
.navbar a {
  float: left;
  display: block;
  color: white;
  text-align: center;
  padding: 14px 20px;
  text-decoration: none;
}

/* Right-aligned link */
.navbar a.right {
  float: right;
}

/* Change color on hover */
.navbar a:hover {
  background-color: #ddd;
  color: black;
}

/* Column container */
.row {  
  display: -ms-flexbox; /* IE10 */
  display: flex;
  -ms-flex-wrap: wrap; /* IE10 */
  flex-wrap: wrap;
}

/* Create two unequal columns that sits next to each other */
/* Sidebar/left column */
.side {
  -ms-flex: 30%; /* IE10 */
  flex: 30%;
  background-color: #f1f1f1;
  padding: 20px;
}

/* Main column */
.main {   
  -ms-flex: 70%; /* IE10 */
  flex: 70%;
  background-color: white;
  padding: 20px;
}

/* Fake image, just for this example */
.fakeimg {
  background-color: #aaa;
  width: 100%;
  padding: 20px;
}

/* Footer */
.footer {
  padding: 120px;
  text-align: center;
  background: #ddd;
}

/* Responsive layout - when the screen is less than 700px wide, make the two columns stack on top of each other instead of next to each other */
@media screen and (max-width: 700px) {
  .row {   
    flex-direction: column;
  }
}

/* Responsive layout - when the screen is less than 400px wide, make the navigation links stack on top of each other instead of next to each other */
@media screen and (max-width: 400px) {
  .navbar a {
    float: none;
    width: 100%;
  }
}
</style>
<script language="javascript">
		function openRealtimetalk(){
			url="/TeamProject/My/qnatutee.jsp";
			//���ο� ������� ����
			open(url, "qnatutee",  "toolbar=no, location=no,status=no,menubar=no,resizable=no,width=400, height=660");
		}
	</script>
</head>
<%
	String loginbarName;	//�α��ι�	
	String logURL;
	
	String statebarName;	//�α��� ���ο� ���� ���¹�
	String stateURL;
	
	if(session.getAttribute("loginId") == null){
		loginbarName="�α���";		
		logURL="/TeamProject/Log/loginForm.jsp";
		
  		statebarName ="ȸ������";	
  		stateURL="/TeamProject/Register/register.jsp";
	}else{
		loginbarName="�ǽð� ��";	//�α׾ƿ������, ������û���ȿ��� ����Ұ�_by.sm
		logURL="/TeamProject/My/qnatutee.jsp";
		
		statebarName ="������û��";	
		stateURL="/TeamProject/My/application.jsp";
	}
%>
<body>

<div class="header">
  <h1>My Website</h1>
  <p>A website created by me.</p>
</div>

<div class="navbar">
  <%//My/Application.jsp�� �α׾ƿ���� �߰��ϸ� �����Ұ�.
	if(session.getAttribute("loginId")!= null){%>
	<a href="/TeamProject/Log/logout.jsp"class="right">�α׾ƿ�</a><%}%>	
  <a href="/TeamProject/Tutor/Register/menu.jsp"class="right">Ʃ�͵��</a>
  <a href="<%=stateURL%>"class="right"><%=statebarName%></a>
				<%
					if(session.getAttribute("loginId")== null){%>
						<a href="<%=logURL%>"class="right"><%=loginbarName %></a>
					<%}else{%>
						<a href="" onclick="openRealtimetalk()"class="right"><%=loginbarName%></a>
						<a href="/TeamProject/My/application.jsp" class="right">��������</a> 
					<%}%>
</div>

<div class="row">
  <div class="side">
    <h2>About Me</h2>
    <h5>Photo of me:</h5>
    <div class="fakeimg" style="height:200px;">Image</div>
    <p>Some text about me in culpa qui officia deserunt mollit anim..</p>
    <h3>More Text</h3>
    <p>Lorem ipsum dolor sit ame.</p>
    <div class="fakeimg" style="height:60px;">Image</div><br>
    <div class="fakeimg" style="height:60px;">Image</div><br>
    <div class="fakeimg" style="height:60px;">Image</div>
  </div>
  <div class="main">
    <h2>TITLE HEADING</h2>
    <h5>Title description, Dec 7, 2017</h5>
    <div class="fakeimg" style="height:200px;">Image</div>
    <p>Some text..</p>
    <p>Sunt in culpa qui officia deserunt mollit anim id est laborum consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco.</p>
    <br>
    <h2>TITLE HEADING</h2>
    <h5>Title description, Sep 2, 2017</h5>
    <div class="fakeimg" style="height:200px;">Image</div>
    <p>Some text..</p>
    <p>Sunt in culpa qui officia deserunt mollit anim id est laborum consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco.</p>
  </div>
</div>

<div class="footer">
  <h2>Footer</h2>
</div>

</body>
</html>