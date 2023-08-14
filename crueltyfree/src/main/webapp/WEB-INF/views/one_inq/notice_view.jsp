<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List, java.util.HashMap, java.util.Map" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 | CrueltyFree</title>

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
	
	#content {
		font-size: 0;
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
	
	.notice_box {
		width: 1020px;
		border-top: 2px solid #a4a4a4;
		border-bottom: 2px solid #a4a4a4;
		margin-bottom: 50px;
	}
	
	.notice_box a {
		font-size: 12px;
	}
	
	.notice_idx {
		width: 70px;
		height: 50px;
		display: inline-block;
		text-align: center;
		padding: 20px 0 0 0;
		border-bottom: 1px dashed #a4a4a4;
	}
	
	.notice_idx a {
		font-size: 18px;
		font-weight: bold;
		color: #7d99a4;
	}
	
	.notice_title {
		width: 950px;
		height: 50px;
		display: inline-block;
		padding: 20px 0 0 0;
		border-bottom: 1px dashed #a4a4a4;
		color: #4a4a4a;
	}
	
	.notice_title a {
		font-size: 18px;
	}
	
	.notice_content {
		width: 920px;
		margin: 50px 30px 50px 30px;
	}
	
	.notice_content a {
		font-size: 13px;
		line-height: 30px;
	}

	.div_write {
		text-align: right;
		margin-bottom: 50px;
	}
	
	#notice_list {
		width: 150px;
		height: 40px;
		font-size: 15px;
		font-weight: bold;
		text-align: center;
		background-color: #7d99a4;
		color: #ffffff;
		border: none;
		border-radius: 30px;
		margin-bottom: 50px;
		margin-left: 435px;
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
	
	<div class="notice_box">
		<article class="notice_idx">
			<a>${noticeView.notice_idx}</a>
		</article>
		<article class="notice_title">
			<a>${noticeView.notice_title}크루얼티프리 시스템 작업 공지 (08/22 오전 2시~6시)</a>
		</article>
		<article class="notice_content">
			
			<a>${noticeView.notice_content}안녕하세요, 크루얼티프리입니다.<br><br>
				
				보다 안정적인 서비스를 제공하고자, 크루얼티프리 시스템 점검을 진행할 예정입니다.<br>
				작업 시간 동안 아래 서비스 이용이 불가하오니 고객 여러분의 양해 부탁드리겠습니다.<br><br>
				
				작업 시간 : 2023년 8월 22일(화) 오전 2시 ~ 오전 6시<br>
				작업 내용 : 크루얼티프리 시스템 점검<br>
				작업 영향 : <br>
				 1) 크루얼티프리 회원 가입/탈퇴 불가<br>
				 2) 크루얼티프리 포인트 적립/사용 불가 (주문에 대한 포인트는 사후 적립 처리됩니다.)<br>
				 3) 크루얼티프리 사이트 자동 로그인 불가<br>
				 4) 크루얼티프리 회원정보 수정 불가<br><br>
				 
				* 작업 시간은 다소 변동 될 수 있습니다.<br><br>
								
				더 좋은 서비스 제공을 위해 항상 노력하겠습니다.<br>
				감사합니다.<br>				
				<img src="${pageContext.request.contextPath}/resources/uploads/${noticeView.notice_saveFile}">
			</a>
		</article>
	</div>
    
	<!-- 목록 보기 버튼 구현 -->
	<div class="div_list">
		<a href="${pageContext.request.contextPath}/one_inq/notice.do"><button id="notice_list">목록보기</button></a>
	</div>
	<c:if test="${mVo.member_grade eq 2}">
		<div class="div_list">
			<a href="${pageContext.request.contextPath}/one_inq/noticeModify.do?prdNum=${noticeView.notice_idx}"><button id="notice_list2">수정하기</button></a>
		</div>
		<div class="div_list">
			<a href="${pageContext.request.contextPath}/one_inq/noticedel_process.do?prdNum=${noticeView.notice_idx}"><button id="notice_list3">삭제하기</button></a>
		</div>
	</c:if>
</section>

<footer>
	<jsp:include page="../main/footer.jsp" />
</footer>

</body>
</html>