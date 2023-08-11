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
	#name{
		font-size:20px;
	}
  	#right{
		text-align:right;
		font-size:20px;
		color:gray;
		
	}
	table {
	  border-collapse: separate;
  		border-spacing: 0;
  		width: 100%;
  		font-size:13px;
	}
	th,
	td {
  		padding: 6px 15px;
  		height:30px;
	}
	th {
  		color: black;
  		text-align: left;
 		border-bottom: 3px solid #7d99a4;

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
		<li id="li"><a href="manager_1main.do" id="" style="color:white; background-color:#7d99a4;">관리자 메인</a></li>
		<li id="li"><a href="manager_2product.do" id="" >판매자 제품 정보 관리</a></li>
		<li id="li"><a href="manager_3member.do" id="" >회원 정보 관리</a></li>
		<li id="li"><a href="manager_41d1.do" id="" >1:1 문의</a></li>
		<li id="li"><a href="manager_5sign.do" id="" >판매자 등록 문의</a></li>
		<li id="li"><a href="manager_7goods.do" id="" >상품 문의</a></li>
		<li id="li"><a href="manager_8review.do" id="" >리뷰</a></li>
	</ul>
	</div>
	<div id="content">
	<div id="sub">
	<table class="tbl_list">
	<thead>
 	 <tr>
 		<th width="300" id="name">1:1문의</th>
 		<th width="50" id="right"><a href="manager_41d1.do" id="right">더보기 〉</a></th>
 	 </tr>
 	 </thead>
 	 <tbody>
        <!-- 글목록 내용-->
		<c:choose>
			<c:when test="${empty oneinqList}">
				<tr>
					<td colspan="2"> 등록된 1:1문의가 없습니다. </td>
				</tr>
			</c:when>
			<c:otherwise>
			
				<c:forEach var="rowNum" begin="1" end="5">
					<tr>
						<td>${oneinqList[rowNum-1].one_inq_content}</td>
						<td>${oneinqList[rowNum-1].member_nickname}</td>
					</tr>
				</c:forEach>		
			</c:otherwise>
		</c:choose>
		</tbody>
    </table>
	</div>
	<div id="sub2">
	<table class="tbl_list">
	<thead>
 	 <tr>
 		<th width="300" id="name">판매자 등록문의</th>
 		<th width="50" id="right"><a href="manager_5sign.do" id="right">더보기 〉</a></th>
 	 </tr>
 	 </thead>
 	 <tbody>
        <!-- 글목록 내용-->
		<c:choose>
			<c:when test="${empty sellerList}">
				<tr>
					<td colspan="2"> 등록된 판매자 등록문의가 없습니다. </td>
				</tr>
			</c:when>
			<c:otherwise>
			
				<c:forEach var="rowNum" begin="1" end="5">
					<tr>
						<td>${sellerList[rowNum-1].one_inq_content}</td>
						<td>${sellerList[rowNum-1].member_nickname}</td>
					</tr>
				</c:forEach>		
			</c:otherwise>
		</c:choose>
		</tbody>
    </table>
	
	</div>
	<div id="sub3">
	<table class="tbl_list">
	<thead>
 	 <tr>
 		<th width="300" id="name">상품 문의</th>
 		<th width="50" id="right"><a href="manager_41d1.do" id="right">더보기 〉</a></th>
 	 </tr>
 	 </thead>
 	 <tbody>
        <!-- 글목록 내용-->
		<c:choose>
			<c:when test="${empty productinqList}">
				<tr>
					<td colspan="2"> 등록된 상품문의가 없습니다. </td>
				</tr>
			</c:when>
			<c:otherwise>
			
				<c:forEach var="rowNum" begin="1" end="5">
					<tr>
						<td>${productinqList[rowNum-1].product_inq_content}</td>
						<td>${productinqList[rowNum-1].member_nickname}</td>
					</tr>
				</c:forEach>		
			</c:otherwise>
		</c:choose>
		</tbody>
    </table>
	
	</div>
	
	</div>
</div>


<footer>
	<jsp:include page="../main/footer.jsp" />
</footer>
</body>
</html>