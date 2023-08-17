<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List, java.util.HashMap, java.util.Map" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
        
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지 | CrueltyFree</title>
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
    
    #mypage {
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
        height: 1000px;;      
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

    .tit_area {
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

    .tit_area .btnMore{
    position: absolute;
    top: 5px;
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
	.mypage-step li{background-color: #eef3f5;}
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
    .likenodata{text-align: center; padding: 60px 0; color: #4a4a4a; font-weight: bold;}

    li.nodata{
        width:100%;
        height: 100%;
        line-height: 175px;
        font-weight: bold;
        color: #4a4a4a;
    }
    
    ul{
        list-style:none;
   }
    
   .list-customer{
        width:380px;
        height:181px;
    
   }
    
    .product_list_background{
        width: 810px;
        height: 301px;
    }

    .product_list {
        width: 180px;
        height: 300px;
    
        display: flex;
        justify-content: center;
        align-items: center;
        margin: 0 auto;
    }
    
    .prd_info{
        width: 180px;
        height: 290px;
    
    }

   .prd_price{
        width: 180px;
        height: 25px;
        text-align: center;
		font: bold 14px Arial, sans-serif;
        line-height: 25px;
   }
   .prd_price1{color:#7d99a4;}

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
        line-height: 55px;
		font: bold 17px Arial, sans-serif;
		color:#000000;
   }
	.inq_title{
        line-height: 55px;
		font: bold 17px Arial, sans-serif;
		color:#000000;
		width:280px;
	  	height: auto;
  		overflow: hidden;
  		text-overflow: ellipsis;
  		white-space:nowrap;
	}   
   .goodlist_thumb_background{
        width: 180px;
        height: 180px;
    
   }
   
   .goodlist_thumb{
        width: 180px;
        height: 180px;
   }
   table{margin-top:30px;}
   #hr{height:3px; background-color:#7d99a4; border:0;}
   .product_list_background{margin-top:30px;}
   .state{		
   		background-color:#7d99a4; 
		color:white; 
		border:0; 
		border-radius:3px; 
		width:90px; 
		height:27px; 
		text-align:center;
		float:right;
		font: bold 18px Arial, Sans-serif;
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
            <th><h3><a href="${pageContext.request.contextPath}/mypage/mypage_main.do" id="mylink">마이페이지</a></h3></th>         
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
            <tr><td>
<%--             <form name="caa" action="${pageContext.request.contextPath}/mypage/mypage_nonreview.do" method="get">
                        <input type="hidden" name="member_idx" value="1">
                    </form>
                    <a href="#" onclick="document.forms['caa'].submit();">리뷰</a></td></tr> --%>
                    <a href="${pageContext.request.contextPath}/mypage/mypage_nonreview.do">리뷰</a>
                    
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
            <h2 class="tit">주문/배송조회<em>(최근 1개월)</em></h2>
           <a class="btnMore" id="orderListMore" href="${pageContext.request.contextPath}/mypage/mypage_orderinq.do">더보기〉</a>
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
            <a class="btnMore" id="wishListMore" href="${pageContext.request.contextPath}/mypage/mypage_like.do">더보기〉</a>      
        </div>
            <hr id="hr" width=100%>
            <div class="product_list_background">               
                <c:choose>
	                <c:when test="${!empty likeproductList[0].like_idx}">
		                <div class="like_list">
		                  <ul>
		                    <li class="product_list">
		                        <c:forEach var="rowNum" begin="0" end="3">
		                          <c:if test="${!empty likeproductList[rowNum].like_idx}">
			                        <div class="prd_info">
			                            <div class="goodlist_thumb_background">
			                                <a href="${pageContext.request.contextPath}/product/product_view.do?prdNum=${likeproductList[rowNum].product_idx}"><img class="goodlist_thumb" src="${pageContext.request.contextPath}/resources/uploads/${likefileList[rowNum].saveFile}"></a>
			                            </div>
			                            <div class="prd_name">
			                                <a href="${pageContext.request.contextPath}/product/product_view.do?prdNum=${likeproductList[rowNum].product_idx}" class="goodlist">
			                                    <p class="prd_title">${likeproductList[rowNum].product_name}</p>
			                                </a>
			                            </div>
			                       		 <fmt:formatNumber value="${likeproductList[rowNum].product_price}" type="number" var="formatNumber"/>						
						                 <p class="prd_price"><span class="prd_price1">${formatNumber}</span><span class="prd_price2">원</span></p>
			                       
			                        </div>
			                      </c:if> 
			                    </c:forEach>    
		                    </li>
		                                    
		                    <!-- c:if el사용 -->
		                   <!-- <li class="nodata">좋아요 상품이 없습니다.</li> -->                       
		               </ul>
		              </div>
	               </c:when>
	               <c:when test="${empty likeproductList[0].like_idx}">
		               <p class="likenodata">좋아요한 상품 목록이 없습니다.</p>
		           </c:when>
		           <c:otherwise></c:otherwise>    
                </c:choose>                   	               
            </div>
            <hr width=100%>
        <div class="area-over">
            <div class="left">
                <div class="tit_area">
                    <h2 class="tit">1:1문의내역</h2>
                    <a class="btnMore" id="wishListMore" href="${pageContext.request.contextPath}/one_inq/one_inq_list.do">더보기〉</a>
                    <hr id="hr" width=100%>
                </div>
                <div class="list-customer">
                    <c:choose>
                        <c:when test="${!empty oneinqList[0].one_inq_idx}">
                            <table style="width:380px; margin-top:5px;">
                                <c:forEach var="rowNum" begin="0" end="4">
                                    <c:if test="${!empty oneinqList[rowNum].one_inq_idx}">
                                    <tr style="cursor:pointer;" onclick="location.href='${pageContext.request.contextPath}/one_inq/one_inq_list.do?=${oneinqList[rowNum].one_inq_idx}'">
                                        <td><p class="inq_title">${oneinqList[rowNum].one_inq_content}</p></td>                                        
                                        <td >
                                            <c:if test="${!empty oneinqList[rowNum].one_inq_idx and !empty oneinqList[rowNum].one_inq_answer}">
                                                <p class="state">답변완료</p>
                                            </c:if>
                                            <c:if test="${empty oneinqList[rowNum].one_inq_answer}">
                                                <p class="state">답변대기</p>
                                            </c:if>
                                        </td>
                                    </tr>
                                    </c:if>
                                </c:forEach>    
                            </table>
                        </c:when>
                        <c:when test="${empty oneinqList[0].one_inq_idx}">
                            <ul class="nodata_ul">                        
		                        <li class="nodata">최근 1개월간 문의하신 내용이 없습니다.</li>                                              
		                    </ul>
                        </c:when>
                        <c:otherwise></c:otherwise>
                    </c:choose>                    
                </div>
            </div>
            <div class="right">
                <div class="tit_area">
                    <h2 class="tit">상품QnA내역</h2>
                    <a class="btnMore" id="wishListMore" href="${pageContext.request.contextPath}/mypage/mypage_productQnA.do">더보기〉</a>
                    <hr id="hr" width=100%>     
                </div>
                <div class="list-customer">
                    <c:choose>
                        <c:when test="${!empty inqproductList[0].product_inq_idx}">
                            <table style="width:380px; margin-top:5px;">
                                <c:forEach var="rowNum" begin="0" end="4">
                                    <c:if test="${!empty inqproductList[rowNum].product_inq_idx}">
                                    <tr style="cursor:pointer;" onclick="location.href='${pageContext.request.contextPath}/mypage/mypage_productQnA.do?'">
                                        <td><p class="inq_title">${inqproductList[rowNum].product_inq_content}</p></td>                                        
                                        <td>
                                            <c:if test="${!empty inqproductList[rowNum].product_inq_idx and !empty inqproductList[rowNum].product_inq_answer}">
                                                <p class="state">답변완료</p>
                                            </c:if>
                                            <c:if test="${empty inqproductList[rowNum].product_inq_answer}">
                                                <p class="state">답변대기</p>
                                            </c:if>
                                        </td>
                                    </tr>
                                    </c:if>
                                </c:forEach>    
                            </table>
                        </c:when>
                        <c:when test="${empty inqproductList[0].product_inq_idx}">
                            <ul class="nodata_ul">                        
                                <li class="nodata">최근 1개월간 문의하신 내용이 없습니다.</li>                                              
                            </ul>
                        </c:when>
                        <c:otherwise></c:otherwise>
                    </c:choose>
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
