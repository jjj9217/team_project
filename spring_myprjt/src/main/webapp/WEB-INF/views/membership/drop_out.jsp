<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SkyBox - 회원 탈퇴</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
$(function(){
	$("#menu").click(function(){
    	$("#sitemap").css("display","block");
    });
    $("#sitemap").click(function(){
    	$("#sitemap").css("display","none");
    });
    $("#submit_btn").click(function(){
    	let confirmAns = confirm("정말 회원 탈퇴하시겠습니까?");
		if(confirmAns){
			if(frm.member_pw.value.length==0){
		        alert("현재 비밀번호가 입력되지 않았습니다.");
		        frm.member_pw.focus();
		        return false;
		    }else if(frm.member_pw.value != $("#member_session_pw").val()){
		    	alert("비밀번호가 일치하지 않습니다.");
		        frm.member_pw.focus();
		        return false;
		    }
		 document.frm.submit();
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
    height: 425px;
    padding: 10px;
}
fieldset{
	width: 898px; height: 288px;
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
	width: 248px; height: 30px;
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
.input_name{
	width: 160px; height: 27px;	
	background-color: rgb(150, 222, 224);
	padding: 0 0 0 10px;
    border-width: 0;
	font-size: 12px;
}
#cancle_btn{
	width: 72px; height: 27px;
	background-color: rgb(224, 224, 224);
	color: rgb(127, 127, 127);
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
	text-align: right;
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
.blue_btn{
	width: 72px; height: 27px;
	background-color: rgb(41, 128, 185);
	color: white;
	border-width: 0;
	font-weight: bold;
}
.red_btn{
	width: 72px; height: 27px;
	background-color: rgb(231, 76, 60);
	color: white;
	border-width: 0;
	font-weight: bold;
}
#member_id, #email{
	background-color: rgb(224, 224, 224);
}
#errmsg{
	vertical-align: top;
	font-size: 10px;
	color: rgb(231, 76, 60);
}
.td_notice{
	height: 27px;
	font-size: 14px;
	color: rgb(231, 76, 60);
	padding: 5px 0;
	font-weight: bold;
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
	<div id="title" class="pull-left"><a href="../membership/mypage.do">마이페이지</a></div>	
	</div>
	<div id="contentcontainer">
		<fieldset>
            <legend></legend>
            <span id="sub-title"><a href="../membership/drop_out.do">회원 탈퇴&nbsp;&nbsp;</a></span>
            <br><br><br>
            	<form action="drop_out_process.do" method="post" name="frm">
		            <table>
		                <tr>
		                    <td class="td_title"><label for="member_id">&nbsp;<span class="redstar">*</span>&nbsp;&nbsp;아이디</label></td>
		                    <td class="td_content"><input type="text" class="input_text" name="member_id" id="member_id" value="${membership.member_id}" disabled></td>
		                </tr>
		                <tr>
		                    <td class="td_title"><label for="member_pw">&nbsp;<span class="redstar">*</span>&nbsp;&nbsp;비밀번호</label></td>
		                    <td class="td_content"><input type="password" class="input_text" name="member_pw" id="member_pw" placeholder="현재 비밀번호를 입력해주세요."></td>
		                </tr>		                
		                <tr>
		                	<td class="td_notice" colspan="2">&nbsp;탈퇴를 하더라도 작성된 게시글과 댓글은 삭제 되지 않으며</td>		                	
		                </tr>
		                <tr>
		                	<td class="td_notice" colspan="2">&nbsp;탈퇴 이후에는 작성하였던 글들의 삭제는 불가능합니다.</td>		                	
		                </tr>		                
		                <tr>
		                	<td class="td_title">
			                	<input type="button" class="gray_btn" name="cancle_btn" id="cancle_btn" value="취소" onclick="history.back()">
		                	</td>
		                	<td class="td_content" id="td_submit">
			                	<input type="button" class="red_btn" name="submit_btn" id="submit_btn" value="탈퇴">
			                	<input type="hidden" id="member_session_pw" name="member_session_pw" value="${membership.member_pw}">
		                	</td>	                	
		                </tr>
		            </table>
	            </form>
        </fieldset>
	</div>
	<footer id="main-footer">
		<jsp:include page="../main/footer.jsp" />
	</footer>
</body>
</html>