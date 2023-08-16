<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List, java.util.HashMap, java.util.Map" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
        
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Header</title>
<style>
*{margin: 0; padding: 0;}
    a{text-decoration: none;}
    input[type="button"], input[type="submit"], input[type="checkbox"], select, input[type="radio"], label, button{cursor: pointer;}
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
     body{
         width: 1020px; height: auto; margin: 0 auto;
         background-color: white;
     }
    /* 바디 CSS */

    #Container{
        overflow:hidden;

        width: 1020px; margin: 0 auto;
    }
    
    #mypage{
    	margin-top:30px;
        font-family:'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif;
       	font-size:15px;
        width: 199px;
        height:500px;
        float:left;
    }
	#mypage a{color:black;}

    #mypage-conts{
        
        width:810px;
        height: 950px;      
        float:left;
    }

    .mypagetable{
        font-size: 20px;
        font-family:'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif;
        font-weight: bold;      
        color:#7d99a4;
    }

    #mylink{
        color: black;
        font-size: 30px;
        text-decoration: none;
    }

    #blank{
        width:100%;
        height: 35px;
        
    }

    
    
    

    .mypage-step li em {
    top: 25px;
    color: #888;
    font-style: normal;
    font-size: 40px;
    line-height: 50px;
    font-weight: 500;
    }

    .mypage-step li em, .mypage-step li span {
    display: block;
    position: absolute;
    left: 0;
    width: 100%;
    text-align: center; 
    }

    

    .mypage-step li span {
    top: 70px;
    color: #666;
    font-size: 16px;
    line-height: 22px;
    }

    

    





    
    
    ul li{      
        list-style:none;
    
    }   

    .buy_list_txt{
    	padding-top: 30px;
        width: 100%;
        height: 250px;
        
        line-height: 50px;

    }
    
    .span_txt{
        padding-left: 20px;
        float: left;
        font-size: 12px;
        height: 35px;
    }

    #member_info_update{
        float: right;
        margin-top: 5px;
        margin-right: 30px;
    }
    
    #password_update{
        float: right;
        margin-top: 5px;
        margin-right: 30px;
    }

    
    #member_password{
        line-height: 50px;
    }

    #bef_pwd{
        width: 230px;
    }

    .password_btn{    	
        width: 100%;
        display : flex;
    }

    #do-search-period1{
        width: 160px;
        height: 30px;
        border-radius: 5px;
        border: 1px solid #7d99a4;
        background-color: #fff;
        color:  #7d99a4;
        font-weight: bold;
        margin-right: 40px;               
    }
    #do-search-period2{
    	width: 160px;
        height: 30px;
        border-radius: 5px;
        border: 1px solid #7d99a4;
        background-color: #7d99a4;
        color:  #fff;
        font-weight: bold;
    }
   #hr{margin-top:10px; height:3px; background-color:#7d99a4; border:0;}
