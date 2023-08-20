<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 작성 | CrueltyFree</title>
<link rel="icon" href="${pageContext.request.contextPath}/resources/img/favicon1.png">

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
		height: 50px;
		text-align: left;
		background-color: #eef3f5;
		padding: 30px 0 0 0;
		margin-bottom: 20px;
	}
	
	#title a {
		text-align: left;
		font-size: 20px;
		font-weight: bold; 
	}
	
	.qna_select {
		width: 100%;
		text-align: center;
		margin-bottom: 40px;
	}
	
	.notice {
		width: 510px;
		height: 50px;
		background-color: #7d99a4;
		display: inline-block;
		padding-top: 15px;
		cursor: pointer;
	}
	
	.notice a {
		color: #ffffff;
		font-size: 20px;
		font-weight: bold;
		text-decoration-line: none;
	}
	
	.one_inq {
		width: 510px;
		height: 50px;
		background-color: #ededed;
		display: inline-block;
		padding-top: 15px;
		cursor: pointer;
	}
	
	.one_inq a {
		color: #000000;
		font-size: 20px;
		font-weight: bold;
		text-decoration-line: none;
	}
	
	.qna_select {
		width: 100%;
		text-align: center;
		margin-bottom: 40px;
		font-size: 0;
	}
	
	.notice_type {
		border-top: 2px solid #a4a4a4;
		border-bottom: 1px solid #a4a4a4;
	}
	
	.notice_sub {
		height: 300px;
		padding: 20px 0 45px 0;
		border-bottom: 1px solid #a4a4a4;
	}
	
	.notice_left {
		width: 250px;
		height: 35px;
		display: inline-block;
		padding-top: 20px;
		padding-bottom: 10px;
	}
	
	.notice_left a {
		font-size: 13px;
		text-align: left;
		font-weight: bold;
	}
	
	.notice_right {
		width: 750px;
		display: inline-block;
	}
	
	.regi_box {
		border: 1px solid #a4a4a4;
		border-radius: 13px;
		outline-color: #7d99a4;
		padding: 10px;
		vertical-align: top;
		margin-bottom: 18px;
	}
	
	.notice_content {
		width: 650px;
		height: 300px;
		border: 1px solid #a4a4a4;
		border-radius: 5px;
		outline-color: #7d99a4;
		padding: 10px;
		resize: none;
		margin-bottom: 40px;
	}
	
	.div_write {
		text-align: center;
		margin-top: 50px;
		margin-bottom: 50px;
	}
	
	#notice_write {
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
	
	#notice_cancel {
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
	
	footer {
		bottom: 0px;
		width: 100%;
		height: 250px;
		line-height: 20px;
		background-color: #eef3f5;	
	}
</style>

<script>

function validateForm(){
	if (notice_insert.notice_title.value.length==0) {
		alert("제목을 입력하세요.");
		notice_insert.notice_title.focus();
		return false;
	} else if (notice_insert.notice_content.value.length==0) {
		alert("내용을 입력하세요.");
		notice_insert.notice_content.focus();
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
	&nbsp;&nbsp;<a>공지사항 등록</a>
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

<form name="notice_insert" method="post" action="notice_process.do" enctype="multipart/form-data" 
          onsubmit="return validateForm()">

	<div class="notice_type">
		<article class="notice_left">
			&nbsp;&nbsp;<a>제목</a>
		</article>
		<article class="notice_right">
			<input type="text" name="notice_title" class="regi_box" style="width:350px;">
		</article>
	</div>
	
	<div class="notice_sub">
		<article class="notice_left" style="vertical-align: top;">
			&nbsp;&nbsp;<a>내용</a>
		</article>
		<article class="notice_right">
			<textarea name="notice_content" class="notice_content" placeholder="내용을 1000자 이내로 입력해주세요"></textarea>
		</article>
	</div>
	
	<div class="notice_type" style="border-top: none;">
		<article class="notice_left">
			&nbsp;&nbsp;<a>파일 첨부</a>
		</article>
		<article class="notice_right">
			<input type="file" name="attachedFile" id="thumFile" class="regi_box">
		</article>
	</div>
	
	<!-- 등록 버튼 -->
	<div class="div_write">
		<input type="submit" id="notice_write" value="등록하기">
		<a href="${pageContext.request.contextPath}/one_inq/notice.do"><button id="notice_cancel">취소하기</button></a>
	</div>
</form>
</section>
<footer>
	<jsp:include page="../main/footer.jsp" />
</footer>

</body>
</html>