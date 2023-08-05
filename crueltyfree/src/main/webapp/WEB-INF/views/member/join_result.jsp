<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입완료 | CrueltyFree</title>
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
            width: 500px;
            height: 600px;
            margin: 0 auto;
            font: bold 25px Arial, Sans-serif;
        	text-align: center;
        	margin-top:70px;
    }
	#login_btn{
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
		cursor:pointer;
		font: bold 17px Arial, sans-serif;
		border-radius:3px;
	}
	#login{
		margin-top:100px;
	}
	
	#sub2{
		color:gray;
	}

   
</style>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>



</head>
<body>

<header>
	<jsp:include page="../main/header.jsp" />
</header>
	<div id="joinbanner" style="text-align:center; margin: 0 auto; width:1000px; height:90px; margin-top:70px;"><img src="../resources/img/joinbanner3.JPG" style="width: 500px; height: 90px; text-align:center; margin:0 auto; "></div>
    <div id="container" style="">
    <img src="../resources/img/CrueltyFree_logo.png" style="width: 380px; height: 100px; margin-top:20px;"><br>
    회원가입이 정상적으로 완료되었습니다.<br>
    <div id="sub2">다양한 서비스를 이용해 보세요.</div>
    <div id="login"><input type="button" id="login_btn" value="로그인 하러가기" onclick="location.href='login.do';"></div>
    </div>
    




<footer>
	<jsp:include page="../main/footer.jsp" />
</footer>
</body>
</html>