<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import = "hmjm.bean.dao.reviewDAO" %>
<%@ page import = "hmjm.bean.vo.reviewVO" %>
<%@ page import = "java.util.List" %>
<%--index.jsp 메인 페이지 --%>

<!DOCTYPE html>
<html lang="en">
<head>
<title>회원정보 수정</title>

<link rel="icon" href="images/favicon.ico" type="image/x-icon">
<link rel="shortcut icon" href="images/favicon.ico" type="image/x-icon" />

<link rel="stylesheet" href="css/bootstrap.css" type="text/css" media="screen">
<link rel="stylesheet" href="css/bootstrap-responsive.css" type="text/css" media="screen">    
<link rel="stylesheet" href="css/camera.css" type="text/css" media="screen">
<link rel="stylesheet" href="css/style.css" type="text/css" media="screen">

<script type="text/javascript" src="js/jquery.js"></script>  
<script type="text/javascript" src="js/jquery.easing.1.3.js"></script>
<script type="text/javascript" src="js/superfish.js"></script>

<script type="text/javascript" src="js/jquery.ui.totop.js"></script>

<script type="text/javascript" src="js/camera.js"></script>
<script type="text/javascript" src="js/jquery.mobile.customized.min.js"></script>

<script type="text/javascript" src="js/jquery.caroufredsel.js"></script>
<script type="text/javascript" src="js/jquery.touchSwipe.min.js"></script>

<script type="text/javascript" src="js/script.js"></script>
<script>
	$(document).ready(function() {
		//
		$('#camera_wrap').camera({
		//thumbnails: true
		//alignment			: 'centerRight', 
		autoAdvance			: true,		
		mobileAutoAdvance	: true,
		//fx					: 'simpleFade',
		height: '48%',
		hover: false,
		loader: 'none',
		navigation: false,
		navigationHover: false,
		mobileNavHover: false,
		playPause: false,
		pauseOnClick: false,
		pagination			: true,
		time: 7000,
		transPeriod: 1000,
		minHeight: '300px'
		});

		//	carouFredSel
		$('#slider3 .carousel.main ul').carouFredSel({
		auto: {
			timeoutDuration: 8000					
		},
		responsive: true,
		prev: '.prev3',
		next: '.next3',
		width: '100%',
		scroll: {
			items: 1,
			duration: 1000,
			easing: "easeOutExpo"
		},			
		items: {
        	width: '330',
			height: 'variable',	//	optionally resize item-height			  
			visible: {
				min: 1,
				max: 4
			}
		},
		mousewheel: false,
		swipe: {
			onMouse: true,
			onTouch: true
			}
		}); 

	


		$(window).bind("resize",updateSizes_vat).bind("load",updateSizes_vat);
			function updateSizes_vat(){		
		$('#slider3 .carousel.main ul').trigger("updateSizes");		
		}
		updateSizes_vat();
	}); //
	
	$(window).load(function() {   	}); 
</script>
<style>
	#inline.div{
		display:inline;
		}
</style>		
<%--[if lt IE 8]>
		<div style='text-align:center'><a href="http://www.microsoft.com/windows/internet-explorer/default.aspx?ocid=ie6_countdown_bannercode"><img src="http://www.theie6countdown.com/images/upgrade.jpg"border="0"alt=""/></a></div>  
	<![endif]--%>    

<%--[if lt IE 9]>
  <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>      
  <link rel="stylesheet" href="css/ie.css" type="text/css" media="screen">
<![endif]--%>


</head>

<body class="front">
<div id="main">
	<jsp:include page="/Home/header.jsp"/>
<%--상단 카테고리 bar --%>
</div>
<div class="banners">
	<div class="banners">
		<div class="banners">
	
			<jsp:include page="modifyForm.jsp"/>
	
		</div>
	</div>
</div>



<%-- HOW IT WORKS: 우선 필요한 목록 이 아니라서 주석처리 --%>
<%--
<div id="content">
<div class="container">
<div class="row">
<div class="span9">
	
<h2><span>How it works</span></h2>

<div class="row">
<div class="span3">

<div class="work1 clearfix">
	<div class="txt1">a</div>
	<div class="txt2">Lorem ipsum<br>dolor sit</div>
</div>	

