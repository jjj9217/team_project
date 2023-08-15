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
	
	#notice_list {
		font-size: 14px;
		border-top: 2px solid #a4a4a4;
		border-bottom: 2px solid #a4a4a4;
		text-align: center;
		margin-bottom: 20px;
	}
	
	#notice_list a {
		color: #4a4a4a;
	}
	
	#notice_list th {
		border-bottom: 1px solid #a4a4a4;
		color: #4a4a4a;
	}
	
	#notice_list td {
		height: 50px;
		border-bottom: 1px solid #d9d9d9;
	}
	
	#td_title {
		text-align: left;
		padding: 0 0 0 60px;
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
	
	<input type="hidden" name="member_nickname" value="${member.member_nickname}">
	
	<!-- 글목록 테이블 -->
    <table id="notice_list">
        <tr height="50px;">
            <th width="100px;">번호</th>
            <th width="720px;">제목</th>
            <th width="200px;">등록일</th>
        </tr>
        
        <!-- 글목록 내용-->
		<c:choose>
			<c:when test="${empty noticeList[0].notice_idx}">
				<tr>
					<td colspan="3" style="height: 300px; color: #a4a4a4;"> 등록된 게시물이 없습니다. </td>
				</tr>
			</c:when>
			<c:otherwise>
				<c:forEach var="rowNum" begin="${pageNav.startNum}" end="${pageNav.endNum}">
					<c:if test="${noticeList[rowNum-1].notice_idx ne null}"> <!-- notice에 저장된 값이 있을 경우에만 출력 -->
						<tr>
							<td>${noticeList[rowNum-1].notice_idx}</td> <!-- 번호 -->
							<td id="td_title">
								<a href="${pageContext.request.contextPath}/one_inq/notice_view.do?prdNum=${noticeList[rowNum-1].notice_idx}">${noticeList[rowNum-1].notice_title}</a> <!-- 제목 -->
							</td>			
							<td>
								<fmt:formatDate value="${noticeList[rowNum-1].notice_regDate}" type="date"
									pattern="yyyy/MM/dd" /> <!-- 날짜 -->
							</td>
						</tr>
					</c:if>
					
					<form action="delete_pro_process.do" class="form_delete" method="post">
						<input type="hidden" name="notice_idx" value="${noticeList[rowNum-1].notice_idx}">
					</form>
					
				</c:forEach>
				
			</c:otherwise>
		</c:choose>

		<tr>
			<td id="td_paging" colspan="3" style="border-bottom: none;">
				<!-- 페이지 네비게이션 구현 -->
				<%@ include file="paging_notice.jsp" %>
			</td>
		</tr>
    </table>
	<!-- 목록 하단에 글등록 버튼 구현 -->
	<c:if test="${member.member_grade eq 2}">
		<div class="div_write">
			<a href="${pageContext.request.contextPath}/one_inq/notice_write.do"><button id="notice_write">공지사항 등록</button></a>
		</div>
	</c:if>
</section>

<footer>
	<jsp:include page="../main/footer.jsp" />
</footer>

</body>
</html>