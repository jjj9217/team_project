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
        height: auto;
    }

    #list_tit{
        width: 350px;
        height: 40px;
        
    }

    .detailSearch{
        width: 1020px;
        height: 170px;
        
    }

    .serach_category_big{
        width: 1020px;
        height: 55px;
        
    }

    .serach_category_small{
        width: 1020px;
        height: 55px;
        
    }

    .saerch_price{
        width: 1020px;
        height: 55px;
        
    }
    
    .inner{
        width: 1020px;
        height: 54px;
        
    }

    .tit_classification{
        float:left;
        width: 150px;
        height: 54px;
        
    }

    .tit_classification2{
        margin: 0;
        width: 150px;
        height: 37px;
        padding-left: 20px;
        padding-top: 17px;

    }

    .classification{
        width: 18px;
        height: 18px;   
    }   

    .list_classification{
        float: left;
        width: 865px;
        height: 26px;
        
        padding-inline-start: 0px;
        margin: 0;  
        padding-top: 14px;  
        padding-bottom: 14px;   
    }
    
    .list_classification li{
        width: 155px;
        height: 27px;
        padding-left: 15px;
    }

    .cate_info_tx {
        margin: 60px 0 20px;
        font-size: 20px;
        color: #222;
        text-align: center;
        
    }

    ul li{      
        list-style:none;
        float: left;
    }   


    .price_input{
        width: 78px;
        height: 26px;
        padding-left: 10px;
        padding-right: 10px;
        border: 1px;
        margin: 0;
    }

    .cate_sort_box{
        width: 1020px;
        height: 49px;
        
    }

    .cate_sort{
        float: left;
        width: 839px;
        height: 35px;
        padding-top: 10px;
        
    }

    .cate_view{
        float: left;
        width: 181px;
        height: 35px;
        padding-top: 10px;  
        
    }

    .cate_view a {
        /* text-decoration: none; */
        color: black;
    }

    .cate_sort_tit{
        float: left;
        width: 595px;
        height: 30px;
        
        padding: 0;
        margin: 0;
    }

    .cate_sort_tit li{
        width: 103px;
        height: 20px;
        padding-left: 1px;
    }




    /* 상품목록복붙 */

    .product_list_background{
        width: 100%;
        height: 1950px;
        
        
    }




    .product_list{
            width: 250px;
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
    
    .paging{
        width:1020px;
        height:150px;
        float:left;
        display: flex;
        justify-content: center;
        align-items: center;
    }

    #td_paging{
        height: 70px;
        font: 20px Arial, Sans-serif;
        text-align: center;
        border-color: white;
        background-color: orange;
        
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
    <script>
function doAction(){
	   let min = document.getElementById("product_price_min");
	   let max = document.getElementById("product_price_max");
	   if(min.value.length==0){
		  min.value = 0;   
	   }
	   if(max.value.length==0){
		   max.value = 10000000; 
       }
	   return true;
    }
    </script>
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
    <div id="list_tit">
        ${exploreVo.searchWord}검색결과(전체 ${pageNav.totalRows}개의 상품)
    </div>
    <div class="detailSearch">      
        <div class="serach_category_big">
            <div class="inner">
                <div class="tit_classification">
                    <h4 class="tit_classification2">카테고리&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <button class="classification">+</button>
                    </h4>
                </div>
                
                <ul class="list_classification">
<!--                     <li><a href="javascript:function1();">스킨케어</a></li> -->
                    <li>
                    <form name="ca" action="product_list_enter_searchword.do" method="get">
                        <input type="hidden" name="category_code" value="1">
                    </form>
                    <a href="#" onclick="document.forms['ca'].submit();">스킨케어</a></li>
                    
                    <li>
                    <form name="ca2" action="product_list_enter_searchword.do" method="get">
                        <input type="hidden" name="category_code" value="2">
                    </form>
                    <a href="#" onclick="document.forms['ca2'].submit();">클렌징</a></li>
                    
                    <li><form name="ca3" action="product_list_enter_searchword.do" method="get">
                        <input type="hidden" name="category_code" value="3">
                    </form>
                    <a href="#" onclick="document.forms['ca3'].submit();">메이크업</a></li>
                    
                    
                    <li><form name="ca4" action="product_list_enter_searchword.do" method="get">
                        <input type="hidden" name="category_code" value="4">
                    </form>
                    <a href="#" onclick="document.forms['ca4'].submit();">바디케어</a></li>
                    
                    <li><form name="ca5" action="product_list_enter_searchword.do" method="get">
                        <input type="hidden" name="category_code" value="5">
                    </form>
                    <a href="#" onclick="document.forms['ca5'].submit();">헤어케어</a></li>
                    
                    <li><form name="ca6" action="product_list_enter_searchword.do" method="get">
                        <input type="hidden" name="category_code" value="6">
                    </form>
                    <a href="#" onclick="document.forms['ca6'].submit();">미용소품</a></li>                    
                    
                    
                    <%-- <c:forEach var="rowNum" begin="${pageNav.startNum}" end="${pageNav.endNum}">                        
                        <li>${productList[rowNum-1].category_code}</li>
                    </c:forEach> --%>
                </ul>                
            </div>
        </div>
    <c:if test="${pageNav.totalRows ne 0}">
        <div class="serach_category_small">
            <div class="inner">
	            <c:if test="${!empty exploreVo.category_code}">	                
	                <c:if test="${exploreVo.category_code ne 6}">
		                <div class="tit_classification">
		                    <h4 class="tit_classification2">카테고리&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		                        <button class="classification">+</button>
		                    </h4>                   
		                </div>
	                </c:if>
   	                
	                <ul class="list_classification">
	                    <c:if test="${pageNav.totalRows ne 0}">                    
	                    <c:if test="${exploreVo.category_code eq 1}">
		                    <li><a href="#">토너/로션/올인원</a></li>
		                    <li><a href="#" name="2">에센스/크림</a></li>
		                    <li><a href="#" name="3">미스트/오일</a></li>
	                    </c:if>
	                    
	                    <c:if test="${exploreVo.category_code eq 2}">
		                    <li><a href="#">폼</a></li>
		                    <li><a href="#">오일</a></li>
		                </c:if>
		                
		                <c:if test="${exploreVo.category_code eq 3}">
		                    <li><a href="#">립</a></li>
		                    <li><a href="#">베이스</a></li>
		                    <li><a href="#">아이</a></li>
		                </c:if>    
	
		                <c:if test="${exploreVo.category_code eq 4}">    
		                    <li><a href="#">샤워</a></li>
		                    <li><a href="#">로션</a></li>
		                </c:if>
		                
		                <c:if test="${exploreVo.category_code eq 5}">    
		                    <li><a href="#">샴푸</a></li>
		                    <li><a href="#">염색</a></li>
		                </c:if>
		                </c:if>	                  
	                </ul>
	            </c:if>  
	        </div>	        
        </div>
    </c:if>
        <div class="saerch_price">
            <div class="inner">
                <div class="tit_classification">                    
                    <h4 class="tit_classification2">가격대                     
                    </h4>                   
                </div>
                <ul class="list_classification">
                    <form action="product_list_enter_searchword.do" method="get" onsubmit="return doAction();">   
                    &nbsp;&nbsp;&nbsp;<input type="text" name="product_price_min" id="product_price_min" class="price_input" placeholder="최저가">~<input type="text" name="product_price_max" id="product_price_max" class="price_input" placeholder="최고가">
                    <button>가격대 적용</button>
                    </form>
                </ul>           
            </div>
            
            <div class="inner">                
                <c:choose>
                    <c:when test="${exploreVo.product_price_min ne 0 and exploreVo.product_price_max eq 10000000}">
                        ${exploreVo.product_price_min}원 ~<button>x</button>
                    </c:when>
                    <c:when test="${exploreVo.product_price_max ne 0 and exploreVo.product_price_min eq 0}">
                        ~ ${exploreVo.product_price_max}원<button>x</button>
                    </c:when>
                    <c:when test="${exploreVo.product_price_min ne 0 and exploreVo.product_price_max ne 0}">
                        ${exploreVo.product_price_min}원 ~ ${exploreVo.product_price_max}원<button>x</button>
                    </c:when>
                    <c:otherwise>
                        
                    </c:otherwise>
                </c:choose>

                <c:if test="${!empty exploreVo.category_code}">
                    ${exploreVo.category_code}<button>x</button>
	                    <c:if test="${!empty exploreVo.category_code_small}">
	                       ${exploreVo.category_code_small}<button>x</button>
	                    </c:if>
                </c:if>
            </div>                        
        </div>      
        <p class="cate_info_tx">
            전체<span>${pageNav.totalRows}</span>개의 상품이 등록되어 있습니다.
        </p>
        <div class="cate_sort_box">
            <div class="cate_sort">
                <ul class="cate_sort_tit">
                    <li>                    
                    <form name="sort_salecount" action="product_list_enter_searchword.do" method="get">
                        <input type="hidden" name="sort_salecount" value="1">
                    </form>
                    <a href="#" onclick="document.forms['sort_salecount'].submit();">판매수량순</a>                
                    </li>
                                        
                    <li>                    
                    <form name="sort_salecount2" action="product_list_enter_searchword.do" method="get">
                        <input type="hidden" name="sort_salecount" value="2">
                    </form>
                    <a href="#" onclick="document.forms['sort_salecount2'].submit();">최근등록순</a>                  
                    </li>                    
                    
                    <li>                    
                    <form name="sort_salecount3" action="product_list_enter_searchword.do" method="get">
                        <input type="hidden" name="sort_salecount" value="3">
                    </form>
                    <a href="#" onclick="document.forms['sort_salecount3'].submit();">평점순</a>                    
                    </li>
                    
                    <li>                    
                    <form name="sort_salecount4" action="product_list_enter_searchword.do" method="get">
                        <input type="hidden" name="sort_salecount" value="4">
                    </form>
                    <a href="#" onclick="document.forms['sort_salecount4'].submit();">높은가격순</a>                   
                    </li>
                    
                    <li>                    
                    <form name="sort_salecount5" action="product_list_enter_searchword.do" method="get">
                        <input type="hidden" name="sort_salecount" value="5">
                    </form>
                    <a href="#" onclick="document.forms['sort_salecount5'].submit();">낮은가격순</a>                   
                    </li>
                    
                </ul>
            </div>
            <div class="cate_view">
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;View&nbsp;
                
                <ul>
	                <li>
	                    <form name="sort_view_15" action="product_list_enter_searchword.do" method="get">
	                        <input type="hidden" name="sort_view" value="15">
	                    </form>
	                    <a href="#" onclick="document.forms['sort_view_15'].submit();">15</a>&nbsp;
	                </li>    
	                <li>
	                <form name="sort_view_30" action="product_list_enter_searchword.do" method="get">
	                        <input type="hidden" name="sort_view" value="30">
	                    </form>
	                    <a href="#" onclick="document.forms['sort_view_30'].submit();">30</a>&nbsp;
	                </li>    
	                <li>
	                <form name="sort_view_45" action="product_list_enter_searchword.do" method="get">
	                        <input type="hidden" name="sort_view" value="45">
	                    </form>
	                    <a href="#" onclick="document.forms['sort_view_45'].submit();">45</a>
	                </li>
                </ul>
                
                
                
                
                
                
                
            </div>
        </div>
        <div class="product_list_background">               
            <ul>            
                <%-- <c:choose>
                    <c:when test="${exploreVo.view eq 15}">
                                
                    </c:when>                                            
                    <c:when test="${exploreVo.view eq 30}">
                                          
                    </c:when>                        
                    <c:otherwise>
                        
                    </c:otherwise>
                </c:choose> --%>
                <c:forEach var="rowNum" begin="${pageNav.startNum}" end="${pageNav.endNum}">
	               <c:if test="${!empty productList[rowNum-1].product_name}">
		                <li class="product_list">
		                    <div class="prd_info">                    
		                        <div class="goodlist_thumb_background">
		                            <a href="#"><img class="goodlist_thumb" src="${pageContext.request.contextPath}/resources/uploads/${fileList[rowNum-1].saveFile}"></a>
		                        </div>
		                        <div class="prd_name">                        
		                            <a href="#" class="goodlist">
		                                <p class="prd_title">${productList[rowNum-1].product_name}</p>
		                            </a>
		                        </div>
		                        <p class="prd_price">${productList[rowNum-1].product_price}원</p>     
		                   </div>
		                </li>
                   </c:if>		                
                </c:forEach>              
           </ul>
           <div class="paging">
	            <table>
		            <tr>
			            <td id="td_paging" colspan="6">
			                <!-- 페이지 네비게이션 구현 -->
			                <%@ include file="paging.jsp" %>
			            </td>
		           </tr>
		        </table>   
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