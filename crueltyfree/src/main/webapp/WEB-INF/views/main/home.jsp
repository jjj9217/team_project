<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List, java.util.HashMap, java.util.Map" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CrueltyFree</title>
<link rel="icon" href="${pageContext.request.contextPath}/resources/img/favicon1.png">
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


var slideIndex = 0;
var slides = $(".home_ad1");
var totalSlides = slides.length;
var intervalId;

$("#totalPages").text(totalSlides);

function showSlide(index) {
    slides.hide();
    slides.eq(index).show();
    $("#currentPage").text(index + 1);
}

function nextSlide() {
    slideIndex = (slideIndex + 1) % totalSlides;
    showSlide(slideIndex);
}

function prevSlide() {
    slideIndex = (slideIndex - 1 + totalSlides) % totalSlides;
    showSlide(slideIndex);
}

function togglePlayStop() {
    if (intervalId) {
        clearInterval(intervalId);
        intervalId = null;
        $("#playStopBtn").text("▶");
    } else {
        intervalId = setInterval(nextSlide, 4000); // 4초마다 이미지 전환
        $("#playStopBtn").text("∥");
    }
}

$("#prevBtn").click(function() {
    prevSlide();
});

$("#nextBtn").click(function() {
    nextSlide();
});

$("#playStopBtn").click(function() {
    togglePlayStop();
});

// 초기 슬라이드 표시
showSlide(slideIndex);
intervalId = setInterval(nextSlide, 4000); // 4초마다 이미지 전환

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
	
	.goodlist_thumb_background {
		width: 190px;
		height: 190px;
		text-align: center;
		margin-bottom: 10px;
	}
	
	.pro_img {
		width: 180px;
		height: 180px;
		margin-left: 75px;
	}
	
	.pro_name {
		margin: 20px 15px 20px 15px;
		width: 300px;
		height: 100px;
		display:-webkit-box; 
	    word-wrap: break-word; 
	    -webkit-line-clamp:2; 
	    -webkit-box-orient: vertical; 
	    overflow: hidden; 
	    text-overflow: ellipsis;
	    line-height: 50px;
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
	.soldOutNotice{color:rgb(216, 98, 98); font-size:18px;}
	#ad_btn_box{display: flex; height: 80px;}
	#ad_btn_box div{display: flex; align-items: center;}
	#btn_text{padding-left:40px; width:40px; justify-content: center; color: #a4a4a4; font-weight: bold;}
	#currentPage{color:#7d99a4;}
	#totalPages{color:#a4a4a4;}
	#prevBtn, #nextBtn, #playStopBtn{margin-left:40px; width:40px; height: 40px; border-radius: 50%;
	border: 1px solid #7d99a4; color: #4a4a4a; font-weight: bold; font-size:24px; background-color: #eef3f5;
	display: flex; align-items: center; justify-content: center;}
	#prevBtn:hover, #nextBtn:hover, #playStopBtn:hover{
		color:#7d99a4;
	}
	#prevBtn{margin-left:340px;}
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
<div id="ad_container">
<nav id="ad">
	<a href="${pageContext.request.contextPath}/product/product_view.do?prdNum=275">
		<img src="${pageContext.request.contextPath}/resources/img/home_ad1.png" class="home_ad1" style="width: 1020px;" />
	</a>
	<a href="${pageContext.request.contextPath}/product/product_view.do?prdNum=359">
		<img src="${pageContext.request.contextPath}/resources/img/home_ad2.png" class="home_ad1" style="width: 1020px;" />
	</a>
		<a href="${pageContext.request.contextPath}/product/product_view.do?prdNum=320">
		<img src="${pageContext.request.contextPath}/resources/img/home_ad3.png" class="home_ad1" style="width: 1020px;" />
	</a>
		<a href="${pageContext.request.contextPath}/product/product_view.do?prdNum=418">
		<img src="${pageContext.request.contextPath}/resources/img/home_ad4.png" class="home_ad1" style="width: 1020px;" />
	</a>
		<a href="${pageContext.request.contextPath}/product/product_view.do?prdNum=265">
		<img src="${pageContext.request.contextPath}/resources/img/home_ad5.png" class="home_ad1" style="width: 1020px;" />
	</a>
		<a href="${pageContext.request.contextPath}/product/product_view.do?prdNum=462">
		<img src="${pageContext.request.contextPath}/resources/img/home_ad6.png" class="home_ad1" style="width: 1020px;" />
	</a>
		<a href="${pageContext.request.contextPath}/product/product_view.do?prdNum=366">
		<img src="${pageContext.request.contextPath}/resources/img/home_ad7.png" class="home_ad1" style="width: 1020px;" />
	</a>	
		<a href="${pageContext.request.contextPath}/product/product_view.do?prdNum=423">
		<img src="${pageContext.request.contextPath}/resources/img/home_ad8.png" class="home_ad1" style="width: 1020px;" />
	</a>		
