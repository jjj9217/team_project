<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	
	#notice_list {
		font-size: 16px;
		border-top: 2px solid #a4a4a4;
		border-bottom: 2px solid #a4a4a4;
		text-align: center;
		margin-bottom: 20px;
	}

	.div_write {
		text-align: right;
		margin-bottom: 50px;
	}
	
	#notice_write {
		width: 150px;
		height: 40px;
		font-size: 15px;
		font-weight: bold;
		text-align: center;
		background-color: #7d99a4;
		color: #ffffff;
		border: none;
		border-radius: 30px;
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
		
	<!-- 글목록 테이블 -->
    <table id="notice_list">
        <tr height="40px;">
            <th width="100px;">번호</th>
            <th width="720px;">제목</th>
            <th width="200px;">등록일</th>
        </tr>
        
        <!-- 추후 c:choose, c:when 및 데이터베이스를 연동해 페이지 구현 -->
		
		<tr>
			<td colspan="3" style="height: 300px; color: #a4a4a4;"> 등록된 게시물이 없습니다. </td>
		</tr>

		<tr>
			<td id="td_paging" colspan="6">
				<!-- 추후 페이징 구현 -->
			</td>
		</tr>
    </table>
	<!-- 목록 하단에 글등록 버튼 구현 -->
	<!-- 추후 관리자에게만 보이게끔 수정 -->
	<div class="div_write">
		<a href="#"><button id="notice_write">공지사항 등록</button></a>
	</div>
</section>

<footer>
	<jsp:include page="../main/footer.jsp" />
</footer>

</body>
</html>