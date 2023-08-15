<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CrueltyFree</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
$(function(){
// 비회원 식별값을 가져오는 함수
function getGuestId() {
	let guestId = getCookie("guestId");
	if (!guestId) {
		// 쿠키에 비회원 식별값이 없으면 새로 생성하여 쿠키에 저장
		guestId = generateGuestId(10);
		document.cookie = "guestId=" + guestId + "; max-age=" + (60 * 60 * 24 * 7) + "; path=/";
	}
	return guestId;
}

// 쿠키 값을 가져오는 함수
function getCookie(name) {
	const value = "; " + document.cookie;
	const parts = value.split("; " + name + "=");
	if (parts.length === 2) return parts.pop().split(";").shift();
}

// 비회원 식별값 생성 함수 (랜덤 문자열 생성)
function generateGuestId(length) {
	const characters = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
	let result = '';
	for (let i = 0; i < length; i++) {
		result += characters.charAt(Math.floor(Math.random() * characters.length));
	}
	return result;
}	

const guestId = getGuestId();
});
</script>
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
	.clear{
		clear:both;
	}
</style>


</head>
<script>
function HeaderBest(sort_salecount) {    
    var insertsort_salecount ="";
    const paramsort_salecount = getParameterValue("sort_salecount");
    if(sort_salecount === ""){
        if(paramsort_salecount === null){
        insertsort_salecount = '';}
        else{
        insertsort_salecount = paramsort_salecount;}
    }else{
        insertsort_salecount = sort_salecount;
       
    }

    // 새 URL 구성    
    var newURL = "${pageContext.request.contextPath}/product/product_list_enter_category.do" +  
    "?sort_salecount=" + insertsort_salecount
    ;
    // URL로 이동
    window.location.href = newURL;    
}
</script>
<body>

<header>
	<jsp:include page="../main/header.jsp" /><br><br>
