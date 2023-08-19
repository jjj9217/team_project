<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 정보 수정 | CrueltyFree</title>
<link rel="icon" href="${pageContext.request.contextPath}/resources/img/favicon.png">

<style>
	* {margin:0; padding:0;}
	a{text-decoration: none;} 
	input[type="button"], input[type="submit"], input[type="checkbox"], select, label, button{cursor: pointer;}
	
	.top {
		border-top: 2px solid #4a4a4a;
	}
	
	.bottom {
		border-bottom: 2px solid #4a4a4a;
	}
	
	body {
		width: 1020px;
		margin: 0 auto;
	}
	
	header{
		top: 0px;
		width: 100%;
		height: 165px;
		background-color: white;
	}
	
	#title {
		width: 1020px;
		height: 50px;
		text-align: left;
		background-color: #eef3f5;
		padding: 30px 0 0 0;
	}
	
	#title a {
		text-align: left;
		font-size: 20px;
		font-weight: bold; 
	}
	
	#content {
		width: 1020px;
		border-top: 1px solid #a4a4a4;
	}
	
	.regi_line {
		border-bottom: 1px solid #a4a4a4;
	}
	
	.regi_left {
		width: 250px;
		height: 35px;
		display: inline-block;
		padding-top: 20px;
		padding-bottom: 10px;
	}
	
	.regi_left a {
		font-size: 13px;
		text-align: left;
		font-weight: bold;
	}
	
	.regi_right {
		width: 750px;
		display: inline-block;
		vertical-align: top;
		padding-top: 15px;
		padding-bottom: 10px;
	}
	
	.regi_box {
		border: 1px solid #a4a4a4;
		border-radius: 13px;
		outline-color: #7d99a4;
		padding: 10px;
		vertical-align: top;
	}
	
	.regi_content {
		border: 1px solid #a4a4a4;
		border-radius: 13px;
		outline-color: #7d99a4;
		width: 400px;
		height: 30px;
		padding: 10px;
		vertical-align: top;
		resize: none;
	}
	
	#pro_info {
		width: 750px; 
		height: auto;
	}
	
	.pro_info_title {
		width: 200px; 
		height: 10px; 
		padding: 5px 0 5px 0;
		font-size: 13px;
	}
	
	.pro_info_content {
		width: 560px; 
		height: 10px; 
		padding: 5px 0 5px 0;
		font-size: 13px;
	}
	
	.div_write {
		text-align: center;
		margin-bottom: 50px;
	}
	
	#edit_pro_btn {
		width: 150px;
		height: 40px;
		font-size: 16px;
		font-weight: bold;
		letter-spacing: -1px;
		text-align: center;
		background-color: #7d99a4;
		color: #ffffff;
		border: none;
		border-radius: 30px;
		display: inline-block;
		margin-top: 50px;
	}
	
	#edit_pro_cancel {
		width: 148px;
		height: 38px;
		font-size: 16px;
		font-weight: bold;
		letter-spacing: -1px;
		text-align: center;
		background-color: #ffffff;
		color: #7d99a4;
		border: 2px solid #7d99a4;
		border-radius: 30px;
		display: inline-block;
		margin-top: 50px;
	}
	
	.file_msg {
		font-size: 12px;
		color: #a4a4a4;
	}
	
	footer{
		bottom: 0px;
		width: 100%;
		height: 250px;
		line-height: 20px;
		background-color: #eef3f5;	
	}
</style>



</head>
<body>

<header>
	<jsp:include page="../main/header.jsp" /><br><br>
</header>

<nav id="title">
	&nbsp;&nbsp;<a>상품정보 변경</a>
</nav>

<section id="content">
<form name="form_update" method="post" action="edit_pro_process.do" enctype="multipart/form-data" 
          onsubmit="return validateForm()">
          
	<input type="hidden" name="product_idx1" value="${ProductVo.product_idx}" />
	<div class="regi_line">
		<article class="regi_left">
			&nbsp;&nbsp;<a>상품명</a>
		</article>
		<article class="regi_right">
			<input type="text" name="product_name1" class="regi_box" value="${ProductVo.product_name}">
		</article>
	</div>
	
	<div class="regi_line">
		<article class="regi_left" style="vertical-align: top;">
			&nbsp;&nbsp;<a>가격</a>
		</article>
		<article class="regi_right">
			<input type="text" name="product_price1" class="regi_box" value="${ProductVo.product_price}" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');"/>
		</article>
	</div>
	
	<div class="regi_line">
		<article class="regi_left" style="vertical-align: top;">
			&nbsp;&nbsp;<a>상품 재고</a>
		</article>
		<article class="regi_right">
			<input type="text" name="product_capa1" class="regi_box" value="${ProductVo.product_capa}" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');"/>
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

</section>

<footer>
	<jsp:include page="../main/footer.jsp" />
</footer>

</body>
</html>