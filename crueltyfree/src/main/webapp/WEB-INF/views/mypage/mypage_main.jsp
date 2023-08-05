<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List, java.util.HashMap, java.util.Map" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
        
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Header</title>
<style>

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
        color: #a4a4a4;
        font-size: 12px;
        line-height: 20px;
        letter-spacing: -.04em;
        border: #ffffff;
        margin-top: 5px;
        position: relative;
        vertical-align: middle;
        display: inline-block;
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
        width: 12.8%; /* 90 * 7 */
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
    
    /* 바디 CSS */

    #Container{
        overflow:hidden;

        width: 1020px; margin: 0 auto;
    }
    
    #mypage{
        
        width: 199px;
        height:500px;
        float:left;     
    }

    #mypage-conts{
    
        width:810px;
        height: 950px;      
        float:left;
    }

    #mylink{
        color: black;
        font-size: 30px;
        text-decoration: none;
    }

    .mypagetable{
        font-size: 20px;
        font-family:'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif;
        font-weight: bold;      
    }

    #blank{
        width:100%;
        height: 35px;
        
    }

    .tit_area{
        overflow: hidden;
        margin-top: 30px;
        position: relative;
        width: 100%;
        font-size: 0;
        line-height: 0;
        
    }

    .tit_area .tit{
        float: left;
        color: #333;
        font-size: 20px;
        line-height: 30px;
    }

    .tit_area .tit em{
        display: inline-block;
        margin-left: 5px;
        padding: 0;
        font-style: normal;
        font-size: 12px;
        line-height: 18px;
        vertical-align: 0;
    }

    .tit_area .btnMore {
    position: absolute;
    top: 25px;
    right: 0;
    padding: 0 15px 0 0;
    
    font-size: 14px;
    line-height: 20px;
    color:black;
    text-decoration: none;
    }

    .mypage-step {
    overflow: hidden;
    width: 100%;
    height: 120px;  /* 없애면됨*/
    padding-inline-start: 0px;
    border-radius: 10px;

    }

    .mypage-step li em {
    top: 25px;
    color: #888;
    font-style: normal;
    font-size: 40px;
    line-height: 50px;
    font-weight: 500;
    }

    .mypage-step li em, .mypage-step li span {
    display: block;
    position: absolute;
    left: 0;
    width: 100%;
    text-align: center; 
    }

    .mypage-step li {

    float: left;
    position: relative;
    width: 20%;
    height: 117px;
   
    font-size: 0;
    line-height: 0;
    
    }

    .mypage-step li span {
    top: 70px;
    color: #666;
    font-size: 16px;
    line-height: 22px;
    }

    .area-over {
    overflow: hidden;
    position: relative;
    width: 100%;
    
    }

    .area-over .left {
    float: left;
    }

    .area-over .right {
    float: right;
    }

    .area-over .left, .area-over .right {
    width: 380px;
    }

    ul.nodata_ul{       
        text-align: center;     
        padding-inline-start: 0px;
    }

    li.nodata{
        width:100%;
        height: 100%;
    
        line-height: 175px;
    }
    
    ul{
        list-style:none;
   }
    
   .list-customer{
        width:380px;
        height:181px;
    
   }
    
    .product_list_background{
        width: 850px;
        height: 301px;
    
    }

    .product_list{
        width: 198px;
        height: 301px;
    
        display: flex;
        justify-content: center;
        align-items: center;
    }
    .prd_info{
        width: 180px;
        height: 290px;
    
    }

   .prd_price{
        width: 180px;
        height: 25px;
    
        text-align: center;
        font-size: 14px;
        line-height: 25px;
   }

   .font_price{
        text-align: center;
        font-size: 14px;
        
   }

   .prd_name{
        width: 180px;
        height: 55px;
    
   }

   .prd_title{      
        text-align: center;
        font-size: 14px;
        line-height: 55px;
   }
   
   .goodlist_thumb_background{
        width: 180px;
        height: 180px;
        
    
   }
   
   .goodlist_thumb{
        width: 180px;
        height: 180px;
        
   }

    /* footer Css */

    .foot {
        text-align: center;
        border-top: 2px solid #a4a4a4;
    }
    
    .foot_logo {
        width: 20%;
        vertical-align: top;
        margin-top: 7%;
        display: inline-block;
    }
    
    .foot_content {
        width: 70%;
        margin-top: 3%;
        display: inline-block;
    }
    
    .foot_content a {
        font-size: 13px;
    }


