<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page import = "hmjm.bean.tutor.*" %>
<%@ page import = "hmjm.bean.member.*" %>
<%@ page import = "hmjm.bean.product.*" %>
<%@ page import = "hmjm.bean.buy.*" %>
<%@ page import = "java.util.List" %>
<!DOCTYPE html>
<html>
<head>
<title>내 수업kkk</title>
<style>
	.top{
		background-color:#FF007F;
		margin: 0 auto;
		padding: 15px;
		
	}
	.row{
		width: 100%;
		display:table;
	}
	.rowele1{
		background-color: white;
		display: table-cell;
		width: 50%;
		padding: 50px 20px;	
		text-align:center;	
	}
	.rowele2{
		background-color: #D5D5D5;
		display: table-cell;
		width: 50%;
		padding: 50px 20px;	
		text-align:center;			
	}
	.btntxt{
		text-decoration:none;
		font-weight:bold;
	}

	span{
		color:white;
		font-size:15px;
	}
	
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
<%
		String id = (String) session.getAttribute("loginId");
		int num = Integer.parseInt(request.getParameter("p_num"));
		productDAO dbPro = productDAO.getInstance();
		productVO vo = dbPro.getProduct(num);
		productVO p = dbPro.getProduct4(id);

		
		//String p = vo.getP_email();
		//boolean result = id.equals(p);
		
		buyDAO buyer = buyDAO.getInstance();
		buyVO b = buyer.getBuy(id);
		//String e = b.getB_email();
	
		//boolean result2 = id.equals(e);
		
		int pageSize = 10;
		String pageNum = request.getParameter("pageNum");
		if (pageNum == null) {pageNum = "1";}

		int currentPage = Integer.parseInt(pageNum);
		int startRow = (currentPage - 1) * pageSize + 1;	// 시작페이지 카운트
		int endRow = currentPage * pageSize;  	// 1~10까지 가져오기위한거
		int count = 0;
		int number=0;
		//튜터강의 목록
		List tutorProductList = null;
		count = dbPro.getProductCount();
		if (count > 0) {
			tutorProductList = dbPro.getProductTutor(id,startRow, endRow);}
		
		//구매목록
		List productbuyList =null;
			count = buyer.buyCount();
			if (count > 0) {
				productbuyList = buyer.getBuyList(id, startRow, endRow);}
		
%>
<body>
	<jsp:include page="/Home/header.jsp"/>
	<jsp:include page="nav_top.jsp" />
	
	<button class="tablink" onclick="openPage('Home', this, 'red')">튜터</button>
	<button class="tablink" onclick="openPage('About', this, 'orange')">수강생</button>
	<div id="Home" class="tabcontent">
  <h3>내 수업</h3>
  <p>
  	<% if(p == null){%>
  			아직 당신의 수업이 없어요
		<%}else{
			 for(int i = 0 ; i <tutorProductList.size(); i++){
				
				productVO tu = (productVO)tutorProductList.get(i);%>
				수업번호::<%=tu.getP_num() %><br>
				수업이름::<a href ="/TeamProject/Talent/Detail.jsp?p_num=<%=tu.getP_num()%>"><%=tu.getP_classname() %></a>
				<br><br>
			<%}%>
		<%}%>
			
  </p>
</div>
<div id="About" class="tabcontent">
  <h3>내가 신청한 수업</h3>
  <p>
  	<% if(b == null){%>
  			신청한 수업이 없습니다	
		<% }else{%>
			<% for(int i = 0 ; i <productbuyList.size(); i++){
				buyVO bb = (buyVO)productbuyList.get(i);%>
				수업번호::<%=bb.getB_num() %><br>
				수업이름::<a href ="/TeamProject/Talent/Detail.jsp?p_num=<%=bb.getB_productnumber()%>"><%=bb.getB_classname() %></a>
				<br><br>
				<%}%>
		<%}%>
  
  </p>

</div>
			

	<jsp:include page="/Home/footer.jsp" />
</body>
</html>