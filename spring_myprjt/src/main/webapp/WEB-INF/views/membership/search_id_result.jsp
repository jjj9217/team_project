<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>        
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SkyBox - 아이디 찾기</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
$(function(){
	$("#menu").click(function(){
    	$("#sitemap").css("display","block");
    });
    $("#sitemap").click(function(){
    	$("#sitemap").css("display","none");
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
	width: 898px; height: 262px;
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
	width: 200px; height: 47px;
}
.td_bottom{
	width: 388px; height: 47px;
	padding-left: 10px;	
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
td>ul>li{
    float: left;
}
#year, #month, #day{
	width: 70px; height: 37px;	
	background-color: rgb(150, 222, 224);
	padding: 0 0 0 10px;
    border-width: 0;
	font-size: 12px;
}
#month{
	width: 78px;
	margin: 0 5px;
	font-size: 12px;
}
#td_submit{
	padding-left: 10px;
	padding-top: 5px;
}
#td_bottom{
	padding-top: 15px;
	padding-left: 20px;
}
#td_bottom a{
	text-decoration: none;
	color: rgb(41, 128, 185);
	font-size: 14px;
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
#notice_red{
	color: rgb(231, 76, 60);
	font-size: 14px;
	font-weight: bold;
}
#notice_blue{
	color: rgb(41, 128, 185);
	font-size: 14px;
	font-weight: bold;;
}
#td_button{
	text-align: right;
}
#back, #pw_search{
	width: 72px; height: 27px;
	background-color: rgb(224, 224, 224);
	color: rgb(127, 127, 127);
	border-width: 0;
	font-weight: bold;
}
#login_btn{
	width: 72px; height: 27px;
	background-color: rgb(41, 128, 185);
	color: white;
	border-width: 0;
	font-weight: bold;
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
	<div id="title"  class="pull-left">아이디 찾기</div>	
	</div>
	<div id="contentcontainer">
		<fieldset>
            <legend></legend>
            <form action="search_id_process.do" method="post" name="frm">
	            <table>
	                <tr>
	                    <td class="td_title"></td>
	                    <td class="td_content">	                    	
	                    </td>
	                </tr>
	                <tr>
	                	<td colspan="2" class="td_title">
	                		<c:choose>
								<c:when test="${msg_searchId eq 'ok'}">
				                	<div id="notice_blue">입력하신 정보의 아이디 : ${search_id.member_id}</div>													
								</c:when>
								<c:when test="${msg_searchId eq 'fail'}">
									<div id="notice_red">회원정보가 없거나 입력하신 정보가 일치하지않습니다.</div>
								</c:when>
							</c:choose> 	                	
	                	</td>                   		
	                </tr>
	                <tr>
	                	<td class="td_title"></td>	
			            <td id="errmsg"></td> 
	                </tr>
	                <tr>
	                    <td class="td_title"></td>
	                    <td id="td_button" class="td_content">
	                    	<c:choose>
								<c:when test="${msg_searchId eq 'ok'}">
				                	<a href="../membership/search_pw.do">
			                    		<input id="pw_search" type="button" value="PW 찾기">
			                    	</a>
			                    	<a href="../membership/login.do">
			                    		<input id="login_btn" type="button" value="로그인">
			                    	</a>													
								</c:when>
								<c:when test="${msg_searchId eq 'fail'}">
			                    	<input id="back" type="button" value="뒤로" onclick="history.back()">
								</c:when>
							</c:choose>
	                    		                    	
	                    	
	                    </td>
	                </tr>	                
	                <tr>
	                	<td id="td_submit" colspan="2"></td>	                	
	                </tr>
	                <tr>
	                	<td id="td_bottom" colspan="2">		                	
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