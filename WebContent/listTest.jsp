<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "hmjm.bean.product.*" %>
<%@ page import = "java.util.List" %>
<%@ page import = "hmjm.bean.classimg.*" %>
<%@ page import="hmjm.bean.review.*"%>

<!DOCTYPE html>
<%
int pageSize = 10;

String pageNum = request.getParameter("pageNum");
if (pageNum == null) {pageNum = "1";}

int currentPage = Integer.parseInt(pageNum);
int startRow = (currentPage - 1) * pageSize + 1;	// 시작페이지 카운트
int endRow = currentPage * pageSize;  	// 1~10까지 가져오기위한거
int count = 0;
int number=0;

List productList = null;
productDAO dbPro = productDAO.getInstance();
count = dbPro.getProductCount();
if (count > 0) {
    productList = dbPro.getProduct(startRow, endRow);
}

number=count-(currentPage-1)*pageSize;
classimgDAO aa  = classimgDAO.getInstance();//강의 등록사진 불러오기
reviewDAO rdao = reviewDAO.getInstance();
%>


<html>
<head>
<meta charset="UTF-8">
<title>강의목록 테스트</title>

<style type="text/css">
#list{
	width:1050px;
	height:300px;
	margin: 0 auto;
}
.rank {
    float: left;
    width: 300px;
    height: 200px;
    overflow: hidden;
    border: 1px #ddd solid;
    padding: 1px;
 
}

.pd_container {
	background-color: #E1E1E1;
	float: left;
	margin: 2px;
}

.pd_info {
	display: table-row;
}

.pd_infoEle {
	display: table-cell;
	margin-left: auto;
	margin-right: auto;
	padding: 5px;
}

#btCont {
	width:100%;
	height:200px;
	float: left;
}

#cont_img {
	width: 250px;
	height:200px;
}

/*a태그 관련 스타일 적용*/
a:link {
	color: black;
	text-decoration: none;
}

a:visited {
	color: black;
	text-decoration: none;
}

a:hovor {
	color: black;
	text-decoration: none;
}

.bt_msg1{
	text-align:center;
}
.bt_msg2{
	float:right
}
</style>
</head>


<body id ="list">
<table style="width:100%">
		<div >
			<p>강의목록 테스트</p>
			<p>등록강좌수:<%=count%></p>
			<%if (count == 0 ){%>
			<p>등록된 강의가 없습니다</p>
			<%}else{
				for(int i = 0 ; i <productList.size(); i++){
				productVO vo = (productVO)productList.get(i); 
				int pn = vo.getP_num();
				classimgVO bb = aa.getImg(pn);%>
				
				
				<div id="contents">
					<a href="/TeamProject/Talent/Detail.jsp?p_num=<%=vo.getP_num()%>&pageNum=<%=currentPage %>">
				<div class="pd_container">
					<div class="pd_img">
						<img id="cont_img" src="/TeamProject/Images/Classimg/<%=bb.getCi_name() %>"  />
					</div>
					<div class="pd_info">
						<div class="pd_infoEle">
						<b>[<%=vo.getP_classname() %>]</b>
						<p><img src="/TeamProject/Images/Icon/coin.png" /><%=vo.getP_cost()%></p>
						
					
					<%
						long stScore = Math.round(rdao.avgScore(pn)); //반올림
							
							for (int y = 0; y < stScore; y++) {//별찍기%>
								<span><img src="/TeamProject/Images/Icon/star_f.png" /></span>
							<%}
							for (int y = 0; y < 5 - stScore; y++) {%>
									<span><img src="/TeamProject/Images/Icon/star_empty.png" /></span>
							<%}%>
							<%=rdao.avgScore(pn)%>(<%=rdao.reviewCount(pn)%>)
				</div>
			</div>
		</div>
		</a>
	</div><%--id=contents--%>
		
			
				<% }
			}%>
		
	</div>
	</table>


<%
    if (count > 0) {
        int pageCount = count / pageSize + ( count % pageSize == 0 ? 0 : 1);
		 
        int startPage = (int)(currentPage/10)* 10+1;
		int pageBlock= 10;
        int endPage = startPage + pageBlock-1;
        if (endPage > pageCount) endPage = pageCount;
        
        if (startPage > 10) {    %>
        <a href="listTest.jsp?pageNum=<%= startPage - 10 %>">[이전]</a>
<%      }
        for (int i = startPage ; i <= endPage ; i++) {  %>
        <a href="listTest.jsp?pageNum=<%= i %>">[<%= i %>]</a>
<%
        }
        if (endPage < pageCount) {  %>
        <a href="listTest.jsp?pageNum=<%= startPage + 10 %>">[다음]</a>
<%
        }
    }
%>



</body>
</html>