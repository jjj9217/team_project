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
<title>${exploreVo.searchWord} 검색 | CrueltyFree </title>
<link rel="icon" href="${pageContext.request.contextPath}/resources/img/favicon.png">
<style>

    *{margin: 0; padding: 0;}
    a{text-decoration: none;}
    input[type="button"], input[type="submit"], input[type="checkbox"], select, input[type="radio"], label, button {cursor: pointer;}
    
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

    #list_tit {
        width: 1020px;
        height: 40px;
        margin-top: 40px;
        color: #4a4a4a;
    }
    
    #list_tit a {
        font-size: 20px;
    }
    
    #list_tit li {
    	list-style:none;
        float: left;
    }

    .category_filter {
		border-top: 2px solid #4a4a4a;
		border-bottom: 2px solid #cfcfcf;
		margin: 20px 0 15px 0;
    }

    .serach_category_small{
        width: 1020px;
        height: 55px;
    }

    .search_price{
        width: 1020px;
        height: 55px;
    }
    
    .inner {
        width: 1020px;
        height: 50px;
        border-bottom: 1px solid #cfcfcf;
    }
    
    .select_filter {
    	font-size: 12px;
    	font-weight: bold;
    }

    .category_left {
        float:left;
        width: 150px;
        height: 35px;
        padding-top: 15px;
        background-color: #ededed;
        text-align: center;
    }
    
    .category_left a {
    	font-size: 13px;
    	font-weight: bold;
    }
    
    .category_right {
		height: 35px;
    	padding-top: 15px;
    	margin-left: 10px;
    }
    
	.category_right a {
		font-size: 12px;
		color: #000000;
		font-weight: bold;
	}

    .change_later {
        margin: 0;
        width: 150px;
        height: 37px;
        padding-left: 20px;
        padding-top: 17px;
    }

    .classification {
        width: 18px;
        height: 18px;   
    }   

    .list_classification {
        float: left;
        width: 870px;
        height: 20px;
        
        padding-inline-start: 0px;
    }
    
    .list_classification li {
        width: 135px;
        height: 20px;
        margin-left: 10px;
        list-style:none;
        float: left;
    }

    .cate_info_tx {
        margin: 60px 0 30px 0;
        font-size: 19px;
        color: #222222;
        text-align: center;
        letter-spacing: -1px;
    }
    
    .price_set_btn {
		width: 100px;
        height: 25px;
        padding-left: 10px;
        padding-right: 10px;
        border-radius: 0.5em;
        background-color: #7d99a4;
        color: #ffffff;
        border: none;
        font-size: 12px;
        font-weight: bold;
    }

    .price_input {
        width: 80px;
        height: 25px;
        padding-left: 10px;
        padding-right: 10px;
        border: 1px solid #a4a4a4;
        border-radius: 0.5em;
        margin-left: 10px;
        margin-right: 10px;
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
    }
    
    .cate_view ul {
    	display: inline-block;
    	padding-top: 15px;
    }
    
    .cate_view li {
    	width: 30px;
    	font-size: 14px;
    	list-style:none;
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
    }
    
    .product_list {
		width: 340px;
		height: 360px;
            
		display: flex;
		justify-content: center;
		align-items: center;
		list-style:none;
        float: left;
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
    
    .paging {
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
    
	#isearchWord{
		color: #7d99a4;
		font-size: 30px;
		letter-spacing: -2px;
		font-weight: bold;
	}

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
	
	let min = document.getElementById("product_price_min");
    let max = document.getElementById("product_price_max");
    
    if(min.value > max.value && max.value.length!=0 || min.value == max.value && min.value.length!=0 && max.value.length!=0){
        alert('최고가를 더 높게 입력해주세요');
        return false;
    }
    
    if(min.value ==0 && max.value==0 && max.value.length!=0){
    	alert('0보다 큰 가격을 입력해주세요');
    	return false;    	
    }
    
    
    
    if(min.value.length==0){
       min.value = 0;       
    }
    if(max.value.length==0){
        max.value = 10000000; 
    }
    
    
    
    var minvalue = min.value;
    var maxvalue = max.value;
    		
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
    
    
    
    
    var insertproduct_price_min ="";
    const paramproduct_price_min = getParameterValue("product_price_min");
    
    if(minvalue !== '0'){//최저가 입력했을때 
    	insertproduct_price_min = minvalue; //사용자가 입력한값   	    	
    }else{//최저가 입력안했을때   
    	//안했는데 주소에 파라미터값이 없네? => 0
    	if(paramproduct_price_min == null){//파라미터값이없을때
            insertproduct_price_min = minvalue;         
    	//안했는데 주소에 파라미터값이 있네? => 파람값
        }else{//파라미터값이 있을때
        	if(maxvalue != "10000000"){//max.value가 입력이됐을경우
        		insertproduct_price_min = minvalue;
        	}else{//아닌경우
		    	insertproduct_price_min = paramproduct_price_min;            
        	}
        }		
    }    	        
    	
    var insertproduct_price_max ="";
    const paramproduct_price_max = getParameterValue("product_price_max");

    if(maxvalue !== '10000000' ){        
    	insertproduct_price_max= maxvalue;
    }else{
    	if(paramproduct_price_max == null){
            insertproduct_price_max = maxvalue;                 
        }else{
        	if(minvalue != '0'){
        		insertproduct_price_max = maxvalue;
        	}else{
	            insertproduct_price_max = paramproduct_price_max;
        	}
        } 
    }
		    	        
    
    
 
    
//     if(maxvalue === 10000000){
//         if(paramproduct_price_max === null){
//         insertproduct_price_max = 0;}
//         else{
//         insertproduct_price_max = paramproduct_price_max;}
//     }else{
//         insertproduct_price_max = maxvalue;
//     }
    
    
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




function ProductDel(searchWord, category_code, category_code_small, 
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

    
    var insertcategory_code_small ="";
    const paramcategory_code_small = getParameterValue("category_code_small");
    if(category_code_small === ""){
        if(paramcategory_code_small === null){
        insertcategory_code_small = '';}
        else{
        insertcategory_code_small = paramcategory_code_small;}
    }else{
        insertcategory_code_small = "";
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
        insertcategory_code = "";
        insertcategory_code_small="";
        pageNum=1;
        pageBlock=1;
        
    }
    
    var insertproduct_price_min ="";
    const paramproduct_price_min = getParameterValue("product_price_min");
    if(product_price_min === ""){
        if(paramproduct_price_min === null){
        insertproduct_price_min = 0;}
        else{
        insertproduct_price_min = paramproduct_price_min;}
    }else{
        insertproduct_price_min = 0;
    }
    
    
    var insertproduct_price_max ="";
    const paramproduct_price_max = getParameterValue("product_price_max");
    if(product_price_max === ""){
        if(paramproduct_price_max === null){
        insertproduct_price_max = 0;}
        else{
        insertproduct_price_max = paramproduct_price_max;}
    }else{
        insertproduct_price_max = 0;
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


   

</script> 
</head>

<body>

<header>    
	<jsp:include page="../main/header.jsp"/>    
</header>

<!-- body시작 -->
    <div id="list_tit">
        <span id="isearchWord">'${exploreVo.searchWord}'</span>&nbsp;&nbsp;<a>검색결과 (전체 <span style="color: #7d99a4; font-weight: bold;">${pageNav.totalRows}</span>개의 상품)</a>
    </div>
    <div class="category_filter">
		<div class="inner">
			<div class="category_left">
				<a>카테고리(대)</a>
			</div>
			<div class="category_right">
                <ul class="list_classification">                                                          
                    <li><a href="#" onclick="ProductDetail('${ExploreVo.searchWord}', 'skin', '${ExploreVo.category_code_small}', '${ExploreVo.product_price_min}', '${ExploreVo.product_price_max}', '${ExploreVo.sort_salecount}', '${ExploreVo.sort_view}', '${pageNav.pageNum}', '${pageNav.pageBlock}')">스킨케어</a></li>                
                    <li><a href="#" onclick="ProductDetail('${ExploreVo.searchWord}', 'clensing', '${ExploreVo.category_code_small}', '${ExploreVo.product_price_min}', '${ExploreVo.product_price_max}', '${ExploreVo.sort_salecount}', '${ExploreVo.sort_view}', '${pageNav.pageNum}', '${pageNav.pageBlock}')">클렌징</a></li>
                    <li><a href="#" onclick="ProductDetail('${ExploreVo.searchWord}', 'makeup', '${ExploreVo.category_code_small}', '${ExploreVo.product_price_min}', '${ExploreVo.product_price_max}', '${ExploreVo.sort_salecount}', '${ExploreVo.sort_view}', '${pageNav.pageNum}', '${pageNav.pageBlock}')">메이크업</a></li>
                    <li><a href="#" onclick="ProductDetail('${ExploreVo.searchWord}', 'body', '${ExploreVo.category_code_small}', '${ExploreVo.product_price_min}', '${ExploreVo.product_price_max}', '${ExploreVo.sort_salecount}', '${ExploreVo.sort_view}', '${pageNav.pageNum}', '${pageNav.pageBlock}')">바디케어</a></li>
                    <li><a href="#" onclick="ProductDetail('${ExploreVo.searchWord}', 'hair', '${ExploreVo.category_code_small}', '${ExploreVo.product_price_min}', '${ExploreVo.product_price_max}', '${ExploreVo.sort_salecount}', '${ExploreVo.sort_view}', '${pageNav.pageNum}', '${pageNav.pageBlock}')">헤어케어</a></li>
                    <li><a href="#" onclick="ProductDetail('${ExploreVo.searchWord}', 'prop', '${ExploreVo.category_code_small}', '${ExploreVo.product_price_min}', '${ExploreVo.product_price_max}', '${ExploreVo.sort_salecount}', '${ExploreVo.sort_view}', '${pageNav.pageNum}', '${pageNav.pageBlock}')">미용소품</a></li>                    
				</ul>
			</div>
        </div>
	    <c:if test="${pageNav.totalRows ne 0}">
			<c:if test="${!empty exploreVo.category_code}">	                 
				<div class="inner">
					<c:if test="${not fn:contains(exploreVo.category_code, 'prop')}">
						<div class="category_left">
							<a>카테고리(소)</a>
						</div>
					</c:if>
					<div class="category_right">
						<ul class="list_classification">
							<c:if test="${pageNav.totalRows ne 0}">                 
								<c:if test="${fn:contains(exploreVo.category_code, 'skin')}">
									<li><a href="#" onclick="ProductDetail('${ExploreVo.searchWord}', '${ExploreVo.category_code}', 'skin_1', '${ExploreVo.product_price_min}', '${ExploreVo.product_price_max}', '${ExploreVo.sort_salecount}', '${ExploreVo.sort_view}', '${pageNav.pageNum}', '${pageNav.pageBlock}')">토너/로션/올인원</a></li>
									<li><a href="#" onclick="ProductDetail('${ExploreVo.searchWord}', '${ExploreVo.category_code}', 'skin_2', '${ExploreVo.product_price_min}', '${ExploreVo.product_price_max}', '${ExploreVo.sort_salecount}', '${ExploreVo.sort_view}', '${pageNav.pageNum}', '${pageNav.pageBlock}')">에센스/크림</a></li>
									<li><a href="#" onclick="ProductDetail('${ExploreVo.searchWord}', '${ExploreVo.category_code}', 'skin_3', '${ExploreVo.product_price_min}', '${ExploreVo.product_price_max}', '${ExploreVo.sort_salecount}', '${ExploreVo.sort_view}', '${pageNav.pageNum}', '${pageNav.pageBlock}')">미스트/오일</a></li>
								</c:if>
				                    
								<c:if test="${fn:contains(exploreVo.category_code, 'clensing')}">
									<li><a href="#" onclick="ProductDetail('${ExploreVo.searchWord}', '${ExploreVo.category_code}', 'clensing_1', '${ExploreVo.product_price_min}', '${ExploreVo.product_price_max}', '${ExploreVo.sort_salecount}', '${ExploreVo.sort_view}', '${pageNav.pageNum}', '${pageNav.pageBlock}')">폼</a></li>
									<li><a href="#" onclick="ProductDetail('${ExploreVo.searchWord}', '${ExploreVo.category_code}', 'clensing_2', '${ExploreVo.product_price_min}', '${ExploreVo.product_price_max}', '${ExploreVo.sort_salecount}', '${ExploreVo.sort_view}', '${pageNav.pageNum}', '${pageNav.pageBlock}')">오일</a></li>
								</c:if>
					                
								<c:if test="${fn:contains(exploreVo.category_code, 'makeup')}">
									<li><a href="#" onclick="ProductDetail('${ExploreVo.searchWord}', '${ExploreVo.category_code}', 'makeup_1', '${ExploreVo.product_price_min}', '${ExploreVo.product_price_max}', '${ExploreVo.sort_salecount}', '${ExploreVo.sort_view}', '${pageNav.pageNum}', '${pageNav.pageBlock}')">립</a></li>
									<li><a href="#" onclick="ProductDetail('${ExploreVo.searchWord}', '${ExploreVo.category_code}', 'makeup_2', '${ExploreVo.product_price_min}', '${ExploreVo.product_price_max}', '${ExploreVo.sort_salecount}', '${ExploreVo.sort_view}', '${pageNav.pageNum}', '${pageNav.pageBlock}')">베이스</a></li>
									<li><a href="#" onclick="ProductDetail('${ExploreVo.searchWord}', '${ExploreVo.category_code}', 'makeup_3', '${ExploreVo.product_price_min}', '${ExploreVo.product_price_max}', '${ExploreVo.sort_salecount}', '${ExploreVo.sort_view}', '${pageNav.pageNum}', '${pageNav.pageBlock}')">아이</a></li>
								</c:if>    
				
								<c:if test="${fn:contains(exploreVo.category_code, 'body')}">    
									<li><a href="#" onclick="ProductDetail('${ExploreVo.searchWord}', '${ExploreVo.category_code}', 'body_1', '${ExploreVo.product_price_min}', '${ExploreVo.product_price_max}', '${ExploreVo.sort_salecount}', '${ExploreVo.sort_view}', '${pageNav.pageNum}', '${pageNav.pageBlock}')">샤워</a></li>
									<li><a href="#" onclick="ProductDetail('${ExploreVo.searchWord}', '${ExploreVo.category_code}', 'body_2', '${ExploreVo.product_price_min}', '${ExploreVo.product_price_max}', '${ExploreVo.sort_salecount}', '${ExploreVo.sort_view}', '${pageNav.pageNum}', '${pageNav.pageBlock}')">로션</a></li>
								</c:if>
					                
								<c:if test="${fn:contains(exploreVo.category_code, 'hair')}">    
									<li><a href="#" onclick="ProductDetail('${ExploreVo.searchWord}', '${ExploreVo.category_code}', 'hair_1', '${ExploreVo.product_price_min}', '${ExploreVo.product_price_max}', '${ExploreVo.sort_salecount}', '${ExploreVo.sort_view}', '${pageNav.pageNum}', '${pageNav.pageBlock}')">샴푸</a></li>
									<li><a href="#" onclick="ProductDetail('${ExploreVo.searchWord}', '${ExploreVo.category_code}', 'hair_2', '${ExploreVo.product_price_min}', '${ExploreVo.product_price_max}', '${ExploreVo.sort_salecount}', '${ExploreVo.sort_view}', '${pageNav.pageNum}', '${pageNav.pageBlock}')">염색</a></li>
								</c:if>
							</c:if>             
						</ul>
					</div>
				</div>	        
			</c:if>
		</c:if>
		<div class="search_price">
            <div class="inner" style="border: none;">
                <div class="category_left" style="bolder-bottom: none; height:40px;">                    
                    <a>가격대</a>
				</div>
                <div class="category_right" style="bolder-bottom: none;">
                	<input type="text" name="product_price_min" id="product_price_min" class="price_input" placeholder="최저가" /> ~ <input type="text" name="product_price_max" id="product_price_max" class="price_input" placeholder="최고가" />
					<button id="price_" class="price_set_btn" onclick="ProductDetail('${ExploreVo.searchWord}', '${ExploreVo.category_code}', '${ExploreVo.category_code_small}', '${ExploreVo.product_price_min}', '${ExploreVo.product_price_max}', '${ExploreVo.sort_salecount}', '${ExploreVo.sort_view}', 1, 1);">가격대 적용</button>
				</div>
			</div>
		</div>
	</div>
            
		<div class="select_filter">
			<c:choose>
				<c:when test="${exploreVo.product_price_min ne 0 and exploreVo.product_price_max eq 10000000}">
					<a>${exploreVo.product_price_min}원 ~</a><button style="width: 20px; height: 20px; background-color: #ffffff; color: #7d99a4; border: none; font-size: 17px;" onclick="ProductDel('${ExploreVo.searchWord}', '${ExploreVo.category_code}', '${ExploreVo.category_code_small}', 'x', 'x', '${ExploreVo.sort_salecount}', '${ExploreVo.sort_view}', '1', '1')">x</button>
				</c:when>

				<c:when test="${exploreVo.product_price_max ne 0 and exploreVo.product_price_min eq 0}">
					<c:if test="${exploreVo.product_price_max ne 10000000 and exploreVo.product_price_min eq 0}">
						<a>~${exploreVo.product_price_max}원</a><button style="width: 20px; height: 20px; background-color: #ffffff; color: #7d99a4; border: none; font-size: 17px;" onclick="ProductDel('${ExploreVo.searchWord}', '${ExploreVo.category_code}', '${ExploreVo.category_code_small}', 'x', 'x', '${ExploreVo.sort_salecount}', '${ExploreVo.sort_view}', '1', '1')">x</button>
					</c:if>
				</c:when>
				<c:when test="${exploreVo.product_price_min ne 0 and exploreVo.product_price_max ne 0}">
					<a>${exploreVo.product_price_min}원 ~ ${exploreVo.product_price_max}원</a><button style="width: 20px; height: 20px; background-color: #ffffff; color: #7d99a4; border: none; font-size: 17px;" onclick="ProductDel('${ExploreVo.searchWord}', '${ExploreVo.category_code}', '${ExploreVo.category_code_small}', 'x', 'x', '${ExploreVo.sort_salecount}', '${ExploreVo.sort_view}', '1', '1')">x</button>
				</c:when>
				<c:otherwise>
                        
				</c:otherwise>
			</c:choose>

			<c:if test="${!empty exploreVo.category_code}">
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
                     <button style="width: 20px; height: 20px; background-color: #ffffff; color: #7d99a4; border: none; font-size: 17px;" onclick="ProductDel('${ExploreVo.searchWord}', 'x', '${ExploreVo.category_code_small}', '${ExploreVo.product_price_min}', '${ExploreVo.product_price_max}', '${ExploreVo.sort_salecount}', '${ExploreVo.sort_view}', '${pageNav.pageNum}', '${pageNav.pageBlock}')">x</button>
	                    <c:if test="${!empty exploreVo.category_code_small}">
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
	                      <button style="width: 20px; height: 20px; background-color: #ffffff; color: #7d99a4; border: none; font-size: 17px;" onclick="ProductDel('${ExploreVo.searchWord}', '${ExploreVo.category_code}', 'x', '${ExploreVo.product_price_min}', '${ExploreVo.product_price_max}', '${ExploreVo.sort_salecount}', '${ExploreVo.sort_view}', '${pageNav.pageNum}', '${pageNav.pageBlock}')">x</button>
	                    </c:if>
                </c:if>
            </div>                              
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
                    <li style="border-right: none;">                                        
                    	<a href="#" onclick="ProductDetail('${ExploreVo.searchWord}', '${ExploreVo.category_code}', '${ExploreVo.category_code_small}', '${ExploreVo.product_price_min}', '${ExploreVo.product_price_max}', '5', '${ExploreVo.sort_view}', '${pageNav.pageNum}', '${pageNav.pageBlock}')">낮은가격순</a>                   
                    </li>
                </ul>
            </div>
            <div class="cate_view">
                <ul>
                	<li style="width:40px;"><a>View</a></li>
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
			<a href="#" onclick="ProductDetail('${ExploreVo.searchWord}', '${ExploreVo.category_code}', '${ExploreVo.category_code_small}', '${ExploreVo.product_price_min}', '${ExploreVo.product_price_max}', '${ExploreVo.sort_salecount}', '${ExploreVo.sort_view}', '1', '1')">			            
    			<input type="button" id="end" value="처음"></a>&nbsp;
    		<a href="#" onclick="ProductDetail('${ExploreVo.searchWord}', '${ExploreVo.category_code}', '${ExploreVo.category_code_small}', '${ExploreVo.product_price_min}', '${ExploreVo.product_price_max}', '${ExploreVo.sort_salecount}', '${ExploreVo.sort_view}', '${(pageNav.pageBlock - 2)*pageNav.pages_per_block + 1}', '${pageNav.pageBlock-1}')">
    			<input type="button" id="next" value="이전">
    		</a>   	
    	</c:if>
			            
		<c:forEach var="i" begin="${(pageNav.pageBlock-1)*pageNav.pages_per_block + 1}" end="${pageNav.pageBlock*pageNav.pages_per_block}">
            <c:if test="${i le pageNav.totalPageNum}">
                <c:choose>
                    <c:when test = "${pageNav.pageNum eq i}">
                        <a href="#" onclick="ProductDetail('${ExploreVo.searchWord}', '${ExploreVo.category_code}', '${ExploreVo.category_code_small}', '${ExploreVo.product_price_min}', '${ExploreVo.product_price_max}', '${ExploreVo.sort_salecount}', '${ExploreVo.sort_view}', '${pageNav.pageNum}', '${pageNav.pageBlock}')">
                            <span style="color:#7d99a4">${i}&nbsp;</span>
                        </a>
                    </c:when>
                    <c:otherwise>
	    				<a href="#" onclick="ProductDetail('${ExploreVo.searchWord}', '${ExploreVo.category_code}', '${ExploreVo.category_code_small}','${ExploreVo.product_price_min}', '${ExploreVo.product_price_max}','${ExploreVo.sort_salecount}', '${ExploreVo.sort_view}', '${i}', '${pageNav.pageBlock}')">
	    					<span class="other">${i}&nbsp;</span>
	    				</a>
                    </c:otherwise>
            </c:choose>
            </c:if>
        </c:forEach>
    
        <c:if test="${((pageNav.rows_per_page*pageNav.pages_per_block) lt pageNav.totalRows) and (pageNav.pageBlock ne pageNav.lastPageBlock) }">
            <a href="#" onclick="ProductDetail('${ExploreVo.searchWord}', '${ExploreVo.category_code}', '${ExploreVo.category_code_small}', '${ExploreVo.product_price_min}', '${ExploreVo.product_price_max}', '${ExploreVo.sort_salecount}', '${ExploreVo.sort_view}', '${pageNav.pageBlock*pageNav.pages_per_block+1}', '${pageNav.pageBlock+1}')">><input type="button" id="next" value="다음"></a>&nbsp;
            <a href="#" onclick="ProductDetail('${ExploreVo.searchWord}', '${ExploreVo.category_code}', '${ExploreVo.category_code_small}', '${ExploreVo.product_price_min}', '${ExploreVo.product_price_max}', '${ExploreVo.sort_salecount}', '${ExploreVo.sort_view}', '${pageNav.totalPageNum}', '${pageNav.lastPageBlock}')"><input type="button" id="end" value="마지막"></a>
        </c:if>

			                
			                <!-- 페이지 네비게이션 구현 -->
			                <%-- <%@ include file="paging.jsp" %> --%>
			            </td>
		           </tr>
		        </table>   
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