<p>
	Nulla ultricies enim aliquet augue eleifend iaculis. Nam sollicitudin ligula ac nisi iaculis eu scelerisque risus ultricies. Nullam eu elit risus, vel interdum urna. Aenean leo nulla, aliquet vitae ultricies sit amet, porttitor id sapien. In hac habitasse platea dictumst. Donec pharetra gravida augue at hendrerit. Cras ut...
</p>

<a href="#" class="button1">Read more</a>



</div>
<div class="span3">

<div class="work1 clearfix">
	<div class="txt1">b</div>
	<div class="txt2">Vestibulum ante<br>ipsum primis</div>
</div>	

<p>
	Nulla ultricies enim aliquet augue eleifend iaculis. Nam sollicitudin ligula ac nisi iaculis eu scelerisque risus ultricies. Nullam eu elit risus, vel interdum urna. Aenean leo nulla, aliquet vitae ultricies sit amet, porttitor id sapien. In hac habitasse platea dictumst. Donec pharetra gravida augue at hendrerit. Cras ut...
</p>

<a href="#" class="button1">Read more</a>



</div>
<div class="span3">

<div class="work1 clearfix">
	<div class="txt1">c</div>
	<div class="txt2">Cras dictum<br>odio</div>
</div>	

<p>
	Nulla ultricies enim aliquet augue eleifend iaculis. Nam sollicitudin ligula ac nisi iaculis eu scelerisque risus ultricies. Nullam eu elit risus, vel interdum urna. Aenean leo nulla, aliquet vitae ultricies sit amet, porttitor id sapien. In hac habitasse platea dictumst. Donec pharetra gravida augue at hendrerit. Cras ut...
</p>

<a href="#" class="button1">Read more</a>



</div>	
</div>

</div>
<div class="span3">
	
<h2><span>Our Professional Management</span></h2>

<ul class="ul1">
	<li><a href="#">Adipisicing</a></li>
	<li><a href="#">Dolore magna aliqua</a></li>
	<li><a href="#">Eiusmod tempor</a></li>
	<li><a href="#">Elit sed do</a></li>
	<li><a href="#">Incididunt ut labore et</a></li>
	<li><a href="#">Lorem ipsum dolor</a></li>
	<li><a href="#">Sit amet conse ctetur</a></li>
	<li><a href="#">Ut enim ad minim</a></li>
</ul>

</div>	
</div>	
</div>	
</div>
 --%>
 
<%--footer.jsp로 적용해야하는 부분 START : 현재, footer적용시, imageslide,가 작동x, 그래서 적용안함 --%>  
<div class="bot1_wrapper">
<div class="container">
<div class="bot1 clearfix">
<div class="row">
<div class="span3">

<div class="bot1_title">Copyright</div>	
	
<div class="logo2_wrapper"><a href="index.jsp" class="logo2"><img src="images/logo2.png" alt=""></a></div>

	<footer><div class="copyright">Copyright © 2017 <br>All rights reserved. Created by <a href="https://gridgum.com">Gridgum</a></div></footer>

</div>	
<div class="span5">

<div class="bot1_title">Useful information</div>

<p>
	<b>
	</b>
</p>

<p>
	Nam sollicitudin ligula ac nisi iaculis eu scelerisque risus ultricies. Nullam eu elit risus, vel interdum urna. Aenean leo nulla, aliquet vitae ultricies sit amet, porttitor id sapien. In hac habitasse platea dictumst. Donec pharetra gravida augue at hendrerit. Cras ut...
</p>

</div>
<div class="span3 offset1">

<div class="bot1_title">Follow Us</div>
	
<div class="social_wrapper">
	<ul class="social clearfix">    
    <li><a href="#"><img src="images/social_ic1.png"></a></li>
    <li><a href="#"><img src="images/social_ic2.png"></a></li>
    <li><a href="#"><img src="images/social_ic3.png"></a></li>
    <li><a href="#"><img src="images/social_ic4.png"></a></li>
    <li><a href="#"><img src="images/social_ic5.png"></a></li>
    <li><a href="#"><img src="images/social_ic6.png"></a></li>
	</ul>
</div>

</div>
</div>	
</div>	
</div>	
</div>
<%--footer.jsp로 적용해야하는 부분 END --%> 
	<jsp:include page="/Home/footer.jsp"/>
</div>	
</div>
<script type="text/javascript" src="js/bootstrap.js"></script>
</body>
</html>