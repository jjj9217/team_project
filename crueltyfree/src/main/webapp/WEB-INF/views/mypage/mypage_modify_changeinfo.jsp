<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List, java.util.HashMap, java.util.Map" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
        
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보 수정 | CrueltyFree</title>
<link rel="icon" href="${pageContext.request.contextPath}/resources/img/favicon1.png">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://cdn.iamport.kr/v1/iamport.js"></script>
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
        	    		    $("#member_handphone").val(data.phone);
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

function checkInput(){	   
    if($("#member_handphone").val().length == 0){
    	alert("핸드폰 번호를 입력해주세요.");
    	$("#member_handphone").focus();
    	return false;
    }else if($("#member_email").val().length == 0){
        alert("이메일을 입력해 주세요.");
        $("#member_email").focus();
        return false;
    }else if($("#member_nickname").val().length == 0){
        alert("닉네임을 입력해 주세요.");
        $("#member_nickname").focus();
        return false;        
    }else if($("#member_postNum").val().length == 0){
        alert("주소를 입력해 주세요.");
        $("#member_postNum").focus();
        return false;        
    }else if($("#member_address").val().length == 0){
        alert("주소를 입력해 주세요.");
        $("#member_address").focus();
        return false;        
    }else if($("#member_address2").val().length == 0){
        alert("주소를 입력해 주세요.");
        $("#member_address2").focus();
        return false;        
    }else if($("#check_nickname").val() == "fail"){
        alert("중복되지 않는 닉네임을 입력해 주세요.");
        $("#check_nickname").focus();
        return false;        
    }else{
    	$("#update_frm").submit();
	    return true;
    }
    
}

