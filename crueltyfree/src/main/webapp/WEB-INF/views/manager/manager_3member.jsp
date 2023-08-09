<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.List, java.util.HashMap, java.util.Map" %>    
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
		<li id="li"><a href="manager_3member.do" id="" style="color:white; background-color:#7d99a4;" >회원 정보 관리</a></li>
		<li id="li"><a href="manager_41d1.do" id="" >1:1 문의</a></li>
		<li id="li"><a href="manager_5sign.do" id="" >판매자 등록 문의</a></li>
		<li id="li"><a href="manager_6post.do" id="" >게시글 관리</a></li>
		<li id="li"><a href="manager_7goods.do" id="" >상품 문의</a></li>
		<li id="li"><a href="manager_8review.do" id="" >리뷰</a></li>
	</ul>
	</div>
	<div id="content">
		<h5>회원 정보 관리</h5>
	<hr style="margin-top:30px;">
	
	 
	 
	
	
		<div id="main">
    	<div id="total">
                	<span>총 회원수 :</span> <span id="total2">${pageNav.totalRows}</span></div>
           		<div id ="search" >
           			<form name="searching">
                    <select name="searchField" id="searchField">
                        <option value="title">회원번호</option>
                        <option value="content">회원아이디</option>
                    </select>
                    <input type="text" name="searchWord" id="searchWord">
                    <input type="submit" id="search_btn" value="검색">
                    </form>
              </div>
         </div>


    <!-- 글목록 테이블 -->
    <table id="tbl_list" style="margin-top:80px;">
        <tr>
            <th width="">회원번호</th>
            <th width="">아이디</th>
            <th width="">휴대폰번호</th>
            <th width="">성별</th>
            <th width="">이메일</th>
            <th width="">기능</th>
        </tr>

        <!-- 글목록 내용-->
		<c:choose>
			<c:when test="${empty memberList}">
				<tr>
					<td colspan="6"> 데이터가 없습니다. </td>
				</tr>
			</c:when>			
			<c:when test="${empty memSelectList}">
				<tr>
					<td colspan="6"> 데이터가 없습니다. </td>
				</tr>
			</c:when>
			<c:otherwise>
			
				<c:forEach var="rowNum" begin="${pageNav.startNum}" end="${pageNav.endNum}">
					<tr>
						<td>${memSelectList[rowNum-1].member_idx}</td>
						<td>${memSelectList[rowNum-1].member_id}</td>
						<td>${memSelectList[rowNum-1].member_handphone}</td>
						<td>${memSelectList[rowNum-1].member_gender}</td>
						<td>${memSelectList[rowNum-1].member_email}</td>
						<td>
						<input type="button" id="edit" value="수정">
						<input type="button" id="delete" value="탈퇴">
						</td>
					</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>
    </table>
		<div id="paging" class="pull-left">
				<div id="td_paging">
					<%@ include file="../manager/paging_member.jsp" %>					
				</div>				
		</div>

	
	</div>
</div>


<footer>
	<jsp:include page="../main/footer.jsp" />
</footer>
</body>
</html>