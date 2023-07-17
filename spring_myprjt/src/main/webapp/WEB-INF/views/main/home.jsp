<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.List, java.util.HashMap, java.util.Map" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SkyBox - 홈.</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
$(function(){
    $("#login_btn").click(function checkInput(){   	
	    if(loginfrm.member_id.value.length==0){
	        alert("아이디가 입력되지 않았습니다.");
	        loginfrm.member_id.focus();
	        return false;
	    }else if(loginfrm.member_pw.value.length==0){
	        alert("비밀번호가 입력되지 않았습니다.");
	        loginfrm.member_pw.focus();
	        return false;
	    }
	    document.loginfrm.submit();
	    return true;
	});
	
	$("#search_btn").click(function checkSearch(){  	
			    document.searchfrm.submit();
			    return true;
	});
	
	$("#menu").click(function(){
		$("#sitemap").css("display","block");
	});
	
	$("#sitemap").click(function(){
		$("#sitemap").css("display","none");
	});	
	
	$(".outer-menu-item").mouseover(function(){
        $(this).find(".inner-menu").css("display", "block");
    });

    $(".outer-menu-item").mouseout(function(){
        $(this).find(".inner-menu").css("display", "none");
    });

    $(".inner-menu").mouseover(function(){
        $(this).css("display", "block");
    });

    $(".inner-menu").mouseout(function(){
        $(this).css("display", "none");
    });
	
	
});
</script>
<style>
*{margin: 0; padding: 0;}
a{text-decoration: none;}
li{list-style: none;}
.pull-left{float: left; display: block;}
.pull-right{float: right; display: block;}
input[type="button"], input[type="submit"], input[type="reset"], select{cursor: pointer;}
body{
    width: 978px; margin: 0 auto;
    background-color: white;
}
#main-header{		
	width: 938px; height: 115px;
	margin-top:10px;
	margin-left: 20px;
    margin-bottom: 30px;		
}
#main-navigaion{
    background-color:rgb(150, 222, 224);
    margin-top:10px;
    margin-left: 20px;
    margin-bottom: 10px;
	width: 938px;
    height: 60px;
}
#navleft{
	width: 500px;
}
.outer-menu-item{
	float: left;
	position: relative;
	padding-top: 5px;
}
.menu-title:hover{
	color: rgb(8, 61, 97);		
}
.menu-title{
	color: rgb(41, 128, 185);
	font-weight: bold;
	display: block;
	height: 42px; line-height: 42px;
	text-align: center;
	padding: 5px 20px;
}
.inner-menu{
	display: none;
	position: absolute;
	background-color: rgb(150, 222, 224);
	border-color: rgb(41, 128, 185);
	border-style: solid;
	border-width: 2px;
	top: 50px; left: 0;
	width: 90px; height: 70px;
	z-index: 10;
	text-align: left;
	padding: 20px;
	border-radius: 2px;
}
.inner-menu-item > a{
	display: block;
	padding-top: 10px;
	padding-bottom: 10px;
	color: rgb(41, 128, 185);
}
.inner-menu-item > a:hover{
	color: rgb(8, 61, 97);
	font-weight: bold;
}
.search-bar{
	height: 42px;
	padding: 9px;
}
.input-search{
	display: block;
	float: left;
	background-color: white;
	border-color: rgb(41, 128, 185);
	border-style: solid;
	border-width: 2px;
	width: 240px; height: 42px;
	font-size: 12px;
	padding: 0 0 0 10px;
}
.input-search:focus{
	border-color:rgb(41, 128, 185);
	outline: 0;
}
.input-search-submit{
	display: block;
	float: left;
	width: 36px; height: 45px;
	margin-left: 4px;
	background-color: rgb(41, 128, 185);
	color: white;
	font-weight: bold;
	border-width: 0;
	border-radius: 2px;
}
#login-container{
    margin-bottom: 10px;
    width: 978px;
    height: 94px;    
}
#ad-space{
    width: 740px; height: 94px; line-height: 94px;
    margin-left: 20px;
    margin-right: 5px;
    background-color: rgb(224, 224, 224);
    text-align: center;
}
#loginbox{
	margin-right: 20px;
	margin-bottom: 20px;
	width: 184px; height: 94px;	    
    background-color: rgb(150, 222, 224);    
}
#member_id, #member_pw{    
    width: 116px;
    height: 27px;
    margin-left: 4px;
    padding: 0 0 0 10px;
    border-width: 0;
}
#member_id:focus{
	outline: 2px;
	outline-color: rgb(41, 128, 185);
}
#member_pw:focus{
	outline: 2px;
	outline-color: rgb(41, 128, 185);
}
#login_btn{
    width: 42px;
    height: 58px;
    line-height: 64px;
    background-color: rgb(41, 128, 185);
    color: white;
    font-weight: bold;
    border-width: 0;
    margin-top: 4px;
    margin-right: 4px;
    margin-left: 2px;
    border-radius: 2px;
}
#id-table{
	padding-top: 3px;
	vertical-align: bottom;
}
#pw-table{
	vertical-align: top;
}
#submit-table{
	vertical-align:top;
}
#link-table{
	padding-left: 4px;
}
.content{
    overflow: hidden; 
    margin-top:20px;
    margin-left: 20px;
    margin-right: 20px;
    margin-bottom: 20px;
	width: 938px;
    height: 220px;
}
.board-header a{
	color: black;
	text-decoration: none;
}
.content a:hover{
	font-weight: bold;
}
#oneline-board, #free-board{
    display: block;
    float: left;
    width: 449px;
    margin-left: 20px;
    margin-top: 20px;
}
#review-board, #question-board{
    display: block;
    float: right;
    width: 449px;
    margin-left: 20px;
    margin-top: 20px;
}
.board-header{
	width: 310px; height: 30px;
	font-size: 12px;
	padding-left: 5px;
}
.board-date{
	width: 90px; height: 30px;
	font-size: 12px;
	text-align: right;		
}
.board-date-title{
	border-bottom: 5px solid rgb(224, 224, 224);
	text-align: right;
	vertical-align: bottom;	
	padding-bottom: 5px;
}
.board-header-title a{
	text-decoration: none;
	color: rgb(41, 128, 185);
}
.board-header-title a:hover{
	color: rgb(8, 61, 97);
}
.board-header-title{
	height: 42px;
	font-size: 20px;
	text-align: left;
	vertical-align: top;
	border-bottom: 5px solid rgb(224, 224, 224);		

}
.more_btn{
	width: 60px; height: 26px;
	margin-left: 4px;
	background-color: rgb(52, 152, 219);
	color: white;
	font-weight: bold;
	border-width: 0;
	border-radius: 5px;
}
.content table{
    border-collapse: collapse;
}
#name-table{
	padding-left: 5px;
	padding-top: 5px;
}
#user_nickname{
	color: rgb(41, 128, 185);
	font-weight: bold;
	font-size: 15px;
}
#nim{
	font-size: 12px;
}
.link-table{
	padding-left: 10px;
	padding-top: 5px;
}
.logout_link {
	font-size: 14px;
    font-weight: bold;
	color: rgb(41, 128, 185);   
}
.login_link {
	font-size: 12px;
    font-weight: bold;
	color: rgb(127, 127, 127);   
}
.tr_color:hover{
	background-color: rgb(246, 246, 246);
}
.reply_color{
	color: rgb(13, 147, 234);
	font-weight: bold;
	font-size: 10px;
}
#main-footer{
	width: 918px; height: 180px;
	margin-top:60px;
	margin-left: 20px;
	padding-top: 10px;
	padding-left: 20px;
    background-color: rgb(150, 222, 224);	
	color: rgb(127, 127, 127);
	font-size: 12px;
}
</style>
</head>
<body>
	<header id="main-header">
		<jsp:include page="header.jsp"/>
	</header>
	
	<nav id="main-navigaion">
		<div id="navleft" class="pull-left">
			<ul class="outer-menu">
				<li class="outer-menu-item">
					<span class="menu-title">영화감상게시판</span>
					<ul class="inner-menu">
						<li class="inner-menu-item">
							<a href="${pageContext.request.contextPath}/oneline_board/list.do">한줄평</a>							
						</li>
						<li class="inner-menu-item">
							<a href="${pageContext.request.contextPath}/review_board/list.do">리뷰</a>
						</li>
					</ul>
				</li>
			</ul>
			<ul class="outer-menu">
				<li class="outer-menu-item">
					<span class="menu-title">유저게시판</span>
					<ul class="inner-menu">
						<li class="inner-menu-item">
							<a href="${pageContext.request.contextPath}/free_board/list.do">자유게시판</a>							
						</li>
						<li class="inner-menu-item">
							<a href="${pageContext.request.contextPath}/question_board/list.do">질문게시판</a>
						</li>
					</ul>
				</li>
			</ul>
		</div>
		<div class="pull-right">
			<div class="search-bar">
				<form action="${pageContext.request.contextPath}/main/search_list.do" name="searchfrm">
					<input type="hidden" name="searchField" id="searchField">
					<input type="hidden" name="searchWord" id="searchWord">
					<input type="text" class="input-search" name="searchTotal" id="searchTotal">
					<input type="button" class="input-search-submit" name="search_btn" id="search_btn" value="검색">
				</form>
			</div>
		</div>		
	</nav>
	
	<div id="login-container">
		<div class="pull-left">
			<div id="ad-space">광고배너자리</div>
		</div>
		<div class="pull-right">
			<aside id="loginbox">
					<form action="${pageContext.request.contextPath}/membership/login_process.do" method="post" name="loginfrm">						
						<c:choose>							
							<c:when test="${!empty membership}">
								<!-- 회원용 -->
								<table id="tb_login_info">
									<tr>
										<td id="name-table" colspan="2">
										<span id="user_nickname">${membership.member_nickname}</span>
										<span id="nim">님</span>
										</td>
									</tr>
									<tr>
										<td class="link-table">
											<a class="login_link" href="${pageContext.request.contextPath}/membership/mypage.do">회원정보보기</a>									
										</td>
										<td class="link-table">
											<a class="login_link" href="${pageContext.request.contextPath}/membership/logout.do">로그아웃</a>
										</td>
									</tr>
									<tr>
										<td class="link-table">
											<a class="login_link" href="${pageContext.request.contextPath}/membership/mycontent.do">작성글보기</a>									
										</td>
										<td class="link-table">
											<a class="login_link" href="${pageContext.request.contextPath}/membership/myreply.do">작성댓글보기</a>
										</td>
									</tr>
								</table>						
							</c:when>
							<c:otherwise>	
								<!-- 일반용 -->
								<table>
									<tr>
										<td id="id-table"><input type="text" id="member_id" name="member_id" placeholder="아 이 디"></td>
										<td id="submit-table"rowspan="2"><input type="button" id="login_btn" name="login_btn" value="로그인"></td>
									</tr>
									<tr>
										<td id="pw-table"><input type="password" id="member_pw" name="member_pw" placeholder="비 밀 번 호"><br></td>
									</tr>
									<tr>
										<td id="link-table" colspan="2">
											<a class="logout_link" href="${pageContext.request.contextPath}/membership/join.do">&nbsp;&nbsp;회원가입&nbsp;</a>
											<a class="logout_link" href="${pageContext.request.contextPath}/membership/search_id.do">&nbsp;&nbsp;ID/PW 찾기&nbsp;&nbsp;</a>
										</td>
									</tr>
								</table>
							</c:otherwise>
						</c:choose>		
					</form>
				</aside>
		</div>	
	</div>
	
	<div class="content">
		<section id="oneline-board">
			<table>
				<tr><th class="board-header-title"><a href="${pageContext.request.contextPath}/oneline_board/list.do">한줄평</a></th><th class="board-date-title"><a href="${pageContext.request.contextPath}/oneline_board/list.do"><input class="more_btn" type="button" value="더보기"></a></th></tr>
				<c:forEach var="rowNum" begin="1" end="5">
				<tr class="tr_color">
					<td class="board-header">
					<a href="${pageContext.request.contextPath}/oneline_board/view.do?no=${onelineBoardList[rowNum-1].board_idx}">${onelineBoardList[rowNum-1].title}
					<c:choose>
						<c:when test="${onelineBoardList[rowNum-1].reply_count eq 0}">
						</c:when>
						<c:otherwise>
							&nbsp;&nbsp;<span class="reply_color">${onelineBoardList[rowNum-1].reply_count}</span>
						</c:otherwise>
					</c:choose>
					</a>
					</td>
					<fmt:formatDate value="${onelineBoardList[rowNum-1].post_date}" type="date" pattern="yyyy-MM-dd" var="oneline_formattedDate"/>
					<td class="board-date">${oneline_formattedDate}</td>			
				</tr>				
				</c:forEach>
			</table>								
		</section>	
		<section id="review-board">
			<table>
				<tr><th class="board-header-title"><a href="${pageContext.request.contextPath}/review_board/list.do">리뷰</a></th><th class="board-date-title"><a href="${pageContext.request.contextPath}/review_board/list.do"><input class="more_btn" type="button" value="더보기"></a></th></tr>
				<c:forEach var="rowNum" begin="1" end="5">
				<tr class="tr_color">
					<td class="board-header">
					<a href="${pageContext.request.contextPath}/review_board/view.do?no=${reviewBoardList[rowNum-1].board_idx}">${reviewBoardList[rowNum-1].title}
					<c:choose>
						<c:when test="${reviewBoardList[rowNum-1].reply_count eq 0}">
						</c:when>
						<c:otherwise>
							&nbsp;&nbsp;<span class="reply_color">${reviewBoardList[rowNum-1].reply_count}</span>
						</c:otherwise>
					</c:choose>
					</a>
					</td>
					<fmt:formatDate value="${reviewBoardList[rowNum-1].post_date}" type="date" pattern="yyyy-MM-dd" var="review_formattedDate"/>
					<td class="board-date">${review_formattedDate}</td>			
				</tr>				
				</c:forEach>
			</table>	
		</section>		
	</div>
	<div class="content">
		<section id="free-board">
			<table>
				<tr><th class="board-header-title"><a href="${pageContext.request.contextPath}/free_board/list.do">자유게시판</a></th><th class="board-date-title"><a href="${pageContext.request.contextPath}/free_board/list.do"><input class="more_btn" type="button" value="더보기"></a></th></tr>
				<c:forEach var="rowNum" begin="1" end="5">
				<tr class="tr_color">
					<td class="board-header">
					<a href="${pageContext.request.contextPath}/free_board/view.do?no=${freeBoardList[rowNum-1].board_idx}">${freeBoardList[rowNum-1].title}
					<c:choose>
						<c:when test="${freeBoardList[rowNum-1].reply_count eq 0}">
						</c:when>
						<c:otherwise>
							&nbsp;&nbsp;<span class="reply_color">${freeBoardList[rowNum-1].reply_count}</span>
						</c:otherwise>
					</c:choose>
					</a>
					</td>
					<fmt:formatDate value="${freeBoardList[rowNum-1].post_date}" type="date" pattern="yyyy-MM-dd" var="free_formattedDate"/>
					<td class="board-date">${free_formattedDate}</td>			
				</tr>				
				</c:forEach>
			</table>	
		</section>	
		<section id="question-board">
			<table>			
				<tr><th class="board-header-title"><a href="${pageContext.request.contextPath}/question_board/list.do">질문게시판</a></th><th class="board-date-title"><a href="${pageContext.request.contextPath}/question_board/list.do"><input class="more_btn" type="button" value="더보기"></a></th></tr>
				<c:forEach var="rowNum" begin="1" end="5">
				<tr class="tr_color">
					<td class="board-header">
					<a href="${pageContext.request.contextPath}/question_board/view.do?no=${questionBoardList[rowNum-1].board_idx}">${questionBoardList[rowNum-1].title}
					<c:choose>
						<c:when test="${questionBoardList[rowNum-1].reply_count eq 0}">
						</c:when>
						<c:otherwise>
							&nbsp;&nbsp;<span class="reply_color">${questionBoardList[rowNum-1].reply_count}</span>
						</c:otherwise>
					</c:choose>					
					</a>
					</td>
					<fmt:formatDate value="${questionBoardList[rowNum-1].post_date}" type="date" pattern="yyyy-MM-dd" var="question_formattedDate"/>
					<td class="board-date">${question_formattedDate}
					</td>			
				</tr>				
				</c:forEach>
			</table>					
		</section>	
	</div>
	<footer id="main-footer">
		<jsp:include page="footer.jsp" />
	</footer>
</body>
</html>