$(function(){
	$("#select_postNum").click(function(){
		kakaopost();
	});
	
	$("#join_btn").click(function(){
		checkInput();
	});
			
	$("#member_identity").click(function(){
		doPayment();
	});
	
	$("#member_nickname").change(function(){
		let member_nickname = $("#member_nickname").val();
    	$.ajax({
        type: "post",
        url: "${pageContext.request.contextPath}/member/checkNickname_process.do",
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
	    });//end of ajax
	});//end of event
	
});
</script>
<style>
*{margin: 0; padding: 0;}
    a{text-decoration: none;}
    input[type="button"], input[type="submit"], input[type="checkbox"], select, input[type="radio"], label, button{cursor: pointer;}
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
     body{
         width: 1020px; height: auto; margin: 0 auto;
         background-color: white;
     }
    /* 바디 CSS */
     
        #Container_ori{
        overflow:hidden;
        
        width: 1020px; margin: 0 auto;
        height: 700px;
    }
    
    #mypage {
    	margin-top: 30px;
        font-family:'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif;
       	font-size: 15px;
        width: 199px;
        height: 500px;
        float: left;
    }
    #mypage th {
    	height: 50px;
    	vertical-align: super;
    	color: #000000;
    }
    
    #mypage td {
    	height: 25px;
    }

    #mypage-conts {
        width:810px;
        height:auto; 
        float:left;
    }

    #mylink{
        color: #000000;
        font-size: 25px;
        text-decoration: none;
        letter-spacing: -2px;
    }

    .mypagetable {
    	height: 50px;
        font-size: 18px;
        font-family:'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif;
        font-weight: bold;      
        color: #7d99a4;
    }

    #blank{
        width: 100%;
        height: 35px;
    }

    
    #tit_area{
        height: auto;
    }
    

    .mypage-step li em {
    top: 25px;
    color: #888;
    font-style: normal;
    font-size: 40px;
    line-height: 50px;
    font-weight: 500;
    }

    .mypage-step li em, .mypage-step li span {
    display: block;
    position: absolute;
    left: 0;
    width: 100%;
    text-align: center; 
    }

    

    .mypage-step li span {
    top: 70px;
    color: #666;
    font-size: 16px;
    line-height: 22px;
    }

    

    





    
    
    ul li{      
        list-style:none;
    
    }   


    
    .span_txt{
        padding-left: 20px;
        float: left;
        font-size: 12px;
        height: 35px;
    }

    #member_info_update{
        float: right;
        margin-top: 5px;
        margin-right: 30px;
    }
    
    #password_update{
        float: right;
        margin-top: 5px;
        margin-right: 30px;
    }

    
    #member_password{
        line-height: 50px;
    }

    

    /* 회원가입 업데이트쪽  */
    
    #title{
        width:500px;
        margin:0 auto;
        margin-top:30px;
    }
    
    #container{
        width: 330px;
        padding-left: 20px;
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
    #reset_btn{
        margin-bottom: 10px;
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
    #member_handphone, #member_postNum{
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
    	.tit_sub{color: #4a4a4a; margin-top:10px;}
    	#hr{margin-top:10px; height:3px; background-color:#7d99a4; border:0;}
	    .hoverClass{color: #4a4a4a;}
		.hoverClass:hover{color: #7d99a4;}
    
    
    
    
    
    
    
     
}

</style>
</head>

<body>
	<header>	
		<jsp:include page="../main/header.jsp"/>	
	</header>

<!-- body시작 -->

<div id="Container_ori">
    <div id="mypage">       
        <table>
            <tr><th><h3><a class="hoverClass" href="${pageContext.request.contextPath}/mypage/mypage_main.do" id="mylink">마이페이지</a></h3></th></tr>         
            <tr><td class="mypagetable">마이 쇼핑</td></tr>
            <tr><td><a class="hoverClass" href="${pageContext.request.contextPath}/mypage/mypage_orderinq.do">주문/배송조회</a></td></tr>
            <tr><td><a class="hoverClass" href="${pageContext.request.contextPath}/mypage/mypage_cancelinq.do">취소/반품내역</a></td></tr>
            <tr><td><hr width=100%></td></tr>
            <tr><td><a class="hoverClass" href="${pageContext.request.contextPath}/purchase/basket.do">장바구니</a></td></tr>
            <tr><td><a class="hoverClass" href="${pageContext.request.contextPath}/mypage/mypage_like.do">좋아요</a></td></tr>
            <tr><td><a class="hoverClass" href="${pageContext.request.contextPath}/mypage/mypage_coupon.do">쿠폰</a></td></tr>
            <tr><td><hr width=100%></td></tr>
            <tr><td class="mypagetable">마이활동</td></tr>
            <tr><td><a class="hoverClass" href="${pageContext.request.contextPath}/one_inq/one_inq_list.do">1:1문의내역</a></td></tr>
            <tr><td><a class="hoverClass" href="${pageContext.request.contextPath}/mypage/mypage_nonreview.do">리뷰</a></td></tr>
            <tr><td><a class="hoverClass" href="${pageContext.request.contextPath}/mypage/mypage_productQnA.do">상품문의내역</a></td></tr>
            <tr><td><hr width=100%></td></tr>
            <tr><td class="mypagetable">마이 정보</td></tr>
            <tr><td><a class="hoverClass" href="${pageContext.request.contextPath}/mypage/mypage_modifymain.do" style="font-weight:bold; color:#7d99a4;">회원정보 수정</a></td></tr>
            <tr><td><a class="hoverClass" href="${pageContext.request.contextPath}/mypage/mypage_deliverymain.do">배송지</a></td></tr>
        </table>         
    </div>
    
    <div id="mypage-conts">
        <div id="blank">            
        </div>
        <div class="tit_area">          
            <h2 class="tit">회원정보 수정</h2>
            <hr id="hr" width=100%;>            
			<h4 class="tit tit_sub">※ 휴대폰번호을 변경하시려면 새로 인증해주세요</h4>
    <div id="container">
        <form action="infoupdate_process.do" method="post" id="update_frm" name="frm" style="margin-top:35px;">         
            <p>
                <label>전화번호<br>
                    <input type="text" name="member_handphone" id="member_handphone" maxlength="11" value="${member.member_handphone}" placeholder="-없이 연락처를 입력해 주세요."  numberonly="ture" readonly></label>
                    <input type="button" name="member_identity" id="member_identity" value="본인인증&nbsp;&nbsp;">
                    </p>  
            <p>
                <label>이메일<br>
                    <input type="text" name="member_email" id="member_email" placeholder="이메일을 입력해 주세요." value="${member.member_email}"></label>
                    <span id="mail-check-warn"></span>
                    </p>
            <p>
                <label>닉네임<br>
                    <input type="text" name="member_nickname" id="member_nickname" maxlength="20" notspecial="true" placeholder="닉네임을 입력해 주세요.(특수 문자 불가능)" nick=""  value="${member.member_nickname}">
                    <input type="hidden" name="check_nickname" id="check_nickname" value=""> 
                </label></p>
                <div id="nickmsg"></div>
           <p >
                <label>주소<br>
                    <input type="text" name="member_postNum" id="member_postNum" placeholder="우편번호" readonly  value="${member.member_postNum}">
                    <input type="button" name="select_postNum" id="select_postNum" value="우편번호 검색&nbsp;&nbsp;" onclick="kakaopost()" >
                    <input type="text" name="member_address" id="member_address" placeholder="주소" readonly value="${member.member_address}">
                    <input type="text" name="member_address2" id="member_address2" placeholder="상세 주소" value="${member.member_address2}">
                </label></p>
                <input type="reset" id="reset_btn" value="취소하기" onclick="location.href='mypage_main.do';">
                <input type="button" id="join_btn" name="join_btn" value="정보수정"> 
                <input type="hidden" name="member_idx" id="member_idx"value="${member.member_idx}">         
        </form>        
        <a class="hoverClass" href="${pageContext.request.contextPath}/mypage/mypage_modify_withdraw.do">탈퇴하기</a>
    </div>
        
            
            
            
            
            
            
            
            
            
            
            
            
            
            




            
            
                    
            
        </div>
    </div>
</div>







    <footer>
		<jsp:include page="../main/footer.jsp"/>		
	</footer>
</body>
</html>
