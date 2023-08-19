<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List, java.util.HashMap, java.util.Map" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>등록 상품 확인 | CrueltyFree</title>
<link rel="icon" href="${pageContext.request.contextPath}/resources/img/favicon.png">


<style>
	* {margin:0; padding:0;}
	a {
		text-decoration: none;
		color: black;
	} 
	input[type="button"], input[type="submit"], input[type="checkbox"], select, label, button, span{cursor: pointer;}
	
	body{
		width:1020px;
		margin:0 auto;
	}
	
	header {
		top: 0px;
		width: 100%;
		height: 165px;
		background-color: white;
	}
	
	footer {
		bottom: 0px;
		width: 100%;
		height: 250px;
		line-height: 20px;
		background-color: #eef3f5;	
  	}
	
	#full {
		width: 1000px;
		height: 500px;
        margin: 0 auto;
        font: bold 25px Arial, Sans-serif;
      	margin-top:10px;
	}
	
	#title {
		width:230px;
		height:120px;
		text-align:center;
		margin-top:50px;

	}
	
	#tap {
		width: 230px;
		height: 160px;
		float: left;
		margin-left: 20px;
	}
	
	.list {
  		list-style-type: none;
  		width: 230px;
  		height: auto;
  		overflow: auto;
	}
	
	.list >li {
		height: 40px;
	}
	
	.list a {
	  	text-decoration: none;
  		padding: 10px;
  		display: block;
  		color: #000;
  		font-size: 14px;
  		background-color: #eef3f5;
  		width: 170px;
	}
	
	.pro_register {
		width: 190px;
		height: 40px;
		font-size: 15px;
		font-weight: bold;
		letter-spacing: -1px;
		text-align: center;
		background-color: #ffffff;
		color: #7d99a4;
		border: 2px solid #7d99a4;
		border-radius: 30px;
		display: inline-block;
		margin-top: 20px;
	}
	
	#content {
		width:700px;
		float:left;
		margin-left:10px;
	}
	
	#checkPro_searchbar {
		width: 280px;
		padding-right: -3px;
	}
	
	.searchField {
		height: 18px;
		border: 1px solid #a4a4a4;
		border-radius: 3px;
		vertical-align: middle;
		outline-color: #7d99a4;
		font-size: 12px;
	}

	#search_btn {
		width: 50px;
		height: 18px;
		background-color: #7d99a4;
		color: #ffffff;
		vertical-align: middle;
		font-size: 12px;
		font-weight: bold;
	}
	
	.sub_title {
		width: 700px;
		height: 50px;
	}
	
	tr {
		height: 20px;
	}
	
	th {
		font-size: 13px;
		font-weight: none;
		height: 30px;
	}
	
	td {
		font-size: 12px;
		font-weight: none;
		text-align: center;
	}
	
	.product_list {
		height: 400px;
		margin-top: 10px;
	}
	
	#pro_list_tb {
		border-collapse: collapse;
		width: 700px;
		border-top: 2px solid #a4a4a4;
		
	}
	
	#pro_list_tb td {
		border-top: 1px solid #a4a4a4;
		padding: 2px 0;
	}
	#pro_list_tb #td_paging {
    	padding: 10px 0;
    	border-bottom: 0px solid #a4a4a4;
	}		
	#clear{clear: both;}
</style>

<script src="https://code.jquery.com/jquery-latest.min.js"></script>

<script>
$(function(){
    $(".pro_delete").click(function(){
    	let index = $(".pro_delete").index(this);    	
    	let confirmAns = confirm("정말 삭제하시겠습니까?");
		if(confirmAns){
			$(".form_delete").eq(index).submit();
	    	return true;
		}
    });
    
    $(".pro_reInsert").click(function(){
    	let index = $(".pro_reInsert").index(this);    	
    	let confirmAns = confirm("상품을 재등록 하시겠습니까?");
		if(confirmAns){
			$(".form_update").eq(index).submit();
	    	return true;
		}
    });
})

</script>

</head>

<body>
<header>
	<jsp:include page="../main/header.jsp" />
