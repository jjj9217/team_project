<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="vo.AllBoardVo, vo.AllBoardReplyVo, dao.AllBoardDao" %>
<%@ page import="vo.MembershipVo, dao.MembershipDao" %>
<%@ page import="java.util.List, java.util.HashMap, java.util.Map" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SkyBox - 작성 댓글 보기</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
$(function(){
	$("#menu").click(function(){
    	$("#sitemap").css("display","block");
    });
    $("#sitemap").click(function(){
    	$("#sitemap").css("display","none");
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
    margin-bottom: 15px;		
}
#hr{
	background-color: rgb(150, 222, 224);
	width: 938px; height: 5px;
	margin-left: 20px;
}
#titlecontainer{
	padding-top: 10px;
    margin-left: 20px;
	width: 938px;
    height: 42px;
}
#title{
	color: rgb(41, 128, 185);
	font-size: 20px;
	font-weight: bold;
	width: 500px
}
#contentcontainer{
    margin-left: 20px;
	width: 918px;
    height: auto;
    padding: 10px;
}
fieldset{
	width: 898px; height: auto;
	border-color: rgb(150, 222, 224);
	border-width: 2px;
	padding-left: 20px;
	padding-top: 5px;
}
label{
	font-size: 14px;	
}
.td_title{
	width: 148px; height: 30px;
}
.td_content{
	width: 268px; height: 30px;
}
.td_bottom{
	width: 388px; height: 30px;
	padding-left: 10px;	
}
.td_bottom a{
	text-decoration: none;
	color: rgb(41, 128, 185);
	font-size: 14px;
	font-weight: bold;
}
.input_text{
	width: 238px; height: 27px;	
	background-color: rgb(150, 222, 224);
	padding: 0 0 0 10px;
    border-width: 0;
	font-size: 12px;
}
#submit_btn{
	width: 388px; height: 37px;
	background-color: rgb(41, 128, 185);
	color: white;
	border-width: 0;
	font-weight: bold;
}
td>ul>li{
    float: left;
}
#year, #month, #day{
	width: 70px; height: 37px;	
	background-color: rgb(150, 222, 224);
	padding: 0 0 0 10px;
    border-width: 0;
	font-size: 12px;
}
#month{
	width: 78px;
	margin: 0 5px;
	font-size: 12px;
}
#td_submit{
	padding-left: 0;
	padding-top: 5px;
}
#td_bottom{
	padding-top: 15px;
	padding-left: 20px;
}
#td_bottom a{
	text-decoration: none;
	color: rgb(41, 128, 185);
	font-size: 14px;
	font-weight: bold;
}
input:focus{
	border-color:rgb(41, 128, 185);
	outline: 0;
}
select:focus{
	border-color:rgb(41, 128, 185);
	outline: 0;
}
.redstar{
	font-weight: bold;
	color: red;
}
.blue_btn{
	width: 108px; height: 27px;
	background-color: rgb(41, 128, 185);
	color: white;
	border-width: 0;
	font-weight: bold;
}
#edit_info_btn, #edit_pw_btn, #drop_out_btn{
	margin-left: 7px;
}
#sub-title{
	color: rgb(41, 128, 185);
	font-size: 16px;
	font-weight: bold;
	padding-left: 35px;
}
#link1 a{
	text-decoration: none;
	color: rgb(127, 127, 127);
	font-size: 16px;	
}
#link2 a{
	text-decoration: none;
	color: rgb(127, 127, 127);
	font-size: 16px;
	padding-left: 35px;
}
.gray_btn{
	width: 72px; height: 27px;
	background-color: rgb(224, 224, 224);
	color: rgb(127, 127, 127);
	border-width: 0;
	font-weight: bold;
}
#tb_board{	
	border-collapse: collapse;
}
#tr_blue_color{
	background-color: rgb(41, 128, 185);
	color: white;
	font-weight: bold;
	text-align: center;
}
.tr_sky_color{
	color: rgb(41, 128, 185);
}
.td_title a{
	color: rgb(41, 128, 185);
}
.tr_sky_color:nth-child(2n){
	background-color: rgb(150, 222, 224);	
}
#td_count{
	padding-top: 10px;
	width: 883px; height: 32px;
	color: rgb(41, 128, 185);
	font-weight: bold;
}
#th_number{
	width: 90px; height: 28px;
}
#th_title{
	width: 613px; height: 28px;	
}
#th_read_count{
	width: 90px; height: 28px;
}
#th_date{
	width: 90px; height: 28px;
}
.td_number{
	width: 90px; height: 28px;
	text-align: center;
}
.th_title{
	width: 613px; height: 28px;
}
.td_read_count{
	width: 90px; height: 28px;
	text-align: center;
}
.td_date{
	width: 90px; height: 28px;
	text-align: center;
}
.td_space{
	width: 883px; height: 15px;
}
#td_paging{
	width: 883px; height: 15px;
	text-align: center;
}
#td_search_result{
	width: 883px; height: 15px;
	text-align: center;
	padding: 5px 0;
}
#delete_btn{
	width: 72px; height: 27px;
	background-color: rgb(224, 224, 224);
	color: rgb(127, 127, 127);
	border-width: 0;
	font-weight: bold;
}
#td_list{
	width: 80px; height: 28px;
}
#td_search{
	width: 7000px; height: 28px;
	text-align: right;
	padding-right: 15px;
}

