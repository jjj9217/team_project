<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지 | CrueltyFree</title>
<style>
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
        height: 1500px;
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
		height:1200px;
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
</style>
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
		<li id="li"><a href="manager_6post.do" id="" >게시글 관리</a></li>
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
                        <option value="title">리뷰번호</option>
                        <option value="content">닉네임</option>
                    </select>
                    <input type="text" name="searchWord" id="searchWord">
                    <input type="submit" id="search_btn" value="검색">
                    </form>
              </div>
         </div>


    <!-- 글목록 테이블 -->
    <table id="tbl_list" style="margin-top:80px;">
		<tr>
            <th width="50px">리뷰번호</th>
            <th width="50px">상품번호</th>
            <th width="50px">작성자</th>
            <th width="300px">리뷰내용</th>
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
						<td>${rvSelectList[rowNum-1].member_nickname}</td>
						<td>${rvSelectList[rowNum-1].review_content}</td>
						<td>
						<input type="button" id="edit" value="수정">
						<input type="button" id="delete" value="삭제">
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
	 			
	<div id="sub">	</div>
	</div>
</div>


<footer>
	<jsp:include page="../main/footer.jsp" />
</footer>
</body>
</html>