<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CrueltyFree</title>

<style>
    *{margin: 0; padding: 0;}
    a{text-decoration: none;}
    input[type="button"], input[type="submit"], input[type="checkbox"], select{cursor: pointer;}
    header{
		top: 0px;
		width: 100%;
		height: 165px;
		background-color: white;
	}		
	footer{
		bottom: 0px;
		width: 100%;
		height: 250px;
		line-height: 20px;
		background-color: #eef3f5;	
	}
    body{
         width: 1020px; height: auto; margin: 0 auto;
         background-color: white;
    }	
	#ad {
		margin-bottom: 50px;
	}
	
	#s_ad1 {
		margin-left: 0;
		margin-right: 13.5px;
		display: inline-block;
	}
	
	#s_ad2 {
		display: inline-block;
	}
	
	.s_ad {
		margin-bottom: 100px;
	}
	
	#content {
		text-align: center;
	}
	
	.cat_name a {
		font-size: 30px;
		font-weight: bold;
		color: #000000;
		text-decoration-line: none;
	}
	
	.pro_list {
		width: 1020px;
		margin-top: 50px;
		margin-bottom: 100px;
	}
	
	.pro_list_line {
		width: 1020px;
		text-align: center;
		padding: 0;
	}
	
	.pro_first {
		width: 330px;
		margin-right: 7px;
		display: inline-block;
	}
	.pro_second {
		width: 330px;
		margin-right: 7px;
		display: inline-block;
	}
	.pro_third {
		width: 330px;
		display: inline-block;
	}
	
	.pro_info {
		text-align: center;
		display: inline-block;
	}
	
	.pro_img {
		width: 330px;
	}
	
	.pro_name {
		margin: 20px 15px 20px 15px;
		width: 300px;
		height: 100px;
	}
	
	.pro_name a {
		text-decoration-line: none;
	}
	
	.pro_price {
		color: #7d99a4;
		font-size: 23px;
		font-weight: bold;
	}
	
	.goods_nickname {
		font-size: 13px;
		color: #4a4a4a;
		font-weight: bold;
		text-decoration-line: none;
	}
	
	.goods_name {
		font-size: 17px;
		color: #000000;
		font-weight: bold;
		text-decoration-line: none;
	}
	
</style>

</head>
<body>

<header>
	<jsp:include page="../main/header.jsp" /><br><br>
</header>

<nav id="ad">
	<a href="#">
		<img src="${pageContext.request.contextPath}/resources/img/home_ad1.png" class="home_ad1" style="width: 1020px;" />
	</a>
</nav>

