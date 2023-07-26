<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
	<title>Home</title>
</head>
<body>
	<header>	
		<jsp:include page="../main/header.jsp"/>	
	</header>
	
	<!-- 홈 만들어지기 전까지 연결을 위한 a태그만 작성해둠 -->
	<a href="${pageContext.request.contextPath}/main/home.do">홈(로고)</a><br>
	<a href="${pageContext.request.contextPath}/product/product_view.do">주문완료</a><br>
	<a href="${pageContext.request.contextPath}/purchase/basket.do">장바구니</a><br>
	<a href="${pageContext.request.contextPath}/purchase/order.do">주문/결제</a><br>
	<a href="${pageContext.request.contextPath}/purchase/order_complete.do">주문완료</a><br>
	<footer>
		<jsp:include page="../main/footer.jsp"/>		
	</footer>
</body>
</html>
