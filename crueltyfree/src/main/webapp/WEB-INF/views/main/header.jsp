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
    
    .recent_pro a {
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
	}
	
	.submenu a {
		height: 0; /*ul의 높이를 안보이게 처리*/
		overflow: hidden;
		list-style: none;
		font-size: 12px;
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
		
</style>
</head>

<body>
<div class="head">

	<!-- 상단 작은 메뉴 (조건에 따라 회원용/비회원용 구분) -->
	<c:choose>
		<c:when test="${!empty member}">
			<!-- 관리자용:회원등급2 -->
			<!-- 판매자용:회원등급1 -->
			<!-- 회원용:회원등급0 -->
			<article class="small_menu">
				<a>${member.member_name}님</a>&nbsp;&nbsp;<a href="${pageContext.request.contextPath}/member/logout.do">로그아웃</a>&nbsp;&nbsp;<a href="${pageContext.request.contextPath}/mypage/mypage_main.do">마이페이지</a>&nbsp;&nbsp;<a href="${pageContext.request.contextPath}/purchase/basket.do">장바구니</a>&nbsp;&nbsp;<a href="#">주문배송</a>&nbsp;&nbsp;<a href="${pageContext.request.contextPath}/one_inq/notice.do">고객센터</a>
			</article>
		</c:when>
		<c:otherwise>
			<!-- 일반용 -->
			<article class="small_menu">
				<a href="${pageContext.request.contextPath}/member/terms.do">회원가입</a>&nbsp;&nbsp;<a href="${pageContext.request.contextPath}/member/login.do">로그인</a>&nbsp;&nbsp;<a href="${pageContext.request.contextPath}/purchase/basket.do">장바구니</a>&nbsp;&nbsp;<a href="#">주문배송</a>&nbsp;&nbsp;<a href="${pageContext.request.contextPath}/member/login.do">로그인</a>&nbsp;&nbsp;<a href="${pageContext.request.contextPath}/one_inq/notice.do">고객센터</a>
			</article>
		</c:otherwise>
	</c:choose>
	
	<!-- 로고 -->
	<a href="${pageContext.request.contextPath}/main/home.do">
		<img src="${pageContext.request.contextPath}/resources/img/CrueltyFree_logo.png" class="head_logo"></a>
	
	<!-- 검색창 -->
	<div class="head_search">
		<input type="text" name="searchWord" id="head_searchWord" placeholder="검색어를 입력해 주세요">
		<button type="submit" name="searchBtn" id="head_searchBtn"><img src="${pageContext.request.contextPath}/resources/img/search_img.png" style="width: 21px; height: 21px; margin-left: -4px; margin-top: -1px;"></button>
	</div>
	
	<!-- 최근 본 상품 -->
	<div class="recent_pro">
		<a href="#">최근 본 상품 ▼</a>
	</div>

</div>

<div class="menu_box">
	<ul class="menu">
		<li>
			<a href="#">베스트</a>
		</li>
		<li>
			<a href="#">스킨케어</a>
			<ul class="submenu">
				<li class="sub3"><a href="#">토너/로션/올인원</a></li>
				<li class="sub3"><a href="#">에센스/크림</a></li>
				<li class="sub3"><a href="#">미스트/오일</a></li>
			</ul>
		</li>
		<li>
			<a href="#">클렌징</a>
			<ul class="submenu">
				<li class="sub2"><a href="#">클렌징폼/젤</a></li>
				<li class="sub2"><a href="#">오일/워터/리무버</a></li>
			</ul>
		</li>
		<li>
			<a href="#">메이크업</a>
			<ul class="submenu">
				<li class="sub3"><a href="#">립메이크업</a></li>
				<li class="sub3"><a href="#">베이스메이크업</a></li>
				<li class="sub3"><a href="#">아이메이크업</a></li>
			</ul>
		</li>
		<li>
			<a href="#">바디케어</a>
			<ul class="submenu">
				<li class="sub2"><a href="#">샤워/입욕</a></li>
				<li class="sub2"><a href="#">로션/오일</a></li>
			</ul>
		</li>
		<li>
			<a href="#">헤어케어</a>
			<ul class="submenu">
				<li class="sub2"><a href="#">샴푸/린스/트리트먼트</a></li>
				<li class="sub2"><a href="#">염색약/펌</a></li>
			</ul>
		</li>
		<li>
			<a href="#">미용소품</a>
		</li>
	</ul>
</div>

</body>
</html>