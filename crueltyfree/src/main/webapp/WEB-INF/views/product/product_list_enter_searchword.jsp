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
         width: 1020px; height: auto; margin: 0 auto;
         background-color: white;
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
    
    #category_code_btn{
    }


</style>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<script>
    
    
/* function doAction(){
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

$(document).ready(function(){
	$("#category_code_1").click(function(){ 
		var asd = $("#qwe").val();
		
		var price
		var category_small
		var srot
		var view_sort
		
		if(asd != null and price=null and category_small=null and srot=null and view_sort=null)
		window.location.href = "product_list_enter_searchword.do?category_code="+asd&sort_salecount=1&sort_view=15;
		else(asd != null and price != null and category_small=null and srot=null and view_sort=null){
		window.location.href = "product_list_enter_searchword.do?category_code="+asd+"&prdocut_price="+price;
		}
	}); 	
}); */

 </script>

<script>
function getParameterValue(parameterName) {
    const queryString = window.location.search;
    const urlParams = new URLSearchParams(queryString);

    if (urlParams.has(parameterName)) {
        return urlParams.get(parameterName);
    }

    return null; // 파라미터가 없으면 null 반환
}

function ProductDetail(searchWord, category_code, category_code_small, 
		product_price_min, product_price_max, sort_salecount, sort_view, 
		pageNum, pageBlock) {       
    
	var insertsearchWord = "";
	const paramsearchWord = getParameterValue("searchWord");	
	if(searchWord === ""){
		if(paramsearchWord === null){
		insertsearchWord = '';}
		else{
		insertsearchWord = paramsearchWord;}
	}else{
		insertsearchWord = searchWord;
	}
	
	
	var insertcategory_code ="";
	const paramcategory_code = getParameterValue("category_code");
	if(category_code === ""){
        if(paramcategory_code === null){
        insertcategory_code = '';}
        else{
        insertcategory_code = paramcategory_code;}
    }else{
    	insertcategory_code = category_code;
    }

	
	var insertcategory_code_small ="";
    const paramcategory_code_small = getParameterValue("category_code_small");
    if(category_code_small === ""){
        if(paramcategory_code_small === null){
        insertcategory_code_small = '';}
        else{
        insertcategory_code_small = paramcategory_code_small;}
    }else{
        insertcategory_code_small = category_code_small;
    }
    
    
    var insertproduct_price_min ="";
    const paramproduct_price_min = getParameterValue("product_price_min");
    if(product_price_min === ""){
        if(paramproduct_price_min === null){
        insertproduct_price_min = 0;}
        else{
        insertproduct_price_min = paramproduct_price_min;}
    }else{
        insertproduct_price_min = product_price_min;
    }
	
	
    var insertproduct_price_max ="";
    const paramproduct_price_max = getParameterValue("product_price_max");
    if(product_price_max === ""){
        if(paramproduct_price_max === null){
        insertproduct_price_max = 0;}
        else{
        insertproduct_price_max = paramproduct_price_max;}
    }else{
        insertproduct_price_max = product_price_max;
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
    }
    
    
	// 새 URL 구성    
    var newURL = "product_list_enter_searchword.do" +  
    "?searchWord=" + insertsearchWord +
    "&category_code=" + insertcategory_code +
    "&category_code_small=" + insertcategory_code_small +
    "&product_price_min=" + insertproduct_price_min +
    "&product_price_max=" + insertproduct_price_max +
    "&sort_salecount=" + insertsort_salecount +
    "&sort_view=" + insertsort_view +
    "&pageNum=" + pageNum +
    "&pageBlock=" + pageBlock;
    // URL로 이동
    window.location.href = newURL;

    
}


	
	
	
	/* ?" + a + b + c + d + e + f + */	
/* 	var a = "searchWord=" + searchWord;
    alert(a);
    if(searchWord === ""){ a=""; alert(a);}
    else{alert("하이");}
    
    var b = "&category_code=" + category_code;
    alert(b);
    if(category_code === ""){ b=""; alert("b성공");}
    else{alert("하이");}
    
    var c = "&category_code_small=" + category_code_small;
    if(category_code_small === ""){ c=""; alert("c성공");}
    
    var d = "&product_price_min=" + product_price_min +
    "&product_price_max=" + product_price_max;
    if(product_price_min === "" && product_price_max=== ""){ d=""; alert("d성공");}      
    
    var e = "&sort_salecount=" + sort_salecount;
    if(sort_salecount === ""){ e=""; alert("e성공");}
    
    var f = "&sort_view=" + sort_view;
    if(sort_view === ""){ f=""; alert("f성공");} */
    
	
   

</script> 
</head>

