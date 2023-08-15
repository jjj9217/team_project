<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Header</title>
<style>
	* {margin:0; padding:0;}
	a{text-decoration: none;}
    input[type="button"], input[type="submit"], input[type="checkbox"], select, label, button{cursor: pointer;}
	.head {
		margin-left: 5%;
		margin-right: 5%;
	}
	
	.small_menu {
		text-align: right;
	}
	
	.small_menu a {
		font-size: 12px; 
		color: black;
		text-decoration-line: none;
	}
	
	.head_logo {
		margin-right: 7%;
		text-align: left;
		width: 180px;
		display: inline-block;
	}
	
	.head_search {
	    width: 300px;
	    height: 40px;
	    margin: 22px 0 0 90px;
	    padding: 0 45px 0 20px;
	    border: 2px solid #7d99a4;
	    background: #ffffff;
	    border-radius: 20px;
	    display: inline-block;
	    white-space : nowrap;
	}
	
	#head_searchWord {
		width: 290px;
	    font-size: 12px;
	    line-height: 20px;
	    letter-spacing: -.04em;
	    border: #ffffff;
	    margin-top: 5px;
	    position: relative;
	    vertical-align: middle;
	    display: inline-block;
    }
    #head_searchWord:focus{
    	outline:none;
    }    
    #head_searchBtn {
	    width: 30px;
	    height: 30px;
    	margin-top: 5px;
    	vertical-align: middle;
		display: inline;
		border: #ffffff;
		background-color: #ffffff;
    }
    
    .recent_pro {
    	margin-top: -35px;
		text-align: right;
		background-color: #fff;
		vertical-align: middle;
    }
    
    .recent_pro span {
    	font-size: 15.5px; 
		color: black;
		text-decoration-line: none;
    }
    
    .menu_box {
    	width: 100%;
    	height: 40px;
    	text-align: center;
    	margin-top: 40px;
    	border-top: 1px solid #a4a4a4;
    	border-bottom: 2px solid #000000;
    }
    
	.menu {
		margin-top: -0%;
		margin-left: 2%;
		text-align: center;
		width: 100%;
		list-style: none;
	}
	
	.menu > li {
		width: 13.8%; /* 90 * 7 */
		float: left;
		text-align: center;
		line-height: 40px;
		background-color: white;
	}
	
	.menu a {
		color: #000000;
		font-weight: bold;
		text-decoration-line: none;
	}
	
	.submenu {
		height: 0; /*ul의 높이를 안보이게 처리*/
		overflow: hidden;
		list-style: none;
		width: 141px;
		position: absolute;
		z-index: 10;
	}
	
	.submenu a {
		height: 0; /*ul의 높이를 안보이게 처리*/
		overflow: hidden;
		list-style: none;
		font-size: 12px;
		z-index: 10;
	}
	
	.submenu > li {
		line-height: 50px;
		background-color: #7d99a4;
	}
	
	.menu > li:hover {
		background-color: #7d99a4;
		transition-duration: 0.5s;
	}
	
	.menu > li:hover .submenu {
		height: 150px; /*서브메뉴 li한개의 높이 50*5*/
		transition-duration: 1s;
	 }
	 
	 .menu > li:hover a {
	 	color: #ffffff;
	}
	.basket_move{
		cursor: pointer;
		font-size: 12px;
	}
	.recent_box{
		display: none;
		position: absolute;
		left: 180px;
		top: 100px;
		width:900px; height:480px;
		border: 2px solid #7d99a4;
		border-radius: 5px;
		background-color: #eef3f5;
	}
	.recent_title{
		margin-top: 10px;
		display:flex;
		width:860px; height:30px;
		padding: 5px 20px;
	}
	.recent_title_text{
		width:430px;
		display: block;
		text-align: left;
		font-size: 14px;
		line-height: 30px;
		color: #4a4a4a;
		font-weight: bold;
	}
	.recent_title_btn{
		width:430px;
		display: block;
	}
	#recent_all_delete_btn{
		width: 80px; height: 26px;
		border: 1px solid #7d99a4;
		border-radius: 5px;
		background-color: #fff;
		color: #4a4a4a;
		font-weight: bold;
	}
	#recent_hr{
	width: 860px; height: 4px; margin-left:20px; margin-top: 10px;
	background-color:#7d99a4;
	}
	.recent_item_box{
		margin-top:10px;
		margin-left: 10px;
		display:flex;
		width: 900px; height: 360px;
	}
	.recent_item{
		width: 260px; height: 340px;
		margin-left: 10px;
		padding: 10px;
	}
	.item_btn{
		width: 260px; height: 30px;
	}
	.item_photo{
		width: 260px; height: 200px;
		text-align: center;
		cursor: pointer;
	}
	.item_seller{
		width: 240px; height: 20px;
		padding: 5px 10px;
		text-align: left;
		color: #4a4a4a;
		font-weight: bold;
		font-size: 15px;
		cursor: pointer;
	}
	.item_name{
		width: 240px; height: 40px;
		padding: 5px 10px;
		text-align: left;
		color: black;
		font-size: 14px;
		overflow: hidden;
	    text-overflow: ellipsis;
	    white-space: nowrap;
	    cursor: pointer;
	}
	.item_price{
		width: 240px; height: 30px;
		padding: 0 10px;
		text-align: left;
		color: #7d99a4;
		font-weight: bold;
		font-size: 18px;
		cursor: pointer;
	}
	.recent_delete_btn{
		width: 30px; height: 30px;
		color: #4a4a4a;
		font-weight: bold;
		border: 0px;
		background-color: #eef3f5;
	}
	.photoImage{width: 200px; height: 200px;}
	#recentViewBtn{cursor:pointer;}
	.item_empty{
	display:flex;
	justify-content: center;
	align-items: center;
	color: #4a4a4a;
	font-size: 20px;
	font-weight: bold;
	}	
