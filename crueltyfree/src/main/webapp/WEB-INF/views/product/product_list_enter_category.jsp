<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List, java.util.HashMap, java.util.Map" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>

<c:choose>
	<c:when test="${exploreVo.category_code eq 'skin'}">
		스킨케어 | CrueltyFree
	</c:when>
	<c:when test="${exploreVo.category_code eq 'clensing'}">
		클렌징 | CrueltyFree
	</c:when>
	<c:when test="${exploreVo.category_code eq 'makeup'}">
		메이크업 | CrueltyFree
	</c:when>
	<c:when test="${exploreVo.category_code eq 'body'}">
		바디케어 | CrueltyFree
	</c:when>
	<c:when test="${exploreVo.category_code eq 'hair'}">
		헤어케어 | CrueltyFree
	</c:when>
	<c:when test="${exploreVo.category_code eq 'prop'}">
		미용소품 | CrueltyFree
	</c:when>
	<c:when test="${exploreVo.category_code_small eq 'skin_1'}">
		토너/로션/올인원 | CrueltyFree
  	</c:when>
	<c:when test="${exploreVo.category_code_small eq 'skin_2'}">
		에센스/크림 | CrueltyFree
	</c:when>
	<c:when test="${exploreVo.category_code_small eq 'skin_3'}">
		미스트/오일 | CrueltyFree
	</c:when>
	<c:when test="${exploreVo.category_code_small eq 'clensing_1'}">
		클렌징폼/젤 | CrueltyFree
	</c:when>
	<c:when test="${exploreVo.category_code_small eq 'clensing_2'}">
		오일/워터/리무버 | CrueltyFree
	</c:when>
	<c:when test="${exploreVo.category_code_small eq 'makeup_1'}">
 		립메이크업 | CrueltyFree
	</c:when>
	<c:when test="${exploreVo.category_code_small eq 'makeup_2'}">
		베이스메이크업 | CrueltyFree
	</c:when>
	<c:when test="${exploreVo.category_code_small eq 'makeup_3'}">
		아이메이크업 | CrueltyFree
	</c:when>
	<c:when test="${exploreVo.category_code_small eq 'body_1'}">
  		샤워/입욕 | CrueltyFree
	</c:when>
	<c:when test="${exploreVo.category_code_small eq 'body_2'}">
		로션/오일 | CrueltyFree
	</c:when>
	<c:when test="${exploreVo.category_code_small eq 'hair_1'}">
		샴푸/린스/트리트먼트 | CrueltyFree
	</c:when>
	<c:when test="${exploreVo.category_code_small eq 'hair_2'}">
		염색약/펌 | CrueltyFree
	</c:when>
	<c:otherwise>
		베스트 | CrueltyFree
	</c:otherwise>
</c:choose>

</title>
<link rel="icon" href="${pageContext.request.contextPath}/resources/img/favicon.png">

