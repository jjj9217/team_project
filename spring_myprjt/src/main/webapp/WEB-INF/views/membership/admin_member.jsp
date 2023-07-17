<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="vo.MembershipVo, dao.MembershipDao" %>
<%@ page import="java.util.List, java.util.HashMap, java.util.Map" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SkyBox - 회원 관리</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
$(function(){
	$("#menu").click(function(){
    	$("#sitemap").css("display","block");
    });
    $("#sitemap").click(function(){
    	$("#sitemap").css("display","none");
    });
    
    $("#delete_btn").click(function(){
    	let confirmAns = confirm("정말 회원 탈퇴하시겠습니까?");
    	if(confirmAns){
    		document.adminfrm.submit();
    		return true;
    	} 
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
	padding-bottom: 20px;
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
}
.link a{
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
	font-size: 12px;
}
.td_member_id a{
	color: rgb(41, 128, 185);
}
.td_member_id a:hover{
	font-weight: bold;
}
.tr_sky_color{
	font-size: 12px;	
}
.tr_sky_color:nth-child(2n){
	background-color: rgb(150, 222, 224);	
}
#td_count{
	padding-top: 10px;
	width: 793px; height: 32px;
	color: rgb(41, 128, 185);
	font-weight: bold;
}
#td_delete{
	width: 90px; height: 32px;
	vertical-align: bottom;
	text-align: right;
	padding-bottom: 5px;
}
#th_radio{
	width: 30px; height: 28px;
}
#th_member_idx{
	width: 90px; height: 28px;
}
#th_member_id{
	width: 90px; height: 28px;
}
#th_member_nickname{
	width: 90px; height: 28px;
}
#th_member_name{
	width: 90px; height: 28px;
}
#th_gender{
	width: 90px; height: 28px;
}
#th_phone{
	width: 90px; height: 28px;
}
#th_email{
	width: 223px; height: 28px;
}
#th_join_date{
	width: 90px; height: 28px;
}
.td_radio{
	width: 30px; height: 28px;
	text-align: center;
}
.td_member_idx{
	width: 90px; height: 28px;
	text-align: center;
}
.td_member_id{
	width: 90px; height: 28px;
	text-align: center;	
}
.td_member_nickname{
	width: 90px; height: 28px;
	text-align: center;
}
.td_member_name{
	width: 90px; height: 28px;
	text-align: center;
}
.td_gender{
	width: 90px; height: 28px;
	text-align: center;
}
.td_phone{
	width: 90px; height: 28px;
	text-align: center;
}
.td_email{
	width: 223px; height: 28px;
	text-align: center;
}
.td_join_date{
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
	width: 650px; height: 28px;
}
#td_search{
	width: 650px; height: 28px;
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
	<div id="title" class="pull-left"><a href="../membership/admin_member.do">관리페이지</a></div>	
	</div>
	<div id="contentcontainer">
		<fieldset>
            <legend></legend>
            <span id="sub-title"><a href="../membership/admin_member.do">회원정보</a></span>&nbsp;&nbsp;
            <span class="link"><a href="../membership/admin_content.do">작성글보기</a>&nbsp;&nbsp;</span>
            <span class="link"><a href="../membership/admin_reply.do">작성댓글보기</a>&nbsp;&nbsp;</span>
	            <form name="adminfrm" method="post" action="admin_member_drop_out_process.do">
	            <table id="tb_board">
	                <tr>
	                    <td id="td_count" colspan="8">
	                    총 회원 수: ${totalRows}
	                    </td>
	                    <td id="td_delete"><input type="button" name="delete_btn" id="delete_btn" value="탈퇴"></td>
	                </tr>
	                <tr id="tr_blue_color">
	                	<th id="th_radio"><img src="../resources/img/checkbox.png" width="18px" height="18px"  alt="체크박스 이미지"></th>
	                    <th id="th_member_idx">회원번호</th>
	                    <th id="th_member_id">ID</th>
	                    <th id="th_member_nickname">닉네임</th>
	                    <th id="th_member_name">이름</th>
	                    <th id="th_gender">성별</th>
	                    <th id="th_phone">전화번호</th>
	                    <th id="th_email">이메일주소</th>
	                    <th id="th_join_date">가입일</th>
	                </tr>	                
				<c:forEach var="rowNum" begin="${startNum}" end="${endNum}">
				
				<tr class="tr_sky_color">
					<td class="td_radio">
						<c:if test="${empty memberList[rowNum-1].cancel_date}">
						<input type="checkbox" name="checkbox" value="${memberList[rowNum-1].member_idx}">
						</c:if>
					</td>
					<td class="td_member_idx">${memberList[rowNum-1].member_idx}</td>
					<td class="td_member_id">
					<a href="../membership/admin_member_view.do?no=${memberList[rowNum-1].member_idx}">
						${memberList[rowNum-1].member_id}
					</a>
					</td>
					<td class="td_member_nickname">${memberList[rowNum-1].member_nickname}</td>
					<td class="td_member_name">${memberList[rowNum-1].member_name}</td>
					<td class="td_gender">					
					<c:choose>
						<c:when test="${memberList[rowNum-1].gender eq 1}">
						남자
						</c:when>
						<c:when test="${memberList[rowNum-1].gender eq 2}">
						여자
						</c:when>
					</c:choose>
					</td>
					<td class="td_phone">${memberList[rowNum-1].handphone}</td>
					<td class="td_email">${memberList[rowNum-1].email}</td>
					<fmt:formatDate value="${memberList[rowNum-1].join_date}" type="date" pattern="yyyy-MM-dd" var="formattedDate"/>
					<td class="td_join_date">${formattedDate}</td>			
				</tr>											
				</c:forEach>
				<tr><td colspan="9" class="td_space"></tr>
	            </table>
	            </form>
				<table>
					<tr>
						<td id="td_paging" colspan="5">
							<%@ include file="../membership/paging_admin_member.jsp" %>
						</td>
					</tr>
					<tr>
						<td id="td_search_result" colspan="5">
							<c:choose>
							<c:when test="${!empty searchWord}">
								<span id="search_result_title">
									<c:choose>
										<c:when test="${searchField eq 'member_id'}">
											아이디
										</c:when>
										<c:when test="${searchField eq 'member_nickname'}">
											닉네임
										</c:when>
										<c:when test="${searchField eq 'member_name'}">
											이름
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
						<td id="td_list" colspan="3">							
						</td>
						<td id="td_search" colspan="2">
			                <form name="boardsearchfrm">
								<input type="submit" name="board_search_btn" id="board_search_btn" value="검색">
				                <input type="text" name="searchWord" id="searchWord">
							<select name="searchField" id="searchField">
			                    <option value="member_id">ID</option>
			                    <option value="member_nickname">닉네임</option>
			                    <option value="member_name">이름</option>
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