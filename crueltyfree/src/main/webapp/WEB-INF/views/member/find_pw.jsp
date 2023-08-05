<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기 | CrueltyFree</title>
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
	#member_id, #member_name, #member_handphone, #submit_btn, #id_btn{
		width:400px;
		height:40px;
		margin-top:10px;
		border-color:#7d99a4;
		border-width:1px;
		outline-color: #7d99a4;
		padding-left:10px;
	}
	input[type="button"]{
		background-color:rgb(59, 58, 58);
		background-color:#7d99a4;
		color:white;
		border:0;
		border-radius:3px;
		cursor:pointer;
		font: bold 17px Arial, sans-serif;
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
   
</style>

<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
$(document).ready(function() {
    $("#submit_btn").click(function() {
        var userid = $("#member_id").val();

        // 아이디를 입력하지 않았을 경우 메시지 띄우기
        if (userid === '') {
            $("#message").text("아이디를 입력해 주세요.");
        } else {
        	$("#message").text("");
        }
    });
    $("#submit_btn").click(function() {
        var username = $("#member_name").val();

        // 아이디를 입력하지 않았을 경우 메시지 띄우기
        if (username === '') {
            $("#message2").text("이름을 입력해 주세요.");
        } else {
        	$("#message2").text("");
        }
    });
    
    
    $("#submit_btn").click(function() {
        var userphone = $("#member_handphone").val();

        // 비밀번호를 입력하지 않았을 경우 메시지 띄우기
        if (userphone === '') {
            $("#message3").text("전화번호를 입력해 주세요.");
        } else {
        	$("#message3").text("");
        }
    });
});
</script>

<script>
$(function(){
	$(document).on("keyup", "input:text[numberonly]", function() {
		$(this).val( $(this).val().replace( /[^0-9]/gi,"") );
	});
});
</script>

<script>

window.onload = function(){
	
	let s_btn = frm.submit_btn;//로그인 버튼
	s_btn.addEventListener("click", checkInput);
	
}

function checkInput(){
    if(frm.member_id.value.length==0){
        frm.member_id.focus();
        return false;
    }else if(frm.member_name.value.length==0){
        frm.member_name.focus();
        return false;        
    }else if(frm.member_handphone.value.length==0){
        frm.member_handphone.focus();
        return false;

    }else{
       document.frm.submit();
    }
    
    return true;
}
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
    <p>비밀번호가 기억나지 않으세요?</p>
    <hr id="hr">
    <div id="tag"><span>입력하신 정보는 비밀번호 찾기에만 사용되며 </span> <span style="color:red;">저장되지 않습니다.</span></div>
    
    	<div id="find_pw">
    		<form action="find_pw_process.do" method="post" name="frm">
    		<input type="text" id="member_id" name="member_id" placeholder="아이디">
    		<div id="message"></div>
    		<input type="text" id="member_name" name="member_name" placeholder="이름">
    		<div id="message2"></div>
    		<input type="text" id="member_handphone" name="member_handphone" placeholder="전화번호(-없이 입력)" numberonly="" maxlength="11">
    		<div id="message3"></div>
    		<input type="button" id="submit_btn" name="submit_btn" value="확인" style="width:415px";>
    		</form>
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