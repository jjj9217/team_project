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

    

    



    .detailSearch{
        width: 1020px;
        height: 170px;
        
    }

    .serach_category_big{
        width: 1020px;
        height: 55px;
        
    }

    .serach_category_small{
        width: 1020px;
        height: 55px;
        
    }

    .saerch_price{
        width: 1020px;
        height: 55px;
        
    }
    
    .inner{
        width: 1020px;
        height: 54px;
        
    }

    .tit_classification{
        float:left;
        width: 150px;
        height: 54px;
    
    }

    .tit_classification2{
        margin: 0;
        width: 150px;
        height: 37px;
        padding-left: 20px;
        padding-top: 17px;

    }

    .classification{
        width: 18px;
        height: 18px;   
    }   

    .list_classification{
        float: left;
        width: 865px;
        height: 26px;
    
        padding-inline-start: 0px;
        margin: 0;  
        padding-top: 14px;  
        padding-bottom: 14px;   
    }
    
    .list_classification li{
        width: 155px;
        height: 27px;
        padding-left: 15px;
    }

    ul li{      
        list-style:none;
        float: left;
    }   


    

    .buy_list{
        width: 100%;
        height:340px;
    
        text-align: center;
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
            <th><h3><a href="#" id="mylink">마이페이지</a></h3></th>         
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
            <h2 class="tit">쿠폰</h2>
        </div>
        
        

        
        
        <table class="buy_list">
            <colgroup>
                <col style="width: 25%;">
                <col style="width: 45%;">
                <col style="width: 15%;">
                <col style="width: 15%;">
            </colgroup>     
            <thead>
                <hr width=100%>
                <tr>
                    <th scope="col">할인율</th>
                    <th scope="col">쿠폰명</th>
                    <th scope="col">쿠폰사용조건</th>
                    <th scope="col">사용기간</th>
                </tr>
            </thead>
            <tbody>            
            <c:forEach var="rowNum" begin="${pageNav.startNum}" end="${pageNav.endNum}">
            <c:choose>
                <c:when test="${!empty couponList[rowNum-1].coupon_idx}">
                                    <tr>
                    <td>${couponList[rowNum-1].coupon_discount} %</td>
                    <td>${untitled}쿠폰명</td>
                    <td>${couponList[rowNum-1].coupon_limit} 원 이상</td>
                    <td>${couponList[rowNum-1].coupon_expDate} 까지</td>
                </tr>
                </c:when>                
                <c:otherwise>
                </c:otherwise>                
            </c:choose>                           
            </c:forEach>
                <c:if test="${empty couponList[0].coupon_idx}">
                    <tr><td>쿠폰이 없습니다.</td></tr>
                </c:if>           
            </tbody>


        </table>



        
        
    </div>
</div>

    <footer>
		<jsp:include page="../main/footer.jsp"/>		
	</footer>
</body>
</html>