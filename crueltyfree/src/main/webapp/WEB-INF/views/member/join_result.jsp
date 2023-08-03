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
	#member_name, #member_handphone,#submit_btn,#pw_btn{
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
   
</style>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>



</head>
<body>

<header>
	<jsp:include page="../main/header.jsp" />
</header>
	<div id="joinbanner" style="text-align:center; margin: 0 auto; width:1000px; height:90px; margin-top:50px;"><img src="../resources/img/joinbanner3.JPG" style="width: 500px; height: 90px; text-align:center; margin:0 auto; "></div>
    <div id="container" style="">
    회원가입을 축하드립니다.<br>
    다양한 서비스를 이용해 보세요.
    
    </div>
    




<footer>
	<jsp:include page="../main/footer.jsp" />
</footer>
</body>
</html>