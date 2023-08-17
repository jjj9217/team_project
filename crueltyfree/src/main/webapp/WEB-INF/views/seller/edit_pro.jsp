<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 정보 수정 | CrueltyFree</title>

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

<script>

// function categoryLarge(cate_large) {
// 	var categorySmall_a = ["토너/로션/올인원", "에센스/크림", "미스트/오일"];
// 	var categorySmall_b = ["클렌징폼/젤", "오일/워터/리무버"];
// 	var categorySmall_c = ["립메이크업", "베이스메이크업", "아이메이크업"];
// 	var categorySmall_d = ["샤워/입욕", "로션/오일"];
// 	var categorySmall_e = ["샴푸/린스/트리트먼트", "염색약/펌"];
// 	var categorySmall_f = ["-"];
// 	var target = document.getElementById("categorySmall");

// 	if(cate_large.value == "skin") var cate_small = categorySmall_a;
// 	else if(cate_large.value == "clensing") var cate_small = categorySmall_b;
// 	else if(cate_large.value == "makeup") var cate_small = categorySmall_c;
// 	else if(cate_large.value == "body") var cate_small = categorySmall_d;
// 	else if(cate_large.value == "hair") var cate_small = categorySmall_e;
// 	else var cate_small = categorySmall_f;
	
// 	var categorySmall_a_val = ["skin_1", "skin_2", "skin_3"];
//     var categorySmall_b_val = ["clensing_1", "clensing_2"];
//     var categorySmall_c_val = ["makeup_1", "makeup_2", "makeup_3"];
//     var categorySmall_d_val = ["body_1", "body_2"];
//     var categorySmall_e_val = ["hair_1", "hair_2"];
//     var categorySmall_f_val = ["prop_1"];
//     var target = document.getElementById("categorySmall");
	
//     if(cate_large.value == "skin") var cate_small_val = categorySmall_a_val;
//     else if(cate_large.value == "clensing") var cate_small_val = categorySmall_b_val;
//     else if(cate_large.value == "makeup") var cate_small_val = categorySmall_c_val;
//     else if(cate_large.value == "body") var cate_small_val = categorySmall_d_val;
//     else if(cate_large.value == "hair") var cate_small_val = categorySmall_e_val;
//     else var cate_small_val = categorySmall_f_val;

// 	target.options.length = 0;

// 	for (x in cate_small) {
// 		var opt = document.createElement("option");
// 		opt.innerHTML = cate_small[x];
// 		opt.value = cate_small_val[x];
// 		target.appendChild(opt);
// 	}
// }

//	$(function(){
//	let category = '${category}';
	// value값으로 설정
//	$("#category").val(category).prop("selected", true);
	
//	let categorySmall = '${categorySmall}';
	// value값으로 설정
//	$("#categorySmall").val(categorySmall).prop("selected", true);
//	});//end of jQuery

function validateForm(){
	if (form_update.product_name.value.length==0) {
		alert("상품명을 입력하세요.");
		form_update.product_name.focus();
		return false;
	} else if (form_update.product_price.value.length==0) {
		alert("상품 가격을 입력하세요.");
		form_update.product_price.focus();
		return false;
	} else if (form_update.product_capa.value.length==0) {
		alert("상품 수량을 입력하세요.");
		form_update.product_capa.focus();
		return false;
	}  else if (form_update.product_info_amount.value.length==0) {
		alert("구매 정보를 모두 입력하세요.");
		form_update.product_info_amount.focus();
		return false;
	}  else if (form_update.product_info_useMethod.value.length==0) {
		alert("구매 정보를 모두 입력하세요.");
		form_update.product_info_useMethod.focus();
		return false;
	}  else if (form_update.product_info_maker.value.length==0) {
		alert("구매 정보를 모두 입력하세요.");
		form_update.product_info_maker.focus();
		return false;
	}  else if (form_update.product_info_handphone.value.length==0) {
		alert("구매 정보를 모두 입력하세요.");
		form_update.product_info_handphone.focus();
		return false;
	}
}

</script>

</head>
<body>

<header>
	<jsp:include page="../main/header.jsp" /><br><br>
</header>

<nav id="title">
	&nbsp;&nbsp;<a>상품 등록</a>
</nav>