<section id="content">
	<article id="s_ad1" class="s_ad">
		<a href="#">
			<img src="${pageContext.request.contextPath}/resources/img/home_s_ad1.png" style="width: 500px;" />
		</a>
	</article>
	<article id="s_ad2" class="s_ad">
		<a href="#">
			<img src="${pageContext.request.contextPath}/resources/img/home_s_ad2.png" style="width: 500px;" />
		</a>
	</article>
		
	<article id="home_best">
		<div class="cat_name">
			<a href="#">베스트</a>
		</div>
		<div class="pro_list">
			<ul class="pro_list_line">
				<li class="pro_first">
					<div class="pro_info">
						<a href="#">
							<img src="${pageContext.request.contextPath}/resources/img/proImg_1.png" class="pro_img">
						</a>
						<div class="pro_name">
							<a href="#">
								<span class="goods_nickname">아로마티카</span>
								<p class="goods_name">아로마티카 로즈마리 헤어 씨크닝 컨디셔너 400ml</p>
							</a>
						</div>
						<span class="pro_price">15,400원</span>
					</div>
				</li>
				<li class="pro_second">
					<div class="pro_info">
						<a href="#">
							<img src="${pageContext.request.contextPath}/resources/img/proImg_2.png" class="pro_img">
						</a>
						<div class="pro_name">
							<a href="#">
								<span class="goods_nickname">아떼</span>
								<p class="goods_name">아떼 바이탈 씨 좀 토닝 캡슐 토너 130ml</p>
							</a>
						</div>
						<span class="pro_price">18,000원</span>
					</div>
				</li>
				<li class="pro_third">
					<div class="pro_info">
						<a href="#">
							<img src="${pageContext.request.contextPath}/resources/img/proImg_3.png" class="pro_img">
						</a>
						<div class="pro_name">
							<a href="#">
								<span class="goods_nickname">톤28</span>
								<p class="goods_name">일하는 손 바를거리(워터블랑향)</p>
							</a>
						</div>
						<span class="pro_price">15,600원</span>
					</div>
				</li>
			</ul>
		</div>
		
		<div class="pro_list">
			<ul class="pro_list_line">
				<li class="pro_first">
					<div class="pro_info">
						<a href="#">
							<img src="${pageContext.request.contextPath}/resources/img/proImg_4.png" class="pro_img">
						</a>
						<div class="pro_name">
							<a href="#">
								<span class="goods_nickname">이즈앤트리</span>
								<p class="goods_name">참마 비건 밀크 클렌저 220ml</p>
							</a>
						</div>
						<span class="pro_price">20,000원</span>
					</div>
				</li>
				<li class="pro_second">
					<div class="pro_info">
						<a href="#">
							<img src="${pageContext.request.contextPath}/resources/img/proImg_5.png" class="pro_img">
						</a>
						<div class="pro_name">
							<a href="#">
								<span class="goods_nickname">보나쥬르</span>
								<p class="goods_name">그린티 워터 토너 205ml</p>
							</a>
						</div>
						<span class="pro_price">16,000원</span>
					</div>
				</li>
				<li class="pro_third">
					<div class="pro_info">
						<a href="#">
							<img src="${pageContext.request.contextPath}/resources/img/proImg_6.png" class="pro_img">
						</a>
						<div class="pro_name">
							<a href="#">
								<span class="goods_nickname">빌리프</span>
								<p class="goods_name">빌리프 프러블럼 솔루션 비건 토너 패드 150ml / 70매</p>
							</a>
						</div>
						<span class="pro_price">30,600원</span>
					</div>
				</li>
			</ul>
		</div>
		
		<div class="pro_list">
			<ul class="pro_list_line">
				<li class="pro_first">
					<div class="pro_info">
						<a href="#">
							<img src="${pageContext.request.contextPath}/resources/img/proImg_7.png" class="pro_img">
						</a>
						<div class="pro_name">
							<a href="#">
								<span class="goods_nickname">에센허브</span>
								<p class="goods_name">에센허브 티트리 수딩 인 카밍 크림 80ml</p>
							</a>
						</div>
						<span class="pro_price">23,800원</span>
					</div>
				</li>
				<li class="pro_second">
					<div class="pro_info">
						<a href="#">
							<img src="${pageContext.request.contextPath}/resources/img/proImg_8.png" class="pro_img">
						</a>
						<div class="pro_name">
							<a href="#">
								<span class="goods_nickname">아떼</span>
								<p class="goods_name">[잡티완화세트] 비건 초록 비타민 세럼 + 크림</p>
							</a>
						</div>
						<span class="pro_price">45,700원</span>
					</div>
				</li>
				<li class="pro_third">
					<div class="pro_info">
						<a href="#">
							<img src="${pageContext.request.contextPath}/resources/img/proImg_9.png" class="pro_img">
						</a>
						<div class="pro_name">
							<a href="#">
								<span class="goods_nickname">머지</span>
								<p class="goods_name">머지 글로시 멜팅 틴티드 컬러 립밤 4g</p>
							</a>
						</div>
						<span class="pro_price">7,900원</span>
					</div>
				</li>
			</ul>
		</div>
	</article>
	
	
</section>
	<a href="${pageContext.request.contextPath}/main/home.do">홈(로고)</a><br>
	<a href="${pageContext.request.contextPath}/product/product_view.do?prdNum=1">상품상세보기1</a><br>
	<a href="${pageContext.request.contextPath}/product/product_view.do?prdNum=2">상품상세보기2</a><br>
	<a href="${pageContext.request.contextPath}/product/product_view.do?prdNum=3">상품상세보기3</a><br>
	<a href="${pageContext.request.contextPath}/product/product_view.do?prdNum=4">상품상세보기4</a><br>
	<a href="${pageContext.request.contextPath}/purchase/basket.do">장바구니</a><br>
	<a href="${pageContext.request.contextPath}/purchase/order.do">주문/결제</a><br>
	<a href="${pageContext.request.contextPath}/purchase/order_complete.do">주문완료</a><br>
	<a href="${pageContext.request.contextPath}/manager/manager_1main.do">관리자메인</a><br>
	
<footer>
	<jsp:include page="../main/footer.jsp" />
</footer>

</body>
</html>