</style>
</head>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
$(function(){
//장바구니 스크립트
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

// 장바구니 버튼 클릭 이벤트 처리
$(".basket_move").click(function() {
	// 비회원 식별값 가져오기
	const guestId = getGuestId();		
	
	window.location.href = "${pageContext.request.contextPath}/purchase/basket.do"; 	    
});

//최근본상품 클릭
$("#recentViewBtn").click(function(){
	$(".recent_box").toggle();
    if ($(".recent_box").is(":visible")) {
        $("#recentViewBtn").text("최근 본 상품 ▼");
      } else {
        $("#recentViewBtn").text("최근 본 상품 ▲");
      }
});

//상품뷰로 이동
$(".item_photo").click(function(){
	var index = $(".item_photo").index(this);
	var prdNum = $(".recentViewIdx").eq(index).val();
	window.location.href = "${pageContext.request.contextPath}/product/product_view.do?prdNum="+prdNum;
});
$(".item_seller").click(function(){
	var index = $(".item_seller").index(this);
	var prdNum = $(".recentViewIdx").eq(index).val();
	window.location.href = "${pageContext.request.contextPath}/product/product_view.do?prdNum="+prdNum;
});
$(".item_name").click(function(){
	var index = $(".item_name").index(this);
	var prdNum = $(".recentViewIdx").eq(index).val();
	window.location.href = "${pageContext.request.contextPath}/product/product_view.do?prdNum="+prdNum;
});
$(".item_price").click(function(){
	var index = $(".item_price").index(this);
	var prdNum = $(".recentViewIdx").eq(index).val();
	window.location.href = "${pageContext.request.contextPath}/product/product_view.do?prdNum="+prdNum;
});

//전체삭제
$("#recent_all_delete_btn").click(function(){
    var confirmDelete = confirm("전체상품을 삭제하시겠습니까?");
    if (confirmDelete) {
    	window.location.href = "${pageContext.request.contextPath}/product/recentViewAllDelete.do";
    }
});

//1개삭제
$(".recent_delete_btn").click(function(){
	var index = $(".recent_delete_btn").index(this);	
	$(".deleteOneRecentFrm").eq(index).submit();
});



});

</script>
<script>

function searchplz(){
	var word = document.getElementById("head_searchWord");	
	if(word.value === ""){
		alert('검색어를 입력해주세요!');
		return false;
	}else{
		searchF.submit();		
	}
		
}


function getParameterValue(parameterName) {
    const queryString = window.location.search;
    const urlParams = new URLSearchParams(queryString);

    if (urlParams.has(parameterName)) {
        return urlParams.get(parameterName);
    }

    return null; // 파라미터가 없으면 null 반환
}


