<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.List, java.util.HashMap, java.util.Map" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SkyBox - 전체 게시판 검색</title>
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
	
	$("#postQuantity").change(function(){
		let rows_per_page = $("#postQuantity").val();
    	if(rows_per_page == 10){
    		rows_per_page = "";
    	}
    	location.href="search_list"+ rows_per_page + ".do" ;
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
#titlecontainer{
	padding-left: 10px;
    margin-left: 20px;
    margin-bottom: 20px;
	width: 928px;
    height: 42px;
    line-height: 42px;
}
#title{
	width: 500px
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
#contentcontainer{
    margin-left: 20px;
	width: 918px;
	height: auto;
    padding: 10px;
}
#pagingcontainer{
    margin-left: 20px;
    margin-bottom: 10px;
	width: 918px;
    height: 40px;
    padding: 10px;
}
#td_paging{
	width: 918px;
    height: 40px;
    text-align: center;
}
#title_image{
	margin-top: 8px;
}
#td_title{
	width: 780px; height: 42px;
	font-size: 20px;
	color: rgb(41, 128, 185);
	font-weight: bold;
	padding-left: 5px;
}
#td_title a{
	color: rgb(41, 128, 185);
}
#td_title_side{
	width: 158px; height: 42px;
	text-align: right;
}
.td_num{
	width: 60px; height: 28px;
	text-align: center;
}
.td_title{
	width: 535px; height: 28px;
}
.td_title a{
	text-decoration: none;
	color: rgb(41, 128, 185);
}
.td_title a:hover{
	text-decoration: none;
	color: rgb(41, 128, 185);
	font-weight: bold;
}
.td_nickname{
	width: 100px; height: 28px;
	text-align: center;
}
.td_count{
	width: 65px; height: 28px;
	text-align: center;
}
.td_date{
	width: 100px; height: 28px;
	text-align: center;
}
#td_notice{
	width: 938px; height: 28px;
	text-align: center;
}
#td_space{
	width: 938px; height: 10px;
}
#td_list{
	width: 650px; height: 28px;
	text-align: left;
}
#td_search{
	width: 650px; height: 28px;
	text-align: right;
}
#td_search_result{
	width: 938px; height: 28px;
	text-align: center;
}
.rowColor:nth-child(2n){
	background-color: rgb(150, 222, 224);	
}
.rowColor{
	color: rgb(41, 128, 185);
	font-size:14px;
}
#tb_board{
	border-collapse: collapse;
}
th{
	color: white;
	background-color: rgb(41, 128, 185);
	font-weight: bold;
}
#searchField,#searchWord,#board_search_btn{
	float:left;
}
#searchWord{
	margin-right: 10px;
}
#postQuantity{	
	margin-right: 10px;
}
#list{
	width: 80px; height: 32px;
	background-color: rgb(41, 128, 185);
	color: white;
	border-width: 0;
	font-weight: bold;
	float:right;
}
#board_search_btn{
	width: 60px; height: 32px;
	background-color: rgb(41, 128, 185);
	color: white;
	border-width: 0;
	font-weight: bold;
}
#searchWord{
	width: 158px; height: 28px;
	background-color: white;
	border-color: rgb(41, 128, 185);
	border-style: solid;
	border-width: 2px;
	font-size: 12px;	
	padding: 0 0 0 10px;
}
#searchField{
	width: 70px; height: 32px;	
	background-color: white;
	border-color: rgb(41, 128, 185);
	border-style: solid;
	border-width: 2px;
	padding: 0 0 0 5px;
    border-width: 2px;
	font-size: 12px;
}
#postQuantity{
	width: 120px; height: 32px;	
	background-color: white;
	border-color: rgb(41, 128, 185);
	border-style: solid;
	border-width: 2px;
    border-width: 2px;
	font-size: 12px;
	padding: 0 0 0 5px;
}
#write_btn{
	width: 60px; height: 32px;
	background-color: rgb(41, 128, 185);
	color: white;
	border-width: 0;
	font-weight: bold;
	float: right;
}
input:focus{
	border-color:rgb(41, 128, 185);
	outline: 0;
}
select:focus{
	border-color:rgb(41, 128, 185);
	outline: 0;
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
#search_result_title{
    font-weight: bold;
	color: rgb(41, 128, 185);  
}
#reply_color{
	color: rgb(13, 147, 234);
	font-weight: bold;
	font-size: 14px;
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
		<jsp:include page="../main/header.jsp"/>
	</header>
	
	<nav id="main-navigaion">
		<div id="navleft" class="pull-left">
			<ul class="outer-menu">
				<li class="outer-menu-item">
					<span class="menu-title">영화감상게시판</span>
					<ul class="inner-menu">
						<li class="inner-menu-item">
							<a href="../oneline_board/list.do">한줄평</a>							
						</li>
						<li class="inner-menu-item">
							<a href="../review_board/list.do">리뷰</a>
						</li>
					</ul>
				</li>
			</ul>
			<ul class="outer-menu">
				<li class="outer-menu-item">
					<span class="menu-title">유저게시판</span>
					<ul class="inner-menu">
						<li class="inner-menu-item">
							<a href="../free_board/list.do">자유게시판</a>							
						</li>
						<li class="inner-menu-item">
							<a href="../question_board/list.do">질문게시판</a>
						</li>
					</ul>
				</li>
			</ul>
		</div>
		<div class="pull-right">
			<div class="search-bar">
				<form action="../main/search_list.do" name="searchfrm">
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
					<form action="../membership/login_process.do" method="post" name="loginfrm">
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
											<a class="login_link" href="../membership/mypage.do">회원정보보기</a>									
										</td>
										<td class="link-table">
											<a class="login_link" href="../membership/logout.do">로그아웃</a>
										</td>
									</tr>
									<tr>
										<td class="link-table">
											<a class="login_link" href="../membership/mycontent.do">작성글보기</a>									
										</td>
										<td class="link-table">
											<a class="login_link" href="../membership/myreply.do">작성댓글보기</a>
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
											<a class="logout_link"  href="../membership/join.do">&nbsp;&nbsp;회원가입&nbsp;</a>
											<a class="logout_link" href="../membership/search_id.do">&nbsp;&nbsp;ID/PW 찾기&nbsp;&nbsp;</a>
										</td>
									</tr>
								</table>
							</c:otherwise>
						</c:choose>				
					</form>
				</aside>
		</div>	
	</div>
	<div id="titlecontainer">
		<div id="title" class="pull-left">
				<div class="pull-left">
					<img id="title_image" src="../resources/img/list.png" width="28px" height="28px" alt="글 수 이미지">
				</div>
			&nbsp;글 수 : ${totalRows}
			</div>	
	</div>
	<div id="contentcontainer">
		<table id="tb_board">			
			<tr>
				<td id="td_title" colspan="2"><a href="../main/search_list.do">전체 게시물 검색결과</a></td>
				<td id="td_title_side" colspan="4">
					<a href="../main/search_list.do"><input type="button" name="list" id="list" value="목록"></a>
					<select name="postQuantity" id="postQuantity">
	                    <option value="10" selected>10개씩 보기</option>
	                    <option value="20">20개씩 보기</option>
	                    <option value="30">30개씩 보기</option>
	                </select>
				</td>
			</tr>
			<tr>
				<th class="td_num">번호</th>
				<th class="td_title">제목</th>
				<th class="td_nickname">닉네임</th>
				<th class="td_count">추천수</th>
				<th class="td_count">조회수</th>
				<th class="td_date">날짜</th>
			</tr>				
			<c:choose>
				<c:when test="${empty searchList}">
					<tr>
						<td id="td_notice" colspan="6"> 등록된 게시물이 없습니다. </td>
					</tr>
				</c:when>
				<c:otherwise>
					<c:forEach var="rowNum" begin="${startNum}" end="${endNum}">
						<tr class="rowColor">
							<td class="td_num">${searchList[rowNum-1].all_board_number}</td>
							<td class="td_title">
								<c:choose>
								<c:when test="${searchList[rowNum-1].board_initial eq 'F'}">
								<a href="../free_board/view.do?no=${searchList[rowNum-1].board_idx}">								
								${searchList[rowNum-1].title}
								<c:if test="${!empty searchList[rowNum-1].originFile}">
									<img src="../resources/img/attachedfile.png" width="12px" height="12px">
								</c:if>
								<c:choose>
									<c:when test="${searchList[rowNum-1].reply_count eq 0}">
									</c:when>
									<c:otherwise>
										&nbsp;&nbsp;<span id="reply_color">${searchList[rowNum-1].reply_count}</span>
									</c:otherwise>
								</c:choose>
								</a>
								</c:when>
								<c:when test="${searchList[rowNum-1].board_initial eq 'Q'}">
								<a href="../question_board/view.do?no=${searchList[rowNum-1].board_idx}">								
								${searchList[rowNum-1].title}
								<c:if test="${!empty searchList[rowNum-1].originFile}">
									<img src="../resources/img/attachedfile.png" width="12px" height="12px">
								</c:if>
								<c:choose>
									<c:when test="${searchList[rowNum-1].reply_count eq 0}">
									</c:when>
									<c:otherwise>
										&nbsp;&nbsp;<span id="reply_color">${searchList[rowNum-1].reply_count}</span>
									</c:otherwise>
								</c:choose>
								</a>
								</c:when>
								<c:when test="${searchList[rowNum-1].board_initial eq 'R'}">
								<a href="../review_board/view.do?no=${searchList[rowNum-1].board_idx}">								
								${searchList[rowNum-1].title}
								<c:if test="${!empty searchList[rowNum-1].originFile}">
									<img src="../resources/img/attachedfile.png" width="12px" height="12px">
								</c:if>
								<c:choose>
									<c:when test="${searchList[rowNum-1].reply_count eq 0}">
									</c:when>
									<c:otherwise>
										&nbsp;&nbsp;<span id="reply_color">${searchList[rowNum-1].reply_count}</span>
									</c:otherwise>
								</c:choose>
								</a>
								</c:when>
								<c:when test="${searchList[rowNum-1].board_initial eq 'O'}">
								<a href="../oneline_board/view.do?no=${searchList[rowNum-1].board_idx}">								
								${searchList[rowNum-1].title}
								<c:if test="${!empty searchList[rowNum-1].originFile}">
									<img src="../resources/img/attachedfile.png" width="12px" height="12px">
								</c:if>
								<c:choose>
									<c:when test="${searchList[rowNum-1].reply_count eq 0}">
									</c:when>
									<c:otherwise>
										&nbsp;&nbsp;<span id="reply_color">${searchList[rowNum-1].reply_count}</span>
									</c:otherwise>
								</c:choose>
								</a>
								</c:when>
								</c:choose>
								
							</td>
							<td class="td_nickname">${searchList[rowNum-1].member_nickname}</td>
							<td class="td_count">${searchList[rowNum-1].recommendation_count}</td>
							<td class="td_count">${searchList[rowNum-1].read_count}</td>
							<td class="td_date">${searchList[rowNum-1].post_date}</td>					
						</tr>				
					</c:forEach>				
				</c:otherwise>
			</c:choose>							
			<tr><td id="td_space" colspan="4"></td><tr>			
			<tr>
				<td id="td_list" colspan="2">
	                <form name="boardsearchfrm">
						<select name="searchField" id="searchField">
		                    <option value="title">제목</option>
		                    <option value="content">내용</option>
		                    <option value="reply">댓글</option>
		                    <option value="nickname">닉네임</option>
		                </select>
		                <input type="text" name="searchWord" id="searchWord">
						<input type="submit" id="board_search_btn" value="검색">
					</form>
				</td>
				<td id="td_search" colspan="4">
				 	<c:choose>							
						<c:when test="${!empty membership}">
						<!-- 회원용 -->
						</c:when>
						<c:otherwise>	
						<!-- 일반용 -->
						</c:otherwise>
					</c:choose>	
				</td>
			</tr>
		</table>	
		<table>
			<tr>
				<td id="td_search_result" colspan="5">
					<c:choose>
					<c:when test="${!empty searchWord}">
						<span id="search_result_title">
							<c:choose>
								<c:when test="${searchField eq 'title'}">
									제목
								</c:when>
								<c:when test="${searchField eq 'content'}">
									내용
								</c:when>
								<c:when test="${searchField eq 'reply'}">
									댓글
								</c:when>
								<c:otherwise>
									닉네임
								</c:otherwise>	
							</c:choose>
							 : ${searchWord}"</span>&nbsp;에 대한 검색결과
					</c:when>
					<c:when test="${!empty searchTotal}">
						<span id="search_result_title">
						전체게시물 : ${searchTotal}"</span>&nbsp;에 대한 검색결과
					</c:when>
					<c:otherwise>
						
					</c:otherwise>			
					</c:choose>
				</td>
			</tr>
		</table>	
	</div>
	<div id="pagingcontainer">	
		<div id="pagingleft" class="pull-left">
			<table>
				<tr>
					<td id="td_paging">
						<%@ include file="../main/paging_list.jsp" %>					
					</td>
				</tr>
			</table>					
		</div>
		<div id="write" class="pull-right">
		</div>
	</div>
	<footer id="main-footer">
		<jsp:include page="../main/footer.jsp" />
	</footer>
</body>
</html>