#tb_box .th_title{text-align: left; color: #4a4a4a; font-weight: bold; padding-right: 20px;}
.input_pw{border: 1px solid #7d99a4; width: 191px; height: 10px; padding: 10px; border-radius: 5px; outline-color: #7d99a4;}
#tb_box{margin-bottom: 20px;}
</style>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
$(function(){
	$("#join_btn").click(function(){
		checkInput();
	});
	$("#do-search-period2").click(function(){
		var p1 = $("#password1").val();
		var p2 = $("#password2").val();
		var pwd = $("#pwd").val();
		var pwd2 = $("#recent_pw").val();
		
		if(pwd.length == 0) {
	        alert('비밀번호를 입력해주세요');
	        $("#pwd").focus();
	        return false;
	    }else if(pwd.length < 8) {
	        alert('입력한 글자가 8글자 이상이어야 합니다.');
	        $("#pwd").focus();
	        return false;
	    }else if(p1 == ""){
	        alert("새 비밀번호를 입력해주세요");
	        $("#password1").focus();
	        return false;
	    }else if(p2 == ""){
	        alert("새 비밀번호 확인을 입력해주세요");
	        $("#password2").focus();
	        return false;
	    }else if(pwd != pwd2){
	        alert("현재 비밀번호가 일치하지 않습니다.");
	        $("#pwd").focus();
	        return false;
	    }if( p1 != p2 ) {
	        alert("입력한 비밀번호가 서로 일치 하지 않습니다");
	        $("#password1").focus();
	        return false;
	      } else{
			$("#qw").submit();
	        return true;
	      }		

	});
});

</script>
</head>

<body>
	<header>	
		<jsp:include page="../main/header.jsp"/>	
	</header>

<!-- body시작 -->

<div id="Container">
    <div id="mypage">       
        <table>
            <tr><th><h3><a href="${pageContext.request.contextPath}/mypage/mypage_main.do" id="mylink">마이페이지</a></h3></th></tr>         
            <tr><td class="mypagetable">마이 쇼핑</td></tr>
            <tr><td><a href="${pageContext.request.contextPath}/mypage/mypage_orderinq.do">주문/배송조회</a></td></tr>
            <tr><td><a href="${pageContext.request.contextPath}/mypage/mypage_cancelinq.do">취소/반품내역</a></td></tr>
            <tr><td><hr width=100%></td></tr>
            <tr><td><a href="${pageContext.request.contextPath}/purchase/basket.do">장바구니</a></td></tr>
            <tr><td><a href="${pageContext.request.contextPath}/mypage/mypage_like.do">좋아요</a></td></tr>
            <tr><td><a href="${pageContext.request.contextPath}/mypage/mypage_coupon.do">쿠폰</a></td></tr>
            <tr><td><hr width=100%></td></tr>
            <tr><td class="mypagetable">마이활동</td></tr>
            <tr><td><a href="${pageContext.request.contextPath}/one_inq/one_inq_list.do">1:1문의내역</a></td></tr>
            <tr><td><a href="${pageContext.request.contextPath}/mypage/mypage_nonreview.do">리뷰</a></td></tr>
            <tr><td><a href="${pageContext.request.contextPath}/mypage/mypage_productQnA.do">상품문의내역</a></td></tr>
            <tr><td><hr width=100%></td></tr>
            <tr><td class="mypagetable">마이 정보</td></tr>
            <tr><td><a href="${pageContext.request.contextPath}/mypage/mypage_modifymain.do">회원정보 수정</a></td></tr>
            <tr><td><a href="${pageContext.request.contextPath}/mypage/mypage_deliverymain.do">배송지</a></td></tr>
        </table>         
    </div>
    
    <div id="mypage-conts">
        <div id="blank">            
        </div>
        <div class="tit_area">          
            <h2 class="tit">비밀번호 수정</h2>
            <hr id="hr" width=100%;>
            <div class="buy_list_txt">  
<form name="caq" id="qw" action="${pageContext.request.contextPath}/mypage/mypage_modify_changepassword_process.do" method="post">
                <table id="tb_box">                
                <tbody>
                    <tr>
                        <th class="th_title">현재 비밀번호</th>
                        <td>
                            <div class="input_group">
                                <span class="input_txt"><input type="password" id="pwd" name="member_pw" class="text input_pw" placeholder="비밀번호를 입력해주세요."></span>
                                <input type="hidden" id="recent_pw" value="${member.member_pw}">
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <th class="th_title">새 비밀번호</th>
                        <td>
                            <div class="input_group">
                                <span class="input_txt"><input type="password" id="password1" name="bef_pwd" class="text input_pw" placeholder="새 비밀번호를 입력해주세요."></span>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <th class="th_title">새 비밀번호 확인</th>
                        <td>
                            <div class="input_group">
                                <span class="input_txt"><input type="password" id="password2" name="member_pw_change" class="text input_pw" placeholder="새 비밀번호를 재입력해주세요."></span>
                            </div>
                        </td>
                    </tr>
                </tbody>
                </table>                
                <div class="password_btn">
                    <button type="button" class="btnLookup" id="do-search-period1" onclick="location.href='${pageContext.request.contextPath}/mypage/mypage_modifymain.do';">나중에</button>                                      
                    <button type="button" class="btnLookup" id="do-search-period2">비밀번호 변경</button>
                </div>
</form>                
            </div>
        </div>
        <hr id="hr" width=100%;>
        
        

        
        
        



        
        
    </div>
</div>

    <footer>
		<jsp:include page="../main/footer.jsp"/>		
	</footer>
</body>
</html>
