<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 | CrueltyFree</title>
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
 		height:1100px;
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
    #member_id,#member_pw,#member_pw2,#member_name,#member_birthday,#member_handphone,#member_nickname,#member_identity,#member_postNum,#select_postNum,#reset_btn,#join_btn,#member_address,#member_address2,#member_email,#member_mail,#member_mail2,#member_email2{
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
    	background-color:rgb(221, 219, 214);
    }
    #member_identity,#member_mail,#member_mail2{
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

    #member_postNum{
    	width:200px;
    }
    #idmsg,#errmsg,#nickmsg,#mail-check-warn,#birthmsg{
    	font-size:12px;
    } 
    
	
	.between{
		width:350px;
	}
	
	
    .form_radio_btn {
			height : 39px;
    		border: 1px solid #EAE7E7;
    		border-radius: 20px;
    		float :left;
		}

		.form_radio_btn input[type=radio] {
			display: none;
		}
		.form_radio_btn label {
			display: block;
    		border-radius: 20px;
   			margin: 0 auto;
    		text-align: center;
    		line-height: 39px;
    		height: -webkit-fill-available;
		}
		 
		/* Checked */
		.form_radio_btn input[type=radio]:checked + label {
			background: #7d99a4;
			color: #fff;
		}
		 
		/* Hover */
		.form_radio_btn label:hover {
			color: #666;
		}
		 
		/* Disabled */
		.form_radio_btn input[type=radio] + label {
			background: rgb(221, 219, 214);
			color: #666;
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
    } else if($("#member_birthday").val().length < 8){
    	alert("올바르지 않은 정보입니다.");
    	$("#birthmsg").text("올바르지 않은 정보입니다.");
    	$("#birthmsg").css("color", "rgb(231, 76, 60)")
        $("#member_birthday").focus();
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
    var width = 500; // 팝업의 너비
    var height = 600; // 팝업의 높이
   
    var top = (window.screen.height / 2) - (height / 2);

    new daum.Postcode({
        width: width,
        height: height,
        oncomplete: function(data) {
            $("#member_postNum").val(data.zonecode);
            $("#member_address").val(data.address);
        }
    }).open({
        left: 1700,
        top: top
    });
}
</script>

<script>

$(function(){
	let email; 
	let code; 
	let auth_flag=false; 
	let checkInput = $("#member_email2"); 
	
	$("#member_mail").click(function(){
		
		email = $("#member_email").val(); 

		let regExp_email= /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/;
		
		if(regExp_email.test(email)){
			
			$.ajax({
				type: "get",
				url: "emailCheck.do?email="+email,
				success: function(data){
					checkInput.attr("disabled", false);
					code = data; 
				    alert("인증번호가 전송되었습니다.");
				}				
			});
		}else{
			alert("입력하신 내용이 이메일 형식에 맞지 않습니다.");
			frm_join.member_id.focus();
		}				
	});
	
    $("#member_mail2").click(function(){
    	const inputCode = checkInput.val(); 
    	const resultMsg = $("#mail-check-warn");
    	
    	if(inputCode == code){
    		resultMsg.html("인증번호가 일치합니다.");
    		resultMsg.css("color", "rgb(41, 128, 185)");
    		auth_flag = true; //메일인증 성공
    	}else{
    		resultMsg.html("인증번호가 불일치합니다. 다시 확인해주세요.");
            resultMsg.css("color", "rgb(231, 76, 60)");
    	}
    })
})

</script>



</head>
<body>

<header>
	<jsp:include page="../main/header.jsp" />
</header>
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
                    <input type="text" name="member_name" id="member_name" placeholder="본인 이름을 입력해 주세요." maxlength="20" nameonly="true" value="${name}" readonly></label></p>
           	<p>
           		<label>전화번호<br>
           			<input type="text" name="member_handphone" id="member_handphone" maxlength="11" placeholder="-없이 연락처를 입력해 주세요." numberonly="ture" value="${phone}" readonly></label>
           			</p>  
            <p>
                <label>생년월일<br>
                    <input type="text" name="member_birthday" id="member_birthday" placeholder="생년월일을 입력해 주세요. ex)19980301" maxlength="8" numberonly="true" value="${birthday}" readonly></label> </p>  
          			<div id="birthmsg"></div>
               <div class="mb-3">
				  <label for="userSex" class="form-label">성별</label>
				   	<div class="between" style="white-space:normal;" >
						<div class="form_radio_btn" style="border-radius:20px 0px 0px 20px; width:163px; ">
							<input id="radio-1" type="radio" name="member_gender" value="M" checked >
							<label for="radio-1" style="border-radius:20px 0px 0px 20px; width:163px;">남자</label>
						</div>
					     <div class="form_radio_btn" style="border-radius:0px 20px 20px 0px; width:163px; ">
							<input id="radio-2" type="radio" name="member_gender" value="F">
							<label for="radio-2" style="border-radius:0px 20px 20px 0px; width:163px;">여자</label>
						</div>
					</div>
			   </div>
            	<br>
            	<br>
            	<br>
           	<p>
           		<label>이메일<br>
           			<input type="text" name="member_email" id="member_email" placeholder="이메일을 입력해 주세요." ></label>
           			<span id="mail-check-warn"></span>
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