</style>
</head>

<body>
<div class="head">

    <!-- 상단 작은 메뉴 (조건에 따라 회원용/비회원용 구분) -->
    <c:choose>
        <c:when test="${!empty member}">
            <!-- 회원용 -->
            <article class="small_menu">
                <a>${member.member_name}님</a>&nbsp;&nbsp;<a href="#">로그아웃</a>&nbsp;&nbsp;<a href="#">마이페이지</a>&nbsp;&nbsp;<a href="#">장바구니</a>&nbsp;&nbsp;<a href="#">주문배송</a>&nbsp;&nbsp;<a href="#">고객센터</a>
            </article>
        </c:when>
        <c:otherwise>
            <!-- 일반용 -->
            <article class="small_menu">
                <a href="#">회원가입</a>&nbsp;&nbsp;<a href="#">로그인</a>&nbsp;&nbsp;<a href="#">장바구니</a>&nbsp;&nbsp;<a href="#">주문배송</a>&nbsp;&nbsp;<a href="#">고객센터</a>
            </article>
        </c:otherwise>
    </c:choose>
    
    <!-- 로고 -->
    <a href="../index/index.jsp">
        <img src="../resources/CrueltyFree_logo.png" class="head_logo" />
    </a>
    
    <!-- 검색창 -->
    <div class="head_search">
        <input type="text" name="searchWord" id="head_searchWord" value="검색어를 입력해 주세요">
        <button type="submit" name="searchBtn" id="head_searchBtn"><img src="../resources/search_img.png" style="width: 21px; height: 21px; margin-left: -4px; margin-top: -1px;"></button>
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

<!-- body시작 -->

