<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기 | CrueltyFree</title>
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
	#member_name, #member_handphone,#submit_btn,#pw_btn,#login_btn,#id_btn{
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
		width:200px;
	}
	p{font-weight:500; color:gray;}
	
	#tag{
		font-size:17px;
		margin-top:50px;
		font-weight:600;
	}
	#find_id{
		margin-top:30px;
		width:80%;
		margin-left:90px;
	}
	#find_pw{
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
  	fieldset{
  		height:100px;
  	}
  	#notice{
  		margin-top:30px;
  	}
  	#notice2{
  		margin-top:30px;
  	}
  	#id_btn{
  		color:black; 
  		background-color:rgb(221, 219, 214);
  	}
</style>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
$(function(){
	// 원래 문자열
	var originalString = "${find_id.member_id}";

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
    	<a href="../main/home.do" id="a"><img src="../resources/img/home.png" style="width: 21px; height: 21px;"></a>
    	<a href="login.do" id="a">〉 로그인</a>
    	<a href="" id="a">〉 아이디 찾기</a>
    </div>
    <h1>아이디 찾기</h1>
    <p>원하는 정보를 찾으셨나요?</p>
    <hr id="hr">
    <div id="tag"><span>입력하신 정보는 아이디 찾기에만 사용되며 </span> <span style="color:red;">저장되지 않습니다.</span></div>
    	 <form action="find_id_process.do" method="post" name="frm">
    	<div id="find_id">
    		
    		<c:choose>
				<c:when test="${msg_findId eq 'ok'}">
					<fieldset>
		             	<div id="notice"><span>입력하신 회원님의 아이디 :</span><span id="id_target" style="color:#7d99a4;"> ${find_id.member_id}</span></div>
		            </fieldset>
		            <input type="button" id="login_btn" name="login_btn" value="로 그 인" onclick="location.href='login.do';" style="width:200px;">														
						</c:when>
						<c:when test="${msg_findId eq 'fail'}">
					<fieldset>
							<div id="notice2">내용과 일치한 회원정보가 없습니다.</div>
						</fieldset>
						<input type="button" id="id_btn" name="id_btn" value="아이디 찾기" onclick="location.href='find_id.do';" style="width:200px;">
						<input type="button" id="login_btn" name="login_btn" value="로 그 인" onclick="location.href='login.do';" style="width:200px;">
						</c:when>		
				</c:choose>
	
    	</div>
    	</form>
    	<div id="find_pw">
    		<img src="../resources/img/find.png" style="width: 130px; height: 130px;">
    		<p><input type="button" id="pw_btn" name="pw_btn" value="비밀번호 찾기" onclick="location.href='find_pw.do';" style="width:200px;"></p>
    	</div>
    
	</div>




<footer>
	<jsp:include page="../main/footer.jsp" />
</footer>
</body>
</html>