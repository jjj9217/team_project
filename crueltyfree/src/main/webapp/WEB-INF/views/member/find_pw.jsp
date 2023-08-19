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
	#member_id, #member_name, #member_handphone, #submit_btn, #id_btn{
		width:400px;
		height:40px;
		margin-top:10px;
		border-color:#7d99a4;
		border-width:1px;
		outline-color: #7d99a4;
		padding-left:10px;
		border-style:solid;
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
<script src="https://cdn.iamport.kr/v1/iamport.js"></script>
<script>
var IMP = window.IMP;
IMP.init("imp36534356");

//yymmdd형태로 날짜 얻기
function formatDateToYYMMDD(date) {
    const year = date.getFullYear().toString().slice(-2);
    const month = String(date.getMonth() + 1).padStart(2, '0');
    const day = String(date.getDate()).padStart(2, '0');
    return year+month+day;
}

//난수생성
function generateRandomNumber(length) {
    const randomNumber = Math.random().toString().slice(2, 2 + length);
    return randomNumber.padStart(length, '0');
}

const currentDate = new Date();
const formattedDate = formatDateToYYMMDD(currentDate);
const randomDigits = generateRandomNumber(8);  //8자리의 난수생성

function doPayment(){	
	IMP.certification({
			pg:'inicis_unified.MIIiasTest',//본인인증 설정이 2개이상 되어 있는 경우 필수 
		    merchant_uid: "CFJOIN"+formattedDate+randomDigits, // 주문 번호
	    }, function (rsp) { // callback
	      	  //rsp.imp_uid 값으로 결제 단건조회 API를 호출하여 결제결과를 판단합니다.
	          if (rsp.success) {
	        	  $.ajax({
	        	    	type: "post",
	        	    	url: "${pageContext.request.contextPath}/purchase/certifications_process.do",
	        	    	data: JSON.stringify({
	        	    		"imp_uid": rsp.imp_uid //인증 UID
	        	    	}), 
	        	    		//JSON.stringify(JSON타입 객체): JSON타입 객체를 String객체로 변환시킴
	        	    	contentType: "application/json;charset=utf-8;",
	        	    	//contentType: 사용자가 서버로 보내는 내용의 MIME타입
	        	    	dataType: "json",
	        	    	success: function(data) {
	        	    		$("#member_name").val(data.name);
        	    		    $("#member_handphone").val(data.phone);
        	    		    
        	    		    $("#search_pw_form").submit();
	        	        },
	        	        error: function(error) {
	        	        	alert("ajax 에러 발생");
	        	        }
	        	    });//end of ajax
			    } else {
			      var msg = '인증에 실패하였습니다.';
			      msg += '에러내용 : ' + rsp.error_msg;
			      alert(msg);
			    }
	    });	
}


$(document).ready(function() {
    $("#submit_btn").click(function() {
        var userid = $("#member_id").val();

        // 아이디를 입력하지 않았을 경우 메시지 띄우기
        if (userid === '') {
            $("#message").text("아이디를 입력해 주세요.");
        } else {
        	$("#message").text("");
        }
        
        checkInput();
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
    }else{
    	doPayment();
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
    	<a href="../main/home.do" id="a"><img src="../resources/img/home.png" style="width: 21px; height: 21px;"></a>
    	<a href="login.do" id="a">〉 로그인</a>
    	<a href="" id="a">〉 비밀번호 찾기</a>
    </div>
    <h1>비밀번호 찾기</h1>
    <p>비밀번호가 기억나지 않으세요?</p>
    <hr id="hr">
    <div id="tag"><span>입력하신 정보는 비밀번호 찾기에만 사용되며 </span> <span style="color:red;">저장되지 않습니다.</span></div>
    
    	<div id="find_pw">
    		<form action="find_pw_process.do" method="post" name="frm" id="search_pw_form">
    		<input type="text" id="member_id" name="member_id" placeholder="아이디">
    		<div id="message"></div>
    		<input type="hidden" id="member_name" name="member_name">    		
    		<input type="hidden" id="member_handphone" name="member_handphone">    		
    		<input type="button" id="submit_btn" name="submit_btn" value="확인" style="width:415px";>
    		</form>
    	</div>
    	<div id="find_id">
    		<img src="../resources/img/find.png" style="width: 130px; height: 130px;">
    		<p><input type="button" id="id_btn" name="id_btn" value="아이디 찾기" onclick="location.href='find_id.do';" style="width:200px;"></p>
    	</div>
	</div>




<footer>
	<jsp:include page="../main/footer.jsp" />
</footer>
</body>
</html>