function ProductHeader(category_code, category_code_small
        ) {
	 
    var insertcategory_code ="";
    const paramcategory_code = getParameterValue("category_code");
    if(category_code === ""){//받은 카테고리대 코드가 없을 때       
        if(paramcategory_code === null){//URL에 있는 카테고리대 코드가 없을 때
        insertcategory_code = '';
        }
        else{//URL에 있는 카테고리대 코드가 있을 때
        insertcategory_code = paramcategory_code;
        }        
    }else{//받은 카테고리대 코드가 있을 때
        insertcategory_code = category_code;
        insertcategory_code_small = "";
//         alert('초기화');
    }
    
    var insertcategory_code_small ="";
    const paramcategory_code_small = getParameterValue("category_code_small");
    if(category_code_small === ""){//받은 카테고리소 코드가 없을 때
        if(paramcategory_code_small === null){//URL에 있는 카테고리소 코드가 없을 때
        insertcategory_code_small = '';}
        else{//URL에 있는 카테고리소 코드가 있을 때
//         	alert('마지막');
        if(category_code === ""){
//         	alert('여기로오면안됨');
        insertcategory_code_small = paramcategory_code_small;}
        else{insertcategory_code_small="";
//         alert('여기로와야함');
        	
        }
        }
    }else{//받은 카테고리대 코드가 있을 때
    	if(paramcategory_code !== null){
    		insertcategory_code="";
    		insertcategory_code_small = category_code_small;
    	}
    	else{
        insertcategory_code_small = category_code_small;}
    }

   
         
    // 새 URL 구성    
    var newURL = "${pageContext.request.contextPath}/product/product_list_enter_category.do" +  
    "?category_code=" + insertcategory_code +
    "&category_code_small=" + insertcategory_code_small
    ;
    // URL로 이동
    window.location.href = newURL;

    
}


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
<div class="head">

	<!-- 상단 작은 메뉴 (조건에 따라 회원용/비회원용 구분) -->
	<c:choose>
		<c:when test="${!empty member}">
			<!-- 관리자용:회원등급2 -->
			<!-- 판매자용:회원등급1 -->
			<!-- 회원용:회원등급0 -->
			<article class="small_menu">
				<a>${member.member_name}님</a>&nbsp;&nbsp;<a href="${pageContext.request.contextPath}/member/logout.do">로그아웃</a>&nbsp;&nbsp;<a href="${pageContext.request.contextPath}/mypage/mypage_main.do">마이페이지</a>&nbsp;&nbsp;<span class="basket_move">장바구니</span>&nbsp;&nbsp;<a href="#">주문배송</a>&nbsp;&nbsp;<a href="${pageContext.request.contextPath}/one_inq/notice.do">고객센터</a>
			</article>
		</c:when>
		<c:otherwise>
			<!-- 일반용 -->
			<article class="small_menu">
				<a href="${pageContext.request.contextPath}/member/terms.do">회원가입</a>&nbsp;&nbsp;<a href="${pageContext.request.contextPath}/member/login.do">로그인</a>&nbsp;&nbsp;<span class="basket_move">장바구니</span>&nbsp;&nbsp;<a href="#">주문배송</a>&nbsp;&nbsp;<a href="${pageContext.request.contextPath}/member/login.do">로그인</a>&nbsp;&nbsp;<a href="${pageContext.request.contextPath}/one_inq/notice.do">고객센터</a>
			</article>
		</c:otherwise>
	</c:choose>
	
	<!-- 로고 -->
	<a href="${pageContext.request.contextPath}/main/home.do">
		<img src="${pageContext.request.contextPath}/resources/img/CrueltyFree_logo.png" class="head_logo"></a>
	
	<!-- 검색창 -->
	<div class="head_search">
<form id="searchF" action="${pageContext.request.contextPath}/product/product_list_enter_searchword.do">	
		<input type="text" name="searchWord" id="head_searchWord" placeholder="검색어를 입력해 주세요" >
		<button type="button" id="head_searchBtn" onclick="searchplz()"><img src="${pageContext.request.contextPath}/resources/img/search_img.png" style="width: 21px; height: 21px; margin-left: -4px; margin-top: -1px;"></button>
