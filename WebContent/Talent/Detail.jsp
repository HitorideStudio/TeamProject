<%@ page language="java" contentType="text/html; charset=utf-8" %>
<%@ page import = "hmjm.bean.product.*" %>
<%@ page import = "hmjm.bean.buy.*" %>
<%@ page import = "hmjm.bean.classtime.*" %>
<%@ page import = "hmjm.bean.classimg.*" %>
<%@ page import = "hmjm.bean.tutor.*" %>
<%@ page import = "java.util.List" %>
<%@ page import = "oracle.net.aso.b"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>강의 상세페이지kkkk</title>
<style>

* {
  box-sizing: border-box;
}

body {
 
  font-family: Helvetica, sans-serif;
}

#tuImg {
	float: center;
	overflow: hidden;
	display: block;
	margin: 0 auto;
	width: 150px;
	height: 150px;
	border-radius: 50%;
	background-size: cover;
	background-position: center;
}

#container_detail {
    width: 1000px;
    background: none;
    padding: 50px 0 50px 0;
    letter-spacing: 0;
    margin: 0 auto;
}
.pic {
	width: 500px;
	height: 200px;
    float: left;
    
    padding: 0 80px 0 80px;
}
.title {
	width: 500px;
	height: 100px;
    float: right;
    margin: 0 auto;
    padding: 0 0 0 0;
     
}
.title2 {
	width: 500px;
	height: 100px;
    float: right;
    margin: 0 auto;
    padding: 0 0 0 0;
     
}
.s {
	padding: 50px;
	width: 1000px;
	
	margin: 0 auto; 
}
.empty{
	height:30px;
	background-color:green;
}
/*버튼 스타일*/
.btn {
 	background-color: #4CAF90;
	color: white;
	padding: 16px 20px;
	margin: 8px 0;
	border: none;
	cursor: pointer;
	width: 400px;
	opacity: 0.9;
}


.success:hover {opacity: 1;}

ul {
    list-style:none;
    margin:0;
    padding:0;
}

li {

    margin: 0 0 0 0;
    padding: 0 0 0 0;
    border : 0;
    float: left;
}

</style>
</head>

<%

		String id = (String) session.getAttribute("loginId");
		int num = Integer.parseInt(request.getParameter("p_num"));
		String pageNum = request.getParameter("pageNum");
	
		classtimeDAO time = classtimeDAO.getInstance();
		classtimeVO t = time.getClasstime(num);
		//String t_email = vo.getP_email();//강사 닉네임을 불러오기위해
		
		classimgDAO aa  = classimgDAO.getInstance();
		classimgVO bb = aa.getImg(num);
		int cp = Integer.parseInt(t.getCt_place());//지역표시 위해
		
		//내수업인지 신청한 수업인지 구별하기 위해 불러오는 값..테스트중
		tutorDAO tu = tutorDAO.getInstance();
		tutorVO ee = tu.getMember(id);
				
		System.out.println("튜터정보**e**"+ee);
				
		buyDAO buyer = buyDAO.getInstance();
		buyVO b = buyer.getBuy(id);
		buyVO c = buyer.getBuy3(id,num);//구매한 상품 신청 못하게
		System.out.println("구매정보**b**"+b);
				
		//System.out.println("구매한경우강의넘버**bbb**"+bbb);
		productDAO dbPro = productDAO.getInstance();
		productVO vo = dbPro.getProduct(num);
		productVO vc = dbPro.getProduct2(id,num);//등록한 상품 신청 못하게
		productVO vd = dbPro.getProduct4(id);
		String t_email = vo.getP_email();//강사 닉네임을 불러오기위해
		tutorVO et = tu.getMember(t_email);
					
		//내가 등록한 강의 번호	
		
		//사진 불러오기 할려고 했는데 이건 아닌 듯....미완성
		if (pageNum == null) { pageNum = "1"; }
		int pageSize = 10;
		int currentPage = Integer.parseInt(pageNum);
		int startRow = (currentPage - 1) * pageSize + 1;
		int endRow = currentPage * pageSize;
		int count = 0;
		int number=0;
		
		List classimgList = null;
		classimgDAO pic = classimgDAO.getInstance();
		count = pic.getClassimgCount(num);
		
		if (count > 0) {
			classimgList = pic.getClassimg(num,startRow, endRow);
		}
	

