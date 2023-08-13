<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
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
	.regi_line{
		margin-top:30px;
	}
	.regi_left{
		font-size:12px;
		margin-top:7px;
	}
	.div_write{
		margin-top:30px;
		text-align:center;
	}
	.regi_box{
		padding-left:10px;
		border-color:#7d99a4; 
		border-style:solid; 
		width:375px; 
		height:35px; 
		border-radius:5px;
	}
	.text_regi_box{
		padding-left:10px;
		border-color:#7d99a4; 
		border-style:solid; 
		width:375px; 
		height:35px; 
		border-radius:5px;
		border-width:2px;
		height:100px;
		padding-top:5px;
	}
	.regi_box2{
		border-color:#7d99a4; 
		border-width:2px; 
		border-style:solid; 
		width:387px; 
		height:38px; 
		border-radius:5px;
	}
	#num{
		color:gray; 
		font-size:17px;
	}
	#hr{
		margin-top:10px; 
		height:5px; 
		background-color:#7d99a4;
		border:0;
	}
	#edit_btn{
		background-color:#7d99a4; 
		color:white; 
		border:0; 
		border-radius:3px; 
		width:170px; 
		height:38px; 
		font: bold 13px Arial, Sans-serif;
	}
	#cancel_btn{
		background-color:rgb(221, 219, 214); 
		border:0; 
		border-radius:3px; 
		width:170px; 
		height:38px;	
		font: bold 13px Arial, Sans-serif; 
		cursor:pointer;
	}
	.ellipsis {
		width:100px;
	  	height: auto;
  		overflow: hidden;
  		text-overflow: ellipsis;
  		white-space:nowrap;
	}
	.ellipsis2 {
		width:150px;
	  	height: auto;
  		overflow: hidden;
  		text-overflow: ellipsis;
  		white-space:nowrap;
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
    $(".edit").click(function(){
    	let index = $(".edit").index(this);
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
		<li id="li"><a href="manager_2product.do" id="" >판매자 제품 정보 관리</a></li>
		<li id="li"><a href="manager_3member.do" id="" >회원 정보 관리</a></li>
		<li id="li"><a href="manager_41d1.do" id=""  >1:1 문의</a></li>
		<li id="li"><a href="manager_5sign.do" id="" >판매자 등록 문의</a></li>
		<li id="li"><a href="manager_7goods.do" id=""  >상품 문의</a></li>
		<li id="li"><a href="manager_8review.do" id=""  style="color:white; background-color:#7d99a4;">리뷰</a></li>
	</ul>
	</div>
	<div id="content">
		<h5>리뷰</h5>
	<hr style="margin-top:30px;">
	
		<div id="main">
    	<div id="total">
                	<span>총 리뷰수 :</span> <span id="total2">${pageNav.totalRows}</span></div>
           		<div id ="search" >
          			<form name="searching">
                    <select name="searchField" id="searchField">
                        <option value="title">닉네임</option>
                        <option value="content">리뷰등록일</option>
                    </select>
                    <input type="text" name="searchWord" id="searchWord">
                    <input type="submit" id="search_btn" value="검색">
                    </form>
              </div>
         </div>


    <!-- 글목록 테이블 -->
    <table id="tbl_list" style="margin-top:80px;">
		<tr>
            <th width="">리뷰번호</th>
            <th width="">상품번호</th>
            <th width="">작성자</th>
            <th width="">리뷰내용</th>
            <th width="">등록일</th>
            <th width="">기능</th>
        </tr>

        <!-- 글목록 내용-->
		<c:choose>
			<c:when test="${empty reviewList}">
				<tr>
					<td colspan="6"> 데이터가 없습니다. </td>
				</tr>
			</c:when>			
			<c:when test="${empty rvSelectList}">
				<tr>
					<td colspan="6"> 데이터가 없습니다. </td>
				</tr>
			</c:when>
			<c:otherwise>
			
				<c:forEach var="rowNum" begin="${pageNav.startNum}" end="${pageNav.endNum}">
					<tr>
						<td>${rvSelectList[rowNum-1].review_idx}</td>
						<td>${rvSelectList[rowNum-1].product_idx}</td>
						<td><div class="ellipsis">${rvSelectList[rowNum-1].member_nickname}</div></td>
						<td><div class="ellipsis2">${rvSelectList[rowNum-1].review_content}</div></td>
                        <fmt:formatDate value="${rvSelectList[rowNum-1].review_regDate}" type="date" pattern="yyyy-MM-dd HH:mm" var="formatDate"/>						
						<td>${formatDate}</td>
						<td>
						<input type="button" id="edit" class="edit" value="상세">
						<input type="button" id="delete" class="delete" value="삭제">
						</td>
					</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>
    </table>
	<div id="paging" class="pull-left">
				<div id="td_paging">
					<%@ include file="../manager/paging_review.jsp" %>					
				</div>				
	</div>
	<c:forEach var="rowNum" begin="${pageNav.startNum}" end="${pageNav.endNum}">
    <form action="reviewdelete_process.do" class="managerfrmClass" name="managerfrm" method="post">
	<input type="hidden" name="review_idx" value="${rvSelectList[rowNum-1].review_idx}">
	<input type="hidden" name="product_idx" value="${rvSelectList[rowNum-1].product_idx}">
	<input type="hidden" name="member_nickname" value="${rvSelectList[rowNum-1].member_nickname}">
	<input type="hidden" name="review_content" value="${rvSelectList[rowNum-1].review_content}">
	<input type="hidden" name="review_regDate" value="${rvSelectList[rowNum-1].review_regDate}">
	</form>
	
	
	<div class="modalContainer hidden">
	<div class="modalContent">
	<div class="modalCloseButton"><img src="../resources/img/cancel.png" style="width: 25px; height: 25px; cursor:pointer; float:right;"></div>
	<span>리뷰</span> <span id="num">(리뷰번호:${rvSelectList[rowNum-1].review_idx})</span> 
	<hr id="hr">	

	<form name="form_update" method="post" action="edit_review_process.do" enctype="multipart/form-data" 
          onsubmit="return validateForm()">
          
	<input type="hidden" name="review_idx" value="${rvSelectList[rowNum-1].review_idx}" />
	<div class="regi_line">
		<article class="regi_left">
			&nbsp;&nbsp;<a>닉네임</a>
		</article>
		<article class="regi_right">
			<input type="text" name="member_nickname" class="regi_box" value="${rvSelectList[rowNum-1].member_nickname}" disabled/>
		</article>
	</div>
	
	<div class="regi_line2">
		<article class="regi_left" style="vertical-align: top;">
			&nbsp;&nbsp;<a>평점</a>
		</article>
		<article class="regi_right">
			<input type="text" name="review_score" class="regi_box" value="${rvSelectList[rowNum-1].review_score}" disabled/>
		</article>
	</div>
	
	<div class="regi_line3">
		<article class="regi_left" style="vertical-align: top;">
			&nbsp;&nbsp;<a>추천수</a>
		</article>
		<article class="regi_right">
			<input type="text" name="review_recom_count" class="regi_box" value="${rvSelectList[rowNum-1].review_recom_count}" disabled/>
		</article>
	</div>

	<div class="regi_line4">
		<article class="regi_left" style="vertical-align: top;">
			&nbsp;&nbsp;<a>리뷰내용</a>
		</article>
		<article class="regi_right">
			<textarea name="review_content" class="text_regi_box">${rvSelectList[rowNum-1].review_content}</textarea>
		</article>
	</div>

	
	<!-- 등록 버튼 -->
	<div class="div_write">
		<input type="submit" id="edit_btn" value="수정하기">
		<input type="reset" id="cancel_btn" value="취소하기" onclick="location.href='manager_8review.do';">
	</div>
</form>
		

    </div>
    </div>	
	
	
	
	
	
	
	
	
	</c:forEach>
	 			
	<div id="sub">	</div>
	</div>
</div>


<footer>
	<jsp:include page="../main/footer.jsp" />
</footer>
</body>
</html>