</form>	
	</div>
	
	<!-- 최근 본 상품 -->
	<div class="recent_pro">
		<span id="recentViewBtn">최근 본 상품 ▲</span>
		<div class="recent_box">
			<div class="recent_title">
				<div class="recent_title_text">최근 본 상품</div>
				<div class="recent_title_btn">
				<c:choose>
				<c:when test="${empty RecentViewList}">
				</c:when>
				<c:otherwise>
				<button id="recent_all_delete_btn">X 전체삭제</button>
				</c:otherwise>
				</c:choose>
				</div>
			</div>
			<div id="recent_hr"></div>
			<c:choose>
			<c:when test="${empty RecentViewList}">
			<div class="recent_item_box item_empty">
			최근 본 상품이 없습니다!
			</div>			
			</c:when>
			<c:otherwise>
			<div class="recent_item_box">
			<c:forEach var="itemRow" begin="1" end="${RecentViewListCount}">			
			<form action="${pageContext.request.contextPath}/product/recentViewOneDelete.do" class="deleteOneRecentFrm" method="get">
			<input type="hidden" class="recentViewIdx" name="product_idx" value="${RecentViewList[itemRow-1].product_idx}">
			</form>					
			<div class="recent_item">
				<div class="item_btn">
				<button class="recent_delete_btn">X</button>
				</div>
				<div class="item_photo">
				<img class="photoImage" src="${pageContext.request.contextPath}/resources/uploads/${RecentViewList[itemRow-1].saveFile}">
				</div>
				<div class="item_seller">
				${RecentViewList[itemRow-1].member_nickname}
				</div>
				<div class="item_name">
				${RecentViewList[itemRow-1].product_name}
				</div>
				<div class="item_price">
				${RecentViewList[itemRow-1].product_price}원
				</div>								
			</div>
			</c:forEach>			
			</div>
			</c:otherwise>
			</c:choose>			
		</div>		
	</div>

</div>

<div class="menu_box">
	<ul class="menu">
		<li>
			<a href="#" onclick="HeaderBest('1')">베스트</a>
		</li>
		<li>
			<a href="${pageContext.request.contextPath}/product/product_list_enter_category.do?category_code=skin" >스킨케어</a>
			<ul class="submenu">
				<li class="sub3"><a href="${pageContext.request.contextPath}/product/product_list_enter_category.do?category_code_small=skin_1">토너/로션/올인원</a></li>
				<li class="sub3"><a href="${pageContext.request.contextPath}/product/product_list_enter_category.do?category_code_small=skin_2">에센스/크림</a></li>
				<li class="sub3"><a href="${pageContext.request.contextPath}/product/product_list_enter_category.do?category_code_small=skin_3">미스트/오일</a></li>
			</ul>
		</li>
		<li>
			<a href="${pageContext.request.contextPath}/product/product_list_enter_category.do?category_code=clensing" >클렌징</a>
			<ul class="submenu">
				<li class="sub2"><a href="${pageContext.request.contextPath}/product/product_list_enter_category.do?category_code_small=clensing_1">클렌징폼/젤</a></li>
				<li class="sub2"><a href="${pageContext.request.contextPath}/product/product_list_enter_category.do?category_code_small=clensing_2">오일/워터/리무버</a></li>
			</ul>
		</li>
		<li>
			<a href="${pageContext.request.contextPath}/product/product_list_enter_category.do?category_code=makeup" >메이크업</a>
			<ul class="submenu">
				<li class="sub3"><a href="${pageContext.request.contextPath}/product/product_list_enter_category.do?category_code_small=makeup_1">립메이크업</a></li>
				<li class="sub3"><a href="${pageContext.request.contextPath}/product/product_list_enter_category.do?category_code_small=makeup_2">베이스메이크업</a></li>
				<li class="sub3"><a href="${pageContext.request.contextPath}/product/product_list_enter_category.do?category_code_small=makeup_3">아이메이크업</a></li>
			</ul>
		</li>
		<li>
			<a href="${pageContext.request.contextPath}/product/product_list_enter_category.do?category_code=body" >바디케어</a>
			<ul class="submenu">
				<li class="sub2"><a href="${pageContext.request.contextPath}/product/product_list_enter_category.do?category_code_small=body_1">샤워/입욕</a></li>
				<li class="sub2"><a href="${pageContext.request.contextPath}/product/product_list_enter_category.do?category_code_small=body_2">로션/오일</a></li>
			</ul>
		</li>
		<li>
			<a href="${pageContext.request.contextPath}/product/product_list_enter_category.do?category_code=hair" >헤어케어</a>
			<ul class="submenu">
				<li class="sub2"><a href="${pageContext.request.contextPath}/product/product_list_enter_category.do?category_code_small=hair_1">샴푸/린스/트리트먼트</a></li>
				<li class="sub2"><a href="${pageContext.request.contextPath}/product/product_list_enter_category.do?category_code_small=hair_2">염색약/펌</a></li>
			</ul>
		</li>
		<li>
			<a href="${pageContext.request.contextPath}/product/product_list_enter_category.do?category_code=prop" >미용소품</a>
		</li>
	</ul>
</div>

</body>
</html>