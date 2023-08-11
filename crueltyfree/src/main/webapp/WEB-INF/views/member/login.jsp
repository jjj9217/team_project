<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 | CrueltyFree</title>
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


<footer>
	<jsp:include page="../main/footer.jsp" />
</footer>
</body>
</html>