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
        
        width: 199px;
        height:500px;
        float:left;     
    }

    #mypage-conts{
        
        width:810px;
        height: 950px;      
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
        height: 350px;
        
        line-height: 50px;
        text-align: center;

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
        justify-content: center;
        align-items : center;
    }

    #bef_pwd{
        width: 230px;
        height: 30px;
    }

    .password_input{
        width: 100%;
        height: 80px;
        
        display : flex;
        justify-content: center;
        align-items : center;
    }

    #do-search-period, #do-search-period2{
        width: 200px;
        height: 50px;
        
        color: black;
        margin-left: 20px;                  
    }
    
    .goodlist_thumb{
        width:150px;
        height:150px;
    }
     
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
            <tr><th><h3><a href="#" id="mylink">마이페이지</a></h3></th></tr>         
            <tr><td class="mypagetable">마이 쇼핑</td></tr>
            <tr><td>주문/배송조회</td></tr>
            <tr><td>취소/반품내역</td></tr>
            <tr><td><hr width=100%></td></tr>
            <tr><td>장바구니</td></tr>
            <tr><td>좋아요</td></tr>
            <tr><td>쿠폰</td></tr>
            <tr><td><hr width=100%></td></tr>
            <tr><td class="mypagetable">마이활동</td></tr>
            <tr><td>1:1문의내역</td></tr>
            <tr><td>리뷰</td></tr>
            <tr><td>상품문의내역</td></tr>
            <tr><td><hr width=100%></td></tr>
            <tr><td class="mypagetable">마이 정보</td></tr>
            <tr><td>회원정보 수정</td></tr>
            <tr><td>배송지/환불계좌</td></tr>
        </table>        
    </div>
    
    <div id="mypage-conts">
        <div id="blank">            
        </div>
        <div class="tit_area">          
            <h2 class="tit">회원정보 수정</h2>
            <hr width=100%;>            
<form name="caq" id="qw" action="${pageContext.request.contextPath}/mypage/mypage_modify_changeinfo.do" method="post">
            <div class="buy_list_txt">              
                <div class="goodlist_thumb_background">
                    <a href="#"><img class="goodlist_thumb" src="${pageContext.request.contextPath}/resources/uploads/images10.jpg"></a>
                </div>
                <p4>회원정보를 수정하시려면 비밀번호를 입력하셔야 합니다.</p4><br>
                <p1>회원님의 개인정보 보호를 위한 본인 확인 절차이오니, CJ ONE 회원 로그인 시 사용하시는 비밀번호를 입력해주세요.</p1>                
            </div>
            <div class="password_input">
                <input type="password" id="pwd"name="pwd" class="text" placeholder="비밀번호를 입력해주세요.">
            </div>
            <div class="password_btn">                  
                <button type="button" class="btnLookup" id="do-search-period">취소</button>                                       
                <button type="button" class="btnLookup" id="do-search-period2">확인</button>
            </div>
</form>       
     	<input type="hidden" id="pwdCheck" value="${member.member_pw}">
        </div>        
    </div>
</div>






    <footer>
		<jsp:include page="../main/footer.jsp"/>		
	</footer>
</body>
</html>
