<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구매 내역 | CrueltyFree</title>
<link rel="icon" href="${pageContext.request.contextPath}/resources/img/favicon.png">

<style>
	* {margin:0; padding:0;}
	a {
		text-decoration: none;
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
	
	.history_list {
		margin-top: 10px;
	}
	
	#history_tb {
		border-collapse: collapse;
		width: 700px;
		border-top: 2px solid #a4a4a4;
	}
	
	#history_tb td {
		border-top: 1px solid #a4a4a4;
		padding: 2px 0;
	}
	#history_tb #history_paging {
    	padding: 10px 0;
    	border-bottom: 0px solid #a4a4a4;
	}	
	#clear{clear: both;}
</style>

<script src="https://code.jquery.com/jquery-latest.min.js"></script>

<script>
$(function(){
    $(".state_update1").click(function(){
    	let index = $(".classBtn").index(this);    	
    	let confirmAns = confirm("출고 준비 상태로 변경하시겠습니까?");
		if(confirmAns){
			$(".form_update1").eq(index).submit();
	    	return true;
		}
    });
    
    $(".state_update2").click(function(){
    	let index = $(".classBtn").index(this);    	
    	let confirmAns = confirm("출고 완료하시겠습니까?");
		if(confirmAns){
			$(".form_update2").eq(index).submit();
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
			<li><a href="purchase_history.do" style="background-color: #7d99a4; color:#ffffff; font-weight: bold;">구매 내역</a></li>
			<li><a href="confirm_inq.do">문의 확인</a></li>
			<li><a href="check_pro.do">등록 상품 확인</a></li>
		</ul>
		<a href="regi_pro.do"><button class="pro_register">상품 등록하기</button></a>
	</div>
	<div id="content">
		<article class="sub_title">
			<h5>구매 내역</h5>
		</article>
		
		<!-- 검색 폼 -->
			    <form>
			        <table id="checkPro_search">
			            <tr>
			                <td id="checkPro_total" style="width:415px; text-align:left; color:#4a4a4a;">
			                	총 주문 건수: ${pageNav.totalRows}
			                </td>
			                <td id="checkPro_searchbar">
			                    <select id="searchField" name="searchField" class="searchField">
			                        <option value="order_name">주문자명</option>
			                        <option value="order_num">주문번호</option>
			                    </select>
			                    <input type="text" name="searchWord" id="searchWord" class="searchField">
			                    <input type="submit" id="search_btn" class="searchField" value="검색">
			                </td>
			            </tr>
			        </table>
			    </form>
		
		<article class="history_list">
			<table id="history_tb">
		        <tr>
		            <th width="100px;">주문번호</th>
		            <th width="50px;">주문자명</th>
		            <th width="250px;">상품명</th>
		            <th width="50px;">주문수량</th>
		            <th width="100px;">처리상태</th>
		            <th width="50px;">비고</th>
		        </tr>
		        
		        <!-- 글목록 내용-->
				<c:choose>
					<c:when test="${empty purchaseList}">
						<tr>
							<td colspan="6" style="height: 300px; color: #a4a4a4;">등록한 상품이 없습니다.</td>
						</tr>
					</c:when>
					<c:otherwise>
						<c:forEach var="rowNum" begin="${pageNav.startNum}" end="${pageNav.endNum}">
							<c:if test="${purchaseList[rowNum-1].product_name ne null}"> <!-- 리스트에 저장된 값이 있을 경우에만 출력 -->
								<tr>
									<td id="td_title">${purchaseList[rowNum-1].order_num}</td> <!-- 주문번호 -->
									<td>${purchaseList[rowNum-1].order_name}</td> <!-- 주문자명 -->
									<td>${purchaseList[rowNum-1].product_name}</td> <!-- 상품명 -->
									<td>${purchaseList[rowNum-1].order_product_count}</td> <!-- 주문수량 -->
									<c:choose>
										<c:when test="${purchaseList[rowNum-1].order_ing eq 0}">
											<td>출고대기</td>
										</c:when>
										<c:when test="${purchaseList[rowNum-1].order_ing eq 1}">
											<td>출고준비</td>
										</c:when>
										<c:when test="${purchaseList[rowNum-1].order_ing eq 2}">
											<td>배송중</td>
										</c:when>
										<c:when test="${purchaseList[rowNum-1].order_ing eq 3}">
											<td>배송완료</td>
										</c:when>
										<c:otherwise>
											<td style="color: #a4a4a4;">출고취소</td>
										</c:otherwise>
									</c:choose>
									<c:choose> 
										<c:when test="${purchaseList[rowNum-1].order_ing eq 0}">
											<td>
												<div id="state_update1" class="state_update1 classBtn" style="margin-top: 2px; width:50px; height:18px; font-size: 10px; background-color:#9fb0b7; color:#ffffff; border-radius:3px;">상품준비</div>
											</td>
										</c:when>
										<c:when test="${purchaseList[rowNum-1].order_ing eq 1}">
											<td>
												<div id="state_update2" class="state_update2 classBtn" style="margin-top: 2px; width:50px; height:18px; font-size: 10px; background-color:#7d99a4; color:#ffffff; border-radius:3px;">배송하기</div>
											</td>
										</c:when>
										<c:when test="${purchaseList[rowNum-1].order_ing eq 2}">
											<td>
											배송중
											<input type="hidden" class="classBtn">
											</td>
										</c:when>
										<c:when test="${purchaseList[rowNum-1].order_ing eq 3}">
											<td>
											배송완료
											<input type="hidden" class="classBtn">
											</td>
										</c:when>
										<c:otherwise>
											<td style="color: #a4a4a4;">
											취소완료
											<input type="hidden" class="classBtn">
											</td>
										</c:otherwise>
									</c:choose>
								</tr>
							</c:if>
							
							<form action="update_state_process1.do" class="form_update1" method="post">
								<input type="hidden" name="order_ing1" value="${purchaseList[rowNum-1].order_num}">
							</form>
							<form action="update_state_process2.do" class="form_update2" method="post">
								<input type="hidden" name="order_ing2" value="${purchaseList[rowNum-1].order_num}">
								<input type="hidden" name="order_ing3" value="${purchaseList[rowNum-1].order_idx}">
							</form>
							
						</c:forEach>
					</c:otherwise>
				</c:choose>

				<tr height="30px;">
					<td id="history_paging" colspan="6">
						<!-- 페이지 네비게이션 구현 -->
						<%@ include file="paging_purchaseHis.jsp" %>
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