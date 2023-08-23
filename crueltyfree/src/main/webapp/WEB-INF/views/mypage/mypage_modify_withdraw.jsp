<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List, java.util.HashMap, java.util.Map" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
        
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보 수정 | CrueltyFree</title>
<link rel="icon" href="${pageContext.request.contextPath}/resources/img/favicon1.png">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
$(function(){
	$("#withdraw_btn").click(function(){
		let confirmAns = confirm("정말 탈퇴하시겠습니까?");
		
	        if(confirmAns){
	        	alert('탈퇴가 완료되었습니다.')
	        	$("#withdraw_frm").submit();	            	           
	        }else{      
	        return false;}	        			
    });
});
</script>
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
     
        #Container_ori{
        overflow:hidden;
        
        width: 1020px; margin: 0 auto;
        height: 700px;
    }
    
    #mypage {
    	margin-top: 30px;
        font-family:'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif;
       	font-size: 15px;
        width: 199px;
        height: 500px;
        float: left;
    }
    #mypage th {
    	height: 50px;
    	vertical-align: super;
    	color: #000000;
    }
    
    #mypage td {
    	height: 25px;
    }

    #mypage-conts {
        width:810px;
        height:auto; 
        float:left;
    }

    #mylink{
        color: #000000;
        font-size: 25px;
        text-decoration: none;
        letter-spacing: -2px;
    }

    .mypagetable {
    	height: 50px;
        font-size: 18px;
        font-family:'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif;
        font-weight: bold;      
        color: #7d99a4;
    }

    #blank{
        width: 100%;
        height: 35px;
    }

    
    #tit_area{
        height: auto;
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

    

    





    
    
   /*  ul li{      
        list-style:none;
    
    } */   


    
    .span_txt{
        padding-left: 20px;
        float: left;
        font-size: 12px;
        height: 35px;
    }

   
    

    
    #reset_btn{
        border-color:white;
        background-color:rgb(221, 219, 214);
    }
    
    
        
    
    
    #container{
        margin-top:20px;
        padding-left: 20px;
    }
    
    .tit_sub{color: #4a4a4a; margin-top:10px;}
    #hr{margin-top:10px; height:3px; background-color:#7d99a4; border:0;}
    .hoverClass{color: #4a4a4a;}
    .hoverClass:hover{color: #7d99a4;} 
    
    
    #withdraw_btn{
        width: 154px;
        height: 40px;
        border: 1px solid #7d99a4;
        color: #fff;
        background-color: #7d99a4;
        font-weight: bold;  
        border-radius: 5px;  
    }
    
    
    #withdraw{
	    display: flex;
	    justify-content: center;
	    align-items: center;
    }
    
    #withdrawtext{
        margin-top:15px;
        font-size:22px;
        display: flex;
        justify-content: center;
        align-items: center;
    }
    
    #withdraw_frm{
        maring-top:15px;
    }
    
    #container ul li{
        padding-bottom:5px;
    }
    
    li::marker{
        color: #7d99a4;
    }
    
    #withdrawfieldset{
        border:3px solid #7d99a4;
	    padding-block-start: 1em;
	    padding-inline-start: 3em;
	    padding-inline-end: 1em;
	    padding-block-end: 1em;    
    }
    
    #hr2{margin-top:15px; height:2px; background-color:#7d99a4; border:0;}
    
</style>
</head>

<body>
	<header>	
		<jsp:include page="../main/header.jsp"/>	
	</header>

<!-- body시작 -->