%>
<jsp:include page="../Home/header.jsp" />
<body>
<div id="container_detail">
		
			<div class="pic">
				<img id="tuImg" src="/TeamProject/Images/TutorImg/<%=et.getT_selfimg()%>">
				<%=et.getT_nick() %>
				<input type="hidden" name="p_email"
					value="<%=vo.getP_email()%>" /><br>
				강사이메일:::::::: <a href="#"
					onClick="window.open('/TeamProject/Message/messageWriteForm.jsp?p_email=<%=vo.getP_email()%>&p_num=<%=num%>',
					'_blank','toolbar=no,location=no,status=no,menubar=no,scrollbars=auto,directories=no,width=650,height=660')">
						<%=vo.getP_email() %></a>
			</div>
			<div class="title">
				 <h1><%=vo.getP_classname()%></h1>
			</div>
			<div class="title2">
			<ul>
			<li><img src="/TeamProject/Images/Icon/location.png"><br>
			<%switch(cp){
				case 101:%>
				강남<%;
				break;
				case 102:%>
				신촌홍대<%;
				break;
				case 103:%>
				건대<%;
				break;
				
				case 201:%>
				수원<%;
				break;
				case 202:%>
				분당<%;
				break;
				case 203:%>
				죽전<%;
				break;
				
				case 301:%>
				부산서면<%;
				break;
				case 302:%>
				부산해운대<%;
				break;
				case 303:%>
				부산사상<%;
				break;
		
				}%>
				</li>
				
				
				<li><img src="/TeamProject/Images/Icon/time.png"><br>
				<%=vo.getP_time() %>시간/회
				</li>
				<li><img src="/TeamProject/Images/Icon/people.png"><br>
				<%if(vo.getP_count_min()==0){%>
				1:1강습<%}else{%>
					<%=vo.getP_count_min() %>~<%=vo.getP_count_max() %>명
					<%} %>
				</li>
				<li><img src="/TeamProject/Images/Icon/don.png"><br>
				<%=vo.getP_cost() %>원/시간
				</li><br>
				<%--수업가능시간 --%>
		
			<li>수업시간:
			<%if(t == null){ %>
			<h1>시간 미등록 튜터</h1>
			<%}else{ %>
			<%if(t.getCt_mon()==null){%>
			<%}else{%>
			월:
			<%=t.getCt_mon()%>
			<%}%>

			<%if(t.getCt_tue()==null){%>
			<%}else{%>
			화:
			<%=t.getCt_tue()%>
			<%}%>

			<%if(t.getCt_wed()==null){%>
			<%}else{%>
			수:
			<%=t.getCt_wed()%>
			<%}%>

			<%if(t.getCt_thu()==null){%>
			<%}else{%>
			목:
			<%=t.getCt_thu()%>
			<%}%>

			<%if(t.getCt_fri()==null){%>
			<%}else{%>
			금:
			<%=t.getCt_fri() %>
			<%}%>

			<%if(t.getCt_sta()==null){%>
			<%}else{%>
			토:
			<%=t.getCt_sta()%>
			<%}%>

			<%if(t.getCt_sun()==null){%>
			<%}else{%>
			일:
			<%=t.getCt_sun() %>
			<% %>

			<%if(t.getCt_day()==null){%>
			<%}else{%>
			데이수업<%=t.getCt_day()%>
			<%}%>
			<%}%>
			<%}%>
			</li>
			</ul>	 
			</div>
			
				
			<div class ="s">
				<h4>강사소개</h4>
				<%=vo.getP_self()%>
			</div>
			<div class="empty"></div>	
			
			
			<div class ="s">
				<h4>튜터정보</h4>
				<%=vo.getP_class1() %>
			</div>
			<div class ="s">
				<h4>수업소개</h4>
				<%=vo.getP_class2() %>
			</div>
		
			<div class ="s">
				<h4>수업대상</h4>
				<%=vo.getP_class3() %>
			</div>
			<div class ="s">	
				<h4>커리큘럼</h4>
				<%=vo.getP_class4() %>
			</div>
			<%if(vo.getP_memo()==null){
			}else{%>
			<div class ="s">	
				<h4>메모</h4>
				<%=vo.getP_memo() %>
			</div>
			<%}%>

		</div>
			테스트라인
		<br>
		<% if(bb==null){%>
		<h1>사진 미등록 튜터</h1>
		<%}else{ %>

		<%if(count == 0){%>
		test
		<%}else{%>
		
			
		<% for(int i = 0 ; i < classimgList.size(); i++){
			classimgVO g = (classimgVO)classimgList.get(i);%>
				<img src="/TeamProject/Images/Classimg/<%=g.getCi_name()%>" style="width:100%">
				<%}%>
			<%}%>
		<%}%>

		<br>

