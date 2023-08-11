<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ page import="java.util.List, java.util.HashMap, java.util.Map" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지 | CrueltyFree</title>
<style>
	 .modalContainer {
	 	width: 100%;
	 	height: 100%;
	 	position: fixed;
	 	top: 0;
	 	left: 0;
	 	display: flex;
	 	justify-content: center;
	 	align-items: center;
	 	background: rgba(0, 0, 0, 0.5);
	 }
		
	 .modalContent {
		position: absolute;
	 	background-color: #ffffff;
	 	border-radius: 5px;
	 	width: 390px;
	 	height: 600px;
	 	padding: 15px;
	 }
	 	 .hidden {
	 	display: none;
	 }
	* {margin:0; padding:0;}
	a{text-decoration: none;}
    input[type="button"], input[type="submit"], input[type="checkbox"], select, label{cursor: pointer;}
	body{
		width:1020px;
		margin:0 auto;
	}
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
	#full{
		width: 1000px;
        height: 1300px;
        margin: 0 auto;
        font: bold 25px Arial, Sans-serif;
      	margin-top:10px;
	}
	#title{
		width:230px;
		height:120px;
		text-align:center;
		margin-top:50px;

	}
	#tap{
		width:230px;
		height:1000px;
		float:left;
		margin-left:20px;

	}
	#content{
		width:700px;
		height:1100px;
		float:left;
		margin-left:10px;
	}
	#sub{
		width:700px;
		height:350px;
	}
	#sub2{
		width:700px;
		height:350px;
		margin-top:35px;
	}
	#sub3{
		width:700px;
		height:350px;
		margin-top:35px;
	}
  	a{
  		text-decoration-line: none;
  		color:black;
  	}
	#right{
		text-align:right;
		font-size:20px;
		color:gray;
		margin-right:-13px;
	}
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
 	.list{
  		list-style-type: none;
  		padding: 0px;
  		margin: 0px;
  		width: 90px;
  		height:300px;
  		height: 100%;
  		overflow: auto;
  		width:230px;
  		height:430px;
	}
	
	#li a{
	  	text-decoration: none;
  		padding: 10px;
  		display: block;
  		color: #000;
  		font-weight: bold;
  		font-size:17px;
  		background-color:rgb(221, 219, 214);
  		width:170px;
	}
	table {
	  border-collapse: separate;
  		border-spacing: 0;
  		width: 100%;
  		font-size:11px;
	}
	th,
	td {
  		padding: 6px 15px;
	}
	th {
  		background: #7d99a4;
  		color: #fff;
  		text-align: left;
 
	}
	td {
  		border-right: 0px solid #c6c9cc;
  		border-bottom: 1px solid #c6c9cc;
	}

	td:first-child {
  		border-left: 0px solid #c6c9cc;
	}
	tr:nth-child(even) td {
  		background: #eaeaed;
	}
	
	#search_btn{
		width:50px;
		height:30px;
		background-color:#7d99a4; 
		border:none; 
		color:white; 
		border-radius:5px;
		font: bold 15px Arial, Sans-serif;
		
	}
	#edit{
		border:0;
		background-color:#7d99a4; 
		color:white;
		border-radius:3px;
		width:37px;
		font: bold 13px Arial, Sans-serif;
	}
	#delete{
		border:0;
		background-color:rgb(216, 98, 98);
		color:white;
		border-radius:3px;
		width:37px;
		font: bold 13px Arial, Sans-serif;
	}
	#paging{
		width:300px; height:100px; margin:0 auto; margin-top:70px; width:600px; text-align:center; font-size:17px;
	}
	#searchField{
		width:100px;
		height:33px;
		border-style:solid;
		border-width:2px;
		border-radius:5px;
	}
	#searchWord{
		height:29px;
		border-style:solid;
		border-width:2px;
		border-radius:5px;
		padding-left:5px;
	}
	#main{
		margin-top:30px;
	}
	#total{
		float:left;
		font-size:20px;
	}
	#total2{
		color:#7d99a4; 
	}
	#search{
		float:right;
	}
	#hr{
		margin-top:30px;
	}
	#delete_btn{
		border:0;
		background-color:gray;
		color:white;
		border-radius:3px;
		width:65px;
		height:25px;
		font: bold 13px Arial, Sans-serif;
	}
