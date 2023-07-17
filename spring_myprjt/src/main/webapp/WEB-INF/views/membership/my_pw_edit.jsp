<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SkyBox - 비밀번호변경</title>
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
    	if(frm.member_current_pw.value.length==0){
            alert("현재 비밀번호가 입력되지 않았습니다.");
            frm.member_current_pw.focus();
            return false;
        }else if(frm.member_pw.value.length==0){
            alert("새 비밀번호가 입력되지 않았습니다.");
            frm.member_pw.focus();
            return false;
        }else if(frm.member_new_pw_re.value.length==0){
            alert("새 비밀번호 확인이 입력되지 않았습니다.");
            frm.member_new_pw_re.focus();
            return false;
        }else if(frm.member_new_pw_re.value != frm.member_pw.value){
            alert("새 비밀번호가 서로 같지 않습니다.");
            frm.member_pw.focus();
            return false;
        }else if(frm.member_current_pw.value != $("#member_session_pw").val()){
        	alert("현재 비밀번호가 일치하지 않습니다.");
            frm.member_current_pw.focus();
            return false;
        }
        document.frm.submit();
        return true;
    });
    
    $("#member_pw, #member_new_pw_re").change(function(){
    	if($("#member_pw").val() != $("#member_new_pw_re").val()){
	    	$("#errmsg").text("비밀번호가 서로 같지 않습니다.");
    	}else{
    		$("#errmsg").text("");
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
#member_id_show, #email{
	background-color: rgb(224, 224, 224);
}
#errmsg{
	vertical-align: top;
	font-size: 10px;
	color: rgb(231, 76, 60);
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
            <span id="sub-title"><a href="../membership/my_pw_edit.do">비밀번호 변경&nbsp;&nbsp;</a></span>
            <br><br><br>
            	<form action="my_pw_edit_process.do" method="post" name="frm">
		            <table>
		                <tr>
		                    <td class="td_title"><label for="member_id">&nbsp;<span class="redstar">*</span>&nbsp;&nbsp;아이디</label></td>
		                    <td class="td_content"><input type="text" class="input_text" name="member_id_show" id="member_id_show" value="${membership.member_id}" disabled>
		                    <input type="hidden" id="member_id" name="member_id" value="${membership.member_id}">
		                    </td>
		                </tr>
		                <tr>
		                    <td class="td_title"><label for="member_pw">&nbsp;<span class="redstar">*</span>&nbsp;&nbsp;현재 비밀번호</label></td>
		                    <td class="td_content"><input type="password" class="input_text" name="member_current_pw" id="member_current_pw" placeholder="현재 비밀번호를 입력해주세요.">
		                    <input type="hidden" id="member_session_pw" name="member_session_pw" value="${membership.member_pw}">
		                    </td>
		                </tr>
		                <tr>
		                    <td class="td_title"><label for="member_new_pw">&nbsp;<span class="redstar">*</span>&nbsp;&nbsp;새 비밀번호</label></td>
		                    <td class="td_content"><input type="password" class="input_text" name="member_pw" id="member_pw" placeholder="새 비밀번호를 입력해주세요."></td>
		                </tr>	
		                <tr>
		                    <td class="td_title"><label for="member_new_pw_re">&nbsp;<span class="redstar">*</span>&nbsp;&nbsp;새 비밀번호 확인</label></td>
		                    <td class="td_content"><input type="password" class="input_text" name="member_new_pw_re" id="member_new_pw_re" placeholder="새 비밀번호를 다시 한번 입력해주세요.">
		                    </td>
		                </tr>		                
		                <tr>
		                	<td class="td_title"></td>
		                	<td class="td_content" id="errmsg"></td>
		                </tr>	   	                
		                <tr>
		                	<td class="td_title">
			                	<input type="button" class="gray_btn" name="cancle_btn" id="cancle_btn" value="취소" onclick="history.back()">
		                	</td>
		                	<td class="td_content" id="td_submit">
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