<%--신청하기 if문 --%>
<%
if(id!=null){
	if(ee!=null){
		if(vd!=null){
			if(vc!=null){%>
		내가 등록한글 <a href="/TeamProject/Home/main.jsp"> 처음으로</a>
		<%}else{
					if(b!=null){
						if(c!=null){%>
		튜터o 구매한 강의 <a href="/TeamProject/Home/main.jsp"> 처음으로</a>
		<%}else{%>
		 튜터 o구매이력 o 신청하기
		 <button class="btn btn-secondary" onclick="location.href='/TeamProject/Talent/check.jsp?p_num=<%=vo.getP_num() %>'">강의신청</button>
		<%}
			
							}else{%>
		 튜터o구매이력 x 신청하기
		 <button class="btn btn-secondary" onclick="location.href='/TeamProject/Talent/check.jsp?p_num=<%=vo.getP_num() %>'">강의신청</button>
		<%}
					
				}
			
		}else{
				if(b!=null){
					if(c!=null){%>
		<!--  튜터 o 판매x 구매한 강의--> <a href="/TeamProject/Home/main.jsp"> 처음으로</a>
		<%}else{%>
		 <!-- 튜터 o판매x 구매이력 o 신청하기 -->
		 <button class="btn btn-secondary" onclick="location.href='/TeamProject/Talent/check.jsp?p_num=<%=vo.getP_num() %>'">강의신청</button>
		<%}
			
					}else{%>
		<!--  튜터o판매x 구매이력 x 신청하기--> 
		<button class="btn btn-secondary" onclick="location.href='/TeamProject/Talent/check.jsp?p_num=<%=vo.getP_num() %>'">강의신청</button>
		<%}
			
				}
				
		}else{
				if(b!=null){
					if(c!=null){%>
		<!--튜터x 구매한 강의--><a href="/TeamProject/Home/main.jsp"> 처음으로</a>
		<%}else{%>
		<!-- 튜터x구매이력o 신청하기-->
		 <button class="btn btn-secondary" onclick="location.href='/TeamProject/Talent/check.jsp?p_num=<%=vo.getP_num() %>'">강의신청</button>
		<%}
			
				}else{%>
				<button class="btn btn-secondary" onclick="location.href='/TeamProject/Talent/check.jsp?p_num=<%=vo.getP_num() %>'">강의신청</button>
		<!--튜터x구매이력 x--> 첫구매!
		<%}	
			
			}
	}else{%>
		
		<button type="button" class="btn btn-secondary" 
		onClick="location.href='/TeamProject/Talent/check.jsp?p_num=<%=vo.getP_num() %>'">강의신청</button>
	<br />
		<%}


%>


		<br> <br>
	

<jsp:include page="/Home/footer.jsp" />	
</body>
</html>