</header>
<div class="clear"></div>
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
			<a href="#" onclick="HeaderBest('1')">베스트</a>
		</div>
		<div class="pro_list">
			<ul class="pro_list_line">
				<li class="pro_first">
					<div class="pro_info">
						<a href="${pageContext.request.contextPath}/product/product_view.do?prdNum=${productList[0].product_idx}">
							<img src="${pageContext.request.contextPath}/resources/uploads/${fileList[0].saveFile}" class="pro_img">
						</a>
						<div class="pro_name">
							<a href="${pageContext.request.contextPath}/product/product_view.do?prdNum=${productList[0].product_idx}">
								<span class="goods_nickname">${productList[0].member_nickname}아로마티카</span>
								<p class="goods_name">${productList[0].product_name}아로마티카 로즈마리 헤어 씨크닝 컨디셔너 400ml</p>
							</a>
						</div>
						<span class="pro_price">${productList[0].product_price}15,400원</span>
					</div>
				</li>
				<li class="pro_second">
					<div class="pro_info">
						<a href="${pageContext.request.contextPath}/product/product_view.do?prdNum=${productList[1].product_idx}">
							<img src="${pageContext.request.contextPath}/resources/uploads/${fileList[1].saveFile}" class="pro_img">
						</a>
						<div class="pro_name">
							<a href="${pageContext.request.contextPath}/product/product_view.do?prdNum=${productList[1].product_idx}">
								<span class="goods_nickname">${productList[1].member_nickname}아떼</span>
								<p class="goods_name">${productList[1].product_name}아떼 바이탈 씨 좀 토닝 캡슐 토너 130ml</p>
							</a>
						</div>
						<span class="pro_price">${productList[1].product_price}18,000원</span>
					</div>
				</li>
				<li class="pro_third">
					<div class="pro_info">
						<a href="${pageContext.request.contextPath}/product/product_view.do?prdNum=${productList[2].product_idx}">
							<img src="${pageContext.request.contextPath}/resources/uploads/${fileList[2].saveFile}" class="pro_img">
						</a>
						<div class="pro_name">
							<a href="${pageContext.request.contextPath}/product/product_view.do?prdNum=${productList[2].product_idx}">
								<span class="goods_nickname">${productList[2].member_nickname}톤28</span>
								<p class="goods_name">${productList[2].product_name}일하는 손 바를거리(워터블랑향)</p>
							</a>
						</div>
						<span class="pro_price">${productList[2].product_price}15,600원</span>
					</div>
				</li>
			</ul>
		</div>
		
		<div class="pro_list">
			<ul class="pro_list_line">
				<li class="pro_first">
					<div class="pro_info">
						<a href="${pageContext.request.contextPath}/product/product_view.do?prdNum=${productList[3].product_idx}">
							<img src="${pageContext.request.contextPath}/resources/iuploads/${fileList[3].saveFile}" class="pro_img">
						</a>
						<div class="pro_name">
							<a href="${pageContext.request.contextPath}/product/product_view.do?prdNum=${productList[3].product_idx}">
								<span class="goods_nickname">${productList[3].member_nickname}이즈앤트리</span>
								<p class="goods_name">${productList[3].product_name}참마 비건 밀크 클렌저 220ml</p>
							</a>
						</div>
						<span class="pro_price">${productList[3].product_price}20,000원</span>
					</div>
				</li>
				<li class="pro_second">
					<div class="pro_info">
						<a href="${pageContext.request.contextPath}/product/product_view.do?prdNum=${productList[4].product_idx}">
							<img src="${pageContext.request.contextPath}/resources/uploads/${fileList[4].saveFile}" class="pro_img">
						</a>
						<div class="pro_name">
							<a href="${pageContext.request.contextPath}/product/product_view.do?prdNum=${productList[4].product_idx}">
								<span class="goods_nickname">${productList[4].member_nickname}보나쥬르</span>
								<p class="goods_name">${productList[4].product_name}그린티 워터 토너 205ml</p>
							</a>
						</div>
						<span class="pro_price">${productList[4].product_price}16,000원</span>
					</div>
				</li>
				<li class="pro_third">
					<div class="pro_info">
						<a href="${pageContext.request.contextPath}/product/product_view.do?prdNum=${productList[5].product_idx}">
							<img src="${pageContext.request.contextPath}/resources/uploads/${fileList[5].saveFile}" class="pro_img">
						</a>
						<div class="pro_name">
							<a href="${pageContext.request.contextPath}/product/product_view.do?prdNum=${productList[5].product_idx}">
								<span class="goods_nickname">${productList[5].member_nickname}빌리프</span>
								<p class="goods_name">${productList[5].product_name}빌리프 프러블럼 솔루션 비건 토너 패드 150ml / 70매</p>
							</a>
						</div>
						<span class="pro_price">${productList[5].product_price}30,600원</span>
					</div>
				</li>
			</ul>
		</div>
		
		<div class="pro_list">
			<ul class="pro_list_line">
				<li class="pro_first">
					<div class="pro_info">
						<a href="${pageContext.request.contextPath}/product/product_view.do?prdNum=${productList[6].product_idx}">
							<img src="${pageContext.request.contextPath}/resources/uploads/${fileList[6].saveFile}" class="pro_img">
						</a>
						<div class="pro_name">
							<a href="${pageContext.request.contextPath}/product/product_view.do?prdNum=${productList[6].product_idx}">
								<span class="goods_nickname">${productList[6].member_nickname}에센허브</span>
								<p class="goods_name">${productList[6].product_name}에센허브 티트리 수딩 인 카밍 크림 80ml</p>
							</a>
						</div>
						<span class="pro_price">${productList[6].product_price}23,800원</span>
					</div>
				</li>
				<li class="pro_second">
					<div class="pro_info">
						<a href="${pageContext.request.contextPath}/product/product_view.do?prdNum=${productList[7].product_idx}">
							<img src="${pageContext.request.contextPath}/resources/uploads/${fileList[7].saveFile}" class="pro_img">
						</a>
						<div class="pro_name">
							<a href="${pageContext.request.contextPath}/product/product_view.do?prdNum=${productList[7].product_idx}">
								<span class="goods_nickname">${productList[7].member_nickname}아떼</span>
								<p class="goods_name">${productList[7].product_name}[잡티완화세트] 비건 초록 비타민 세럼 + 크림</p>
							</a>
						</div>
						<span class="pro_price">${productList[7].product_price}45,700원</span>
					</div>
				</li>
				<li class="pro_third">
					<div class="pro_info">
						<a href="${pageContext.request.contextPath}/product/product_view.do?prdNum=${productList[8].product_idx}">
							<img src="${pageContext.request.contextPath}/resources/uploads/${fileList[8].saveFile}" class="pro_img">
						</a>
						<div class="pro_name">
							<a href="${pageContext.request.contextPath}/product/product_view.do?prdNum=${productList[8].product_idx}">
								<span class="goods_nickname">${productList[8].member_nickname}머지</span>
								<p class="goods_name">${productList[8].product_name}머지 글로시 멜팅 틴티드 컬러 립밤 4g</p>
							</a>
						</div>
						<span class="pro_price">${productList[8].product_price}7,900원</span>
					</div>
				</li>
			</ul>
		</div>
	</article>
	
	
