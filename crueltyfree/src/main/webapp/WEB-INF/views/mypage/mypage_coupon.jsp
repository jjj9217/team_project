<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List, java.util.HashMap, java.util.Map" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
        
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쿠폰 | CrueltyFree</title>
<link rel="icon" href="${pageContext.request.contextPath}/resources/img/favicon.png">
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
        height: auto;      
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

	
	
	.coupon_border {
		width: 122px;
		height: 58px;
		background-color: #7d99a4;
		border-radius: 15px;
		margin-left: 20px;
		padding-top: 3px;
	}
	
	.coupon_inside {
		width: 100px;
		height: 44px;
		background-color: #ffffff;
		border-radius: 12px;
		margin-left: 3px;
		padding-top: 10px;
	}
	
	.coupon_inside a {
		font-size: 20px;
		font-weight: bold;
		color: #000000;
	}

   

    .buy_list{
        width: 100%;
        height: 150px;
        text-align: center;
        margin-top:30px;
        border-bottom: 1px solid #a4a4a4;
    }
    
	.buy_list td {
        font-size: 14px;
    }


     .paging{
        width: 820px;
        height:150px;
        float:left;
        display: flex;
        justify-content: center;
        align-items: center;
    }

    #td_paging{
        height: 70px;
        font: 20px Arial, Sans-serif;
        text-align: center;
        border-color: white;
    }
    .buy_list_container{display: block; width: 790px; height: auto; margin: 0 auto; padding: 10px; margin-top: 50px;}
    .buy_list, .order_list{border-collapse: collapse;}
    .th_discount{height: 20px; padding: 10px 0; background-color: rgb(224, 224, 224);}
    .th_coupon{height: 20px; padding: 10px 0; background-color: rgb(224, 224, 224);}
    .th_couponcondition{height: 20px; padding: 10px 0; background-color: rgb(224, 224, 224);}
    .th_day{height: 20px; padding: 10px 0; background-color: rgb(224, 224, 224);}
	.td_discount{height: auto; padding: 30px 5px; text-align: center; font-size:14px; font-weight: bold;}
    .td_coupon{height: auto; padding: 30px 5px; text-align: center; border-left: 1px solid #a4a4a4; font-size:14px;}
    .td_couponcondition{height: auto; padding: 30px 5px; text-align: center; border-left: 1px solid #a4a4a4; font-size:14px;}
    .td_day{height: auto; padding: 30px 5px; text-align: center; border-left: 1px solid #a4a4a4; font-size:14px;}
    .top{border-top: 2px solid #4a4a4a}
    .bottom{border-bottom: 1px solid #a4a4a4}    
	#no_coupon{text-align: center; padding: 60px 0; color: #4a4a4a; font-weight: bold;}
	.hoverClass{color: #4a4a4a;}
    .hoverClass:hover{color: #7d99a4;}
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
            <tr><th><h3><a class="hoverClass"  href="${pageContext.request.contextPath}/mypage/mypage_main.do" id="mylink">마이페이지</a></h3></th></tr>         
            <tr><td class="mypagetable">마이 쇼핑</td></tr>
            <tr><td><a class="hoverClass"  href="${pageContext.request.contextPath}/mypage/mypage_orderinq.do">주문/배송조회</a></td></tr>
            <tr><td><a class="hoverClass"  href="${pageContext.request.contextPath}/mypage/mypage_cancelinq.do">취소/반품내역</a></td></tr>
            <tr><td><hr width=100%></td></tr>
            <tr><td><a class="hoverClass"  href="${pageContext.request.contextPath}/purchase/basket.do">장바구니</a></td></tr>
            <tr><td><a class="hoverClass"  href="${pageContext.request.contextPath}/mypage/mypage_like.do">좋아요</a></td></tr>
            <tr><td><a class="hoverClass"  href="${pageContext.request.contextPath}/mypage/mypage_coupon.do" style="font-weight:bold; color:#7d99a4;">쿠폰</a></td></tr>
            <tr><td><hr width=100%></td></tr>
            <tr><td class="mypagetable">마이활동</td></tr>
            <tr><td><a class="hoverClass"  href="${pageContext.request.contextPath}/one_inq/one_inq_list.do">1:1문의내역</a></td></tr>
            <tr><td><a class="hoverClass"  href="${pageContext.request.contextPath}/mypage/mypage_nonreview.do">리뷰</a></td></tr>
            <tr><td><a class="hoverClass"  href="${pageContext.request.contextPath}/mypage/mypage_productQnA.do">상품문의내역</a></td></tr>
            <tr><td><hr width=100%></td></tr>
            <tr><td class="mypagetable">마이 정보</td></tr>
            <tr><td><a class="hoverClass"  href="${pageContext.request.contextPath}/mypage/mypage_modifymain.do">회원정보 수정</a></td></tr>
            <tr><td><a class="hoverClass"  href="${pageContext.request.contextPath}/mypage/mypage_deliverymain.do">배송지</a></td></tr>
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
                <col style="width: 20%;">
                <col style="width: 45%;">
                <col style="width: 15%;">
                <col style="width: 20%;">
            </colgroup>     
            <thead>
                <tr>
                    <th class="th_discount top bottom" scope="col">할인율</th>
                    <th class="th_coupon top bottom" scope="col">쿠폰명</th>
                    <th class="th_couponcondition top bottom" scope="col">쿠폰사용조건</th>
                    <th class="th_day top bottom" scope="col">사용기간</th>
                </tr>
            </thead>
            <tbody>
            <c:forEach var="rowNum" begin="${pageNav.startNum}" end="${pageNav.endNum}">
            <c:choose>
                <c:when test="${!empty couponList[rowNum-1].coupon_idx}">
					<tr>
	                    <td>
	                    	<div class="coupon_border">
	                    		<div class="coupon_inside">
	                    			<a>
	                    				<fmt:formatNumber value="${couponList[rowNum-1].coupon_discount}" type="percent"/>
	                    			</a>
	                    		</div>
	                    	</div>
	                    </td>
	                    <td>${couponList[rowNum-1].coupon_name}</td>
	                    <td style="color: #4a4a4a;">
	                    	<fmt:formatNumber value="${couponList[rowNum-1].coupon_limit}" pattern="###,###" />원 이상</td>
	                    <td style="color: #4a4a4a;">
	                    	<fmt:formatDate value="${couponList[rowNum-1].coupon_expDate}" type="date" pattern="yyyy.MM.dd" />까지
	                    </td>
	                </tr>
                </c:when>                
                <c:otherwise>
                </c:otherwise>                
            </c:choose>                           
            </c:forEach>
                <c:if test="${empty couponList[0].coupon_idx}">
                    <tr><td id="no_coupon" colspan="4">쿠폰이 없습니다.</td></tr>
                </c:if>           
            </tbody>


        </table>

        <!--페이징처리 -->
        <div class="paging">
            <table>
                <tr>
                    <td id="td_paging" colspan="6">
                    
                        <c:if test="${pageNav.pageNum > pageNav.pages_per_block}">
                            <a href="mypage_coupon.do?pageNum=1&pageBlock=1"><input type="button" id="end" value="처음"></a>&nbsp;
                            <a href="mypage_coupon.do?pageNum=${(pageNav.pageBlock - 2)*pageNav.pages_per_block + 1}&pageBlock=${pageNav.pageBlock-1}">
                                <input type="button" id="next" value="이전">
                            </a>    
                        </c:if>                     
                        <c:forEach var="i" begin="${(pageNav.pageBlock-1)*pageNav.pages_per_block + 1}" end="${pageNav.pageBlock*pageNav.pages_per_block}">
                            <c:if test="${i le pageNav.totalPageNum}">
                                <c:choose>
                                    <c:when test = "${pageNav.pageNum eq i}">
                                        <a href="mypage_coupon.do?pageNum=${i}&pageBlock=${pageNav.pageBlock}">
                                            <span style="color:#7d99a4">${i}&nbsp;</span>
                                        </a>
                                    </c:when>
                                    <c:otherwise>
                                        <a href="mypage_coupon.do?pageNum=${i}&pageBlock=${pageNav.pageBlock}">${i}&nbsp;</a>
                                    </c:otherwise>
                            </c:choose>
                            </c:if>
                        </c:forEach>                    
                        <c:if test="${((pageNav.rows_per_page*pageNav.pages_per_block) lt pageNav.totalRows) and (pageNav.pageBlock ne pageNav.lastPageBlock) }">
                            <a href="mypage_coupon.do?pageNum=${pageNav.pageBlock*pageNav.pages_per_block+1}&pageBlock=${pageNav.pageBlock+1}"><input type="button" id="next" value="다음"></a>&nbsp;
                            <a href="mypage_coupon.do?pageNum=${pageNav.totalPageNum}&pageBlock=${pageNav.lastPageBlock}"><input type="button" id="end" value="마지막"></a>
                        </c:if>                                                          
                    </td>
                </tr>
            </table>
        </div>

        
        
    </div>
</div>

    <footer>
		<jsp:include page="../main/footer.jsp"/>		
	</footer>
</body>
</html>
