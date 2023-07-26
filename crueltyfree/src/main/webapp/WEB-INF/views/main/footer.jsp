<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Footer</title>
<style>
	
	.foot {
		text-align: center;
		border-top: 2px solid #a4a4a4;
	}
	
	.foot_logo {
		width: 20%;
		vertical-align: top;
		margin-top: 7%;
		display: inline-block;
	}
	
	.foot_content {
		width: 70%;
		margin-top: 3%;
		display: inline-block;
	}
	
	.foot_content a {
		font-size: 13px;
	}
	
</style>
</head>

<body>
<div class="foot">
	<div class="foot_logo">
		<img src="${pageContext.request.contextPath}/resources/img/CrueltyFree_logo.png" style="width: 70%;" />
	</div>
	
	<div class="foot_content">
		<a style="font-weight: bold; color:#000000;">크루얼티프리 주식회사</a><br><br>
		<a style="text-align: left; color:#4a4a4a;"> 대표이사: 정종진<br>
			주소: (31144) 충남 천안시 동남구 대흥로 215 7층, 8층<br><br>
			크루얼티프리에서 판매되는 상품 중에는 크루얼티프리에 입점한 개별 판매자가 판매하는 상품이 포함되어
			있습니다. 개별 판매자 판매 상품의 경우, 크루얼티프리는 통신판매중개자로서 통신판매의 당사자가 아니며
			판매자가 등록한 상품정보 및 거래 정보 등에 대하여 책임을 부담하지 않습니다.
		</a>
	</div>
</div>
</body>
</html>