<body>
<div class="head">
    <header>    
        <jsp:include page="../main/header.jsp"/>    
    </header>

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
                        <button class="classification" id="category_code_btn">+</button>
                    </h4>
                </div>
                
                <ul class="list_classification">                                                          
                    <li><a href="#" onclick="ProductDetail('${ExploreVo.searchWord}', 'Skin', '${ExploreVo.category_code_small}', '${ExploreVo.product_price_min}', '${ExploreVo.product_price_max}', '${ExploreVo.sort_salecount}', '${ExploreVo.sort_view}', '${pageNav.pageNum}', '${pageNav.pageBlock}')">스킨케어</a></li>
                                        
                    <li><a href="#" onclick="ProductDetail('${ExploreVo.searchWord}', 'clensing', '${ExploreVo.category_code_small}', '${ExploreVo.product_price_min}', '${ExploreVo.product_price_max}', '${ExploreVo.sort_salecount}', '${ExploreVo.sort_view}', '${pageNav.pageNum}', '${pageNav.pageBlock}')">클렌징</a></li>
                    
                    <li><a href="#" onclick="ProductDetail('${ExploreVo.searchWord}', 'makeup', '${ExploreVo.category_code_small}', '${ExploreVo.product_price_min}', '${ExploreVo.product_price_max}', '${ExploreVo.sort_salecount}', '${ExploreVo.sort_view}', '${pageNav.pageNum}', '${pageNav.pageBlock}')">메이크업</a></li>
                                        
                    <li><a href="#" onclick="ProductDetail('${ExploreVo.searchWord}', 'body', '${ExploreVo.category_code_small}', '${ExploreVo.product_price_min}', '${ExploreVo.product_price_max}', '${ExploreVo.sort_salecount}', '${ExploreVo.sort_view}', '${pageNav.pageNum}', '${pageNav.pageBlock}')">바디케어</a></li>
                    
                    <li><a href="#" onclick="ProductDetail('${ExploreVo.searchWord}', 'hair', '${ExploreVo.category_code_small}', '${ExploreVo.product_price_min}', '${ExploreVo.product_price_max}', '${ExploreVo.sort_salecount}', '${ExploreVo.sort_view}', '${pageNav.pageNum}', '${pageNav.pageBlock}')">헤어케어</a></li>
                    
                    <li><a href="#" onclick="ProductDetail('${ExploreVo.searchWord}', '1', '${ExploreVo.category_code_small}', '${ExploreVo.product_price_min}', '${ExploreVo.product_price_max}', '${ExploreVo.sort_salecount}', '${ExploreVo.sort_view}', '${pageNav.pageNum}', '${pageNav.pageBlock}')">미용소품</a></li>                    
                   
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
	                    <%-- <c:if test="${pageNav.totalRows ne 0}"> --%>                    
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
			                
			                <c:if test="${exploreVo.category_code eq 'clensing'}">    
			                    <li><a href="#">샴푸</a></li>
			                    <li><a href="#">염색</a></li>
			                </c:if>
		                <%-- </c:if>	    --%>               
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
                    <a href="#" onclick="ProductDetail('${ExploreVo.searchWord}', '${ExploreVo.category_code}', '${ExploreVo.category_code_small}', '${ExploreVo.product_price_min}', '${ExploreVo.product_price_max}', '1', '${ExploreVo.sort_view}', '${pageNav.pageNum}', '${pageNav.pageBlock}')">판매수량순</a>                
                    </li>
                                        
                    <li>                                       
                    <a href="#" onclick="ProductDetail('${ExploreVo.searchWord}', '${ExploreVo.category_code}', '${ExploreVo.category_code_small}', '${ExploreVo.product_price_min}', '${ExploreVo.product_price_max}', '2', '${ExploreVo.sort_view}', '${pageNav.pageNum}', '${pageNav.pageBlock}')">최근등록순</a>                  
                    </li>                    
                    
                    <li>                                        
                    <a href="#" onclick="ProductDetail('${ExploreVo.searchWord}', '${ExploreVo.category_code}', '${ExploreVo.category_code_small}', '${ExploreVo.product_price_min}', '${ExploreVo.product_price_max}', '3', '${ExploreVo.sort_view}', '${pageNav.pageNum}', '${pageNav.pageBlock}')">평점순</a>                    
                    </li>
                    
                    <li>                                        
                    <a href="#" onclick="ProductDetail('${ExploreVo.searchWord}', '${ExploreVo.category_code}', '${ExploreVo.category_code_small}', '${ExploreVo.product_price_min}', '${ExploreVo.product_price_max}', '4', '${ExploreVo.sort_view}', '${pageNav.pageNum}', '${pageNav.pageBlock}')">높은가격순</a>                    
                    </li>
                    
                    <li>                                        
                    <a href="#" onclick="ProductDetail('${ExploreVo.searchWord}', '${ExploreVo.category_code}', '${ExploreVo.category_code_small}', '${ExploreVo.product_price_min}', '${ExploreVo.product_price_max}', '5', '${ExploreVo.sort_view}', '${pageNav.pageNum}', '${pageNav.pageBlock}')">낮은가격순</a>                   
                    </li>
                    
                </ul>
            </div>
            <div class="cate_view">
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;View&nbsp;
                
                <ul>
	                <li>
	                    <a href="#" onclick="ProductDetail('${ExploreVo.searchWord}', '${ExploreVo.category_code}', '${ExploreVo.category_code_small}', '${ExploreVo.product_price_min}', '${ExploreVo.product_price_max}', '${ExploreVo.sort_salecount}', '15', '${pageNav.pageNum}', '${pageNav.pageBlock}')">15</a>&nbsp;
	                </li>    
	                <li>
	                    <a href="#" onclick="ProductDetail('${ExploreVo.searchWord}', '${ExploreVo.category_code}', '${ExploreVo.category_code_small}', '${ExploreVo.product_price_min}', '${ExploreVo.product_price_max}', '${ExploreVo.sort_salecount}', '30', '${pageNav.pageNum}', '${pageNav.pageBlock}')">30</a>&nbsp;
	                </li>    
	                <li>	                    
	                    <a href="#" onclick="ProductDetail('${ExploreVo.searchWord}', '${ExploreVo.category_code}', '${ExploreVo.category_code_small}', '${ExploreVo.product_price_min}', '${ExploreVo.product_price_max}', '${ExploreVo.sort_salecount}', '45', '${pageNav.pageNum}', '${pageNav.pageBlock}')">45</a>	                    
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
    <footer>
        <jsp:include page="../main/footer.jsp"/>        
    </footer>

</body>
</body>
</html>