<section id="content">
<form name="form_update" method="post" action="edit_pro_process.do" enctype="multipart/form-data" 
          onsubmit="return validateForm()">
          
	<input type="hidden" name="product_idx" value="${ProductVo.product_idx}" />
	<input type="hidden" name="member_idx" value="${MemberVo.member_idx}" />
	<input type="hidden" name="member_nickname" value="${MemberVo.member_nickname}" />
	<input type="hidden" name="file_idx" value="${FileVo.file_idx}" />
	
	<div class="regi_line">
		<article class="regi_left" style="vertical-align: top;">
			&nbsp;&nbsp;<a>썸네일</a>
		</article>
		<article class="regi_right">
			<input type="file" name="attachedFile0" class="regi_box">
			<div class="select_img">
			<!-- 
				<img src="${FileVo.saveFile}" />
				<input type="hidden" name="saveFile" value="${FileVo.saveFile}" />"
			-->
			</div>
			<span class="file_msg"><br>새로운 파일을 선택하면 이전 파일이 교체됩니다.</span>
		</article>
	</div>
	
	<div class="regi_line">
		<article class="regi_left">
			&nbsp;&nbsp;<a>상품명</a>
		</article>
		<article class="regi_right">
			<input type="text" name="product_name" class="regi_box" value="${ProductVo.product_name}">
		</article>
	</div>
	
	<div class="regi_line">
		<article class="regi_left" style="vertical-align: top;">
			&nbsp;&nbsp;<a>가격</a>
		</article>
		<article class="regi_right">
			<input type="text" name="product_price" class="regi_box" value="${ProductVo.product_price}" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');"/>
		</article>
	</div>
	
	<div class="regi_line">
		<article class="regi_left" style="vertical-align: top;">
			&nbsp;&nbsp;<a>상품 재고</a>
		</article>
		<article class="regi_right">
			<input type="text" name="product_capa" class="regi_box" value="${ProductVo.product_capa}" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');"/>
		</article>
	</div>
	
	<div class="regi_line">
		<article class="regi_left" style="vertical-align: top;">
			&nbsp;&nbsp;<a>택배사</a>
		</article>
		<article class="regi_right">
			<select class="regi_box" name="delivery_company">
				<option value="0">무료</option>
			</select>
		</article>
	</div>
	
	<div class="regi_line">
		<article class="regi_left" style="vertical-align: top;">
			&nbsp;&nbsp;<a>상품설명</a>
		</article>
		<article class="regi_right">
			<input type="file" name="attachedFile1" class="regi_box" style="width: 200px;">
			<input type="file" name="attachedFile2" class="regi_box" style="width: 200px;">
			<input type="file" name="attachedFile3" class="regi_box" style="width: 200px;">
			<span class="file_msg"><br>새로운 파일을 선택하면 이전 파일이 교체됩니다.</span>
		</article>
	</div>
	
	<div class="regi_line">
		<article class="regi_left" style="vertical-align: top;">
			&nbsp;&nbsp;<a>구매정보</a>
		</article>
		<article class="regi_right">
			<table id="pro_info">  
				<tr>
					<td class="pro_info_title">내용물의 용량 또는 중량</td>
					<td class="pro_info_content"><input type="text" name="product_info_amount" class="regi_box" value="${ProductInfoVo.product_info_amount}"></td>
				</tr>
				<tr>
					<td class="pro_info_title">사용방법</td>
					<td class="pro_info_content"><textarea name="product_info_useMethod" class="regi_content">${ProductInfoVo.product_info_useMethod}</textarea></td>
				</tr>
				<tr>
					<td class="pro_info_title">제조국</td>
					<td class="pro_info_content"><input type="text" name="product_info_maker" class="regi_box" value="${ProductInfoVo.product_info_maker}"></td>
				</tr>
				<tr>
					<td class="pro_info_title">책임자 전화번호</td>
					<td class="pro_info_content"><input type="text" name="product_info_handphone" class="regi_box" value="${ProductInfoVo.product_info_handphone}"></td>
				</tr>
			</table>
		</article>
	</div>
	
	<!-- 등록 버튼 -->
	<div class="div_write">
		<input type="submit" id="edit_pro_btn" value="수정하기">
		<input type="reset" id="edit_pro_cancel" value="취소하기">
	</div>
</form>

</section>

<footer>
	<jsp:include page="../main/footer.jsp" />
</footer>

</body>
</html>