</style>

<script src="https://code.jquery.com/jquery-latest.min.js"></script>

<script>
$(function(){
    $(".delete").click(function(){
    	let index = $(".delete").index(this);    	
    	let confirmAns = confirm("정말 삭제하시겠습니까?");
		if(confirmAns){
			$(".managerfrmClass").eq(index).submit();
	    	return true;
		}
    });
    
 $(".test33").click(function(){
	let index = $(".test33").index(this);
	$(".modalContainer").eq(index).removeClass("hidden");
});
    $(".modalCloseButton").click(function(){
    	let index = $(".modalCloseButton").index(this);
    	$(".modalContainer").eq(index).addClass("hidden");
    });
})


</script>


</head>
<body>
<header>
	<jsp:include page="../main/header.jsp" />
</header>

<div id="full">
	<div id="title">
			<img src="../resources/img/manage.png" style="width: 50px; height: 50px;">
			<h3>관리자 페이지</h3>	
	</div>
	<div id="tap">
	<ul class="list">
		<li id="li"><a href="manager_1main.do" id="">관리자 메인</a></li>
		<li id="li"><a href="manager_2product.do" id=""  style="color:white; background-color:#7d99a4;">판매자 제품 정보 관리</a></li>
		<li id="li"><a href="manager_3member.do" id="" >회원 정보 관리</a></li>
		<li id="li"><a href="manager_41d1.do" id="" >1:1 문의</a></li>
		<li id="li"><a href="manager_5sign.do" id="" >판매자 등록 문의</a></li>
		<li id="li"><a href="manager_7goods.do" id="" >상품 문의</a></li>
		<li id="li"><a href="manager_8review.do" id="" >리뷰</a></li>
	</ul>
	</div>
	<div id="content">
		<h5>판매자 제품 정보 관리</h5>
	<hr id="hr">
	
		<div id="main">
    	<div id="total">
                	<span>총 제품수 :</span> <span id="total2">${pageNav.totalRows}</span></div>
           		<div id ="search" >
           		<form name="searching">
                    <select name="searchField" id="searchField">
                        <option value="title">상품이름</option>
                        <option value="content">판매자</option>
                        <option value="content2">택배사</option>
                    </select>
                    <input type="text" name="searchWord" id="searchWord">
                    <input type="submit" id="search_btn" value="검색">
                    </form>
              </div>
         </div>
	 
    <!-- 글목록 테이블 -->
    <table id="tbl_list" style="margin-top:80px;">
        <tr>
        	<th></th>
            <th width="">상품번호</th>
            <th width="">상품이름</th>
            <th width="">상품가격</th>
            <th width="">상품재고</th>
			<th>택배사</th>
			<th>판매자</th>
			<th>기능</th>
        </tr>

        <!-- 글목록 내용-->
		<c:choose>
			<c:when test="${empty productList}">
				<tr>
					<td colspan="8"> 데이터가 없습니다. </td>
				</tr>
			</c:when>
			<c:when test="${empty proSelectList}">
				<tr>
					<td colspan="8"> 데이터가 없습니다. </td>
				</tr>
			</c:when>
			<c:otherwise>
				<form id="" name="" method="post">
				<c:forEach var="rowNum" begin="${pageNav.startNum}" end="${pageNav.endNum}">
					<tr>
						<td><input type="checkbox" name="checkedValue" value="${proSelectList[rowNum-1].product_idx}"></td>
						<td>${proSelectList[rowNum-1].product_idx}</td>					
						<td>${proSelectList[rowNum-1].product_name}</td>
						<td>${proSelectList[rowNum-1].product_price}</td>
						<td>${proSelectList[rowNum-1].product_capa}</td>
						<td>${proSelectList[rowNum-1].delivery_company}</td>
						<td>${proSelectList[rowNum-1].member_nickname}</td>
						<td>
						<input type="button" id="edit" class="edit" value="상세" onclick="location.href='manager_2product_edit.do?no=${proSelectList[rowNum-1].product_idx}'">
						<input type="button" id="delete" class="delete" value="삭제">
						<input type="button" id="test33" class="test33" value="테스트">			
						</td>
					</tr>
				</c:forEach>
				</form>
			</c:otherwise>
		</c:choose>
    </table>
    
       <input type="submit" name="delete_btn" id="delete_btn" value="선택삭제" >
   
 
		<div id="paging" class="pull-left">
				<div id="td_paging">
					<%@ include file="../manager/paging_product.jsp" %>					
				</div>				
		</div>
	       
    <c:forEach var="rowNum" begin="${pageNav.startNum}" end="${pageNav.endNum}">
	<form action="delete_process.do" class="managerfrmClass" name="managerfrm" method="post">
	<input type="hidden" name="product_idx" value="${proSelectList[rowNum-1].product_idx}">
	<input type="hidden" name="product_name" value="${proSelectList[rowNum-1].product_name}">
	<input type="hidden" name="product_price" value="${proSelectList[rowNum-1].product_price}">
	<input type="hidden" name="product_capa" value="${proSelectList[rowNum-1].product_capa}">
	<input type="hidden" name="delivery_company" value="${proSelectList[rowNum-1].delivery_company}">
	<input type="hidden" name="member_nickname" value="${proSelectList[rowNum-1].member_nickname}">
	</form>    
	
    <div class="modalContainer hidden">
	<div class="modalContent">
		상품정보변경 상품번호:${proSelectList[rowNum-1].product_idx} <button class="modalCloseButton">X</button>
		

	<form name="form_update" method="post" action="edit_pro_process.do" enctype="multipart/form-data" 
          onsubmit="return validateForm()">
          
	<input type="hidden" name="product_idx1" value="${proSelectList[rowNum-1].product_idx}" />
	<div class="regi_line">
		<article class="regi_left">
			&nbsp;&nbsp;<a>상품명</a>
		</article>
		<article class="regi_right">
			<input type="text" name="product_name1" class="regi_box" value="${proSelectList[rowNum-1].product_name}">
		</article>
	</div>
	
	<div class="regi_line">
		<article class="regi_left" style="vertical-align: top;">
			&nbsp;&nbsp;<a>가격</a>
		</article>
		<article class="regi_right">
			<input type="text" name="product_price1" class="regi_box" value="${proSelectList[rowNum-1].product_price}" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');"/>
		</article>
	</div>
	
	<div class="regi_line">
		<article class="regi_left" style="vertical-align: top;">
			&nbsp;&nbsp;<a>상품 재고</a>
		</article>
		<article class="regi_right">
			<input type="text" name="product_capa1" class="regi_box" value="${proSelectList[rowNum-1].product_capa}" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');"/>
		</article>
	</div>
	
	<div class="regi_line">
		<article class="regi_left" style="vertical-align: top;">
			&nbsp;&nbsp;<a>택배사</a>
		</article>
		<article class="regi_right">
			<select class="regi_box" name="delivery_company1">
				<option value="0">무료</option>
			</select>
		</article>
	</div>

	

	
	<!-- 등록 버튼 -->
	<div class="div_write">
		<input type="submit" id="edit_pro_btn" value="수정하기">
		<input type="reset" id="edit_pro_cancel" value="취소하기" onclick="location.href='manager_2product.do';">
	</div>
</form>
		
		
		

		
		
		
    </div>
    </div>
    
  
  </c:forEach>			
	<div id="sub">
		
	</div>
	</div>
</div>


<footer>
	<jsp:include page="../main/footer.jsp" />
</footer>
</body>
</html>