</nav>
<div id="ad_btn_box">
    <div id="ad_left_btn">
        <button id="prevBtn">&lt;</button>
    </div>
    <div id="btn_text">
        <span id="currentPage">1</span>&nbsp;/&nbsp;<span id="totalPages">8</span>
    </div>
    <div id="ad_right_btn">
        <button id="nextBtn">&gt;</button>
    </div>
    <div id="play_and_stop">
        <button id="playStopBtn">∥</button>
    </div>
</div>
</div>


<section id="content">
	<article id="s_ad1" class="s_ad">
		<a href="${pageContext.request.contextPath}/one_inq/notice_view.do?prdNum=1">
			<img src="${pageContext.request.contextPath}/resources/img/home_s_ad1.png" style="width: 500px;" />
		</a>
	</article>
	<article id="s_ad2" class="s_ad">
		<a href="${pageContext.request.contextPath}/one_inq/notice_view.do?prdNum=2">
			<img src="${pageContext.request.contextPath}/resources/img/home_s_ad2.png" style="width: 500px;" />
		</a>
	</article>

	<article id="home_best">
		<div class="cat_name">
			<a href="#" onclick="HeaderBest('1')">베스트 </a>
		</div>		
		<div class="pro_list">		    		 
			<ul class="pro_list_line">
			    <c:if test="${!empty productList[0].product_idx}">				
					<li class="pro_first" >				    				            
						<div class="pro_info">	
							<div class="goodlist_thumb_background">										
								<a href="${pageContext.request.contextPath}/product/product_view.do?prdNum=${productList[0].product_idx}">
									<img src="${pageContext.request.contextPath}/resources/uploads/${fileList[0].saveFile}" class="pro_img">
								</a>
							</div>
							<div class="pro_name">
								<a href="${pageContext.request.contextPath}/product/product_view.do?prdNum=${productList[0].product_idx}">
									<span class="goods_nickname">${productList[0].member_nickname}</span>
									<p class="goods_name">${productList[0].product_name}</p>
								</a>
							</div>
							<span class="pro_price">
								<c:choose>
								<c:when test="${productList[0].product_capa == 0}">
								<span class="soldOutNotice">[SOLD OUT] 일시품절</span>
								</c:when>
								<c:otherwise>
								<fmt:formatNumber value="${productList[0].product_price}" pattern="###,###" />원
								</c:otherwise>
								</c:choose>
							</span>
						</div>					 
					</li>
				</c:if>	
				<c:if test="${!empty productList[1].product_idx}">					
					<li class="pro_second">
						<div class="pro_info">
							<div class="goodlist_thumb_background">
								<a href="${pageContext.request.contextPath}/product/product_view.do?prdNum=${productList[1].product_idx}">
									<img src="${pageContext.request.contextPath}/resources/uploads/${fileList[1].saveFile}" class="pro_img">
								</a>
							</div>
							<div class="pro_name">
								<a href="${pageContext.request.contextPath}/product/product_view.do?prdNum=${productList[1].product_idx}">
									<span class="goods_nickname">${productList[1].member_nickname}</span>
									<p class="goods_name">${productList[1].product_name}</p>
								</a>
							</div>
							<span class="pro_price">
								<c:choose>
								<c:when test="${productList[1].product_capa == 0}">
								<span class="soldOutNotice">[SOLD OUT] 일시품절</span>
								</c:when>
								<c:otherwise>
								<fmt:formatNumber value="${productList[1].product_price}" pattern="###,###" />원
								</c:otherwise>
								</c:choose>
							</span>
						</div>
					</li>
				</c:if>
				<c:if test="${!empty productList[2].product_idx}">	
					<li class="pro_third">
						<div class="pro_info">
							<div class="goodlist_thumb_background">
								<a href="${pageContext.request.contextPath}/product/product_view.do?prdNum=${productList[2].product_idx}">
									<img src="${pageContext.request.contextPath}/resources/uploads/${fileList[2].saveFile}" class="pro_img">
								</a>
							</div>
							<div class="pro_name">
								<a href="${pageContext.request.contextPath}/product/product_view.do?prdNum=${productList[2].product_idx}">
									<span class="goods_nickname">${productList[2].member_nickname}</span>
									<p class="goods_name">${productList[2].product_name}</p>
								</a>
							</div>
							<span class="pro_price">
								<c:choose>
								<c:when test="${productList[2].product_capa == 0}">
								<span class="soldOutNotice">[SOLD OUT] 일시품절</span>
								</c:when>
								<c:otherwise>
								<fmt:formatNumber value="${productList[2].product_price}" pattern="###,###" />원
								</c:otherwise>
								</c:choose>
							</span>
						</div>
					</li>
				</c:if>
	        </ul>
		</div>
		
		<div class="pro_list">
			<ul class="pro_list_line">
				<c:if test="${!empty productList[3].product_idx}">
					<li class="pro_first">
						<div class="pro_info">
							<div class="goodlist_thumb_background">
								<a href="${pageContext.request.contextPath}/product/product_view.do?prdNum=${productList[3].product_idx}">
									<img src="${pageContext.request.contextPath}/resources/uploads/${fileList[3].saveFile}" class="pro_img">
								</a>
							</div>
							<div class="pro_name">
								<a href="${pageContext.request.contextPath}/product/product_view.do?prdNum=${productList[3].product_idx}">
									<span class="goods_nickname">${productList[3].member_nickname}</span>
									<p class="goods_name">${productList[3].product_name}</p>
								</a>
							</div>
							<span class="pro_price">
								<c:choose>
								<c:when test="${productList[3].product_capa == 0}">
								<span class="soldOutNotice">[SOLD OUT] 일시품절</span>
								</c:when>
								<c:otherwise>
								<fmt:formatNumber value="${productList[3].product_price}" pattern="###,###" />원
								</c:otherwise>
								</c:choose>
							</span>
						</div>
					</li>
				</c:if>
				<c:if test="${!empty productList[4].product_idx}">
					<li class="pro_second">
						<div class="pro_info">
							<div class="goodlist_thumb_background">
								<a href="${pageContext.request.contextPath}/product/product_view.do?prdNum=${productList[4].product_idx}">
									<img src="${pageContext.request.contextPath}/resources/uploads/${fileList[4].saveFile}" class="pro_img">
								</a>
							</div>
							<div class="pro_name">
								<a href="${pageContext.request.contextPath}/product/product_view.do?prdNum=${productList[4].product_idx}">
									<span class="goods_nickname">${productList[4].member_nickname}</span>
									<p class="goods_name">${productList[4].product_name}</p>
								</a>
							</div>
							<span class="pro_price">
								<c:choose>
								<c:when test="${productList[4].product_capa == 0}">
								<span class="soldOutNotice">[SOLD OUT] 일시품절</span>
								</c:when>
								<c:otherwise>
								<fmt:formatNumber value="${productList[4].product_price}" pattern="###,###" />원
								</c:otherwise>
								</c:choose>
							</span>
						</div>
					</li>
				</c:if>
				<c:if test="${!empty productList[5].product_idx}">
					<li class="pro_third">
						<div class="pro_info">
							<div class="goodlist_thumb_background">
								<a href="${pageContext.request.contextPath}/product/product_view.do?prdNum=${productList[5].product_idx}">
									<img src="${pageContext.request.contextPath}/resources/uploads/${fileList[5].saveFile}" class="pro_img">
								</a>
							</div>
							<div class="pro_name">
								<a href="${pageContext.request.contextPath}/product/product_view.do?prdNum=${productList[5].product_idx}">
									<span class="goods_nickname">${productList[5].member_nickname}</span>
									<p class="goods_name">${productList[5].product_name}</p>
								</a>
							</div>
							<span class="pro_price">
								<c:choose>
								<c:when test="${productList[5].product_capa == 0}">
								<span class="soldOutNotice">[SOLD OUT] 일시품절</span>
								</c:when>
								<c:otherwise>
								<fmt:formatNumber value="${productList[5].product_price}" pattern="###,###" />원
								</c:otherwise>
								</c:choose>
							</span>
						</div>
					</li>
			    </c:if>
			</ul>
		</div>
		
		<div class="pro_list">
			<ul class="pro_list_line">
				<c:if test="${!empty productList[6].product_idx}">
					<li class="pro_first">
						<div class="pro_info">
							<div class="goodlist_thumb_background">
								<a href="${pageContext.request.contextPath}/product/product_view.do?prdNum=${productList[6].product_idx}">
									<img src="${pageContext.request.contextPath}/resources/uploads/${fileList[6].saveFile}" class="pro_img">
								</a>
							</div>
							<div class="pro_name">
								<a href="${pageContext.request.contextPath}/product/product_view.do?prdNum=${productList[6].product_idx}">
									<span class="goods_nickname">${productList[6].member_nickname}</span>
									<p class="goods_name">${productList[6].product_name}</p>
								</a>
							</div>
							<span class="pro_price">
								<c:choose>
								<c:when test="${productList[6].product_capa == 0}">
								<span class="soldOutNotice">[SOLD OUT] 일시품절</span>
								</c:when>
								<c:otherwise>
								<fmt:formatNumber value="${productList[6].product_price}" pattern="###,###" />원
								</c:otherwise>
								</c:choose>
							</span>
						</div>
					</li>
				</c:if>
				<c:if test="${!empty productList[7].product_idx}">	
					<li class="pro_second">
						<div class="pro_info">
							<div class="goodlist_thumb_background">
								<a href="${pageContext.request.contextPath}/product/product_view.do?prdNum=${productList[7].product_idx}">
									<img src="${pageContext.request.contextPath}/resources/uploads/${fileList[7].saveFile}" class="pro_img">
								</a>
							</div>
							<div class="pro_name">
								<a href="${pageContext.request.contextPath}/product/product_view.do?prdNum=${productList[7].product_idx}">
									<span class="goods_nickname">${productList[7].member_nickname}</span>
									<p class="goods_name">${productList[7].product_name}</p>
								</a>
							</div>
							<span class="pro_price">
								<c:choose>
								<c:when test="${productList[7].product_capa == 0}">
								<span class="soldOutNotice">[SOLD OUT] 일시품절</span>
								</c:when>
								<c:otherwise>
								<fmt:formatNumber value="${productList[7].product_price}" pattern="###,###" />원
								</c:otherwise>
								</c:choose>
							</span>
						</div>
					</li>
				</c:if>
				<c:if test="${!empty productList[8].product_idx}">	
					<li class="pro_third">
						<div class="pro_info">
							<div class="goodlist_thumb_background">
								<a href="${pageContext.request.contextPath}/product/product_view.do?prdNum=${productList[8].product_idx}">
									<img src="${pageContext.request.contextPath}/resources/uploads/${fileList[8].saveFile}" class="pro_img">
								</a>
							</div>
							<div class="pro_name">
								<a href="${pageContext.request.contextPath}/product/product_view.do?prdNum=${productList[8].product_idx}">
									<span class="goods_nickname">${productList[8].member_nickname}</span>
									<p class="goods_name">${productList[8].product_name}</p>
								</a>
							</div>
							<span class="pro_price">
								<c:choose>
								<c:when test="${productList[8].product_capa == 0}">
								<span class="soldOutNotice">[SOLD OUT] 일시품절</span>
								</c:when>
								<c:otherwise>
								<fmt:formatNumber value="${productList[8].product_price}" pattern="###,###" />원
								</c:otherwise>
								</c:choose>
							</span>
						</div>
					</li>
			    </c:if>
			</ul>
		</div>
	</article>		
</section>

<footer>
	<jsp:include page="../main/footer.jsp" />
</footer>

</body>
</html>