<div id="Container">
    <div id="mypage">       
        <table>
            <th><h3><a href="#" id="mylink">마이페이지</a></h3></th>         
            <tr><td class="mypagetable">마이 쇼핑</td></tr>
            <tr><td>주문/배송조회</td></tr>
            <tr><td>취소/반품내역</td></tr>
            <tr><td><hr width=100%></td></tr>
            <tr><td>장바구니</td></tr>
            <tr><td>좋아요</td></tr>
            <tr><td>쿠폰</td></tr>
            <tr><td><hr width=100%></td></tr>
            <tr><td class="mypagetable">마이활동</td></tr>
            <tr><td>1:1문의내역</td></tr>
            <tr><td>
            <form name="caa" action="${pageContext.request.contextPath}/mypage/mypage_nonreview.do" method="get">
                        <input type="hidden" name="member_idx" value="1">
                    </form>
                    <a href="#" onclick="document.forms['caa'].submit();">리뷰</a></td></tr>
                    
            <tr><td>상품문의내역</td></tr>
            <tr><td><hr width=100%></td></tr>
            <tr><td class="mypagetable">마이 정보</td></tr>
            <tr><td>회원정보 수정</td></tr>
            <tr><td>배송지/환불계좌</td></tr>
        </table>        
    </div>
    
    <div id="mypage-conts">
        <div id="blank">            
        </div>
        <div class="tit_area">
            <h2 class="tit">주문/배송조회<em>(최근 1개월)</em></h2>
            <a class="btnMore" id="orderListMore" href="#">더보기〉</a>
        </div>
        <a class="order_view" href="#">
            <ul class="mypage-step">
                <li><em>0$</em>
                <span>주문접수</span>
                </li>
                <li><em>0$</em>
                <span>결제완료</span>
                </li>
                <li><em>0$</em>
                <span>배송준비중</span>
                </li>
                <li><em>0$</em>
                <span>배송중</span>
                </li>
                <li><em>0$</em>
                <span>배송완료</span>
                </li>
            </ul>
        </a>
        <div class="tit_area">
            <h2 class="tit">좋아요</h2>
            <a class="btnMore" id="wishListMore" href="#">더보기〉</a>      
            <hr width=100%>
            <div class="product_list_background">               
                <ul>
                    <li class="product_list">
                        <div class="prd_info">
                            <div class="goodlist_thumb_background">
                                <a href="#"><img class="goodlist_thumb" src="images.jpg"></a>
                            </div>
                            <div class="prd_name">
                                <a href="#" class="goodlist">
                                    <p class="prd_title">${untitled}상품제목</p>
                                </a>
                            </div>
                            <p class="prd_price">${untitled}원</p>
                        </div>
                    </li>
                    <!-- c:if el사용 -->
                   <!-- <li class="nodata">좋아요 상품이 없습니다.</li> -->                       
               </ul>
               <ul>
                    <li class="product_list">
                        <div class="prd_info">
                            <div class="goodlist_thumb_background">
                                <a href="#"><img class="goodlist_thumb" src="images.jpg"></a>
                            </div>
                            <div class="prd_name">
                                <a href="#" class="goodlist">
                                    <p class="prd_title">${untitled}상품제목</p>
                                </a>
                            </div>
                            <p class="prd_price">${untitled}원</p>
                        </div>
                    </li>
                    <!-- c:if el사용 -->
                   <!-- <li class="nodata">좋아요 상품이 없습니다.</li> -->                       
               </ul>
            </div>
            <hr width=100%>
        </div>
        <div class="area-over">
            <div class="left">
                <div class="tit_area">
                    <h2 class="tit">1:1문의내역</h2>
                    <a class="btnMore" id="wishListMore" href="#">더보기〉</a>
                    <hr width=100%>
                </div>
                <div class="list-customer">
                    <ul class="nodata_ul">
                        <!--
                        <c:choose>
                            <c:when test="el{empty untitled}">
                                     최근1개월간 없다
                            </c:when>
                            <c:otherwise>                                   
                                <c:choose>
                                    <c:when test="el{untitled ne null}">1:1답변대기</c:when>
                                    <c:otherwise>1:1답변완료</c:otherwise>
                                </c:choose>
                                    el{untitled}
                                    <c:if test="el{untitled ne null }">el{1:1문의등록일}</c:if>                                                
                            </c:otherwise>
                        </c:choose>
                        -->
                        <li class="nodata">최근 1개월만 문의하신 내용이 없습니다.</li>                                              
                    </ul>
                </div>
            </div>
            <div class="right">
                <div class="tit_area">
                    <h2 class="tit">상품QnA내역</h2>
                    <a class="btnMore" id="wishListMore" href="#">더보기〉</a>
                    <hr width=100%>     
                </div>
                <div class="list-customer">
                    <ul class="nodata_ul">
                        <!-- c:if el{}사용 -->
                        <li class="nodata">최근 1개월만 문의하신 내용이 없습니다.</li>                      
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- footer -->
<div class="foot">
    <div class="foot_logo">
        <img src="../resources/CrueltyFree_logo.png" style="width: 70%;" />
    </div>
    
    <div class="foot_content">
        <a style="font-weight: bold; color:#000000;">크루얼티프리 주식회사</a><br><br>
        <a style="text-align: left; color:#4a4a4a;"> 대표이사: 정종진<br>
            주소: (31144) 충남 천안시 동남구 대흥로 215 7층, 8층<br><br>
            크루얼티프리에서 판매되는 상품 중에는 크루얼티프리에 입점한 개별 판매자가 판매하는 상품이 포함되어
            있습니다. 개별 판매자 판매 상품의 경우, 크루얼티프리는 통신판매중개자로서 통신판매의 당사자가 아니며
            판매자가 등록한 상품정보 및 거래 정보 등에 대하여 책임을 부담하지 않습니다.
        </a>
    </div>
</div>
</body>
</body>
</html>