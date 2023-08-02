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
    #container{
        width: 330px;
        margin: 0 auto;
 		height:1100px;
    }
    #logo{
        width: 100%;
        height: 50px;
        margin-top: 70px;
        margin-bottom: 10px;
        font: bold 25px Arial, Sans-serif;
        text-align: center;
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
    #member_id,#member_pw,#member_pw2,#name,#member_handphone,#nick,#identity,#address,#select_postNum,#reset_btn,#join_btn,#postNum2,#postNum3,#email{
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
    #identity{
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
    #address{
    	width:200px;
    }
    #idmsg{
    	font-size:12px;
    }
	#errmsg{
		font-size:12px;
		color:red;
	}    
</style>
<script type="text/javascript" src="../resources/js/checkMember.js"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>



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
	$(document).on("keyup", "input:text[nameonly]" ,function() {
		$(this).val( $(this).val().replace( /[^A-Za-z\x20^가-힣ㄱ-ㅎㅏ-ㅣ\x20]/g, '' ) );
	});
	
	$("#member_pw, #member_pw2").change(function(){
    	if($("#member_pw").val() != $("#member_pw2").val()){
	    	$("#errmsg").text("비밀번호가 일치하지 않습니다.");
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
        		$("#idmsg").text("사용 가능한 ID입니다.");
        		$("#idmsg").css("color", "rgb(41, 128, 185)")
        		$("#confirm_id").val("ok");
            } else {
            	$("#idmsg").text("이미 사용중인 ID입니다.");
            	$("#idmsg").css("color", "rgb(231, 76, 60)")
            	$("#confirm_id").val("fail");
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
            document.querySelector("#address").value=data.zonecode;
            document.querySelector("#postNum2").value=data.address;
        }

    }).open({left:10,top:200});
}
</script>

</head>
<body>

<header>
	<jsp:include page="../main/header.jsp" />
</header>

    <div id="container">
        <div id="logo">회원가입</div>
        
        <form action="join_process.do" method="post" name="frm_join" style="margin-top:35px;">
            <p >
                <label>아이디<br>
                    <input type="text" name="member_id" id="member_id" placeholder="아이디를 입력해주세요.(영문,숫자만 입력가능)" maxlength="30" engnumonly=""/>
                    <input type="hidden" name="confirm_id" id="confirm_id" value="">
                    </label></p>
                    <div id="idmsg"></div>
            <p >
                <label>비밀번호<br>
                    <input type="password" name="member_pw" id="member_pw" placeholder="비밀번호를 입력해주세요."></label></p>
            <p >
                <label>비밀번호 재확인<br>
                    <input type="password" name="member_pw2" id="member_pw2" placeholder="비밀번호를 다시 입력해주세요."></label>
                    <div id="errmsg"></div></p>
            <p >
                <label>이름<br>
                    <input type="text" name="member_name" id="name" placeholder="본인 이름을 입력해주세요." maxlength="20" nameonly="true"></label></p>
           	<p>
           		<label>전화번호<br>
           			<input type="text" name="member_handphone" id="member_handphone" maxlength="11" placeholder="-없이 연락처를 입력해주세요." numberonly="ture"></label>
           			<input type="button" name="member_identity" id="identity" value="본인인증&nbsp;&nbsp;">
           			</p>  
           	<p>
           		<label>이메일<br>
           			<input type="text" name="member_email" id="email" placeholder="이메일을 입력해주세요."></label>
           	</p>
           <p >
                <label>닉네임<br>
                	<input type="text" name="member_nickname" id="nick" maxlength="20" notspecial="true" placeholder="닉네임을 입력해주세요."> 
                </label></p>
           <p >
                <label>주소<br>
                    <input type="text" name="member_postNum" id="address" placeholder="우편번호" readonly>
                    <input type="button" name="select_postNum" id="select_postNum" value="우편번호 검색&nbsp;&nbsp;" onclick="kakaopost()" >
                    <input type="text" name="member_address" id="postNum2" placeholder="주소" readonly>
                    <input type="text" name="member_address2" id="postNum3" placeholder="상세 주소">
                </label></p>
                <input type="reset" id="reset_btn" value="취소하기" onclick="location.href='login.do';">
                <input type="button" id="join_btn" value="회원가입">
        </form>
        <div id="sub2" style="margin-top:30px;">
    	<img src="../resources/img/CrueltyFree_logo.png" style="width: 330px; height: 70px; margin-top:30px;">
   		 </div>
    </div>
    
    
<footer>
	<jsp:include page="../main/footer.jsp" />
</footer>   
    
</body>
</html>