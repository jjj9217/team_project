<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 | CrueltyFree</title>
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
	#title{
		width:500px;
		margin:0 auto;
		margin-top:30px;
	}
	#mark{
		text-align:center;
	}
    #container{
        width: 330px;
        margin: 0 auto;
 		height:1000px;
    }
    #logo{
        width: 100%;
        height:25px;
        margin-top: 30px;
        margin-bottom: 10px;
        font: bold 23px Arial, Sans-serif;
        text-align: center;
    }
    #logo2{
    	text-align:center;
    	font: bold 12px Arial, Sans-serif;
    	color: gray;
    }
    p{
        margin-bottom: 10px;
    }
    label{
        font-size: 12px;
        font-weight:700;
        font-family: Arial, Helvetica, sans-serif;
    }
    #member_pw2{
        margin-bottom: 20px;
    }
    select{
        height: 38px;
        margin-top: 5px;
        padding-left: 5px;
        border-color: rgb(199, 198, 198);
        border-style: solid;
        border-width: 1px;
    }
    #gender{
        width: 100%;
    }
    #member_id,#member_pw,#member_pw2,#member_name,#member_handphone,#member_nickname,#member_identity,#member_postNum,#select_postNum,#reset_btn,#join_btn,#member_address,#member_address2,#member_email{
        width: 97%;
        height: 35px;
        padding-left: 10px;
        margin-top: 5px;
        border-style: solid;
        border-width: 1px;
        outline-color: #7d99a4;
        outline-width: 1px;
        border-radius: 20px;
        border-color: #7d99a4;
        border-width:1px;
    }
    #join_btn, #reset_btn{
        width: 49%;
        height: 40px;
        margin-top: 20px;
        font: bold 15px Arial, sans-serif;
       	cursor:pointer;/*마우스를 올려놓았을 때 커서가 손모양으로 변경됨*/
       	border-radius:0px;
       	 border:0;
    }
    #join_btn{
        background-color:#7d99a4;
        color: white;
    }
    #reset_btn{
    	border-color:white;
    	background-color:#a4a4a4;
    }
    #member_identity{
    	background-color: #7d99a4;
    	color:white;
    	width:105px;
    	cursor:pointer;
    	font: bold 13px Arial, sans-serif;
    }
    #select_postNum{
    	background-color: #7d99a4;
    	color:white;
    	width:105px;
    	cursor:pointer;
    	font: bold 13px Arial, sans-serif;
    }
    #member_handphone{
    	width:200px;
    }
    #member_postNum{
    	width:200px;
    }
    #idmsg,#errmsg,#nickmsg{
    	font-size:12px;
    } 

</style>
<script type="text/javascript" src="../resources/js/checkMember.js"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<script>
window.onload = function(){
	let join_btn = frm.join_btn;
	join_btn.addEventListener("click", checkInput);
}
function checkInput(){
   
    if($("#member_id").val().length == 0){
        alert("해당 정보가 입력되지 않았습니다.");
        $("#member_id").focus();
        return false;
    } else if($("#member_id").val().length <= 7){
        alert("아이디가 8자 미만입니다.");
        $("#member_id").focus();
        return false;
    } else if($("#member_pw").val().length == 0){
        alert("해당 정보가 입력되지 않았습니다.");
        $("#member_pw").focus();
        return false;
    } else if($("#member_pw").val().length <= 7){
    	alert("비밀번호가 8자 미만입니다.");
    	$("#errmsg").text("비밀번호가 8자 미만입니다.");
    	$("#errmsg").css("color", "rgb(231, 76, 60)")
        $("#member_pw").focus();
        return false;
    } else if($("#member_pw2").val().length == 0){
        alert("해당 정보가 입력되지 않았습니다.");
        $("#member_pw2").focus();
        return false;
    } else if($("#member_pw2").val().length <= 7){
    	alert("비밀번호가 8자 미만입니다.");
    	$("#errmsg").text("비밀번호가 8자 미만입니다.");
    	$("#errmsg").css("color", "rgb(231, 76, 60)")
        $("#member_pw2").focus();
        return false;
    } else if($("#member_name").val().length == 0){
        alert("해당 정보가 입력되지 않았습니다.");
        $("#member_name").focus();
        return false;
    } else if($("#member_handphone").val().length == 0){
        alert("해당 정보가 입력되지 않았습니다.");
        $("#member_handphone").focus();
        return false;
    } else if($("#member_email").val().length == 0){
        alert("해당 정보가 입력되지 않았습니다.");
        $("#member_email").focus();
        return false;
    } else if($("#member_nickname").val().length == 0){
        alert("해당 정보가 입력되지 않았습니다.");
        $("#member_nickname").focus();
        return false;
    } else if($("#member_postNum").val().length == 0){
        alert("해당 정보가 입력되지 않았습니다.");
        $("#member_postNum").focus();
        return false;
    } else if($("#member_postNum").val().length < 2){
        alert("닉네임이 2자 미만입니다.");
        $("#member_postNum").focus();
        return false;
    } else if($("#member_address").val().length == 0){
        alert("해당 정보가 입력되지 않았습니다.");
        $("#member_address").focus();
        return false;
    } else if($("#member_address2").val().length == 0){
        alert("해당 정보가 입력되지 않았습니다.");
        $("#member_address2").focus();
        return false;
    } else if($("#check_id").val() == "fail"){
        alert("중복된 아이디를 사용하였습니다.");
        $("#member_id").focus();
        return false;
    } else if($("#member_pw").val() != $("#member_pw2").val()){
        alert("비밀번호가 같지 않습니다.");
        $("#member_pw").focus();
        return false;
    } else if($("#check_nickname").val() == "fail"){
        alert("중복된 닉네임을 사용하였습니다.");
        $("#member_nickname").focus();
        return false;
        
    }else{
        document.frm.submit();
    }
    
    return true;
}
</script>

