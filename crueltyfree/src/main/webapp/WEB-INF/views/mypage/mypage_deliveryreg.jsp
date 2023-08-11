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

    .address_or_refund{
        width: 100%;
        height: 52px;   
        
        padding-inline-start: 0px;
        display : flex;
        justify-content: center;
        align-items : center;
        text-align: center;
        margin: 0px;    
    }

    .address_atag{
        float: left;
        width: 392px;
        height: 37px;
    }

    .refund_atag{
        float: left;
        width: 392px;
        height: 37px;
    }

    #address_atag{
        float: left;
        width: 392px;
        height: 37px;
        line-height: 35px;
    }

    #refund_atag{
        float: left;
        width: 392px;
        height: 37px;
        line-height: 35px;
    }
    
    ul li{      
        list-style:none;
    
    }
    
    .sub-title{
        height: 22px;
        padding-top: 27px;
        padding-bottom: 10px;
        margin: 0;
        
    }   

    
    .address_list{
        width: 100%;
        height:auto; 
        /* height는 auto로 해두면 편함 */
    
        
    }

    .address_list tr {
        width: 100%;
        height:53px;
    }

    .address_list th {
        width: 198px;
        height:53px;
    }

    .address_list td {
        height:53px;
    }

    .request_list{
        width: 100%;
        height:161px;
        
        
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

    .address_reg_background{
        width: 100%;
        height: 80px;
        
        display : flex;
        justify-content: center;
        align-items : center;
    }

    #address_ok{
        width: 200px;
        height: 50px;
        
        color: black;
        margin-left: 20px;                  
    }

    #address_cancel{
        width: 200px;
        height: 50px;
        
        color: black;
        margin-left: 20px;                  
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
            <tr><td>리뷰</td></tr>
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
            <h2 class="tit">배송지/환불계좌</h2>           
        </div>
        <ul class="address_or_refund">
            <li class="address_atag"><a href="#" id="address_atag">배송지</a></li>
            <li class="refund_atag"><a href="#" id="refund_atag">환불계좌</a></li>
        </ul>
        <h3 class="sub-title">배송지 등록</h3>
        <table class="address_list">
            <colgroup>
                <col style="width:25%;">
                <col style="width:75%;">
            </colgroup>
            <tbody>
                <tr>
                    <th>배송지명</th>
                    <td><input type="text" placeholder="최대 10자"><input type="checkbox" id="base-dlvp-yn-check"><label for="base-dlvp-yn-check">기본 배송지 설정</label>
                    </td>
                </tr>           
                <tr>
                    <th>받는분</th>
                    <td><input type="text" placeholder="최대 10자"></td>
                </tr>
                <tr>
                    <th>연락처</th>
                    <td><input type="text" placeholder="- 를 제외한 숫자입력"></td>
                </tr>
                <tr>
                    <th>주소</th>
                    <td><input type="text" placeholder="- 를 제외한 숫자입력"></td>
                </tr>
        </table>
        <h3 class="sub-title">배송지 요청사항</h3>
        <table class="request_list">
            <colgroup>
                <col style="width:170px">
                <col style="width:622px">
            </colgroup>
            <tbody>
                <tr type="exist" class="quick_area">
                    <th scope="row">공동현관 출입방법</th>
                    <td class="imp_data">
                        <span class="chk_area mgzero"><input type="radio" id="btn_door_manner_temp1" name="o2oVisitTypeSp" value="1" data-attr="^배송지정보_PC^1_공동현관 출입방법"><label for="btn_door_manner_temp1">비밀번호</label></span>
                        <span class="chk_area"><input type="radio" id="btn_door_manner_temp2" name="o2oVisitTypeSp" value="2" data-attr="^배송지정보_PC^1_공동현관 출입방법"><label for="btn_door_manner_temp2">경비실 호출</label></span>
                        <span class="chk_area"><input type="radio" id="btn_door_manner_temp3" name="o2oVisitTypeSp" value="3" data-attr="^배송지정보_PC^1_공동현관 출입방법"><label for="btn_door_manner_temp3">자유출입가능</label></span>
                        <span class="chk_area"><input type="radio" id="btn_door_manner_temp4" name="o2oVisitTypeSp" value="4" data-attr="^배송지정보_PC^1_공동현관 출입방법"><label for="btn_door_manner_temp4">기타사항</label></span>
                    </td>
                </tr>
                <tr type="exist" class="quick_area">
                    <th scope="row">공동현관 비밀번호</th>
                    <td class="imp_data">
                        <input type="text" id="door_type_exist" name="o2oVisitTypeDesc" value="" class="inpH28" title="공동현관 출입방법 상세내용." maxlength="20" style="width: 500px" data-attr="^배송지정보_PC^1_공동현관 비밀번호">
                    </td>
                </tr>
                <!--
                <tr type="exist" class="quick_area">
                    <th scope="row">경비실 호출방법</th>
                    <td class="imp_data">
                        <input type="text" id="door_type_exist" name="o2oVisitTypeDesc" value="" class="inpH28" title="공동현관 출입방법 상세내용." maxlength="20" style="width: 500px" data-attr="^배송지정보_PC^1_공동현관 비밀번호">
                    </td>
                </tr>
                <tr type="exist" class="quick_area">
                    <th scope="row">기타사항</th>
                    <td class="imp_data">
                        <input type="text" id="door_type_exist" name="o2oVisitTypeDesc" value="" class="inpH28" title="공동현관 출입방법 상세내용." maxlength="20" style="width: 500px" data-attr="^배송지정보_PC^1_공동현관 비밀번호">
                    </td>
                </tr>
                -->
            </tbody>
        </table>
        <div class="address_reg_background">                                                                        
            <button type="button" class="btnLookup" id="address_ok">확인</button>
            
           <%--  <form name="caq" action="${pageContext.request.contextPath}/mypage/mypage_deliverymain.do" method="get">
                        <input type="hidden" name="member_idx" value="1">
                    </form>
                    <a href="#" onclick="document.forms['caq'].submit();">
            배송지TEST</a> --%>
            
            <button type="button" class="btnLookup" id="address_cancel">취소</button>                                     
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
        