#searchField,#searchWord,#board_search_btn{
	float:right;
}
#searchWord{
	margin-right: 10px;
}
#list{
	width: 80px; height: 32px;
	background-color: rgb(41, 128, 185);
	color: white;
	border-width: 0;
	font-weight: bold;
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
#search_result_title{
    font-weight: bold;
	color: rgb(41, 128, 185);  
}
#title a{
	color: rgb(41, 128, 185);
}
#sub-title a{
	color: rgb(41, 128, 185);
}
#tb_search{
	margin-bottom: 10px;
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
	<div id="hr"></div>
	<div id="titlecontainer">
	<div id="title" class="pull-left">마이페이지</div>	
	</div>
	<div id="contentcontainer">
		<fieldset>
            <legend></legend>
            <span id="link1"><a href="../membership/mypage.do">회원정보</a>&nbsp;&nbsp;</span>
            <span id="link2"><a href="../membership/mycontent.do">작성 글 보기</a>&nbsp;&nbsp;</span>
            <span id="sub-title">작성 댓글 보기</span>&nbsp;&nbsp;
            	<form name="adminfrm">
	            <table id="tb_board">
	                <tr>
	                	<c:set var="total" value="${totalRows}" />
	                    <td id="td_count" colspan="3">Total: ${total}</td>
	                </tr>
	                <tr id="tr_blue_color">
	                    <th id="th_number">번호</th>
	                    <th id="th_title">내용</th>
	                    <th id="th_date">날짜</th>
	                </tr>	                
				<c:forEach var="rowNum" begin="${startNum}" end="${endNum}">
				<tr class="tr_sky_color">
					<td class="td_number">${replyList[rowNum-1].all_reply_number}</td>
					<td class="td_title">
						<c:choose>
							<c:when test="${replyList[rowNum-1].board_initial eq 'F'}">
							<a href="../free_board/view.do?no=${replyList[rowNum-1].board_idx}">								
							${replyList[rowNum-1].content}							
							</a>
							</c:when>
							<c:when test="${replyList[rowNum-1].board_initial eq 'Q'}">
							<a href="../question_board/view.do?no=${replyList[rowNum-1].board_idx}">								
							${replyList[rowNum-1].content}							
							</a>
							</c:when>
							<c:when test="${replyList[rowNum-1].board_initial eq 'R'}">
							<a href="../review_board/view.do?no=${replyList[rowNum-1].board_idx}">								
							${replyList[rowNum-1].content}							
							</a>
							</c:when>
							<c:when test="${replyList[rowNum-1].board_initial eq 'O'}">
							<a href="../oneline_board/view.do?no=${replyList[rowNum-1].board_idx}">								
							${replyList[rowNum-1].content}							
							</a>
							</c:when>
						</c:choose>
					</td>
					<td class="td_date">${replyList[rowNum-1].post_date}</td>			
				</tr>				
				</c:forEach>
				<tr><td colspan="3" class="td_space"></tr>
	            </table>
	            </form>
	            <table id="tb_search">					
					<tr>
						<td id="td_paging" colspan="4">
							<%@ include file="../membership/paging_myreply.jsp" %>
						</td>
					</tr>
					<tr>
						<td id="td_search_result" colspan="4">
							<c:choose>
							<c:when test="${!empty searchWord}">
								<span id="search_result_title">
									<c:choose>
										<c:when test="${searchField eq 'content'}">
											내용
										</c:when>
									</c:choose>
									: ${searchWord}"</span>&nbsp;에 대한 검색결과
							</c:when>
							<c:otherwise>
								
							</c:otherwise>			
							</c:choose>
						</td>
					</tr>
					<tr>
						<td id="td_list">							
						</td>
						<td id="td_search" colspan="3">
			                <form name="boardsearchfrm">
								<input type="submit" name="board_search_btn" id="board_search_btn" value="검색">
				                <input type="text" name="searchWord" id="searchWord">
							<select name="searchField" id="searchField">
			                    <option value="content">내용</option>
			                </select>
							</form>
						</td>
					</tr>
				</table>	
        </fieldset>
	</div>
	<footer id="main-footer">
		<jsp:include page="../main/footer.jsp" />
	</footer>
</body>
</html>