<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="vo.MembershipVo, dao.MembershipDao" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SkyBox - 관리페이지</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
$(function(){
	$("#menu").click(function(){
    	$("#sitemap").css("display","block");
    });
    $("#sitemap").click(function(){
    	$("#sitemap").css("display","none");
    });
    $("#member_nickname").change(function(){
		let member_nickname = $("#member_nickname").val();
	    
	    $.ajax({
	        type: "post",
	        url: "checkNickname_process.do",
	        data: { "member_nickname": member_nickname },
	        success: function(data) {
	        	if (data == "success") {
	        		$("#nicknamemsg").text("사용할 수 있는 닉네임입니다.");
	        		$("#nicknamemsg").css("color", "rgb(41, 128, 185)")
	        		$("#confirm_nickname").val("ok");
	            } else {
	            	$("#nicknamemsg").text("이미 사용하고 있는 닉네임입니다.");
	            	$("#nicknamemsg").css("color", "rgb(231, 76, 60)")
	            	$("#confirm_nickname").val("fail");
	            }
	        },
	        error: function(error) {
	        	alert("ajax 에러 발생");
	        }
	    });
	    
    });
    $("#edit_info_btn").click(function(){
    	if(frm.member_nickname.value.length==0){
    	        alert("닉네임이 입력되지 않았습니다.");
    	        frm.member_nickname.focus();
    	        return false;
    	    }else if(frm.handphone.value.length==0){
    	        alert("휴대전화가 입력되지 않았습니다.");
    	        frm.handphone.focus();
    	        return false;
    	    }else if($("#confirm_nickname").val() == "fail"){
    	        alert("중복된 닉네임을 사용하였습니다.");
    	        frm.member_nickname.focus();
    	        return false;
    	    }
   	    document.frm.submit();
   	    return true;
    });
    
    $("#drop_out_btn").click(function(){
    	let confirmAns = confirm("정말 회원 탈퇴하시겠습니까?");
    	if(confirmAns){
    		document.drop_frm.submit();
    		return true;
    	} 
    });
    
});
</script>
<style>
*{margin: 0; padding: 0;}
a{text-decoration: none;}
li{list-style: none;}
.pull-left{float: left; display: block;}
.pull-right{float: right; display: block;}
input[type="button"], input[type="submit"], input[type="reset"], .pointerSelect{cursor: pointer;}
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
    height: auto;
    padding: 10px;
}
fieldset{
	width: 898px; height: auto;
	border-color: rgb(150, 222, 224);
	border-width: 2px;
	padding-left: 20px;
	padding-top: 5px;
	padding-bottom: 15px;
}
label{
	font-size: 14px;	
}
.td_title{
	width: 148px; height: 30px;
}
.td_content{
	width: 248px; height: 30px;
}
.td_bottom{
	width: 388px; height: 30px;
	padding-left: 10px;	
}
#td_nicknamecheck_input{
	width: 170px; height: 30px;
}
#td_nicknamecheck{
	width: 76px; height: 30px;
	text-align: right;
}
.td_bottom a{
	text-decoration: none;
	color: rgb(41, 128, 185);
	font-size: 14px;
	font-weight: bold;
}
.input_gray{
	background-color: rgb(224, 224, 224);
	width: 238px; height: 27px;	
	padding: 0 0 0 10px;
    border-width: 0;
	font-size: 12px;
}
.input_text{
	width: 238px; height: 27px;	
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
#year, #day{
	width: 70px; height: 27px;	
	background-color: rgb(224, 224, 224);
	padding: 0 0 0 10px;
    border-width: 0;
	font-size: 12px;
}
#month{
	width: 70px; height: 27px;	
	background-color: rgb(224, 224, 224);
	padding: 0 0 0 5px;
    border-width: 0;
	font-size: 12px;
}
#gender{
	background-color: rgb(224, 224, 224);
    border-width: 0;
	font-size: 12px;
}
#gender, #grade{
	padding: 0 0 0 5px;
	width:248px; height: 27px;	
	font-size: 12px;
}
#month{
	width: 78px;
	margin: 0 5px;
	font-size: 12px;
}
#td_submit{
	padding-left: 0;
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
#td_delete{
	text-align: right;
}
input:focus{
	border-color:rgb(41, 128, 185);
	outline: 0;
}
select:focus{
	border-color:rgb(41, 128, 185);
	outline: 0;
}
.redstar{
	font-weight: bold;
	color: red;
}
#edit_info_btn{
	width: 108px; height: 27px;
	background-color: rgb(41, 128, 185);
	color: white;
	border-width: 0;
	font-weight: bold;
}
#edit_info_btn, #edit_pw_btn, #drop_out_btn{
	margin-left: 7px;
}
#sub-title{
	color: rgb(41, 128, 185);
	font-size: 16px;
	font-weight: bold;
}
.link a{
	text-decoration: none;
	color: rgb(127, 127, 127);
	font-size: 16px;
	padding-left: 35px;
}
.gray_btn{
	width: 72px; height: 27px;
	background-color: rgb(224, 224, 224);
	color: rgb(127, 127, 127);
	border-width: 0;
	font-weight: bold;
}
#member_nickname{
	width: 238px; height: 27px;	
	background-color: rgb(150, 222, 224);
	padding: 0 0 0 10px;
    border-width: 0;
	font-size: 12px;
}
.blue_btn{
	width: 72px; height: 27px;
	background-color: rgb(41, 128, 185);
	color: white;
	border-width: 0;
	font-weight: bold;
}
#td_cancle_notice{
	width: 396px;
	text-align: center;
	color:rgb(231, 60, 60);
	font-weight: bold;
}
#title a{
	color: rgb(41, 128, 185);
}
#sub-title a{
	color: rgb(41, 128, 185);
}
#nicknamemsg{
	vertical-align: top;
	font-size: 10px;
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
	<div id="title" class="pull-left"><a href="../membership/admin_member.do">관리페이지</a></div>	
	</div>
	<div id="contentcontainer">
		<fieldset>
            <legend></legend>
            <span id="sub-title"><a href="../membership/admin_member.do">회원정보</a></span>&nbsp;&nbsp;
            <span class="link"><a href="../membership/admin_content.do">작성글보기</a></span>&nbsp;&nbsp;
            <span class="link"><a href="../membership/admin_reply.do">작성댓글보기</a></span>&nbsp;&nbsp;
            <br><br><br>
            	<form action="admin_member_edit_process.do" method="post" name="frm">
	            <table>
	            	 <tr>
	                    <td class="td_title"><label for="member_idx">&nbsp;&nbsp;&nbsp;회원번호</label></td>
	                    <td colspan="2" class="td_content">
	                    <input type="text" class="input_gray" name="member_idx_show" id="member_idx_show" value="${membershipVo.member_idx}" disabled>
	                    <input type="hidden" id="member_idx" name="member_idx" value="${membershipVo.member_idx}">	                    
	                    </td>
	                </tr>
	                <tr>
	                    <td class="td_title"><label for="member_id">&nbsp;&nbsp;&nbsp;아이디</label></td>
	                    <td colspan="2" class="td_content"><input type="text" class="input_gray" name="member_id_show" id="member_id_show" value="${membershipVo.member_id}" disabled>
	                    <input type="hidden" id="member_id" name="member_id" value="${membershipVo.member_id}">
	                    </td>
	                </tr>
	                <tr>
	                    <td class="td_title"><label for="member_nickname">&nbsp;&nbsp;&nbsp;닉네임</label></td>
	                    <td colspan="2" class="td_content">
	                    <input type="text" class="input_text" name="member_nickname" id="member_nickname" value="${membershipVo.member_nickname}" >
	                    <input type="hidden" name="confirm_nickname" id="confirm_nickname" value="${membershipVo.member_nickname}">
	                    </td>
	                </tr>
	                <tr>
		                <td></td>
		                <td colspan="2" id="nicknamemsg"></td>
	                </tr>
	                <tr>
	                    <td class="td_title"><label for="member_name">&nbsp;&nbsp;&nbsp;이름</label></td>
	                    <td colspan="2" class="td_content"><input type="text" class="input_gray" name="member_name" id="member_name" value="${membershipVo.member_name}" disabled></td>
	                </tr>
	                <tr>
	                	<td class="td_title"><label for="gender">&nbsp;&nbsp;&nbsp;성별</label></td>
	                   	<td colspan="2" class="td_content">
	                   		<c:choose>
	                   		<c:when test="${membershipVo.gender eq 1}">
	                   			<select name="gender" id="gender" disabled>
	                            <option class="gray" value="">성별</option>
	                            <option value="1" selected>남자</option>
	                            <option value="2">여자</option>
	                        </select>
	                   		</c:when>
	                   		<c:when test="${membershipVo.gender eq 2}">
	                   			<select name="gender" id="gender" disabled>
	                            <option class="gray" value="">성별</option>
	                            <option value="1">남자</option>
	                            <option value="2" selected>여자</option>
	                        </select>
	                   		</c:when>
	                   		</c:choose>           
	                  	</td>
	               	</tr>
                	<tr>
                	 	<td class="td_title"><label for="year">&nbsp;&nbsp;&nbsp;생년월일</label></td>
                   		<td colspan="2" class="td_content">
                        	<%@ include file="../membership/birthday.jsp" %>	
                   		</td>
                 	</tr>	               
	                <tr>
	                    <td class="td_title"><label for="handphone">&nbsp;&nbsp;&nbsp;휴대전화</label></td>
	                    <td colspan="2" class="td_content"><input type="text" class="input_text" name="handphone" id="handphone" value="${membershipVo.handphone}"></td>
	                </tr>
	                <tr>
	                    <td class="td_title"><label for="email">&nbsp;&nbsp;&nbsp;이메일</label></td>
	                    <td colspan="2" class="td_content"><input type="email" class="input_gray" name="email" id="email" value="${membershipVo.email}" disabled></td>
	                </tr>
	               <tr>
	                	<td class="td_title"><label for="grade">&nbsp;&nbsp;&nbsp;회원등급</label></td>
	                   	<td colspan="2" class="td_content">
	                   		<c:choose>
	                   		<c:when test="${membershipVo.grade eq 0}">
		                        <select class="input_text pointerSelect" name="grade" id="grade">
		                            <option class="gray" value="">등급</option>
		                            <option value="0" selected>일반회원</option>
		                            <option value="1">관리자</option>
		                        </select>
	                   		</c:when>
	                   		<c:when test="${membershipVo.grade eq 1}">
	                   			<select class="input_text pointerSelect" name="grade" id="grade">
		                            <option class="gray" value="">등급</option>
		                            <option value="0">일반회원</option>
		                            <option value="1" selected>관리자</option>
		                        </select>
	                   		</c:when>
	                   		</c:choose>
	                   		
	                  	</td>
	               	</tr>		
	                <tr>
	                    <td class="td_title"><label for="join_date">&nbsp;&nbsp;&nbsp;가입일</label></td>
	                    <td colspan="2" class="td_content">
	                    <fmt:formatDate value="${membershipVo.join_date}" type="date" pattern="yyyy-MM-dd" var="formattedDate"/>
	                    <input type="text" class="input_gray" class="input_text" name="join_date" id="join_date" value="${formattedDate}" disabled></td>
	                </tr>
	                <tr>
	                <td class="td_title"></td>
	                <td colspan="2" class="td_content"></td>
	              	</tr>
              	</table>
              	</form>
              	<form action="admin_drop_out_process.do" method="post" name="drop_frm">
              	<table>			                
	                <tr>
	                <c:choose>
	                	<c:when test="${empty membershipVo.cancel_date}">
	                		<td class="td_title">
			                	<input type="button" name="edit_info_btn" id="edit_info_btn" value="회원 정보 변경">
			                	<input type="hidden" id="member_idx" name="member_idx" value="${membershipVo.member_idx}">	
			                </td>
			                <td colspan="2" id="td_delete" class="td_content">
			                	<input type="button" class="gray_btn" name="drop_out_btn" id="drop_out_btn" value="회원 탈퇴">
			                </td>	 
	                	</c:when>
	                	<c:otherwise>
	                		<td id="td_cancle_notice" colspan="3" class="td_title">
	                			탈퇴한 회원입니다.
			                </td>
	                	</c:otherwise>
	                </c:choose>
	                
	                               	                	
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