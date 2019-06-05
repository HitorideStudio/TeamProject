<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>FOOTER</title>
<style>

#footer{
	width:1200px;
	height:383px;
	margin: 0 auto;
}
.footer_cont {
	width:1050px;
	height:380px;
	margin: 0px 230px;
	padding: 35px 0px 70px;
	font-family: Arial, Helvetica, sans-serif;
}

/*ul요소 포함 박스*/
.info_box {
	display: table-row;	/*tr같이 나열*/
	width: 663px;
	height: 138px;
	
}

/*info_box 내의 정보 블럭*/
.info_cell {
	display: table-cell;/*상하가 아닌 좌우 나열을 위함*/
    float:left;
    margin-right:50px;
}
.info_cell_kko {
	display: table-cell;/*상하가 아닌 좌우 나열을 위함*/
    float:right;
}
.footer_mid {
	width:1050px;
    padding: 79px 0px 0px;
	height:79px;  	
}

.footer_bot {
	display: table-row;	/*tr같이 나열*/
	width:1050px;
	height:60;
	padding: 79px 0px 0px;
	font-family: Arial, Helvetica, sans-serif;
  	
}
.bot_info {
	display: table-cell;/*상하가 아닌 좌우 나열을 위함*/
	width: 650px;
	height: 60px;
   
}

.bot_logo {
	display: table-cell;/*상하가 아닌 좌우 나열을 위함*/
	width: 330px;
	height: 38px;
	margin:20px;
   
}
.bot_logo a{
	margin:10px;
}

/*개별 요소 태그 속성*/
b {
	text-transform: uppercase;
}


ul {
	list-style-type: none;
	padding-left: 0;
}

li {
	color: gray;
	margin: 5px;
}
li a {
	color: gray;
	font-size: 15px;
	text-decoration: none;
}
p{
	font-size:13px;
}
span{
	color:white;
}


</style>
</head>
<body id="footer">
	<div class="footer_cont">
		<div class="info_box">
			<div class="info_cell">
				<b>company</b>
				<ul><li><a href="#">서비스 소개</a></li>
					<li><a href="#">튜터 컨텐츠</a></li>
					<li><a href="#">블로그</a></li>
					<li><a href="#">언론보도</a></li></ul>
			</div>

			<div class="info_cell">
				<b>policies</b>
				<ul><li><a href="#">이용약관</a></li>
					<li><a href="#">개인정보취금방침</a></li>	</ul>
			</div>

			<div class="info_cell">
				<b>support</b>
				<ul><li><a href="#">FAQ</a></li>
					<li><a href="#">쉘위 센터</a></li></ul>
			</div>

			<div class="info_cell">
				<b>기업교육</b>
				<ul><li><a href="#">shallwe Biz</a></li></ul>
			</div>
            
            <div class="info_cell_kko" style="float:right;">
				<b>shallweing center</b>
				<ul><li><img src="/hmjm/Images/Icon/kakao.jpg" width="18px"/>&nbsp;&nbsp;KAKAO 플러스친구 / @쉘위센터</li>
					<li>운영시간 / 평일 10:00 ~ 18:00</li>
					<li><span>ㅁㅁㅁㅁ</span>/점심 13:00 ~ 14:00</li></ul>
			</div>
            
		</div>
        
        <div class="footer_mid"></div>
		

		<div class="footer_bot">
			<div class="bot_info">
				<p>상호 : (주)쉘위 | 주소 : 서울특별시 관악구 남부순환로 1820 에그옐로우빌딩 14층 | 사업자등록번호 : 000-00-00000 | 대표자명 : 김성민</p>
				<p>Copyright ⓒ2019 taling inc, ltd. All rights reserved</p>
			</div>
			
			<div class="bot_logo">
                <a href="https://www.facebook.com/taling.me" target="_blank"><img src="/hmjm/Images/Icon/facebook.png" width="29px"/></a>
                <a href="https://www.instagram.com/" target="_blank"><img src="/hmjm/Images/Icon/instagram.png" width="29px"/></a>
                <a href="https://www.youtube.com/channel/UCuFmmpVLaNNFoy-cHqELl_A" target="_blank"><img src="/hmjm/Images/Icon/youtube.png" width="29px"/></a>
                <a href="https://post.naver.com/taling_me" target="_blank"><img src="/hmjm/Images/Icon/naver.png" width="29px"/></a>
			</div>

		</div>
        
	</div>
</body>
</html>