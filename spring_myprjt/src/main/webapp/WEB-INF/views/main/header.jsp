<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Header</title>
<style>
	#header{
		padding-top: 20px;
		width: 938px; height: 110px; line-height: 50px;
	}
	.pull-left{
		float: left;
	}	
	.pull-right, #notice, #homemenu{
		float: right;
	}
	#notice a {
		color: black;
		font-weight: bold;
	}
	#user, #welcome, {
		font-weight: bold;
	}
	#mypage, #user{
		color: rgb(41, 128, 185);
	}
	#logout, #adminpage{
		color: red;
	}
	
	#sitemapcontainer{
		float: right;
		position: relative;
	}
	#sitemap{
		display: none;
		float: right;		
		position: absolute;
		background-color: rgb(150, 222, 224);
		border-color: rgb(41, 128, 185);
		border-style: solid;
		border-width: 2px;
		top: 0px; left: -421px;
		width: 380px; height: 460px;
		z-index: 100;
		text-align: left;
		padding: 20px;
		border-radius: 2px;
	}
	#sitemap1,#sitemap3{
		float: left;
		width:180px; height:210px;
		margin-right: 20px;
		line-height: 40px;
	}
	#sitemap2,#sitemap4{
		float: left;
		width:180px; height:210px;
		line-height: 40px;
	}
	#sitemap1, #sitemap2{
		margin-bottom: 20px;
	}
	#sitemap1 a, #sitemap2 a, #sitemap3 a, #sitemap4 a{
		color: rgb(41, 128, 185);		
	}
	#sitemap1 a:hover, #sitemap2 a:hover, #sitemap3 a:hover, #sitemap4 a:hover{
		font-weight: bold;	
	}
	#x_button{
		width: 24px; height: 24px;
		border-width: 0;
		color: white;
		background-color: rgb(231, 76, 60);	
	}
	.site_header{
		font-weight: bold;
		font-size: 20px;
		color: rgb(41, 128, 185);
	}
	#menu{
		cursor: pointer;
	}
</style>
</head>
<body>
	<div id="header">
		<div class="pull-left">
				<a href="${pageContext.request.contextPath}/main/home.do">
					<img src="${pageContext.request.contextPath}/resources/img/logo.png" width="120px" height="100px"  alt="SkyBox 로고 이미지"></a>
		</div>
		<div class="pull-right">
			<div id="notice">
			
				<c:choose>
					<c:when test="${membership.grade eq 1}">
						<!-- 관리자용 -->
						<a href="${pageContext.request.contextPath}/membership/admin_member.do">&nbsp;&nbsp;<span id="adminpage">관리페이지</span></a>
						<a href="${pageContext.request.contextPath}/membership/mypage.do">&nbsp;&nbsp;<span id="mypage">마이페이지</span></a>
						<a href="${pageContext.request.contextPath}/membership/logout.do">&nbsp;&nbsp;<span id="logout">로그아웃</span></a>
						&nbsp;&nbsp;<span id="user">${membership.member_nickname}&nbsp;</span><span id="welcome">님 환영합니다</span>
					</c:when>
					<c:when test="${membership.grade eq 0}">
						<!-- 회원용 -->
						<a href="${pageContext.request.contextPath}/membership/mypage.do">&nbsp;&nbsp;<span id="mypage">마이페이지</span></a>
						<a href="${pageContext.request.contextPath}/membership/logout.do">&nbsp;&nbsp;<span id="logout">로그아웃</span></a>
						&nbsp;&nbsp;<span id="user">${membership.member_nickname}&nbsp;</span><span id="welcome">님 환영합니다</span>
					</c:when>
					<c:otherwise>	
						<!-- 일반용 -->
					</c:otherwise>
				</c:choose>				
			</div>
			<br>
			<div id="homemenu">
				<a id="home" href="${pageContext.request.contextPath}/main/home.do">
					<img src="${pageContext.request.contextPath}/resources/img/home.png" width="56px" height="56px"  alt="홈 버튼 이미지"></a>
				
				<a id="menu">
					<img src="${pageContext.request.contextPath}/resources/img/menu.png" width="56px" height="56px"  alt="메뉴 버튼 이미지"></a>
					<br>							
			<div id="sitemapcontainer">
				<div id="sitemap">
				<div id="sitemap1">
					<span class="site_header">영화감상게시판</span><br>
					<a href="${pageContext.request.contextPath}/oneline_board/list.do">&nbsp;한줄평</a><br>
					<a href="${pageContext.request.contextPath}/review_board/list.do">&nbsp;리뷰</a><br>
				</div>
				<div id="sitemap2">
					<span class="site_header">유저게시판</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="button" id="x_button" value="X">
					<br>
					<a href="${pageContext.request.contextPath}/free_board/list.do">&nbsp;자유게시판</a><br>
					<a href="${pageContext.request.contextPath}/question_board/list.do">&nbsp;질문게시판</a><br>
				</div>
				<br>
				<div id="sitemap3">
					<span class="site_header">회원서비스</span><br>
					<a href="${pageContext.request.contextPath}/membership/login.do">&nbsp;로그인</a><br>
					<a href="${pageContext.request.contextPath}/membership/join.do">&nbsp;회원가입</a><br>
					<a href="${pageContext.request.contextPath}/membership/search_id.do">&nbsp;아이디찾기</a><br>
					<a href="${pageContext.request.contextPath}/membership/search_pw.do">&nbsp;비밀번호찾기</a><br>
				</div>
				<div id="sitemap4">
					<c:choose>
					<c:when test="${!empty membership}">
					<span class="site_header">마이서비스</span><br>
					<a href="${pageContext.request.contextPath}/membership/mypage.do">&nbsp;회원정보보기</a><br>
					<a href="${pageContext.request.contextPath}/membership/mycontent.do">&nbsp;작성글보기</a><br>
					<a href="${pageContext.request.contextPath}/membership/myreply.do">&nbsp;작성댓글보기</a><br>
					<a href="${pageContext.request.contextPath}/membership/my_info_edit.do">&nbsp;회원정보변경</a><br>
					<a href="${pageContext.request.contextPath}/membership/my_pw_edit.do">&nbsp;비밀번호변경</a><br>
					</c:when>
					<c:otherwise>
					</c:otherwise>
					</c:choose>
				</div>
				</div>
			</div>
			</div>
		</div>
		
			
		
		
	</div>	
	
</body>
</html>