<style>
	* {margin: 0; padding: 0;}
    a{text-decoration: none;}
    input[type="button"], input[type="submit"], input[type="checkbox"], select, input[type="radio"], label, button{cursor: pointer;}
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
         width: 1020px; 
         height: auto; 
         margin: 0 auto;
         background-color: white;
     }
              
    
    /* 바디 CSS */

    #Container{
        overflow: hidden
        width: 1020px; 
        margin: 0 auto;
        height: auto;
    }

    #list_tit{
        width: 1020px;
        margin-top: 50px;
        margin-bottom: 10px;
        height: 40px;
        text-align: center;
        font: bold 25px Arial, sans-serif;
        color: #4a4a4a;
    }

    .detailSearch{
        width: 1020px;
        height: 112px;
        display: flex;
        justify-content: center;
        align-items: center;
    }

    .cate_info_tx {
        margin: 60px 0 30px 0;
        font-size: 19px;
        color: #222222;
        text-align: center;
        letter-spacing: -1px;
    }

    .price_input{
        width: 78px;
        height: 26px;
        padding-left: 10px;
        padding-right: 10px;
        border: 1px;
        margin: 0;
    }

    .cate_sort_box {
        width: 1020px;
        height: 50px; 
        border-top: 4px solid #ededed;
        border-bottom: 1px solid #ededed;
        margin-bottom: 30px;
    }

    .cate_sort {
        float: left;
        width: 838px;
        height: 35px;
        padding-top: 15px;
    }
    
	.cate_sort a {
        color: #4a4a4a;
        font-weight: bold;
    }

    .cate_view {
    	float: right;
        width: 179px;
        height: 50px;
        text-align: center;
        border-left: 1px solid #ededed;
        display: inline-block;
    }
    
    .cate_view ul {
    	display: inline-block;
    	padding-top: 15px;
    	list-style: none;
    }
    
    .cate_view li {
    	width: 30px;
    	font-size: 14px;
    	list-style: none;
    	float: left;
    }
    
    .cate_view a {
    	color: #4a4a4a;
        font-weight: bold;
    }

    .cate_sort_tit {
        float: left;
        width: 460px;
        height: 30px;

        padding: 0;
        margin: 0;
        text-align: center;
        color: #000000;
		list-style:none;
    }

    .cate_sort_tit li {
        width: 90px;
        height: 20px;
        font-size: 14px;
        color: #000000;
        border-right: 1px solid #ededed;
        list-style:none;
        float: left;
    }

    /* 상품목록복붙 */

    .product_list_background {
        width: 1020px;
        height: auto;
        background-color: #eef3f5;
    }

    .product_list {
		width: 340px;
		height: 360px;
            
		display: flex;
		justify-content: center;
		align-items: center;
		float: left;
		list-style:none;
	}
	
	.prd_info {
		width: 180px;
		height: 290px;
		text-align: center;
	}

    .prd_price {
		width: 180px;
		height: 25px;

		text-align: center;
		font-size: 20px;
		font-weight: bold;
		line-height: 25px;
		color: #7d99a4;
	}
	
    .prd_price a {
		color: #7d99a4;
	}

	.prd_nickname {
		text-align: center;
		color: #6b6b6b;
		font-size: 13px;
		font-weight: bold;
		margin-bottom: 5px;
	}

	.prd_name {
		width: 180px;
		height: 50px;
		display:-webkit-box; 
	    word-wrap: break-word; 
	    -webkit-line-clamp:2; 
	    -webkit-box-orient: vertical; 
	    overflow: hidden; 
	    text-overflow: ellipsis;
	    line-height: 25px;
	    font-size: 14.5px;
    }
    
	.prd_name a {
		color: #4a4a4a;
	}

    .prd_title {     
		text-align: center;
		font-size: 14px;
		line-height: 55px;
	}

	.goodlist_thumb_background {
		width: 190px;
		height: 190px;
		margin-bottom: 10px;
	}
    
	.goodlist_thumb{
		width: 180px;
		height: 180px;       
	}

    #imgArea{
            width: 100%;
            height: 80px;
            padding-inline-start: 0px;
            
            display : flex;
            justify-content: center;
            align-items : center;
            text-align: center;
        }

        #imgArea li{
            width: 120px;
            height: 80px;
            float: left;
			list-style:none;
        }

        .btn_img_add{
            width: 80px;
            height: 80px;
        }

        .rw-photo-list p{
            font-size: 10px;
            text-align: center;
            
        }

        .category_small_img{
            width: 75px;
            height: 75px;
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
        
    }
    
    .smallimg{
        width: 100px;
        height: 100px;
    }
    
	#banner_name{font: bold 12px Arial, sans-serif;}
	#clear{clear: both;}
	.soldOutNotice{
	color:rgb(216, 98, 98); font-size:16px;
	}
	#next{
		background-color:#7d99a4;
		border :0;
		color:white;
		font: bold 15px Arial, Sans-serif;
		border-radius:3px;
		width:50px;
		height:25px;
	}
	#end{
		background-color:rgb(221, 219, 214);
		border :0;
		font: bold 15px Arial, Sans-serif;
		border-radius:3px;
		width:50px;
		height:25px;
	}	
	.other{color:#4a4a4a;}
</style>

<script type="text/javascript" src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<script>
function getParameterValue(parameterName) {
    const queryString = window.location.search;
    const urlParams = new URLSearchParams(queryString);

    if (urlParams.has(parameterName)) {
        return urlParams.get(parameterName);
    }

    return null; // 파라미터가 없으면 null 반환
}


function ProductDetail(category_code, category_code_small, 
        sort_salecount, sort_view, 
        pageNum, pageBlock) {

    var insertcategory_code_small ="";
    const paramcategory_code_small = getParameterValue("category_code_small");
    if(category_code_small === ""){
        if(paramcategory_code_small === null){
        insertcategory_code_small = '';}
        else{
        insertcategory_code_small = paramcategory_code_small;}
    }else{
        insertcategory_code_small = category_code_small;
        pageNum=1;
        pageBlock=1;
        
    }

    
    var insertcategory_code ="";
    const paramcategory_code = getParameterValue("category_code");
    if(category_code === ""){

        
        if(paramcategory_code === null){
        insertcategory_code = '';
        }
        else{
        insertcategory_code = paramcategory_code;
        }
        
    }else{
        insertcategory_code = category_code;
        insertcategory_code_small="";
        pageNum=1;
        pageBlock=1;
        
        
    }
        
    var insertsort_salecount ="";
    const paramsort_salecount = getParameterValue("sort_salecount");
    if(sort_salecount === ""){
        if(paramsort_salecount === null){
        insertsort_salecount = '';}
        else{
        insertsort_salecount = paramsort_salecount;}
    }else{
        insertsort_salecount = sort_salecount;
        pageNum=1;
        pageBlock=1;
    }
    
    
    var insertsort_view ="";
    const paramsort_view = getParameterValue("sort_view");
    if(sort_view === ""){
        if(paramsort_view === null){        
        insertsort_view = 15;}
        else{
        insertsort_view = paramsort_view;}
    }else{
        insertsort_view = sort_view;
        pageNum=1;
        pageBlock=1;
        
    }
    
    
    // 새 URL 구성    
    var newURL = "product_list_enter_category.do" +  
    "?category_code=" + insertcategory_code +
    "&category_code_small=" + insertcategory_code_small +
    "&sort_salecount=" + insertsort_salecount +
    "&sort_view=" + insertsort_view +
    "&pageNum=" + pageNum +
    "&pageBlock=" + pageBlock;
    // URL로 이동
    window.location.href = newURL;

    
}

</script>


</head>
<body>

	<header>    
        <jsp:include page="../main/header.jsp"/>    
    </header>
    
<!-- body시작 -->

<div id="Container">
       
	<c:choose>
		<c:when test="${!empty exploreVo.category_code and empty exploreVo.category_code_small}">
			<!--     큰 카테고리로 진입시 -->
		    <div id="list_tit">
		          <c:choose>
		              <c:when test="${exploreVo.category_code eq 'skin'}">
		              스킨케어
		              </c:when>
		              <c:when test="${exploreVo.category_code eq 'clensing'}">
                      클렌징
                      </c:when>
                      <c:when test="${exploreVo.category_code eq 'makeup'}">
                      메이크업
                      </c:when>
                      <c:when test="${exploreVo.category_code eq 'body'}">
                      바디케어
                      </c:when>
                      <c:when test="${exploreVo.category_code eq 'hair'}">
                      헤어케어
                      </c:when>
                      <c:when test="${exploreVo.category_code eq 'prop'}">
                      미용소품
                      </c:when>
                      <c:otherwise></c:otherwise>
		          </c:choose>
		    </div>		
		</c:when>
		<c:when test="${!empty exploreVo.category_code_small}">
			<!--     작은 카테고리로 진입시 -->
		    <div id="list_tit">
		          <c:choose>
                      <c:when test="${exploreVo.category_code_small eq 'skin_1'}">
                      토너/로션/올인원
                      </c:when>
                      <c:when test="${exploreVo.category_code_small eq 'skin_2'}">
                      에센스/크림
                      </c:when>
                      <c:when test="${exploreVo.category_code_small eq 'skin_3'}">
                      미스트/오일
                      </c:when>
                      <c:when test="${exploreVo.category_code_small eq 'clensing_1'}">
                      클렌징폼/젤
                      </c:when>
                      <c:when test="${exploreVo.category_code_small eq 'clensing_2'}">
                      오일/워터/리무버
                      </c:when>
                      <c:when test="${exploreVo.category_code_small eq 'makeup_1'}">
                      립메이크업
                      </c:when>
                      <c:when test="${exploreVo.category_code_small eq 'makeup_2'}">
                      베이스메이크업
                      </c:when>
                      <c:when test="${exploreVo.category_code_small eq 'makeup_3'}">
                      아이메이크업
                      </c:when>
                      <c:when test="${exploreVo.category_code_small eq 'body_1'}">
                      샤워/입욕
                      </c:when>
                      <c:when test="${exploreVo.category_code_small eq 'body_2'}">
                      로션/오일
                      </c:when>
                      <c:when test="${exploreVo.category_code_small eq 'hair_1'}">
                      샴푸/린스/트리트먼트
                      </c:when>
                      <c:when test="${exploreVo.category_code_small eq 'hair_2'}">
                      염색약/펌
                      </c:when>
                      <c:otherwise></c:otherwise>
                  </c:choose>
		    </div>		
		</c:when>
		<c:otherwise>
		</c:otherwise>
	</c:choose>


   
    <c:choose>
    	<c:when test="${exploreVo.category_code eq 'skin'}">    	
		<!--     스킨 3개 -->
		    <div class="detailSearch">
		        <ul id="imgArea">
		            <li class="imgArea1">
		                <a href="${pageContext.request.contextPath}/product/product_list_enter_category.do?category_code_small=skin_1" >
		                     <img class="smallimg" src="${pageContext.request.contextPath}/resources/img/skin_1.png" class="head_logo">
		                </a>
		                <p id="banner_name">토너/로션/올인원</p>		                
		            </li>
		            <li class="imgArea2">
		                <a href="${pageContext.request.contextPath}/product/product_list_enter_category.do?category_code_small=skin_2">
                             <img class="smallimg" src="${pageContext.request.contextPath}/resources/img/skin_2.png" class="head_logo">
                        </a>
                        <p id="banner_name">에센스/크림</p>
		            </li>
		            <li class="imgArea3">
		                <a href="${pageContext.request.contextPath}/product/product_list_enter_category.do?category_code_small=skin_3">
                             <img class="smallimg" src="${pageContext.request.contextPath}/resources/img/skin_3.png" class="head_logo">
                        </a>
                        <p id="banner_name">미스트/오일</p>
		            </li>
		        </ul>
		    </div>
		</c:when>
    	
    	<c:when test="${exploreVo.category_code eq 'clensing'}">    		    		   
		<!--     클렌징 2개 -->
		    <div class="detailSearch">
		        <ul id="imgArea">
		            <li class="imgArea1">
		                <a href="${pageContext.request.contextPath}/product/product_list_enter_category.do?category_code_small=clensing_1">
                             <img class="smallimg" src="${pageContext.request.contextPath}/resources/img/clean_1.png" class="head_logo">
                        </a>
                        <p id="banner_name">클렌징폼/젤</p>
		            </li>
		            <li class="imgArea2">
		                <a href="${pageContext.request.contextPath}/product/product_list_enter_category.do?category_code_small=clensing_2">
                             <img class="smallimg" src="${pageContext.request.contextPath}/resources/img/clean_2.png" class="head_logo">
                        </a>
                        <p id="banner_name">오일/워터/리무버</p>
		            </li>
		        </ul>
		    </div>
		</c:when>
    	    
		<c:when test="${exploreVo.category_code eq 'makeup'}">    
		<!--     메이크업3개 -->
		    <div class="detailSearch">
		        <ul id="imgArea">
		            <li class="imgArea1">
		                <a href="${pageContext.request.contextPath}/product/product_list_enter_category.do?category_code_small=makeup_1">
                             <img class="smallimg" src="${pageContext.request.contextPath}/resources/img/makeup_1.png" class="head_logo">
                        </a>
                        <p id="banner_name">립메이크업</p>
		            </li>
		            <li class="imgArea2">
		                <a href="${pageContext.request.contextPath}/product/product_list_enter_category.do?category_code_small=makeup_2">
                             <img class="smallimg" src="${pageContext.request.contextPath}/resources/img/makeup_2.png" class="head_logo">
                        </a>
                        <p id="banner_name">베이스메이크업</p>
		            </li>
		            <li class="imgArea3">
		                <a href="${pageContext.request.contextPath}/product/product_list_enter_category.do?category_code_small=makeup_3">
                             <img class="smallimg" src="${pageContext.request.contextPath}/resources/img/makeup_3.png" class="head_logo">
                        </a>
                        <p id="banner_name">아이메이크업</p>
		            </li>
		        </ul>
		    </div>
		</c:when>
    	    
		<c:when test="${exploreVo.category_code eq 'body'}">    
		<!--     바디케어2개 -->
		    <div class="detailSearch">
		        <ul id="imgArea">
		            <li class="imgArea1">
		                <a href="${pageContext.request.contextPath}/product/product_list_enter_category.do?category_code_small=body_1">
                             <img class="smallimg" src="${pageContext.request.contextPath}/resources/img/body_1.png" class="head_logo">
                        </a>
                        <p id="banner_name">샤워/입욕</p>
		            </li>
		            <li class="imgArea2">
		                <a href="${pageContext.request.contextPath}/product/product_list_enter_category.do?category_code_small=body_2">
                             <img class="smallimg" src="${pageContext.request.contextPath}/resources/img/body_2.png" class="head_logo">
                        </a>
                        <p id="banner_name">로션/오일</p>
		            </li>
		        </ul>
		    </div>
		</c:when>
    	    
		<c:when test="${exploreVo.category_code eq 'hair'}">    
		<!--     헤어케어2개 -->
		    <div class="detailSearch">
		        <ul id="imgArea">
		            <li class="imgArea1">
		                <a href="${pageContext.request.contextPath}/product/product_list_enter_category.do?category_code_small=hair_1">
                             <img class="smallimg" src="${pageContext.request.contextPath}/resources/img/hair_1.png" class="head_logo">
                        </a>
                        <p id="banner_name">샴푸/린스/트리트먼트</p>
		            </li>
		            <li class="imgArea2">
		                <a href="${pageContext.request.contextPath}/product/product_list_enter_category.do?category_code_small=hair_2">
                             <img class="smallimg" src="${pageContext.request.contextPath}/resources/img/hair_2.png" class="head_logo">
                        </a>
                        <p id="banner_name">염색약/펌</p>
		            </li>
		        </ul>
		    </div>
		</c:when>
    	    
		<c:when test="${exploreVo.category_code eq 'prop'}">    
		<!-- 	미용소품0개 -->
		    <div class="detailSearch">
		        <ul id="imgArea">
		            
		        </ul>
		    </div>
    	</c:when>
          
    	<c:otherwise>
    	</c:otherwise>
    </c:choose>
    
    
    
    
    
    
    
    
       
        <p class="cate_info_tx">
            전체<span style="color: #7d99a4; font-weight: bold;"> ${pageNav.totalRows} </span>개의 상품이 등록되어 있습니다.
        </p>
        <div class="cate_sort_box">
            <div class="cate_sort">
                <ul class="cate_sort_tit">
                  <li>                    
                    <form name="sort_salecount" action="product_list_enter_searchword.do" method="get">
                        <input type="hidden" name="sort_salecount" value="1">
                    </form>
                    
                    <a href="#" onclick="ProductDetail('${ExploreVo.category_code}', '${ExploreVo.category_code_small}', '1', '${ExploreVo.sort_view}', '${pageNav.pageNum}', '${pageNav.pageBlock}')">판매수량순</a>                
                    </li>
                                        
                    <li>                                       
                    <a href="#" onclick="ProductDetail('${ExploreVo.category_code}', '${ExploreVo.category_code_small}', '2', '${ExploreVo.sort_view}', '${pageNav.pageNum}', '${pageNav.pageBlock}')">최근등록순</a>                  
                    </li>                    
                    
                    <li>                                        
                    <a href="#" onclick="ProductDetail('${ExploreVo.category_code}', '${ExploreVo.category_code_small}', '3', '${ExploreVo.sort_view}', '${pageNav.pageNum}', '${pageNav.pageBlock}')">평점순</a>                    
                    </li>
                    
                    <li>                                        
                    <a href="#" onclick="ProductDetail('${ExploreVo.category_code}', '${ExploreVo.category_code_small}', '4', '${ExploreVo.sort_view}', '${pageNav.pageNum}', '${pageNav.pageBlock}')">높은가격순</a>                    
                    </li>
                    
                    <li>                                        
                    <a href="#" onclick="ProductDetail('${ExploreVo.category_code}', '${ExploreVo.category_code_small}', '5', '${ExploreVo.sort_view}', '${pageNav.pageNum}', '${pageNav.pageBlock}')">낮은가격순</a>                   
                    </li>
                    
                </ul>
            </div>
            <div class="cate_view">
                <ul>
                	<li style="width:40px;"><a>View</a></li>
	                <li>
	                   <a href="#" onclick="ProductDetail('${ExploreVo.category_code}', '${ExploreVo.category_code_small}', '${ExploreVo.sort_salecount}', '15', '${pageNav.pageNum}', '${pageNav.pageBlock}')">15</a>&nbsp;
	                </li>    
	                <li>
	                    <a href="#" onclick="ProductDetail('${ExploreVo.category_code}', '${ExploreVo.category_code_small}', '${ExploreVo.sort_salecount}', '30', '${pageNav.pageNum}', '${pageNav.pageBlock}')">30</a>&nbsp;
	                </li>    
	                <li>	                    
	                    <a href="#" onclick="ProductDetail('${ExploreVo.category_code}', '${ExploreVo.category_code_small}', '${ExploreVo.sort_salecount}', '45', '${pageNav.pageNum}', '${pageNav.pageBlock}')">45</a>	                    
	                </li>           
                </ul>
                                                        
                
                               
            </div>
        </div>
        <div class="product_list_background">               
            <ul>                
                <c:forEach var="rowNum" begin="${pageNav.startNum}" end="${pageNav.endNum}">
	               <c:if test="${!empty productList[rowNum-1].product_name}">
		                <li class="product_list">
		                    <div class="prd_info">                    
		                        <div class="goodlist_thumb_background">
		                            <a href="${pageContext.request.contextPath}/product/product_view.do?prdNum=${productList[rowNum-1].product_idx}"><img class="goodlist_thumb" src="${pageContext.request.contextPath}/resources/uploads/${fileList[rowNum-1].saveFile}"></a>
		                        </div>
		                        <div class="prd_nickname">
		                        	<a>${productList[rowNum-1].member_nickname}</a>
		                        </div>
		                        <div class="prd_name">                        
		                            <a href="${pageContext.request.contextPath}/product/product_view.do?prdNum=${productList[rowNum-1].product_idx}" class="goodlist">
		                                ${productList[rowNum-1].product_name}
		                            </a>
		                        </div>
		                        <p class="prd_price">
			                        <c:choose>
										<c:when test="${productList[rowNum-1].product_capa == 0}">
											<span class="soldOutNotice">[SOLD OUT] 일시품절</span>
										</c:when>
										<c:otherwise>
											<fmt:formatNumber value="${productList[rowNum-1].product_price}" pattern="###,###" />원
										</c:otherwise>
									</c:choose>
		                        </p>     
		                   </div>
		                </li>
                   </c:if>		                
                </c:forEach>              
           </ul>
           <div class="paging">
	            <table>
		            <tr>
			            <td id="td_paging" colspan="6">
			            
			            
			            
			            
			            
			            
			            
		<c:if test="${pageNav.pageNum > pageNav.pages_per_block}">
	    	<a href="#" onclick="ProductDetail('${ExploreVo.category_code}', '${ExploreVo.category_code_small}','${ExploreVo.sort_salecount}', '${ExploreVo.sort_view}', '1', '1')">
	    		<input type="button" id="end" value="처음"></a>&nbsp;
	    	<a href="#"onclick="ProductDetail('${ExploreVo.category_code}', '${ExploreVo.category_code_small}','${ExploreVo.sort_salecount}', '${ExploreVo.sort_view}', '${(pageNav.pageBlock - 2)*pageNav.pages_per_block + 1}', '${pageNav.pageBlock-1}')">
	    		<input type="button" id="next" value="이전">
	    	</a>   	
	    </c:if>
	    	
	    <c:forEach var="i" begin="${(pageNav.pageBlock-1)*pageNav.pages_per_block + 1}" end="${pageNav.pageBlock*pageNav.pages_per_block}">
	    	<c:if test="${i le pageNav.totalPageNum}">
	    		<c:choose>
	    			<c:when test = "${pageNav.pageNum eq i}">
	    				<a href="#" onclick="ProductDetail('${ExploreVo.category_code}', '${ExploreVo.category_code_small}','${ExploreVo.sort_salecount}', '${ExploreVo.sort_view}', '${pageNav.pageNum}', '${pageNav.pageBlock}')">
	    					<span style="color:#7d99a4">${i}&nbsp;</span>
	    				</a>
	    			</c:when>
	    			<c:otherwise>
	    				<a href="#" onclick="ProductDetail('${ExploreVo.category_code}', '${ExploreVo.category_code_small}','${ExploreVo.sort_salecount}', '${ExploreVo.sort_view}', '${i}', '${pageNav.pageBlock}')">
	    					<span class="other">${i}&nbsp;</span>
	    				</a>
	    			</c:otherwise>
	   		</c:choose>
	    	</c:if>
	    </c:forEach>
	    
	    <c:if test="${((pageNav.rows_per_page*pageNav.pages_per_block) lt pageNav.totalRows) and (pageNav.pageBlock ne pageNav.lastPageBlock) }">
	    	<a href="#" onclick="ProductDetail('${ExploreVo.category_code}', '${ExploreVo.category_code_small}','${ExploreVo.sort_salecount}', '${ExploreVo.sort_view}', '${pageNav.pageBlock*pageNav.pages_per_block+1}', '${pageNav.pageBlock+1}')"><input type="button" id="next" value="다음"></a>&nbsp;
	    	<a href="#" onclick="ProductDetail('${ExploreVo.category_code}', '${ExploreVo.category_code_small}','${ExploreVo.sort_salecount}', '${ExploreVo.sort_view}', '${pageNav.totalPageNum}', '${pageNav.lastPageBlock}')"><input type="button" id="end" value="마지막"></a>
	    </c:if>
			           
			           
			            </td>
		           </tr>
		        </table>   
           </div>           
    </div>
</div>
<div id="clear"></div>
</body>
<!-- footer -->
<footer>
        <jsp:include page="../main/footer.jsp"/>        
</footer>
</body>
</html>