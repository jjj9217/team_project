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
<style>
*{margin: 0; padding: 0;}
    a{text-decoration: none;}
    input[type="button"], input[type="submit"], input[type="checkbox"], select, input[type="radio"], label, button{cursor: pointer;}
   	header {
		top: 0px;
		width: 100%;
		height: 165px;
		background-color: white;
	}
	
	footer {
		bottom: 0px;
		width: 100%;
		height: 250px;
		line-height: 20px;
		background-color: #eef3f5;	
	}
     body {
         width: 1020px; height: auto; margin: 0 auto;
         background-color: white;
     }

    /* 바디 CSS */

    #Container{
        overflow:hidden;
        width: 1020px; margin: 0 auto;
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
    
	#mypage a {color: #4a4a4a;}

    #mypage-conts {
        width:810px;
        height: 950px;      
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

    

   

    .buy_list_txt{
        width: 100%;
        height: 100px;
        
        line-height: 50px;

    }
    
    .span_txt{
    	margin-top:20px;
        padding-left: 20px;
        float: left;
		font: bold 20px Arial, sans-serif;
        height: 35px;
    }
    .span_txt2{
        padding-left: 20px;
        float: left;
		font: bold 13px Arial, sans-serif;
        height: 35px;
        color:gray;
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
   #hr{margin-top:10px; height:3px; background-color:#7d99a4; border:0;}
   #hr2{margin-top:30px;}
   #member_info_update{
   		width:120px;
   		height:30px;
        margin-top: 20px;
        font: bold 15px Arial, sans-serif;
       	cursor:pointer;/*마우스를 올려놓았을 때 커서가 손모양으로 변경됨*/
       	border-radius:0px;
       	border:0;
        background-color:#7d99a4;
        color: white;
   		border-radius:5px;
   }
	#password_update{
   		width:120px;
   		height:30px;
        margin-top: 20px;
        font: bold 15px Arial, sans-serif;
       	cursor:pointer;/*마우스를 올려놓았을 때 커서가 손모양으로 변경됨*/
       	border-radius:0px;
       	border:0;
        background-color:rgb(221, 219, 214);
        color: black;
   		border-radius:5px;
   }

</style>
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
            <p class="buy_list_txt">    
                <span class="span_txt">회원 정보 및 비밀번호는 크루얼티프리 사이트를 통해 수정 가능합니다.</span><br>               
                <span class="span_txt2">새로운 정보를 입력하여 개인정보를 최신 상태로 유지하세요.</span>                      
                <button type="button" id="member_info_update" onClick="location.href='mypage_modify_info.do'">회원정보 수정</button>
                <button type="button" id="password_update" onClick="location.href='mypage_modify_password.do'">비밀번호 수정</button>                
            </p>
        </div>
        <hr id="hr2" width=100%;>
        
        
		<!-- 수정 성공 메시지 -->
		<c:if test="${not empty msgOk}">
		    <script>
		        alert("${msgOk}");
		    </script>
		</c:if>
		
		<!-- 수정 실패 메시지 -->
		<c:if test="${not empty msgFail}">
		    <script>
		        alert("${msgFail}");
		    </script>
		</c:if>
        
        
        



        
        
    </div>
</div>

    <footer>
		<jsp:include page="../main/footer.jsp"/>		
	</footer>
</body>
</html>
