<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List, java.util.HashMap, java.util.Map" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SkyBox - 게시글 수정 - 한줄평</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
$(function(){	
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
	
    $("#submit_btn").click(function(){
    	if(frm_edit.title.value.length==0){
    		alert("제목을 입력하세요");
    		frm_edit.title.focus();
    		return false;
    	}else if(frm_edit.content.value.length==0){
    		alert("내용을 입력하세요");
    		frm_edit.content.focus();
    		return false;
    	}
    	document.frm_edit.submit();
        return true;
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
    margin-left: 20px;
    margin-bottom: 20px;
	width: 938px;
    height: 42px;
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
#loginbox a{
	font-size: 12px;
    font-weight: bold;
	color: rgb(127, 127, 127);   
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
    margin-bottom: 10px;
	width: 918px;
    padding: 10px;
}
input:focus{outline: 0;} select:focus{outline: 0;} textarea{outline: 0;}
}
#tb_board{
	border-collapse: collapse;
}
#td_title{
	width: 740px; height: 42px;
	font-size: 20px;
	color: rgb(41, 128, 185);
	font-weight: bold;
	padding-left: 5px;
}
#td_title_side{
	width: 158px; height: 42px;
	text-align: right;	
	vertical-align: bottom;
}
#td_title_input{
	width: 900px; height: 28px;
	border: 2px solid rgb(41, 128, 185);
}
#title_input{
	width: 900px; height: 24px;
	background-color: white;
	border-width: 0px;
	font-size: 12px;	
	padding: 0 0 0 10px;
}
#td_content{
	width: 900px; height: 250px;
	border: 2px solid rgb(41, 128, 185);	
}
#content_input{
	width: 900px; height: 246px;
	background-color: white;
	border-width: 0px;
	font-size: 12px;	
	padding: 10px;
	resize: none;
}
#td_file{
	width: 900px; height: 60px;
	border: 2px solid rgb(41, 128, 185);
	padding: 5px;
	padding-left: 10px;
}
#td_back{
	width: 740px; height: 42px;
}
#td_submit{
	width: 158px; height: 42px;
	text-align: right;
}
.td_space{
	width: 938px; height: 5px;
}
#td_big_space{
	width: 938px; height: 15px;
}
#file_notice{
	font-size: 12px;
	font-weight: bold;
	color: rgb(127, 127, 127);
}
#list{
	width: 72px; height: 27px;
	background-color: rgb(41, 128, 185);
	color: white;
	border-width: 0;
	font-weight: bold;
}
#cancle_btn{
	width: 72px; height: 27px;
	background-color: rgb(224, 224, 224);
	color: rgb(127, 127, 127);
	border-width: 0;
	font-weight: bold;
}
#reset_btn{
	width: 72px; height: 27px;
	background-color: rgb(224, 224, 224);
	color: rgb(127, 127, 127);
	border-width: 0;
	font-weight: bold;
}
#submit_btn{
	width: 72px; height: 27px;
	background-color: rgb(41, 128, 185);
	color: white;
	border-width: 0;
	font-weight: bold;
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
#td_file a{
	color: black;
}
#td_title a{
	color: rgb(41, 128, 185);
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
				<form action="../main/search_list.do" method="get" name="searchfrm">
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
						<table id="tb_login_info">
							<tr>
								<td id="name-table" colspan="2">
								<span id="user_nickname">${membership.member_nickname}</span>
								<span id="nim">님</span>
								</td>
							</tr>
							<tr>
								<td class="link-table">
									<a href="../membership/mypage.do">회원정보보기</a>									
								</td>
								<td class="link-table">
									<a href="../membership/logout.do">로그아웃</a>
								</td>
							</tr>
							<tr>
								<td class="link-table">
									<a href="../membership/mycontent.do">작성글보기</a>									
								</td>
								<td class="link-table">
									<a href="../membership/myreply.do">작성댓글보기</a>
								</td>
							</tr>
						</table>			
					</form>
				</aside>
		</div>	
	</div>
	<div id="titlecontainer">
			
	</div>
	<div id="contentcontainer">
		<form name="frm_edit" method="post" action="edit_process.do" enctype="multipart/form-data">
		<table id="tb_board">			
			<tr>
				<td id="td_title" colspan="3"><a href="../oneline_board/list.do">한줄평</a></td>
				<td id="td_title_side" colspan="2">
					<a href="../oneline_board/list.do"><input type="button" name="list" id="list" value="목록"></a>
				</td>
			</tr>
			<tr>
			<td class="td_space" colspan="5">
				<input type="hidden" name="member_nickname" value="${onelineboardVo.member_nickname}">
                <input type="hidden" name="member_idx" value="${onelineboardVo.member_idx}">
                <input type="hidden" name="board_idx" value="${onelineboardVo.board_idx}">
			</td>
			</tr>
			<tr>
				<td id="td_title_input" colspan="5">
					<input type="text" id="title_input" name="title" value="${onelineboardVo.title}">
				</td>
			</tr>			
			<tr><td class="td_space" colspan="5"></td></tr>				
			<tr>
				<td id="td_content" colspan="5">
					<textarea id="content_input" name="content" cols="30" rows="20">${onelineboardVo.content}</textarea>
				</td>
			</tr>
			<tr><td class="td_space" colspan="5"></td></tr>
			<tr>
				<td id="td_file" colspan="5">
					<span id="file_notice">현재파일</span><br>
					<c:choose>
						<c:when test="${!empty onelineboardVo.saveFile}">
							<img src="../resources/uploads/${onelineboardVo.saveFile}"  width="128px" height="128px"  alt="첨부파일 이미지"><br>
							<a href="download.do?oName=${onelineboardVo.originFile}&sName=${onelineboardVo.saveFile}">${onelineboardVo.originFile}</a><br>
						</c:when>
						<c:otherwise>
							없음
						</c:otherwise>
					</c:choose>					
					<br>
					<span id="file_notice">파일수정</span><br>
					<input type="file" name="attachedFile"><br>
					<span id="file_notice">새로운 파일을 선택하면 이전파일이 교체됩니다.</span>
				</td>
			</tr>
			<tr><td id="td_big_space" colspan="5"></td></tr>	
			<tr>
				<td id="td_back" colspan="3">
					<input type="button" name="cancle_btn" id="cancle_btn" value="뒤로" onclick="history.back()">					
				</td>
				<td id="td_submit" colspan="2">
					<input type="reset" name="reset_btn" id="reset_btn" value="다시 입력">
			        <input type="button" name="submit_btn" id="submit_btn" value="작성 완료">					
				</td>
			</tr>
		</table>
		</form>		
	</div>	
	<footer id="main-footer">
		<jsp:include page="../main/footer.jsp" />
	</footer>
</body>
</html>