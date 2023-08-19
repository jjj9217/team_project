<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기 | CrueltyFree</title>
<link rel="icon" href="${pageContext.request.contextPath}/resources/img/favicon.png">
<style>
	* {margin:0; padding:0;}
	a{text-decoration: none;}
    input[type="button"], input[type="submit"], input[type="checkbox"], select, label{cursor: pointer;}
	body{
		width:1020px;
		margin:0 auto;
	}
	header{
		top: 0px;
		width: 100%;
		height: 165px;
		background-color: white;
	}
	
	footer{
		bottom: 0px;
		width: 100%;
		height: 250px;
		line-height: 20px;
		background-color: #eef3f5;	
	}
	#container{
            width: 1000px;
            height: 1000px;
            margin: 0 auto;
            font: bold 25px Arial, Sans-serif;
        	text-align: center;
        	margin-top:70px;
    }
	#member_pw, #member_repw,#id_btn, #back, #submit_btn,#pw_btn,#login_btn{
		width:400px;
		height:40px;
		margin-top:10px;
		border-color:#7d99a4;
		border-width:1px;
		outline-color: #7d99a4;
		padding-left:10px;
	}
	#member_pw{
		margin-top:30px;
	}
	input[type="button"]{
		background-color:rgb(59, 58, 58);
		background-color:#7d99a4;
		color:white;
		border:0;
		border-radius:3px;
		cursor:pointer;
		font: bold 17px Arial, sans-serif;
		width:200px;
	}
	p{font-weight:500; color:gray;}
	
	#tag{
		font-size:17px;
		margin-top:50px;
		font-weight:600;
	}
	#find_pw{
		margin-top:30px;
		width:80%;
		margin-left:90px;
	}
	#find_id{
		margin-top:50px;
	}
	#hr{
		margin-top:50px;
	}
	#home{
		width:300px;
		height:70px;
		margin:0 auto;
		margin-top:50px;
		margin-right:0px;
	}
	#a{
		color:black;
		text-decoration-line: none;
		font-size:19px;
	}
	#message{
		color:rgb(231, 76, 60);
		font-size:13px;
	}
	#message2{
		color:rgb(231, 76, 60);
		font-size:13px;
	}
	#message3{
		color:rgb(231, 76, 60);
		font-size:13px;
	}
	#errmsg{
		color:rgb(231, 76, 60);
		font-size:13px;
	}
	#back{
  		color:black; 
  		background-color:rgb(221, 219, 214);
  		width:203px;
  	}
  	#submit_btn{
  		width:203px;
  	}
  	#notice{
  		margin-top:30px;
  	}
  	#notice2{
  		margin-top:30px;
  	}
  	fieldset{
  		height:100px;
  	}
  	#pw_btn{
  		color:black; 
  		background-color:rgb(221, 219, 214);
  	}
</style>

<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
$(document).ready(function() {
    $("#submit_btn").click(function() {
        var userpw = $("#member_pw").val();

        // 아이디를 입력하지 않았을 경우 메시지 띄우기
        if (userpw === '') {
            $("#message").text("새 비밀번호를 입력해 주세요.");
        } else {
        	$("#message").text("");
        }
    });
    $("#submit_btn").click(function() {
        var userrepw = $("#member_repw").val();

        // 아이디를 입력하지 않았을 경우 메시지 띄우기
        if (userrepw === '') {
            $("#message2").text("새 비밀번호를 재입력해 주세요.");
        } else {
        	$("#message2").text("");
        }
    });
});
</script>
<script>
$(function(){    
    $("#member_pw, #member_repw").change(function(){
    	if($("#member_pw").val() != $("#member_repw").val()){
	    	$("#errmsg").text("비밀번호가 서로 같지 않습니다.");
	    	$("#errmsg").css("color","rgb(231, 76, 60)");
    	}else{
    		if($("#member_pw").val() != 0){
    		$("#errmsg").text("비밀번호가 일치합니다.");
    		$("#errmsg").css("color","blue");
    		}
    	}
    });   
});
</script>
<script>
window.onload = function(){
	
	let s_btn = frm.submit_btn;//로그인 버튼
	s_btn.addEventListener("click", checkInput);
	
}

function checkInput(){
    if(frm.member_pw.value.length==0){
        frm.member_pw.focus();
        return false;

    }else if(frm.member_repw.value.length==0){
        frm.member_repw.focus();
        return false;
	
    }else if(frm.member_pw.value != frm.member_repw.value){
	   alert("비밀번호가 같지 않습니다.");
	   frm.member_pw.focus();
	   return false;	            
    }else{
       document.frm.submit();
    }
    
    return true;
}
</script>
<script>
$(function(){
	// 원래 문자열
	var originalString = "${find_pw.member_id}";

	// 문자열 길이 계산
	var length = originalString.length;

	// 마지막 3자리를 ***로 바꾸기
	var maskedString = originalString.substring(0, length - 3) + '***';
	
	$("#id_target").text(maskedString);
});
</script>




</head>
<body>

<header>
	<jsp:include page="../main/header.jsp" />
</header>
    <div id="container">
    <div id="home">
    	<a href="" id="a"><img src="../resources/img/home.png" style="width: 21px; height: 21px;"></a>
    	<a href="" id="a">〉 로그인</a>
    	<a href="" id="a">〉 비밀번호 찾기</a>
    </div>
    <h1>비밀번호 찾기</h1>
    <p>원하는 정보를 찾으셨나요?</p>
    <hr id="hr">
    <div id="tag"><span>입력하신 정보는 비밀번호 찾기에만 사용되며 </span> <span style="color:red;">저장되지 않습니다.</span></div>
    
    	<div id="find_pw">
    		
    		
    			<c:choose>
						<c:when test="${msg_findPw eq 'ok'}">
						<form action="find_pw_edit_process.do" method="post" name="frm">
								<div id="notice"><span>CrueltyFree 아이디 :</span><span id="id_target" style="color:#7d99a4;"> ${find_pw.member_id}</span></div>
								<input type="hidden" name="member_id" value="${find_pw.member_id}">
								<input type="hidden" id="member_current_pw" name="member_current_pw" value="${find_pw.member_pw}">
			                  	<input class="newpw" type="password" id="member_pw" name="member_pw" placeholder="새 비밀번호">
			                  	<div id="message"></div>
	              				<input class="newpw" type="password" id="member_repw" name="member_repw" placeholder="새 비밀번호 확인"><br>
	              				<div id="message2"></div>
	              				<div id="errmsg"></div>
	              				<input id="back" type="button" value="취소" onclick="history.back()">
	              				<input id="submit_btn" type="button" value="비밀번호 변경">	
	              				</form>						
						</c:when>
						<c:when test="${msg_findPw eq 'fail'}">
						<fieldset>
								<div id="notice2">내용과 일치한 회원정보가 없습니다.</div>
								</fieldset>
								<input type="button" id="pw_btn" name="pw_btn" value="비밀번호 찾기" onclick="location.href='find_pw.do';" style="width:200px;">
								<input type="button" id="login_btn" name="login_btn" value="로 그 인" onclick="location.href='login.do';" style="width:200px;">
						</c:when>
					</c:choose> 
    		
    	</div>
    	<div id="find_id">
    		<img src="../resources/img/find.png" style="width: 130px; height: 130px;">
    		<p><input type="button" id="id_btn" name="id_btn" value="아이디 찾기" onclick="" style="width:200px;"></p>
    	</div>
	</div>




<footer>
	<jsp:include page="../main/footer.jsp" />
</footer>
</body>
</html>