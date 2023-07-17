<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SkyBox - 마이페이지</title>
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
    height: 425px;
    padding: 10px;
}
fieldset{
	width: 898px; height: 400px;
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
}
#title a{
	color: rgb(41, 128, 185);
}
#sub-title a{
	color: rgb(41, 128, 185);
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
	<div id="title" class="pull-left"><a href="../membership/mypage.do">마이페이지</a></div>	
	</div>
	<div id="contentcontainer">
		<fieldset>
            <legend></legend>
            <span id="sub-title"><a href="../membership/mypage.do">회원정보</a></span>&nbsp;&nbsp;
            <span class="link"><a href="../membership/mycontent.do">작성 글 보기</a></span>&nbsp;&nbsp;
            <span class="link"><a href="../membership/myreply.do">작성 댓글 보기</a></span>&nbsp;&nbsp;
            <br><br><br>
	            <table>
	                <tr>
	                    <td class="td_title"><label for="member_id">&nbsp;<span class="redstar">*</span>&nbsp;&nbsp;아이디</label></td>
	                    <td class="td_content"><input type="text" class="input_text" name="member_id" id="member_id" value="${membership.member_id}" disabled></td>
	                </tr>
	                <tr>
	                    <td class="td_title"><label for="member_nickname">&nbsp;<span class="redstar">*</span>&nbsp;&nbsp;닉네임</label></td>
	                    <td class="td_content"><input type="text" class="input_text" name="member_nickname" id="member_nickname" value="${membership.member_nickname}" disabled></td>
	                </tr>
	                <tr>
	                    <td class="td_title"><label for="email">&nbsp;<span class="redstar">*</span>&nbsp;&nbsp;이메일</label></td>
	                    <td class="td_content"><input type="email" class="input_text" name="email" id="email" value="${membership.email}" disabled></td>
	                </tr>	
	                <tr>
	                    <td class="td_title"><label for="handphone">&nbsp;<span class="redstar">*</span>&nbsp;&nbsp;휴대전화</label></td>
	                    <td class="td_content"><input type="text" class="input_text" name="handphone" id="handphone" value="${membership.handphone}" disabled></td>
	                </tr>
	                <tr>
	                    <td class="td_title"><label for="join_date">&nbsp;&nbsp;&nbsp;&nbsp;가입일</label></td>
	                    <fmt:formatDate value="${membership.join_date}" type="date" pattern="yyyy-MM-dd" var="formattedDate"/>
	                    <td class="td_content"><input type="text" class="input_text" name="join_date" id="join_date" value="${formattedDate}" disabled></td>
	                </tr>
	                <tr>
	                <td class="td_title"></td>
	                <td class="td_content"></td>			                
	                <tr>
	                	<td id="td_submit" colspan="2">
	                	<a href="../membership/logout.do"><input type="button" class="gray_btn" name="logout_btn" id="logout_btn" value="로그아웃"></a>
	                	<a href="../membership/my_info_edit.do"><input type="button" class="blue_btn" name="edit_info_btn" id="edit_info_btn" value="회원 정보 변경"></a>
	                	<a href="../membership/my_pw_edit.do"><input type="button" class="blue_btn" name="edit_pw_btn" id="edit_pw_btn" value="비밀 번호 변경"></a>
	                	<a href="../membership/drop_out.do"><input type="button" class="gray_btn" name="drop_out_btn" id="drop_out_btn" value="회원 탈퇴"></a>
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