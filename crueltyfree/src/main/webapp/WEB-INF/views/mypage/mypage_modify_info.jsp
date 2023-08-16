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
        height: auto;      
        float:left;
    }

    #mylink{
        color: black;
        font-size: 30px;
        text-decoration: none;
    }

    .mypagetable{
        font-size: 20px;
        font-family:'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif;
        font-weight: bold;      
        color:#7d99a4;
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
        width: 100%;
        height: auto;
        color: #4a4a4a;
        font-size: 14px;
        font-weight: bold;
        line-height: 50px;
        text-align: left;

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

    

    .password_btn{
        width: 100%;
        height: 80px;
        display : flex;
    }

    #bef_pwd{
        width: 230px;
        height: 30px;
    }

    .password_input{
        width: 100%;
        height: auto;
        margin-bottom: 10px;
        margin-top: 10px;
        display : flex;
    }

    #do-search-period{
        width: 150px;
        height: 30px;
        border: 1px solid #7d99a4;
        color: #7d99a4;
        background-color: #fff;
        font-weight: bold;   
        border-radius: 5px; 
        margin-right: 10px;              
    }
    #do-search-period2{
    	width: 154px;
        height: 30px;
        border: 1px solid #7d99a4;
        color: #fff;
        background-color: #7d99a4;
        font-weight: bold;  
        border-radius: 5px;  
    }
    .goodlist_thumb{
        width:150px;
        height:150px;
    }
    #hr, #hr2{margin-top:10px; height:3px; background-color:#7d99a4; border:0;}
    #hr2{margin-bottom: 30px;}
    #pwd{width: 290px; height: 10px; padding: 10px; border-radius: 5px; border: 1px solid #7d99a4; outline: none;}
}

</style>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
$(function(){
	
$("#do-search-period2").click(function(){
	
	var test1 = $("#pwd").val();
	var test2 = $("#pwdCheck").val();
	if($("#pwd").val().length == 0){
		alert("비밀번호를 입력해주세요");	
	}else{
	    if(test1 != test2){
	    	alert("비밀번호가 서로 같지 않습니다");
	    }else{
	    	$("#qw").submit();
	    }
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
            <h2 class="tit">회원정보 수정</h2>
            <hr id="hr" width=100%;>            
<form name="caq" id="qw" action="${pageContext.request.contextPath}/mypage/mypage_modify_changeinfo.do" method="post">
            <div class="buy_list_txt">              
                <p4>회원정보를 수정하시려면 비밀번호를 입력하셔야 합니다.</p4><br>
                <p1>회원님의 개인정보 보호를 위한 본인 확인 절차이오니,<br>
                 CrueltyFree 회원 로그인 시 사용하시는 비밀번호를 입력해주세요.</p1>                
            </div>
            <div class="password_input">
                <input type="password" id="pwd" name="pwd" class="text" placeholder="비밀번호를 입력해주세요.">
            </div>
            <div class="password_btn">                  
                <button type="button" class="btnLookup" id="do-search-period"onclick="location.href='${pageContext.request.contextPath}/mypage/mypage_modifymain.do';">취소</button>                                       
                <button type="button" class="btnLookup" id="do-search-period2">확인</button>
            </div>
</form>       
     	<input type="hidden" id="pwdCheck" value="${member.member_pw}">
     	<hr id="hr2" width=100%;>
        </div>        
    </div>
</div>






    <footer>
		<jsp:include page="../main/footer.jsp"/>		
	</footer>
</body>
</html>
