<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SkyBox - 로그인</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
$(function(){
	$("#menu").click(function(){
    	$("#sitemap").css("display","block");
    });
    $("#sitemap").click(function(){
    	$("#sitemap").css("display","none");
    });
    $("#submit_btn").click(function(){
    	if(frm.member_id.value.length==0){
            alert("아이디가 입력되지 않았습니다.");
            frm.member_id.focus();
            return false;
        }else if(frm.member_pw.value.length==0){
            alert("비밀번호가 입력되지 않았습니다.");
            frm.member_pw.focus();
            return false;
        }
        document.frm.submit();
        return true;
    });
});
</script>
<style>
*{margin: 0; padding: 0;}
a{text-decoration: none;}
li{list-style: none;}
.pull-left{float: left; display: block;}
.pull-right{float: right; display: block;}
input[type="button"], input[type="submit"], input[type="reset"], select{cursor: pointer;}
body{
    width: 978px; margin: 0 auto;
    background-color: white;
}
#main-header{		
	width: 938px; height: 115px;
	margin-top:10px;
	margin-left: 20px;
    margin-bottom: 15px;		
}
#hr{
	background-color: rgb(150, 222, 224);
	width: 938px; height: 5px;
	margin-left: 20px;
}
#titlecontainer{
	padding-top: 10px;
    margin-left: 20px;
	width: 938px;
    height: 42px;
}
#title{
	color: rgb(41, 128, 185);
	font-size: 20px;
	font-weight: bold;
	width: 500px
}
#contentcontainer{
    margin-left: 20px;
	width: 918px;
    height: 425px;
    padding: 10px;
}
fieldset{
	width: 898px; height: 233px;
	border-color: rgb(150, 222, 224);
	border-width: 2px;
	padding-left: 20px;
	padding-top: 20px;
}
label{
	font-size: 14px;	
}
.td_title{
	width: 148px; height: 47px;
}
.td_content{
	width: 248px; height: 47px;
}
.td_bottom{
	width: 388px; height: 47px;
	padding-left: 10px;		
}
.td_notice{
	width: 388px; height: 27px;
	vertical-align: top;
	padding-left: 10px;
	font-weight: bold;
	font-size: 14px;
}
#notice_red{
	color: rgb(231, 76, 60);
}
#notice_blue{
	color: rgb(41, 128, 185);
}
.td_bottom a{
	text-decoration: none;
	color: rgb(41, 128, 185);
	font-size: 14px;
	font-weight: bold;
}
.input_text{
	width: 238px; height: 37px;	
	background-color: rgb(150, 222, 224);
	padding: 0 0 0 10px;
    border-width: 0;
	font-size: 12px;
}
#submit_btn{
	width: 388px; height: 37px;
	background-color: rgb(41, 128, 185);
	color: white;
	border-width: 0;
	font-weight: bold;
}
input:focus{
	border-color:rgb(41, 128, 185);
	outline: 0;
}
select:focus{
	border-color:rgb(41, 128, 185);
	outline: 0;
}
#title a{
	text-decoration: none;
	color: rgb(41, 128, 185);
	font-size: 20px;
}
#main-footer{
		width: 918px; height: 180px;
		margin-top:60px;
		margin-left: 20px;
		padding-top: 10px;
		padding-left: 20px;
	    background-color: rgb(150, 222, 224);	
		color: rgb(127, 127, 127);
		font-size: 12px;
}
</style>
</head>
<body>
	<header id="main-header">
		<jsp:include page="../main/header.jsp"/>
	</header>
	<div id="hr"></div>
	<div id="titlecontainer">
	<div id="title" class="pull-left">&nbsp;<a href="../membership/login.do">로그인</a></div>	
	</div>
	<div id="contentcontainer">
		<fieldset>
            <legend></legend>
            <form action="login_process.do" method="post" name="frm">
	            <table>
	                <tr>
	                    <td class="td_title"><label for="member_id">&nbsp;&nbsp;아이디</label></td>
	                    <td class="td_content">
	                    	<input type="text" class="input_text" name="member_id" id="member_id" placeholder="아이디를 입력해주세요.">
	                    </td>
	                </tr>
	                <tr>
	                    <td class="td_title"><label for="member_pw">&nbsp;&nbsp;비밀번호</label></td>
	                    <td class="td_content"><input type="password" class="input_text" name="member_pw" id="member_pw" placeholder="비밀번호를 입력해주세요."></td>
	                </tr>	                
	                <tr>
	                	<td colspan="2" class="td_bottom"><input type="button" name="login_btn" id="submit_btn" value="로그인"></td>	                	
	                </tr>
	                <tr>
	                	<td colspan="2" class="td_bottom">
		                	<a href="../membership/join.do">&nbsp;&nbsp;&nbsp;회원가입&nbsp;&nbsp;</a>
		                	<a href="../membership/search_id.do">&nbsp;&nbsp;ID/PW 찾기&nbsp;&nbsp;</a>
	                	</td>	                	
	                </tr>
	                <tr>
	                	<td colspan="2" class="td_notice">
	                		<c:choose>
								<c:when test="${msg_join eq 'ok'}">
									<div id="notice_blue">회원가입이 정상적으로 이루어졌습니다</div>		
								</c:when>
								<c:when test="${msg eq 'fail'}">
									<div id="notice_red">회원정보가 없거나 아이디나 비밀번호가 일치하지않습니다.</div>
								</c:when>
								<c:when test="${msg_search_pw_change eq 'ok'}">
									<div id="notice_blue">비밀번호 변경이 정상적으로 이루어졌습니다</div>
								</c:when>
							</c:choose> 
	                	</td>
	                </tr>
	            </table>
	        </form>
        </fieldset>
	</div>
	<footer id="main-footer">
		<jsp:include page="../main/footer.jsp" />
	</footer>
</body>
</html>