<div id="Container_ori">
    <div id="mypage">       
        <table>
            <tr><th><h3><a class="hoverClass" href="${pageContext.request.contextPath}/mypage/mypage_main.do" id="mylink">마이페이지</a></h3></th></tr>         
            <tr><td class="mypagetable">마이 쇼핑</td></tr>
            <tr><td><a class="hoverClass" href="${pageContext.request.contextPath}/mypage/mypage_orderinq.do">주문/배송조회</a></td></tr>
            <tr><td><a class="hoverClass" href="${pageContext.request.contextPath}/mypage/mypage_cancelinq.do">취소/반품내역</a></td></tr>
            <tr><td><hr width=100%></td></tr>
            <tr><td><a class="hoverClass" href="${pageContext.request.contextPath}/purchase/basket.do">장바구니</a></td></tr>
            <tr><td><a class="hoverClass" href="${pageContext.request.contextPath}/mypage/mypage_like.do">좋아요</a></td></tr>
            <tr><td><a class="hoverClass" href="${pageContext.request.contextPath}/mypage/mypage_coupon.do">쿠폰</a></td></tr>
            <tr><td><hr width=100%></td></tr>
            <tr><td class="mypagetable">마이활동</td></tr>
            <tr><td><a class="hoverClass" href="${pageContext.request.contextPath}/one_inq/one_inq_list.do">1:1문의내역</a></td></tr>
            <tr><td><a class="hoverClass" href="${pageContext.request.contextPath}/mypage/mypage_nonreview.do">리뷰</a></td></tr>
            <tr><td><a class="hoverClass" href="${pageContext.request.contextPath}/mypage/mypage_productQnA.do">상품문의내역</a></td></tr>
            <tr><td><hr width=100%></td></tr>
            <tr><td class="mypagetable">마이 정보</td></tr>
            <tr><td><a class="hoverClass" href="${pageContext.request.contextPath}/mypage/mypage_modifymain.do" style="font-weight:bold; color:#7d99a4;">회원정보 수정</a></td></tr>
            <tr><td><a class="hoverClass" href="${pageContext.request.contextPath}/mypage/mypage_deliverymain.do">배송지</a></td></tr>
        </table>         
    </div>
    
    <div id="mypage-conts">
        <div id="blank">            
        </div>
        <div class="tit_area">          
            <h2 class="tit">회원탈퇴 수정</h2>
            <hr id="hr" width=100%;>            
			<h4 class="tit tit_sub">회원 탈퇴(이용약관 동의 철회)시 아래 내용을 확인해주세요.</h4>
    <div id="container">
            <fieldset id = withdrawfieldset>
            <ul style="list-style-type: disc;">
                <li>
                CureltyFree 이용약관 동의 철회 시 고객님께서 보유하셨던 쿠폰은 모두 삭제되며, 재가입 시 복원이 불가능합니다.
                </li>
                <li>
                CureltyFree 이용약관 동의 철회 시에는 CureltyFree 서비스를 이용할 수 없게 됩니다.
                </li>
                <li>
                CureltyFree 이용약관 동의 철회 시에도 회원님의 개인정보 및 거래정보는 개인정보보호법에 의거해 약 3년간 보존됩니다.
                </li>
                <li>
                CureltyFree 이용약관 동의를 철회한 후에라도 해당 약관에 다시 동의하시면 서비스를 이용할 수 있습니다.
                </li>
                <li>
                진행 중인 전자상거래 이용내역(결제/배송/교환/반품 중인 상태)이 있거나 고객상담 및 이용하신 서비스가 완료되지 않은 경우 서비스 철회 하실 수 없습니다.
                </li>                                
            </ul>
            </fieldset>
            <div id="withdrawtext">
            CureltyFree 회원 탈퇴(이용약관 동의 철회)를 하시겠습니까?
            </div>        
            <hr id="hr2" width=100%;>
        <form action="withdraw_process.do" method="post" id="withdraw_frm" style="margin-top:20px;">
               <div id=withdraw>
               <input type="button" id="withdraw_btn" value="탈퇴하기">
               <input type="hidden" name="member_idx" value="${member.member_idx}">
               </div> 
        </form>        
    </div>
            
            
            
            
            
            
            
            
            
            
            
            
            
            




            
            
                    
            
        </div>
    </div>
</div>







    <footer>
		<jsp:include page="../main/footer.jsp"/>		
	</footer>
</body>
</html>
