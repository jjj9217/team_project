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

    .tit_area{
        overflow: hidden;
        margin-top: 30px;
        position: relative;
        width: 100%;
        font-size: 0;
        line-height: 0;
        
    }

    .tit_area .tit{
        float: left;
        color: #333;
        font-size: 20px;
        line-height: 30px;
    }

    .tit_area .tit em{
        display: inline-block;
        margin-left: 5px;
        padding: 0;
        font-style: normal;
        font-size: 12px;
        line-height: 18px;
        vertical-align: 0;
    }

    .tit_area .btnMore {
    position: absolute;
    top: 25px;
    right: 0;
    padding: 0 15px 0 0;
    
    font-size: 14px;
    line-height: 20px;
    color:black;
    text-decoration: none;
    }

    .mypage-step {
    overflow: hidden;
    width: 100%;
    height: 120px;  /* 없애면됨*/
    padding-inline-start: 0px;
    border-radius: 10px;

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

    .mypage-step li {

    float: left;
    position: relative;
    width: 20%;
    height: 117px;
   
    font-size: 0;
    line-height: 0;
    
    }

    .mypage-step li span {
    top: 70px;
    color: #666;
    font-size: 16px;
    line-height: 22px;
    }

    .area-over {
    overflow: hidden;
    position: relative;
    width: 100%;
    
    }

    .area-over .left {
    float: left;
    }

    .area-over .right {
    float: right;
    }

    .area-over .left, .area-over .right {
    width: 380px;
    }

    ul.nodata_ul{       
        text-align: center;     
        padding-inline-start: 0px;
    }

    li.nodata{
        width:100%;
        height: 100%;
    
        line-height: 175px;
    }
    
    ul{
        list-style:none;
   }
    
   .list-customer{
        width:380px;
        height:181px;
    
   }
    
    .product_list_background{
        width: 850px;
        height: 301px;
    
    }

    .product_list{
        width: 198px;
        height: 301px;
    
        display: flex;
        justify-content: center;
        align-items: center;
    }
    .prd_info{
        width: 180px;
        height: 290px;
    
    }

   .prd_price{
        width: 180px;
        height: 25px;
    
        text-align: center;
        font-size: 14px;
        line-height: 25px;
   }

   .font_price{
        text-align: center;
        font-size: 14px;
        
   }

   .prd_name{
        width: 180px;
        height: 55px;
    
   }

   .prd_title{      
        text-align: center;
        font-size: 14px;
        line-height: 55px;
   }
   
   .goodlist_thumb_background{
        width: 180px;
        height: 180px;
        
    
   }
   
   .goodlist_thumb{
        width: 180px;
        height: 180px;
        
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
            <tr><td>
            <form name="caa" action="${pageContext.request.contextPath}/mypage/mypage_nonreview.do" method="get">
                        <input type="hidden" name="member_idx" value="1">
                    </form>
                    <a href="#" onclick="document.forms['caa'].submit();">리뷰</a></td></tr>
                    
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
            <h2 class="tit">주문/배송조회<em>(최근 1개월)</em></h2>
            <a class="btnMore" id="orderListMore" href="#">더보기〉</a>
        </div>
        <a class="order_view" href="#">
            <ul class="mypage-step">
                <li><em>0$</em>
                <span>주문접수</span>
                </li>
                <li><em>0$</em>
                <span>결제완료</span>
                </li>
                <li><em>0$</em>
                <span>배송준비중</span>
                </li>
                <li><em>0$</em>
                <span>배송중</span>
                </li>
                <li><em>0$</em>
                <span>배송완료</span>
                </li>
            </ul>
        </a>
        <div class="tit_area">
            <h2 class="tit">좋아요</h2>
            <a class="btnMore" id="wishListMore" href="#">더보기〉</a>      
            <hr width=100%>
            <div class="product_list_background">               
                <ul>
                    <li class="product_list">
                        <div class="prd_info">
                            <div class="goodlist_thumb_background">
                                <a href="#"><img class="goodlist_thumb" src="images.jpg"></a>
                            </div>
                            <div class="prd_name">
                                <a href="#" class="goodlist">
                                    <p class="prd_title">${untitled}상품제목</p>
                                </a>
                            </div>
                            <p class="prd_price">${untitled}원</p>
                        </div>
                    </li>
                    <!-- c:if el사용 -->
                   <!-- <li class="nodata">좋아요 상품이 없습니다.</li> -->                       
               </ul>
               <ul>
                    <li class="product_list">
                        <div class="prd_info">
                            <div class="goodlist_thumb_background">
                                <a href="#"><img class="goodlist_thumb" src="images.jpg"></a>
                            </div>
                            <div class="prd_name">
                                <a href="#" class="goodlist">
                                    <p class="prd_title">${untitled}상품제목</p>
                                </a>
                            </div>
                            <p class="prd_price">${untitled}원</p>
                        </div>
                    </li>
                    <!-- c:if el사용 -->
                   <!-- <li class="nodata">좋아요 상품이 없습니다.</li> -->                       
               </ul>
            </div>
            <hr width=100%>
        </div>
        <div class="area-over">
            <div class="left">
                <div class="tit_area">
                    <h2 class="tit">1:1문의내역</h2>
                    <a class="btnMore" id="wishListMore" href="#">더보기〉</a>
                    <hr width=100%>
                </div>
                <div class="list-customer">
                    <ul class="nodata_ul">
                        <!--
                        <c:choose>
                            <c:when test="el{empty untitled}">
                                     최근1개월간 없다
                            </c:when>
                            <c:otherwise>                                   
                                <c:choose>
                                    <c:when test="el{untitled ne null}">1:1답변대기</c:when>
                                    <c:otherwise>1:1답변완료</c:otherwise>
                                </c:choose>
                                    el{untitled}
                                    <c:if test="el{untitled ne null }">el{1:1문의등록일}</c:if>                                                
                            </c:otherwise>
                        </c:choose>
                        -->
                        <li class="nodata">최근 1개월만 문의하신 내용이 없습니다.</li>                                              
                    </ul>
                </div>
            </div>
            <div class="right">
                <div class="tit_area">
                    <h2 class="tit">상품QnA내역</h2>
                    <a class="btnMore" id="wishListMore" href="#">더보기〉</a>
                    <hr width=100%>     
                </div>
                <div class="list-customer">
                    <ul class="nodata_ul">
                        <!-- c:if el{}사용 -->
                        <li class="nodata">최근 1개월만 문의하신 내용이 없습니다.</li>                      
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>

    <footer>
		<jsp:include page="../main/footer.jsp"/>		
	</footer>
</body>
</html>
