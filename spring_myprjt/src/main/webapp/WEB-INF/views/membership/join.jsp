<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SkyBox - 회원가입</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
$(function(){
	$("#menu").click(function(){
    	$("#sitemap").css("display","block");
    });
    $("#sitemap").click(function(){
    	$("#sitemap").css("display","none");
    });
    
    $("#member_pw, #member_pwre").change(function(){
    	if($("#member_pw").val() != $("#member_pwre").val()){
	    	$("#errmsg").text("비밀번호가 서로 같지 않습니다.");
    	}else{
    		$("#errmsg").text("");
    	}
    });
    
    $("#submit_btn").click(function(){
        if($("#member_id").val().length == 0){
            alert("아이디가 입력되지 않았습니다.");
            $("#member_id").focus();
            return false;
        } else if($("#member_pw").val().length == 0){
            alert("비밀번호가 입력되지 않았습니다.");
            $("#member_pw").focus();
            return false;
        } else if($("#member_pwre").val().length == 0){
            alert("비밀번호 재확인이 입력되지 않았습니다.");
            $("#member_pwre").focus();
            return false;
        } else if($("#member_pw").val() != $("#member_pwre").val()){
            alert("비밀번호가 같지 않습니다.");
            $("#member_pw").focus();
            return false;
        } else if($("#member_nickname").val().length == 0){
            alert("닉네임이 입력되지 않았습니다.");
            $("#member_nickname").focus();
            return false;
        } else if($("#member_name").val().length == 0){
            alert("이름이 입력되지 않았습니다.");
            $("#member_name").focus();
            return false;
        } else if($("#gender").val().length == 0){
            alert("성별이 입력되지 않았습니다.");
            $("#gender").focus();
            return false;
        } else if($("#year").val().length == 0){
            alert("생년월일: 년도가 입력되지 않았습니다.");
            $("#year").focus();
            return false;
        } else if($("#year").val().length > 4){
            alert("년도가 4자리 이상 입력되었습니다.");
            $("#year").focus();
            return false;
        } else if($("#month").val().length == 0){
            alert("생년월일: 월이 입력되지 않았습니다.");
            $("#month").focus();
            return false;
        } else if($("#day").val().length == 0){
            alert("생년월일: 일이 입력되지 않았습니다.");
            $("#day").focus();
            return false;
        } else if($("#day").val().length > 2){
            alert("일이 2자리 이상 입력되었습니다.");
            $("#day").focus();
            return false;
        } else if($("#handphone").val().length == 0){
            alert("휴대전화가 입력되지 않았습니다.");
            $("#handphone").focus();
            return false;
        } else if($("#email").val().length == 0){
            alert("이메일이 입력되지 않았습니다.");
            $("#email").focus();
            return false;
        } else if($("#confirm_id").val() == "fail"){
            alert("중복된 아이디를 사용하였습니다.");
            $("#member_id").focus();
            return false;
        } else if($("#confirm_nickname").val() == "fail"){
            alert("중복된 닉네임을 사용하였습니다.");
            $("#member_nickname").focus();
            return false;
        }
        
        let year = $("#year").val();
        let month = $("#month").val();
        let day = $("#day").val();
        
        if(year.length == 3){
            year = '0' + year;
        } else if(year.length == 2){
            year = '00' + year;
        } else if(year.length == 1){
            year = '000' + year;
        }
        
        if(month.length == 1){
            month = '0' + month;
        }
        if(day.length == 1){
            day = '0' + day;
        }
        
        let birthday = year + '-' + month + '-' + day;
        $("#birthday").val(birthday);
        
        document.frm.submit();
        return true;
    });
    
    $("#member_id").change(function(){
		let member_id = $("#member_id").val();
	    
	    $.ajax({
	        type: "post",
	        url: "checkId_process.do",
	        data: { "member_id": member_id },
	        success: function(data) {
	        	if (data == "success") {
	        		$("#idmsg").text("사용할 수 있는 ID입니다.");
	        		$("#idmsg").css("color", "rgb(41, 128, 185)")
	        		$("#confirm_id").val("ok");
	            } else {
	            	$("#idmsg").text("이미 사용하고 있는 ID입니다.");
	            	$("#idmsg").css("color", "rgb(231, 76, 60)")
	            	$("#confirm_id").val("fail");
	            }
	        },
	        error: function(error) {
	        	alert("ajax 에러 발생");
	        }
	    });
	    
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
#title a{
	text-decoration: none;
	color: rgb(41, 128, 185);
	font-size: 20px;
}
#link a{
	text-decoration: none;
	color: rgb(41, 128, 185);
	font-size: 14px;
}
#contentcontainer{
    margin-left: 20px;
	width: 918px;
    height: 425px;
    padding: 10px;
}
fieldset{
	width: 913px; height: auto;
	border-color: rgb(150, 222, 224);
	border-width: 2px;
	padding: 5px;
	padding-bottom: 30px;
}
#link{
	line-height: 40px;
}
.redstar{
	font-weight: bold;
	color: red;
}
label{
	font-size: 14px;
}
#email_notice{
	font-size: 10px;
	color: rgb(127, 127, 127);
}
td>ul>li{
    float: left;
}
.td_title{
	width: 180px; height: 30px;	
}
.td_content{
	width: 240px; height: 30px;
}
.td_check_input{
	width: 165px; height: 30px;
}
.td_check{
	width: 75px; height: 30px;
	text-align: right;
}
.input_name{
	width: 160px; height: 27px;	
	background-color: rgb(150, 222, 224);
	padding: 0 0 0 10px;
    border-width: 0;
	font-size: 12px;
}
.input_text{
	width: 238px; height: 27px;	
	background-color: rgb(150, 222, 224);
	padding: 0 0 0 10px;
    border-width: 0;
	font-size: 12px;
}
#year, #month, #day{
	width: 73px; height: 27px;	
	background-color: rgb(150, 222, 224);
	padding: 0 0 0 10px;
    border-width: 0;
	font-size: 12px;
}
#gender{
	width:248px;
	font-size: 12px;
}
#month{
	width: 74px;
	margin: 0 4px;
	font-size: 12px;
}
.check_btn{
	width: 72px; height: 27px;
	background-color: rgb(41, 128, 185);
	color: white;
	border-width: 0;
	font-weight: bold;
} 
#td_notice{	
	vertical-align: top;
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
#td_submit{
	text-align: right;
}
#link{	
	font-weight: bold;
}
#errmsg{
	vertical-align: top;
	font-size: 10px;
	color: rgb(231, 76, 60);
}
#idmsg, #nicknamemsg{
	vertical-align: top;
	font-size: 10px;
}

