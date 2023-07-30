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
	#input{
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
		margin-top:70px;
		font-weight:600;
	}
	#find_pw{
		margin-top:30px;
		width:80%;
		margin-left:90px;
	}
	#find_id{
		margin-top:70px;
	}
	#hr{
		margin-top:70px;
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
	
   
</style>


</head>
<body>

<header>
	<jsp:include page="../main/header.jsp" />
</header>
    <div id="container">
    <div id="home">
    	<a href="" id="a"><img src="../resources/home.png" style="width: 21px; height: 21px;"></a>
    	<a href="" id="a">〉 로그인</a>
    	<a href="" id="a">〉 비밀번호 찾기</a>
    </div>
    <h1>비밀번호 찾기</h1>
    <p>비밀번호가 기억나지 않으세요?</p>
    <hr id="hr">
    <div id="tag"><span>입력하신 정보는 비밀번호 찾기에만 사용되며 </span> <span style="color:red;">저장되지 않습니다.</span></div>
    
    	<div id="find_pw">
    		<input type="text" id="input" name="member_name" placeholder="아이디를 입력해 주세요.">
    		<input type="text" id="input" name="member_handphone" placeholder="-없이 숫자로 휴대폰 번호를 입력해 주세요.">
    		<input type="button" id="input" name="" value="확인" style="width:415px";>
    	</div>
    	<div id="find_id">
    		<img src="../resources/find.png" style="width: 130px; height: 130px;">
    		<p><input type="button" id="input" name="" value="아이디 찾기" onclick="" style="width:200px;"></p>
    	</div>
	</div>




<footer>
	<jsp:include page="../main/footer.jsp" />
</footer>
</body>
</html>