<script>
$(function(){
	$(document).on("keyup", "input:text[engnumonly]", function() {
		$(this).val( $(this).val().replace(/[^A-Za-z\x20^0-9]/gi,"") );
	});
	$(document).on("keyup", "input:text[numberonly]", function() {
		$(this).val( $(this).val().replace( /[^0-9]/gi,"") );
	});
	$(document).on("keyup", "input:text[notspecial]" ,function() {
		$(this).val( $(this).val().replace( /[^0-9^A-Za-z\x20^가-힣ㄱ-ㅎㅏ-ㅣ\x20]/g, '' ) );
	});
	$(document).on("keyup", "input:text[nick]" ,function() {
		$(this).val( $(this).val().replace( /[^0-9^A-Za-z\x20^가-힣\x20]/g, '' ) );
	});
	$(document).on("keyup", "input:text[nameonly]" ,function() {
		$(this).val( $(this).val().replace( /[^A-Za-z\x20^가-힣ㄱ-ㅎㅏ-ㅣ\x20]/g, '' ) );
	});
	
	$("#member_pw, #member_pw2").change(function(){
    	if($("#member_pw").val() != $("#member_pw2").val()){
	    	$("#errmsg").text("비밀번호가 일치하지 않습니다.");
	    	$("#errmsg").css("color", "rgb(231, 76, 60)")
    	}else{
    		$("#errmsg").text("");
    	}
    });
	
	
	$("#member_id").change(function(){
		let member_id = $("#member_id").val();
    $.ajax({
        type: "post",
        url: "checkId_process.do",
        data: { "member_id": member_id },
        success: function(data) {
        	if (data == "success") {
        		if($("#member_id").val().length >= 8){
        		$("#idmsg").text("사용 가능한 ID입니다.");
        		$("#idmsg").css("color", "rgb(41, 128, 185)")
        		$("#check_id").val("ok");
        		}else{
        			$("#idmsg").text("사용 불가능한 ID입니다.");
                	$("#idmsg").css("color", "rgb(231, 76, 60)")
                	$("#check_id").val("fail");
        		}
            } else {
            	$("#idmsg").text("사용 불가능한 ID입니다.");
            	$("#idmsg").css("color", "rgb(231, 76, 60)")
            	$("#check_id").val("fail");
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
        	if (data == "success"){ 
        		if($("#member_nickname").val().length < 2){
                	$("#nickmsg").text("사용 불가능한 닉네임입니다.");
                	$("#nickmsg").css("color", "rgb(231, 76, 60)")
        		}else{
        			$("#nickmsg").text("사용 가능한 닉네임입니다.");
            		$("#nickmsg").css("color", "rgb(41, 128, 185)")
            		$("#check_nickname").val("ok");
            		} 
        	}else {
            	$("#nickmsg").text("사용 불가능한 닉네임입니다.");
            	$("#nickmsg").css("color", "rgb(231, 76, 60)")
            	$("#check_nickname").val("fail");
            }
        },
        error: function(error) {
        	alert("ajax 에러 발생");
        }
    });    
});	
});
</script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
function kakaopost(){
	var width=500;
	var height = 600; //팝업의 높이
	
    new daum.Postcode({    	
        oncomplete: function(data) {
            document.querySelector("#member_postNum").value=data.zonecode;
            document.querySelector("#member_address").value=data.address;
        }

    }).open({left:10,top:200});
}
</script>

</head>
<body>

<header>
	<jsp:include page="../main/header.jsp" />
</header>
	<input type="reset" id="reset_btn" value="회원가입 결과창" onclick="location.href='join_result.do';">
	<div id="joinbanner" style="text-align:center; margin: 0 auto; width:1000px; height:90px; margin-top:70px;"><img src="../resources/img/joinbanner2.JPG" style="width: 500px; height: 90px; text-align:center; margin:0 auto; "></div>
	<div id="title">
	<div id="mark"><img src="../resources/img/CrueltyFree_logo.png" style="width: 200px; height: 55px; margin-top:20px;"></div>
        <p id="logo">Cruelty Free에 오신것을 환영합니다.</p>
        <p id="logo2">회원가입에 필요한 기본 정보를 입력해 주세요.</p><hr style="margin-top:35px;"> 
    </div>  
    <div id="container">
    	<form action="join_process.do" method="post" name="frm" style="margin-top:35px;">
            <p>
                <label>아이디<br>
                    <input type="text" name="member_id" id="member_id" placeholder="8~16자 아이디를 입력해 주세요.(영어,숫자 입력가능)" maxlength="16" engnumonly=""/>
                    <input type="hidden" name="check_id" id="check_id" value="">
                    </label></p>
                    <div id="idmsg"></div>
            <p>
                <label>비밀번호<br>
                    <input type="password" name="member_pw" id="member_pw" placeholder="8자 이상의 비밀번호를 입력해 주세요." maxlength="30"></label></p>
            <p style="height:63px;">
                <label>비밀번호 재확인<br>
                    <input type="password" name="member_pw2" id="member_pw2" placeholder="8자 이상의 비밀번호를 다시 입력해 주세요." maxlength="30"></label></p>
                    <div id="errmsg"></div>
            <p>
                <label>이름<br>
                    <input type="text" name="member_name" id="member_name" placeholder="본인 이름을 입력해 주세요." maxlength="20" nameonly="true"></label></p>
           	<p>
           		<label>전화번호<br>
           			<input type="text" name="member_handphone" id="member_handphone" maxlength="11" placeholder="-없이 연락처를 입력해 주세요." numberonly="ture"></label>
           			<input type="button" name="member_identity" id="member_identity" value="본인인증&nbsp;&nbsp;">
           			</p>  
           	<p>
           		<label>이메일<br>
           			<input type="text" name="member_email" id="member_email" placeholder="이메일을 입력해 주세요." ></label>
           			</p>
            <p>
                <label>닉네임<br>
                	<input type="text" name="member_nickname" id="member_nickname" maxlength="20" notspecial="true" placeholder="닉네임을 입력해 주세요.(특수 문자 불가능)" nick="">
                	<input type="hidden" name="check_nickname" id="check_nickname" value=""> 
                </label></p>
                <div id="nickmsg"></div>
           <p >
                <label>주소<br>
                    <input type="text" name="member_postNum" id="member_postNum" placeholder="우편번호" readonly>
                    <input type="button" name="select_postNum" id="select_postNum" value="우편번호 검색&nbsp;&nbsp;" onclick="kakaopost()" >
                    <input type="text" name="member_address" id="member_address" placeholder="주소" readonly>
                    <input type="text" name="member_address2" id="member_address2" placeholder="상세 주소">
                </label></p>
                <input type="reset" id="reset_btn" value="취소하기" onclick="location.href='login.do';">
                <input type="button" id="join_btn" name="join_btn" value="회원가입">
        </form>
    </div>
    
    
<footer>
	<jsp:include page="../main/footer.jsp" />
</footer>   
    
</body>
</html>