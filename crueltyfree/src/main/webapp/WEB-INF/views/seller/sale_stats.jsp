<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>매출통계 | CrueltyFree</title>
<style>
	* {margin:0; padding:0;}
	a{text-decoration: none;} 
input[type="button"], input[type="submit"], input[type="checkbox"], select, label, button{cursor: pointer;}
	
	body{
		width:1020px;
		margin:0 auto;
	}
	
	header {
		top: 0px;
		width: 100%;
		height: 165px;
		background-color: white;
	}
	
	footer {
		bottom: 0px;
		width: 100%;
		height: 250px;
		line-height: 20px;
		background-color: #eef3f5;	
	}
	
	a {
  		text-decoration-line: none;
  		color:black;
  	}
	
	#full {
		width: 1000px;
		height: 500px;
        margin: 0 auto;
        font: bold 25px Arial, Sans-serif;
      	margin-top:10px;
	}
	
	#title {
		width:230px;
		height:120px;
		text-align:center;
		margin-top:50px;

	}
	
	#tap {
		width: 230px;
		height: 160px;
		float: left;
		margin-left: 20px;
	}
	
	.list {
  		list-style-type: none;
  		width: 230px;
  		height: auto;
  		overflow: auto;
	}
	
	.list >li {
		height: 40px;
	}
	
	.list a {
	  	text-decoration: none;
  		padding: 10px;
  		display: block;
  		color: #000;
  		font-size: 14px;
  		background-color: #eef3f5;
  		width: 170px;
	}
	
	.pro_register {
		width: 190px;
		height: 40px;
		font-size: 15px;
		font-weight: bold;
		letter-spacing: -1px;
		text-align: center;
		background-color: #ffffff;
		color: #7d99a4;
		border: 2px solid #7d99a4;
		border-radius: 30px;
		display: inline-block;
		margin-top: 20px;
	}
	
	#content {
		width:700px;
		float:left;
		margin-left:10px;
	}
	
	.set_period {
		width: 700px;
	}
	
	.set_period a {
		font-size: 15px;
	}
	
	.sub_period {
		width: 50px;
		height: 23px;
		border: none;
		background-color: #7d99a4;
		color: #ffffff;
	}
	
	.sub_title {
		width: 700px;
		height: 50px;
		border-bottom: 1px solid #a4a4a4;
	}
</style>
</head>
<body>
<header>
	<jsp:include page="../main/header.jsp" />
</header>
<section id="full">
	<div id="title">
		<img src="../resources/img/seller.png" style="width: 50px; height: 50px;">
		<h3>판매자 페이지</h3>	
	</div>
	<div id="tap">
		<ul class="list">
			<li><a href="#" style="background-color: #7d99a4; color:#ffffff; font-weight: bold;">매출통계</a></li>
			<li><a href="#">구매 내역</a></li>
			<li><a href="#">문의 확인</a></li>
			<li><a href="#">등록 상품 확인</a></li>
		</ul>
		<a href="#"><button class="pro_register">상품 등록하기</button></a>
	</div>
	<div id="content">
		<article class="sub_title">
			<h5>매출 통계</h5>
		</article>
		<article class="set_period">
			<div style="display: inline-block;">
				<a>기간 설정</a>
			</div>
			<input type="date" class="start_period" style="display: inline-block; margin-left: 50px;">
			<input type="date" class="end_period" style="display: inline-block;">
      		<input type="submit" class="sub_period"value="설정">
		</article>
		<article class="chart_1">
		
		</article>
		<article class="chart_2">
		
		</article>
		<article class="chart_3">
		
		</article>
	</div>
</section>
</body>

<footer>
	<jsp:include page="../main/footer.jsp" />
</footer>

</body>
</html>