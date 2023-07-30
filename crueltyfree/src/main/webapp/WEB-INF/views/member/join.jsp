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
    #pswd2{
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
    #id,#pswd,#pswd2,#name,#handphone,#nick,#identity,#address,#postNum,#reset_btn,#join_btn,#postNum2,#postNum3{
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
    #postNum{
    	background-color: #7d99a4;
    	color:white;
    	width:105px;
    	cursor:pointer;
    	font: bold 13px Arial, sans-serif;
    }
    #handphone{
    	width:200px;
    }
    #address{
    	width:200px;
    }
</style>
<script type="text/javascript" src="../resources/js/checkMember.js"></script>
</head>
<body>

<header>
	<jsp:include page="../main/header.jsp" />
</header>

    <div id="container">
        <div id="logo">회원가입</div>
        
        <form action="join_process.jsp" method="post" name="frm_join" style="margin-top:35px;">
            <p >
                <label>아이디<br>
                    <input type="text" name="member_id" id="id" placeholder="User Name" required oninput="checkId()">
                    <input type="hidden" name="confirm_id">
                    <span class="id_ok" style="green; display:none;">사용 가능한 아이디입니다.</span>
                    <span class="id_ok" style="green; display:none;">중복된 아이디입니다.</span>
                    </label></p>
            <p >
                <label>비밀번호<br>
                    <input type="password" name="member_pw" id="pswd" placeholder="Password"></label></p>
            <p >
                <label>비밀번호 확인<br>
                    <input type="password" name="member_pw2" id="pswd2"></label></p>
            <p >
                <label>이름<br>
                    <input type="text" name="member_name" id="name"></label></p>
           	<p>
           		<label>전화번호<br>
           			<input type="text" name="member_handphone" id="handphone"></label>
           			<input type="button" name="member_identity" id="identity" value="본인인증&nbsp;&nbsp;">
           			</p>  
           <p >
                <label>닉네임<br>
                	<input type="text" name="member_nickname" id="nick"> 
                </label></p>
           <p >
                <label>주소<br>
                    <input type="text" name="member_postNum" id="address" placeholder="">
                    <input type="button" name="select_postNum" id="postNum" value="우편번호 검색&nbsp;&nbsp;">
                    <input type="text" name="member_address" id="postNum2">
                    <input type="text" name="member_address2" id="postNum3">
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