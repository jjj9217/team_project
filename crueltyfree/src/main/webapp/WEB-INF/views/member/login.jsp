<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 | CrueltyFree</title>
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
            width: 380px;
            height: 700px;
            margin: 0 auto;
            font: bold 25px Arial, Sans-serif;
        	text-align: center;
        	margin-top:70px;
        	
    }


    #member_id,#member_pw{
        width: 360px;
        height: 54px;
     	margin: 3px 0;
        padding-left: 20px;
        font-size: 16px;
        border-radius: 30px;
        border-color:#7d99a4;
        border-width:1px;
        outline-color: #7d99a4;
    }
    
    input[type="button"]{
        width: 380px;
        height:50px;
        margin-top: 10px;
        font: bold 20px Arial, sans-serif;
        background-color:#7d99a4;
        color: white;
        cursor:pointer;/*마우스를 올려놓았을 때 커서가 손모양으로 변경됨*/
        border-radius: 0px;
        border:0;
    }
    #msg{
    	width: 400px;
    	margin: 20px auto;
    	text-align: center;
    	font-size: 13px;
    } 		
    #no_join{
    	font-size:15px;
    	 font: bold 14px Arial, sans-serif;
    	 color:rgb(122, 120, 120);
    	
    }
    #join_btn{
    	width:200px;
    	height:50px;
    	border:0;
    }
	#find_id,#find_pw{
		color:rgb(65, 60, 60);
		text-decoration-line: none;
		font-size:17px;
	}
	#sub{
		margin-top:70px;
	}
	#sub2{
		margin-top:30px;
	}
	#message,#message2,#msg{
		color:rgb(231, 76, 60);
		font-size:13px;
	}
	#member_id,#member_pw{
		border-style:solid;
		border-width:1px;
	}
	#guest{font-size:14px; float:right; padding-right: 20px; color:#7d99a4; cursor: pointer; font-weight:bold; text-decoration: underline;}

	 .modalContainer {
	 	width: 100%;
	 	height: 100%;
	 	position: fixed;
	 	top: 0;
	 	left: 0;
	 	display: flex;
	 	justify-content: center;
	 	align-items: center;
	 	background: rgba(0, 0, 0, 0.5);
	 }
	.hidden {
	 	display: none;
	 }	 
	.modal_title{width:450px; font-size: 24px; font-weight: bold; margin-bottom: 10px;}
	.modal_content{width:450px; height:auto; line-height:130px; color:#a4a4a4; font-weight: bold; text-align: center;}
	.modal_hr{width:450px; height: 5px; background-color: #7d99a4; margin-bottom: 10px;}
	.modal_btn{width:450px; display: flex; justify-content: center;}
	.modal_title_text{display:inline-block;}
	.modal_title_right{float:right;}
	.close{border:0;color:#4a4a4a; font-weight: bold; font-size: 24px; background-color: #fff;}	     
	
	.modalInqContent {
		position: absolute;
	 	background-color: #ffffff;
	 	border-radius: 5px;
	 	width: 550px;
	 	height: auto;
	 	padding: 15px;
	 }
	 .modal_inq_title{width:550px; font-size: 24px; font-weight: bold; margin-bottom: 10px;}
	 .modal_inq_content{width:550px; height:auto;}
	 .modal_inq_hr{width:550px; height: 5px; background-color: #7d99a4; margin-bottom: 20px;}
	 .inq_text_box{width:530px; height: auto; margin-top: 10px; margin-bottom: 20px; border-radius: 5px; border: 1px solid #a4a4a4; padding: 10px;}	
	 .inq_text{width:510px; height: 180px; padding: 10px; border: none; resize: none;}
	 .inq_text:focus{outline: none;}
	 .inq_text_count{width:510px; height:50px; line-height:50px; border-top: 1px solid #a4a4a4; padding: 10px;}     
	 .modal_inq_btn{width:550px; display: flex; justify-content: center; border-top: 1px solid #a4a4a4; padding-top: 20px; padding-bottom: 20px;}
	 .cancelButton, .edit_cancelButton{width:130px; height:40px; margin-right: 10px; border-radius: 2px; background-color: #fff; color:#7d99a4; font-weight: bold; border: 1px solid #7d99a4}
	 .writeButton, .edit_updateButton{width:130px; height:40px; margin-left: 10px; border-radius: 2px; background-color: #7d99a4; color:#fff; font-weight: bold; border: 1px solid #7d99a4}
	 .search_notice{color: #4a4a4a; font-weight: bold;}
	 #order_num{margin-left: 30px; width: 300px; height: 20px; padding: 10px; border: 1px solid #7d99a4; border-radius: 5px; outline: #7d99a4;}
	
</style>

<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
$(document).ready(function() {
    $("#submit_btn").click(function() {
        var userid = $("#member_id").val();

        // 아이디를 입력하지 않았을 경우 메시지 띄우기
        if (userid === '') {
            $("#message").text("아이디를 입력해주세요.");
        } else {
        	$("#message").text("");
        }
    });
    $("#submit_btn").click(function() {
        var userpw = $("#member_pw").val();

        // 비밀번호를 입력하지 않았을 경우 메시지 띄우기
        if (userpw === '') {
            $("#message2").text("비밀번호를 입력해주세요.");
        } else {
        	$("#message2").text("");
        }
    });
    
    //비회원 주문/배송 조회
    $("#guest").click(function() {
    	$(".modalContainer").eq(0).removeClass("hidden");
    });  
    
    $(".modalCloseButton").click(function() {
    	$(".modalContainer").eq(0).addClass("hidden");
    });
    
    $("#orderInq_search_btn").click(function() {
    	if($("#order_num").val().length == 0){
    		alert("주문번호를 입력해주세요");
    		$("#order_num").focus();
    	}else{
    		$("#inq_form").submit();
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
    if(frm.member_id.value.length==0){
        frm.member_id.focus();
        return false;

    }else if(frm.member_pw.value.length==0){
        frm.member_pw.focus();
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

<section>
    <div id="container">LOGIN<br><br>
   	<span id="guest">비회원 주문조회</span><br>
    <form name="frm" action="login_process.do" method="post" >
            <input type="text" name="member_id" id="member_id" placeholder="아이디">
            <div id="message"></div>
            <input type="password" name="member_pw" id="member_pw" placeholder="비밀번호">
            <div id="message2"></div>
            <div id="msg">
            <c:choose>
				<c:when test="${msg eq 'fail'}">
					<div id="msg">아이디 또는 비밀번호를 잘못 입력했습니다.</div>
				</c:when>
			</c:choose> 
            </div>
            <input type="button" name="submit_btn" id="submit_btn" value="로 그 인">
    		<br>
    </form>
    <a href="${pageContext.request.contextPath}/member/find_id.do" id="find_id">아이디 찾기</a>&nbsp;&nbsp; 
    		<a href="${pageContext.request.contextPath}/member/find_pw.do" id="find_pw">비밀번호 찾기</a>
    <div id="sub">
    <form name="join" action="join.jsp" method="post">
    	<p id="no_join">아직 회원이 아니신가요?</p>
    	<input type="button" name="join_btn" id="join_btn" value="회원가입" onclick="location.href='${pageContext.request.contextPath}/member/terms.do';">
    </form>
    </div>
    <div id="sub2">
    	<hr>
    	<img src="../resources/img/CrueltyFree_logo.png" style="width: 150px; height: 60px; margin-top:30px; float:left;">
    	<p style="font-size:12px; margin-right:0px; color:rgb(122, 120, 120); width:210px;margin-top:50px; float:right;">가입을 하시면 크루얼티프리의 다양한 서비스를 이용하실 수 있습니다.</p>
    </div>
</div>    
</section>

<!-- 주문조회 모달창 -->
<div class="modalContainer hidden">
<div class="modalInqContent">
	<div class="modal_inq_title">
		<div class="modal_title_text">주문/배송 조회</div>
		<div class="modal_title_right"><button class="modalCloseButton close">X</button></div>							
	</div>
	<div class="modal_inq_hr">
	</div>
	<form name="inq_form" id="inq_form" action="${pageContext.request.contextPath}/mypage/mypage_orderinq_view.do" method="get">
	<div class="modal_inq_content">
		<div class="inq_text_box">
			<span class="search_notice">주문시 이메일로 받은 주문번호를 입력해주세요.</span><br><br>			
			<span class="search_notice">주문번호 : 			
			</span><input type="text" id="order_num" name="ordNum" placeholder="주문번호를 입력해주세요">
		</div>
	</div>
	</form>
	<div class="modal_inq_btn">
	    <button class="modalCloseButton cancelButton">취소</button>
	    <button class="writeButton" id="orderInq_search_btn">
	    조회</button>
	</div>
   </div>				    
</div>

<footer>
	<jsp:include page="../main/footer.jsp" />
</footer>
</body>
</html>