</section>
	<a href="${pageContext.request.contextPath}/main/home.do">홈(로고)</a><br>
	s<a href="${pageContext.request.contextPath}/product/product_view.do?prdNum=1">상품상세보기1</a><br>
	<a href="${pageContext.request.contextPath}/product/product_view.do?prdNum=2">상품상세보기2</a><br>
	<a href="${pageContext.request.contextPath}/product/product_view.do?prdNum=3">상품상세보기3</a><br>
	<a href="${pageContext.request.contextPath}/product/product_view.do?prdNum=4">상품상세보기4</a><br>
	<a href="${pageContext.request.contextPath}/product/product_view.do?prdNum=15">상품상세보기15</a><br>
	<a href="${pageContext.request.contextPath}/purchase/basket.do">장바구니</a><br>
	<a href="${pageContext.request.contextPath}/purchase/order.do">주문/결제</a><br>
	<a href="${pageContext.request.contextPath}/purchase/order_complete.do">주문완료</a><br>
	<a href="${pageContext.request.contextPath}/manager/manager_1main.do">관리자메인</a><br>
	<a href="${pageContext.request.contextPath}/seller/regi_pro.do">판매자 - 상품 등록</a><br>
	<a href="${pageContext.request.contextPath}/seller/check_pro.do">판매자 - 등록 상품 확인</a><br>
	<a href="${pageContext.request.contextPath}/mypage/mypage_main.do">마이페이지</a><br>
	<a href="${pageContext.request.contextPath}/product/product_list_enter_searchword.do">상품목록검색어진입</a><br>
	<a href="${pageContext.request.contextPath}/mypage/test.do">TEST</a><br>
	
	<form name="caq" action="${pageContext.request.contextPath}/mypage/mypage_deliverymain.do" method="get">
                        <input type="hidden" name="member_idx" value="1">
                    </form>
                    <a href="#" onclick="document.forms['caq'].submit();">
            배송지TEST</a>
	<br>
	<a href="${pageContext.request.contextPath}/purchase/refund.do">환불테스트</a><br>
	<a href="${pageContext.request.contextPath}/mypage/mypage_orderinq.do">주문배송조회</a><br>
	<a href="${pageContext.request.contextPath}/mypage/mypage_cancelinq.do">환불취소조회</a><br>
	<br>
	<a href="${pageContext.request.contextPath}/product/product_list_enter_category.do">상품목록카테고리진입</a><br>
<footer>
	<jsp:include page="../main/footer.jsp" />
</footer>

</body>
</html>