</header>
<section id="full">
	<div id="title">
		<img src="../resources/img/seller.png" style="width: 50px; height: 50px;">
		<h3>판매자 페이지</h3>	
	</div>
	<div id="tap">
		<ul class="list">
			<li><a href="purchase_history.do">구매 내역</a></li>
			<li><a href="confirm_inq.do">문의 확인</a></li>
			<li><a href="check_pro.do" style="background-color: #7d99a4; color:#ffffff; font-weight: bold;">등록 상품 확인</a></li>
		</ul>
		<a href="regi_pro.do"><button class="pro_register">상품 등록하기</button></a>
	</div>
	<div id="content">
		<article class="sub_title">
			<h5>등록 상품 확인</h5>
		</article>
		
		<!-- 검색 폼 -->
	    <form>
	        <table id="checkPro_search">
	            <tr>
	                <td id="checkPro_total" style="width:415px; text-align:left; color:#4a4a4a;">
	                	총 상품 개수: ${pageNav.totalRows}
	                </td>
	                <td id="checkPro_searchbar">
	                    <select name="searchField" class="searchField">
	                        <option value="product_name">상품명</option>
	                        <option value="product_capa">재고</option>
	                    </select>
	                    <input type="text" name="searchWord" id="searchWord" class="searchField">
	                    <input type="submit" id="search_btn" class="searchField" value="검색">
	                </td>
	            </tr>
	        </table>
	    </form>
		
		<article class="product_list">
			<table id="pro_list_tb">
		        <tr>
		            <th width="400px;">상품명</th>
		            <th width="100px;">상품 재고</th>
		            <th width="50px;">상태</th>
		            <th width="150px;">수정/삭제</th>
		        </tr>
		        
		        <!-- 글목록 내용-->
				<c:choose>
					<c:when test="${empty checkProList}">
						<tr>
							<td colspan="4" style="height: 300px; color: #a4a4a4;">등록한 상품이 없습니다.</td>
						</tr>
					</c:when>
					<c:otherwise>
						<c:forEach var="rowNum" begin="${pageNav.startNum}" end="${pageNav.endNum}">
							<c:if test="${checkProList[rowNum-1].product_name ne null}"> <!-- product에 저장된 값이 있을 경우에만 출력 -->
								<tr>
									<td id="td_title">
										<a href="../product/product_view.do?prdNum=${checkProList[rowNum-1].product_idx}">${checkProList[rowNum-1].product_name}</a>
									</td>
									<td>${checkProList[rowNum-1].product_capa}</td>
									<c:choose>
										<c:when test="${checkProList[rowNum-1].product_del_or_not eq 1}">
											<td>판매</td>
										</c:when>
										<c:otherwise>
											<td style="color: #a4a4a4;">삭제</td>
										</c:otherwise>
									</c:choose>
									<td>
									<c:choose>
									<c:when test="${checkProList[rowNum-1].product_del_or_not == -1}">
									<div style="margin-top: 2px; width:104px; height:18px; background-color:#7d99a4; color:#ffffff; border-radius:3px; display: inline-block; cursor: pointer;" class="pro_reInsert">상품 재등록</div>
									<input type="hidden" class="pro_delete">
									</c:when>
									<c:otherwise>
										<input type="hidden" class="pro_reInsert">
										<div style="margin-top: 2px; width:50px; height:18px; background-color:#7d99a4; color:#ffffff; border-radius:3px; display: inline-block; cursor: pointer;" onclick="location.href='edit_pro.do?no=${checkProList[rowNum-1].product_idx}'">수정</div>
										<div style="width:50px; height:18px; background-color:#a4a4a4; color:#ffffff; border-radius:3px; display: inline-block; cursor: pointer;" id="pro_delete" class="pro_delete">삭제</div>
									</c:otherwise>
									</c:choose>						
									</td>
								</tr>
							</c:if>
							
							<form action="delete_pro_process.do" class="form_delete" method="post">
								<input type="hidden" name="product_idx" value="${checkProList[rowNum-1].product_idx}">
							</form>
							<form action="update_pro_process.do" class="form_update" method="post">
								<input type="hidden" name="product_idx" value="${checkProList[rowNum-1].product_idx}">
							</form>							
						</c:forEach>
						
					</c:otherwise>
				</c:choose>
		
				<tr height="30px;">
					<td id="td_paging" colspan="4">
						<!-- 페이지 네비게이션 구현 -->
						<%@ include file="paging_checkPro.jsp" %>
					</td>
				</tr>
    		</table>
		</article>
	</div>
</section>
<div id="clear"></div>
</body>

<footer>
	<jsp:include page="../main/footer.jsp" />
</footer>

</body>
</html>