input:focus{
	border-color:rgb(41, 128, 185);
	outline: 0;
}
select:focus{
	border-color:rgb(41, 128, 185);
	outline: 0;
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
	<div id="title" class="pull-left">&nbsp;&nbsp;<a href="../membership/join.do">회원가입</a></div>
	<div id="link" class="pull-right">
	<a href="../membership/login.do">로그인&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a>
	<a href="../membership/search_id.do">ID/PW찾기&nbsp;&nbsp;&nbsp;&nbsp;</a>
	</div>
	</div>
	<div id="contentcontainer">
		<fieldset>
            <legend></legend>
            <form action="join_process.do" method="post" name="frm">
            	<br>
	            <table>
	                <tr>
	                    <td class="td_title"><label for="member_id">&nbsp;<span class="redstar">*</span>&nbsp;&nbsp;아이디</label></td>
	                    <td colspan="2" class="td_content">
	                    	<input type="text" class="input_text" name="member_id" id="member_id" placeholder="아이디를 입력해주세요.">
	                    	<input type="hidden" name="confirm_id" id="confirm_id" value="">
	                    </td>
	                </tr>
	                <tr>
		                <td></td>
		                <td colspan="2" id="idmsg"></td>
	                </tr>
	                <tr>
	                    <td class="td_title"><label for="member_pw">&nbsp;<span class="redstar">*</span>&nbsp;&nbsp;비밀번호</label></td>
	                    <td colspan="2" class="td_content"><input type="password" class="input_text" name="member_pw" id="member_pw" placeholder="비밀번호를 입력해주세요."></td>
	                </tr>
	                <tr>
	                    <td class="td_title"><label for="member_pwre">&nbsp;<span class="redstar">*</span>&nbsp;&nbsp;비밀번호 재확인</label></td>
	                    <td colspan="2" class="td_content"><input type="password" class="input_text" name="member_pwre" id="member_pwre" placeholder="비밀번호를 다시 한번 입력해주세요."></td>
	                </tr>
	                <tr>
		                <td></td>
		                <td colspan="2" id="errmsg"></td>
	                </tr>
	                <tr>
	                    <td class="td_title"><label for="member_nickname">&nbsp;<span class="redstar">*</span>&nbsp;&nbsp;닉네임</label></td>
	                    <td colspan="2" class="td_content">
							<input type="text" class="input_text" name="member_nickname" id="member_nickname" placeholder="닉네임을 입력해주세요.">
							<input type="hidden" name="confirm_nickname" id="confirm_nickname" value="">
						</td>
						<td class="td_check">
						</td>
	                </tr>
	                <tr>
		                <td></td>
		                <td colspan="2" id="nicknamemsg"></td>
	                </tr>
	                <tr>
	                    <td class="td_title"><label for="member_name">&nbsp;<span class="redstar">*</span>&nbsp;&nbsp;이름</label></td>
	                    <td colspan="2" class="td_content"><input type="text" class="input_text" name="member_name" id="member_name" placeholder="이름을 입력해주세요."></td>
	                </tr>
	                <tr>
	                	<td class="td_title"><label for="gender">&nbsp;<span class="redstar">*</span>&nbsp;&nbsp;성별</label></td>
                    	<td colspan="2" class="td_content">
	                        <select class="input_text" name="gender" id="gender">
	                            <option class="gray" value="">성별</option>
	                            <option value="1">남자</option>
	                            <option value="2">여자</option>
	                        </select>
                   		</td>
                	 </tr>
                	 <tr>
                	 	<td class="td_title"><label for="year">&nbsp;<span class="redstar">*</span>&nbsp;&nbsp;생년월일</label></td>
                   		<td colspan="2" class="td_content">
                        <ul>
                            <li><input type="text" name="year" id="year" placeholder="년(4자)"></li>
                            <li>
                                <select name="month" id="month">
                                    <option class="gray" value="">월</option>
                                    <option value="1">1</option>
                                    <option value="2">2</option>
                                    <option value="3">3</option>
                                    <option value="4">4</option>
                                    <option value="5">5</option>
                                    <option value="6">6</option>
                                    <option value="7">7</option>
                                    <option value="8">8</option>
                                    <option value="9">9</option>
                                    <option value="10">10</option>
                                    <option value="11">11</option>
                                    <option value="12">12</option>
                                </select>
                            </li>
                            <li><input type="text" name="day" id="day" placeholder="일"></li>
                        </ul>
                        <input type="hidden" name="birthday" id="birthday" value="">
                   		</td>
                 	</tr>
                 	
                 	<tr>
	                    <td class="td_title"><label for="handphone">&nbsp;<span class="redstar">*</span>&nbsp;&nbsp;휴대전화</label></td>
	                    <td colspan="2" class="td_content"><input type="text" class="input_text" name="handphone" id="handphone" placeholder="휴대폰 번호를 입력해주세요."></td>
	                </tr>
	                <tr>
	                    <td class="td_title"><label for="email">&nbsp;<span class="redstar">*</span>&nbsp;&nbsp;이메일</label></td>
	                    <td colspan="2" class="td_content"><input type="email" class="input_text" name="email" id="email" placeholder="이메일 주소를 입력해주세요."></td>
	                </tr>
	                <tr>
	                    <td class="td_title"></td>
	                    <td colspan="2" id="td_notice" class="td_content"><span id="email_notice">이메일 주소는 ID/PW 찾기에 사용됩니다.</span></td>
	                </tr>
	                <tr>
	                	<td id="td_reset" class="td_title">&nbsp;<input type="reset" name="reset_btn" id="reset_btn" value="다시 입력"></td>
	                	<td colspan="2" id="td_submit" class="td_content"><input type="button" name="join_btn" id="submit_btn" value="회원 가입"></td>
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