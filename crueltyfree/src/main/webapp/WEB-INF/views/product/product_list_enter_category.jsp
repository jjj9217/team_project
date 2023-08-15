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
<title>Header</title>
<style>
	*{margin: 0; padding: 0;}
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
        overflow: hidden;
        width: 1020px; 
        margin: 0 auto;
        height: auto;
    }

    #list_tit{
        width: 1020px;
        margin-top:70px;
        height: 70px;
        text-align:center;
        font: bold 25px Arial, sans-serif;
    }

    .detailSearch{
        width: 1020px;
        height: 112px;
        display: flex;
        justify-content: center;
        align-items: center;
    }

    


    .cate_info_tx {
        margin: 20px 0 20px;
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
        text-decoration: none;
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
        height: 301px;
        
    }




    .product_list{
            width: 300px;
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
        background-color: orange;
        
    }
    
    .smallimg{
        width:75px;
        height:75px;
    }
	#banner_name{font: bold 11px Arial, sans-serif;}
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
  alert(pageNum);
  alert(pageBlock);
	  var p = pageNum.value;
	  var b = pageBlock.value;
  alert('페이지넘'+p);
  alert('페이지블락'+b);
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
		    <div id="list_tit" style="background-color:red">
		       
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
		        작은카테고리명 : 
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
                        <p id="banner_name">클렌징폼/젤</p>
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
            전체<span>${pageNav.totalRows}</span>개의 상품이 등록되어 있습니다.
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
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;View&nbsp;
                
                <ul>
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
		                        <div class="prd_name">                        
		                            <a href="${pageContext.request.contextPath}/product/product_view.do?prdNum=${productList[rowNum-1].product_idx}" class="goodlist">
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
			            
			            
			            
			            
			            
			            
			            
			            <c:if test="${pageNav.pageNum > pageNav.pages_per_block}">
			<a href="#" onclick="ProductDetail('${ExploreVo.searchWord}', '${ExploreVo.category_code}', '${ExploreVo.category_code_small}', '${ExploreVo.product_price_min}', '${ExploreVo.product_price_max}', '${ExploreVo.sort_salecount}', '${ExploreVo.sort_view}', '1', '1')">			            
    		&lt;&lt;</a>&nbsp;
    		<a href="#" onclick="ProductDetail('${ExploreVo.searchWord}', '${ExploreVo.category_code}', '${ExploreVo.category_code_small}', '${ExploreVo.product_price_min}', '${ExploreVo.product_price_max}', '${ExploreVo.sort_salecount}', '${ExploreVo.sort_view}', '${(pageNav.pageBlock - 2)*pageNav.pages_per_block + 1}', '${pageNav.pageBlock-1}')">
    			&lt;이전페이지
    		</a>   	
    	</c:if>
			            
			            <c:forEach var="i" begin="${(pageNav.pageBlock-1)*pageNav.pages_per_block + 1}" end="${pageNav.pageBlock*pageNav.pages_per_block}">
            <c:if test="${i le pageNav.totalPageNum}">
                <c:choose>
                    <c:when test = "${pageNav.pageNum eq i}">
                        <a href="#" onclick="ProductDetail('${ExploreVo.searchWord}', '${ExploreVo.category_code}', '${ExploreVo.category_code_small}', '${ExploreVo.product_price_min}', '${ExploreVo.product_price_max}', '${ExploreVo.sort_salecount}', '${ExploreVo.sort_view}', '${pageNav.pageNum}', '${pageNav.pageBlock}')">
                            <span style="color:red">${i}&nbsp;</span>
                        </a>
                    </c:when>
                    <c:otherwise>
                        <a href="#" onclick="ProductDetail('${ExploreVo.searchWord}', '${ExploreVo.category_code}', '${ExploreVo.category_code_small}', '${ExploreVo.product_price_min}', '${ExploreVo.product_price_max}', '${ExploreVo.sort_salecount}', '${ExploreVo.sort_view}', '${i}', '${pageNav.pageBlock}')">${i}&nbsp;</a>
                    </c:otherwise>
            </c:choose>
            </c:if>
        </c:forEach>
    
        <c:if test="${((pageNav.rows_per_page*pageNav.pages_per_block) lt pageNav.totalRows) and (pageNav.pageBlock ne pageNav.lastPageBlock) }">
            <a href="#" onclick="ProductDetail('${ExploreVo.searchWord}', '${ExploreVo.category_code}', '${ExploreVo.category_code_small}', '${ExploreVo.product_price_min}', '${ExploreVo.product_price_max}', '${ExploreVo.sort_salecount}', '${ExploreVo.sort_view}', '${pageNav.pageBlock*pageNav.pages_per_block+1}', '${pageNav.pageBlock+1}')">다음페이지&gt;</a>&nbsp;
            <a href="#" onclick="ProductDetail('${ExploreVo.searchWord}', '${ExploreVo.category_code}', '${ExploreVo.category_code_small}', '${ExploreVo.product_price_min}', '${ExploreVo.product_price_max}', '${ExploreVo.sort_salecount}', '${ExploreVo.sort_view}', '${pageNav.totalPageNum}', '${pageNav.lastPageBlock}')">&gt;&gt;</a>
        </c:if>
			            
			            
			            
			            
			            
			            
			            
			            
			            
			            
			            
			            
			            
			            
			            
			            
			            
			            
			            
			            
			                
			                
			                
			                
			                <!-- 페이지 네비게이션 구현 -->
			                <%-- <%@ include file="paging.jsp" %> --%>
			            </td>
		           </tr>
		        </table>   
           </div>           
    </div>
</div>
</div>




<!-- footer -->
<footer>
        <jsp:include page="../main/footer.jsp"/>        
    </footer>
</body>
</body>
</html>