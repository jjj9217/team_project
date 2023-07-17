<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SkyBox - 회원정보 조회/수정</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
$(function(){
	$("#menu").click(function(){
    	$("#sitemap").css("display","block");
    });
    $("#sitemap").click(function(){
    	$("#sitemap").css("display","none");
    });
    
    $("#member_nickname").change(function(){
		let member_nickname = $("#member_nickname").val();
	    
	    $.ajax({
	        type: "post",
	        url: "checkNickname_process.do",
	        data: { "member_nickname": member_nickname },
	        success: function(data) {
	        	if (data == "success") {
	        		$("#nicknamemsg").text("사용할 수 있는 닉네임입니다.");
	        		$("#nicknamemsg").css("color", "rgb(41, 128, 185)")
	        		$("#confirm_nickname").val("ok");
	            } else {
	            	$("#nicknamemsg").text("이미 사용하고 있는 닉네임입니다.");
	            	$("#nicknamemsg").css("color", "rgb(231, 76, 60)")
	            	$("#confirm_nickname").val("fail");
	            }
	        },
	        error: function(error) {
	        	alert("ajax 에러 발생");
	        }
	    });
	    
    });
    
    $("#submit_btn").click(function(){
    	if(frm.member_nickname.value.length==0){
            alert("닉네임이 입력되지 않았습니다.");
            frm.member_nickname.focus();
            return false;
        }else if(frm.handphone.value.length==0){
            alert("휴대전화가 입력되지 않았습니다.");
            frm.handphone.focus();
            return false;
        }else if($("#confirm_nickname").val() == "fail"){
	        alert("중복된 닉네임을 사용하였습니다.");
	        frm.member_nickname.focus();
	        return false;
	    }
        document.frm.submit();
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
#td_nicknamecheck_input{
	width: 170px; height: 30px;
}
#td_nicknamecheck{
	width: 76px; height: 30px;
	text-align: right;
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
#member_id_show, #email{
	background-color: rgb(224, 224, 224);
}
#title a{
	color: rgb(41, 128, 185);
}
#sub-title a{
	color: rgb(41, 128, 185);
}
#nicknamemsg{
	vertical-align: top;
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
		<jsp:include page="../main/header.jsp"/>
	</header>
	<div id="hr"></div>
	<div id="titlecontainer">
	<div id="title" class="pull-left"><a href="../membership/mypage.do">마이페이지</a></div>	
	</div>
	<div id="contentcontainer">
		<fieldset>
            <legend></legend>
            <span id="sub-title"><a href="../membership/my_info_edit.do">회원정보 조회/수정&nbsp;&nbsp;</a></span>
            <br><br><br>
	            <form action="my_info_edit_process.do" method="post" name="frm">
		            <table>
		                <tr>
		                    <td class="td_title"><label for="member_id">&nbsp;<span class="redstar">*</span>&nbsp;&nbsp;아이디</label></td>
		                    <td colspan="2" class="td_content"><input type="text" class="input_text" name="member_id_show" id="member_id_show" value="${membership.member_id}" disabled>
		                    <input type="hidden" id="member_id" name="member_id" value="${membership.member_id}">
		                    </td>
		                </tr>
		                <tr>
		                    <td class="td_title"><label for="member_nickname">&nbsp;<span class="redstar">*</span>&nbsp;&nbsp;닉네임</label></td>
		                    <td colspan="2" class="td_content">
		                    <input type="text" class="input_text" name="member_nickname" id="member_nickname" value="${membership.member_nickname}">
		                    <input type="hidden" name="confirm_nickname" id="confirm_nickname" value="${membership.member_nickname}">
		                    </td>
		                </tr>
		                <tr>
			                <td></td>
			                <td colspan="2" id="nicknamemsg"></td>
		                </tr>
		                <tr>
		                    <td class="td_title"><label for="email">&nbsp;<span class="redstar">*</span>&nbsp;&nbsp;이메일</label></td>
		                    <td colspan="2" class="td_content"><input type="email" class="input_text" name="email" id="email" value="${membership.email}" disabled></td>
		                </tr>	
		                <tr>
		                    <td class="td_title"><label for="handphone">&nbsp;<span class="redstar">*</span>&nbsp;&nbsp;휴대전화</label></td>
		                    <td colspan="2" class="td_content"><input type="text" class="input_text" name="handphone" id="handphone" value="${membership.handphone}"></td>
		                </tr>
		                <tr>
		                	<td class="td_title"></td>
		                	<td colspan="2" class="td_content"></td>
		                </tr>	                
		                <tr>
		                	<td class="td_title">
			                	<input type="button" name="cancle_btn" id="cancle_btn" value="취소" onclick="history.back()">
		                	</td>	
		                	<td colspan="2" id="td_submit" class="td_content">
			                	<input type="button" class="blue_btn" name="submit_btn" id="submit_btn" value="등록">
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