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
   table{margin-top:30px;}
   #hr{height:3px; background-color:#7d99a4; border:0;}
   .product_list_background{margin-top:30px;}

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
            <hr id="hr" width=100%>
            <div class="product_list_background">               
                <c:choose>
	                <c:when test="${!empty likeproductList[0].like_idx}">
		                <ul>
		                    <li class="product_list">
		                        <c:forEach var="rowNum" begin="0" end="4">
			                        <div class="prd_info">
			                            <div class="goodlist_thumb_background">
			                                <a href="${pageContext.request.contextPath}/product/product_view.do?prdNum=${likeproductList[rowNum].product_idx}"><img class="goodlist_thumb" src="${pageContext.request.contextPath}/resources/uploads/${likefileList[rowNum].saveFile}"></a>
			                            </div>
			                            <div class="prd_name">
			                                <a href="${pageContext.request.contextPath}/product/product_view.do?prdNum=${likeproductList[rowNum].product_idx}" class="goodlist">
			                                    <p class="prd_title">상품제목: ${likeproductList[rowNum].product_name}</p>
			                                </a>
			                            </div>
			                            <p class="prd_price">${likeproductList[rowNum].product_price} 원</p>
			                        </div>
			                    </c:forEach>    
		                    </li>
		                                    
		                    <!-- c:if el사용 -->
		                   <!-- <li class="nodata">좋아요 상품이 없습니다.</li> -->                       
		               </ul>
	               </c:when>
	               <c:when test="${empty likeproductList[0].like_idx}">
		               <h1>좋아요한 상품 목록이 없습니다!</h1>
		           </c:when>
		           <c:otherwise></c:otherwise>    
                </c:choose>                   	               
            </div>
            <hr width=100%>
        </div>
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
                            <table>
                                <c:forEach var="rowNum" begin="0" end="4">
                                    <tr style="cursor:pointer" onclick="location.href='${pageContext.request.contextPath}/one_inq/one_inq_list.do?=${oneinqList[rowNum].one_inq_idx}'">
                                        <td>문의번호 : ${oneinqList[rowNum].one_inq_idx}</td>
                                        <td>문의내역 : ${oneinqList[rowNum].one_inq_content}</td>                                        
                                        <td>
                                            <c:if test="${!empty oneinqList[rowNum].one_inq_idx and !empty oneinqList[rowNum].one_inq_answer}">
                                                답변완료
                                            </c:if>
                                            <c:if test="${empty oneinqList[rowNum].one_inq_answer}">
                                                답변대기
                                            </c:if>
                                        </td>
                                    </tr>
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
                        <c:when test="${!empty oneinqList[0].one_inq_idx}">
                            <table>
                                <c:forEach var="rowNum" begin="0" end="4">
                                    <tr style="cursor:pointer" onclick="location.href='${pageContext.request.contextPath}/mypage/mypage_productQnA.do?'">
                                        <td>문의번호 : ${inqproductList[rowNum].product_inq_idx}</td>
                                        <td>문의내역 : ${inqproductList[rowNum].product_inq_content}</td>                                        
                                        <td>
                                            <c:if test="${!empty inqproductList[rowNum].product_inq_idx and !empty inqproductList[rowNum].product_inq_answer}">
                                                답변완료
                                            </c:if>
                                            <c:if test="${empty inqproductList[rowNum].product_inq_answer}">
                                                답변대기
                                            </c:if>
                                        </td>
                                    </tr>
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
        </div>
    </div>
</div>

    <footer>
		<jsp:include page="../main/footer.jsp"/>		
	</footer>
</body>
</html>
