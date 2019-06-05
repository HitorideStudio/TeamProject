<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<title>실시간 문의 - 쉘위</title>
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
</head>
<body>
	<div class="content">
		 <div class="top" >
			<img src="../images/logo.png" width="100px" >
			<span>실시간으로 간편하게 문의하세요!</span>
			<span onclick="javascript:window.close();">×</span>
		</div>
		<div class="row" >
			<div class="rowele1 btntxt"><a class="btntxt" href="Qnatutee.jsp">수강생</a></div>
			<div class="rowele2 btntxt"><a class="btntxt" href="Qnatutor.jsp">튜터</a></div>
		</div>
		<div class="bottom">
			<%--수강생, 문의가 있으면 리스트로 보여준다. --%>
			<p>문의가 없습니다.</p>
		</div>
	</div>
</body>
</html>