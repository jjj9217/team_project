<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SkyBox - 비밀번호 찾기</title>
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
	    }else if(frm.member_name.value.length==0){
	        alert("이름이 입력되지 않았습니다.");
	        frm.member_name.focus();
	        return false;
	    }else if(frm.year.value.length==0){
	        alert("생년월일: 년도가 입력되지 않았습니다.");
	        frm.year.focus();
	        return false;
	    }else if(frm.year.value.length>4){
	        alert("년도가 4자리 이상 입력되었습니다.");
	        frm.year.focus();
	        return false;
	    }else if(frm.month.value.length==0){
	        alert("생년월일: 월이 입력되지 않았습니다.");
	        frm.month.focus();
	        return false;
	    }else if(frm.day.value.length==0){
	        alert("생년월일: 일이 입력되지 않았습니다.");
	        frm.day.focus();
	        return false;
	    }else if(frm.day.value.length>2){
	        alert("일이 2자리 이상 입력되었습니다.");
	        frm.day.focus();
	        return false;
	    }else if(frm.email.value.length==0){
	        alert("이메일이 입력되지 않았습니다.");
	        frm.email.focus();
	        return false;
	    }
	    
		let year = $("#year").val();
	    let month = $("#month").val();
	    let day = $("#day").val();
	    
	    if(year.length == 3){
	        year = '0' + year;
	    } else if(year.length == 2){
	        year = '00' + year;
	    } else if(year.length == 1){
	        year = '000' + year;
	    }
	    
	    if(month.length == 1){
	        month = '0' + month;
	    }
	    if(day.length == 1){
	        day = '0' + day;
	    }
	    
	    let birthday = year + '-' + month + '-' + day;
	    $("#birthday").val(birthday);
	    
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
	width: 898px; height: 305px;
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
	width: 268px; height: 47px;
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
	<div id="title"  class="pull-left"><a href="../membership/search_pw.do">비밀번호 찾기</a></div>	
	</div>
	<div id="contentcontainer">
		<fieldset>
            <legend></legend>
            <form action="search_pw_process.do" method="post" name="frm">
	            <table>
	            	<tr>
	                    <td class="td_title"><label for="member_id">&nbsp;&nbsp;아이디</label></td>
	                    <td class="td_content">
	                    	<input type="text" class="input_text" name="member_id" id="member_id" placeholder="아이디를 입력해주세요.">
	                    </td>
	                </tr>
	                <tr>
	                    <td class="td_title"><label for="member_name">&nbsp;&nbsp;이름</label></td>
	                    <td class="td_content">
	                    	<input type="text" class="input_text" name="member_name" id="member_name" placeholder="이름을 입력해주세요.">
	                    </td>
	                </tr>
	                <tr>
	                	<td class="td_title"><label for="year">&nbsp;&nbsp;생년월일</label></td>
                   		<td class="td_content">
	                        <ul>
	                            <li><input class="input_text" type="text" name="year" id="year" placeholder="년(4자)"></li>
	                            <li>
	                                <select name="month" id="month">
	                                    <option value="">월</option>
	                                    <option value="1">1</option>
	                                    <option value="2">2</option>
	                                    <option value="3">3</option>
	                                    <option value="4">4</option>
	                                    <option value="5">5</option>
	                                    <option value="6">6</option>
	                                    <option value="7">7</option>
	                                    <option value="8">8</option>
	                                    <option value="9">9</option>
	                                    <option value="10">10</option>
	                                    <option value="11">11</option>
	                                    <option value="12">12</option>
	                                </select>
	                            </li>
	                            <li><input type="text" name="day" id="day" placeholder="일"></li>
	                        </ul>
	                        <input type="hidden" name="birthday" id="birthday" value="">
                   		</td>
	                </tr>
	                <tr>
	                    <td class="td_title"><label for="email">&nbsp;&nbsp;이메일</label></td>
	                    <td class="td_content"><input class="input_text" type="email" name="email" id="email" placeholder="이메일 주소를 입력해주세요."></td>
	                </tr>	                
	                <tr>
	                	<td id="td_submit" colspan="2"><input type="button" name="search_pw_btn" id="submit_btn" value="비밀번호 찾기"></td>	                	
	                </tr>
	                <tr>
	                	<td id="td_bottom" colspan="2">
		                	<a href="../membership/login.do">&nbsp;&nbsp;로그인&nbsp;&nbsp;</a>
		                	<a href="../membership/search_id.do">&nbsp;&nbsp;아이디 찾기&nbsp;&nbsp;</a>
		                	<a href="../membership/join.do">&nbsp;&nbsp;회원가입&nbsp;&nbsp;</a>
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