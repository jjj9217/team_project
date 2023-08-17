<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1:1 문의 | CrueltyFree</title>

<style>
	* {margin:0; padding:0;}
	a{text-decoration: none;}
    input[type="button"], input[type="submit"], input[type="checkbox"], select, label, button{cursor: pointer;}
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
		height: 90px;
		text-align: left;
		background-color: #eef3f5;
		margin-bottom: 20px;
		padding: 30px 0 0 0;
	}
	
	#title a {
		text-align: left;
	}
	
	.qna_select {
		width: 100%;
		text-align: center;
		margin-bottom: 40px;
		font-size: 0;
	}
	
	.notice {
		width: 510px;
		height: 50px;
		background-color: #ededed;
		display: inline-block;
		padding-top: 15px;
		cursor: pointer;
	}
	
	.notice a {
		color: #000000;
		font-size: 20px;
		font-weight: bold;
		text-decoration-line: none;
	}
	
	.one_inq {
		width: 510px;
		height: 50px;
		background-color: #7d99a4;
		display: inline-block;
		padding-top: 15px;
		cursor: pointer;
	}
	
	.one_inq a {
		color: #ffffff;
		font-size: 20px;
		font-weight: bold;
		text-decoration-line: none;
	}
	
	.one_inq_content {
		width: 1020px;
		border-top: 2px solid #a4a4a4;
		font-size: 0;
		background-color: #fffae0;
	}
	
	.one_inq_type {
		border-top: 2px solid #a4a4a4;
		border-bottom: 1px solid #a4a4a4;
	}
	
	.one_inq_sub {
		height: 300px;
		padding: 20px 0 30px 0;
		border-bottom: 1px solid #a4a4a4;
	}
	
	.oneinq_left {
		width: 250px;
		height: 35px;
		display: inline-block;
		padding-top: 20px;
		padding-bottom: 10px;
	}
	
	.oneinq_left a {
		font-size: 13px;
		text-align: left;
		font-weight: bold;
	}
	
	.oneinq_right {
		width: 750px;
		display: inline-block;
	}
	
	.inq_type {
		width: 170px;
		height: 40px;
		border: 1px solid #a4a4a4;
		border-radius: 5px;
		padding: 0 1px 0 1px;
		outline-color: #7d99a4;
	}
	
	.inq_sub {
		width: 650px;
		height: 300px;
		border: 1px solid #a4a4a4;
		border-radius: 5px;
		outline-color: #7d99a4;
		padding: 10px;
		resize: none;
	}
	
	.div_write {
		text-align: center;
		margin-bottom: 50px;
	}
	
	#one_inq_write {
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
	}
	
	#one_inq_cancel {
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
	}
	
	footer{
		bottom: 0px;
		width: 100%;
		height: 250px;
		line-height: 20px;
		background-color: #eef3f5;	
	}
	
	.regi_box {
		border: 1px solid #a4a4a4;
		border-radius: 13px;
		outline-color: #7d99a4;
		padding: 10px;
		vertical-align: top;
		margin-bottom: 18px;
	}
</style>

</head>
<body>

<header>
	<jsp:include page="../main/header.jsp" /><br><br>
</header>

<nav id="title">
	&nbsp;&nbsp;<a style="font-size: 30px; font-weight: bold;">고객센터</a>&nbsp;&nbsp;&nbsp;<a>무엇을 도와드릴까요?</a>
</nav>

<section id="content">
	<div class="qna_select">
		<article class="notice" onclick="location.href='${pageContext.request.contextPath}/one_inq/notice.do';">
			<a href="${pageContext.request.contextPath}/one_inq/notice.do">공지사항</a>
		</article>
		<article class="one_inq" onclick="location.href='${pageContext.request.contextPath}/one_inq/one_inq_list.do';">
			<a href="${pageContext.request.contextPath}/one_inq/one_inq_list.do">1:1 문의</a>
		</article>
	</div>

<form name="notice_insert" method="post" action="oneinq_process.do" enctype="multipart/form-data" 
          onsubmit="return validateForm()">
	
	<div class="one_inq_type">
		<article class="oneinq_left">
			&nbsp;&nbsp;<a>문의유형</a>
		</article>
		<article class="oneinq_right">
			<select name="one_inq_title" class="inq_type">
				<option value="회원정보">회원정보</option>
				<option value="주문/결제">주문/결제</option>
				<option value="배송문의">배송문의</option>
				<option value="취소/교환/환불">취소/교환/환불</option>
				<option value="사이트 이용 오류/개선">사이트 이용 오류/개선</option>
				<option value="판매자 등급 문의">판매자 등급 문의</option>
			</select>
		</article>
	</div>
	
	<div class="one_inq_sub">
		<article class="oneinq_left" style="vertical-align: top;">
			&nbsp;&nbsp;<a>내용</a>
		</article>
		<article class="oneinq_right">
			<textarea class="inq_sub" placeholder="내용을 1000자 이내로 입력해주세요" name="one_inq_content"></textarea>
		</article>
	</div>
	
	<div class="one_inq_type" style="border-top: none; margin-bottom: 50px;">
		<article class="oneinq_left">
			&nbsp;&nbsp;<a>파일 첨부</a>
		</article>
		<article class="oneinq_right">
			<input type="file" name="attachedFile" id="thumFile" class="regi_box">
		</article>
	</div>
	
	<!-- 등록 버튼 -->
	<div class="div_write">
		<a href="#"><button id="one_inq_write">1:1 문의하기</button></a>
		<a href="${pageContext.request.contextPath}/one_inq/one_inq_list.do"><button id="one_inq_cancel">취소하기</button></a>
	</div>
</form>	
</section>
<footer>
	<jsp:include page="../main/footer.jsp" />
</footer>

</body>
</html>