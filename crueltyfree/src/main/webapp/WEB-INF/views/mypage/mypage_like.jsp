<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List, java.util.HashMap, java.util.Map" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
        
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>좋아요내역 | CrueltyFree</title>
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
    
	#mypage a {color: #4a4a4a;}

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




    

    .buy_list{
        width: 100%;
        height:340px;
        text-align: center;
    }

    .buy_list_txt{
        width: 100%;
        height: 40px;
        
        line-height: 40px;

    }

    .span_txt{
        padding-left: 20px;
        float: left;
    	font: bold 15px Arial, sans-serif;
    	margin-top:30px;
    }

    #all_del{
        float: right;
        margin-top: 10px;
		background-color:#7d99a4;
		color:white;
		border:0;
		cursor:pointer;
		font: bold 17px Arial, sans-serif;
		border-radius:3px;
        width:100px;
        height:30px;
    }

    .goodlist_thumb{
        width:150px;
        height:150px;    
    }
    .goodlist{color:black;}
    .buy_list_container{display: block; width: 790px; height: auto; margin: 0 auto; padding: 10px; margin-top: 50px;}
    .buy_list, .order_list{border-collapse: collapse;}
    .th_product{width: 135px; height: 20px; padding: 10px 0; background-color: rgb(224, 224, 224);}
    .th_price{width: 380px; height: 20px; padding: 10px 0; background-color: rgb(224, 224, 224);}
    .th_admin{width: 65px; height: 20px; padding: 10px 0; background-color: rgb(224, 224, 224);}
	.td_product{width: 125px; height: auto; padding: 30px 5px; text-align: center; font-size:14px; font-weight: bold;}
    .td_price{width: 370px; height: auto; padding: 30px 5px; text-align: center; border-left: 1px solid #a4a4a4; font-size:14px;}
    .td_admin{width: 45px; height: auto; padding: 30px 5px; text-align: center; border-left: 1px solid #a4a4a4; font-size:14px;}
    .top{border-top: 2px solid #4a4a4a}
    .bottom{border-bottom: 1px solid #a4a4a4}
    .buy_list td{border-bottom: 1px solid gray; padding: 10px 0;}    
	#font{font: bold 13px Arial, sans-serif;}    
	#font2{font: bold 15px Arial, sans-serif; color:#7d99a4;}
	#font3{font: bold 15px Arial, sans-serif;} 
    #td_cancel{
        width: 100px;
        height: 30px;
        border-radius: 5px;
        border: 1px solid #7d99a4;
        background-color: #fff;
        color:  #7d99a4;
        font-weight: bold;
        margin-right: 20px; 
    }
     #td_basket{
    	width: 100px;
        height: 30px;
        border-radius: 5px;
        border: 1px solid #7d99a4;
        background-color: #7d99a4;
        color:  #fff;
        font-weight: bold;
 		float:left;
    }    
    
    
     .paging{
        width:820px;
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
    #no_coupon{border-bottom:0px;text-align: center; padding: 60px 0; color: #4a4a4a; font-weight: bold;}
</style>
</head>
<script>
function deletelikelist(like_idx) {
    
    var confirmAns = confirm("정말로 삭제하겠습니까?");
    
    if (confirmAns) {
        alert('삭제하였습니다');
        frm_view.method = "post"; // 전송 방식 
        frm_view.action = "delete_process_like.do?no="+like_idx; // 전송 경로
        frm_view.submit(); // 폼값 전송
        
    }
    
}



function deletelikelistall() {
    
    var confirmAns = confirm("정말로 삭제하겠습니까?");
    
    if (confirmAns) {
        alert('삭제하였습니다.');
        
        frm_view2.method = "get"; // 전송 방식 
        frm_view2.action = "delete_process_likeall.do?" // 전송 경로
        frm_view2.submit(); // 폼값 전송
          
        
    }
    
}


</script>

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
            <tr><td><a href="${pageContext.request.contextPath}/mypage/mypage_like.do" style="font-weight:bold; color:#7d99a4;">좋아요</a></td></tr>
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
            <h2 class="tit">좋아요</h2>
        </div>
        
        

       
        <p class="buy_list_txt">

            <span class="span_txt" style="margin-bottom:10px;">전체${pageNav.totalRows}개<%--  | 좋아요 상품은 최대 ${untitled}일간 보관됩니다. --%>             
            </span>
           <form name="frm_view2"> 
            <c:if test="${!empty likeproductList[0].product_name}">      
            <button type="button" onclick="deletelikelistall();" id="all_del" style="margin-bottom:10px;">전체삭제</button>
            </c:if>
            </form>            
        </p>

		<form name="frm_view">  
        <table class="buy_list">
            <colgroup>
                <col style="width:40%;">
                <col style="width:30%;">
                <col style="width:30%;">
            </colgroup>         
            <thead>
                <tr>
                    <th class="th_product top bottom" scope="col">상품</th>
                    <th class="th_price top bottom" scope="col">가격</th>
                    <th class="th_admin top bottom" scope="col">관리</th>
                </tr>
            </thead>
            <tbody>
                          <c:forEach var="rowNum" begin="${pageNav.startNum}" end="${pageNav.endNum}"> 
                          
                          <c:if test="${!empty likefileList[rowNum-1].saveFile}">
                <tr>
                    <td>

                    <a href="${pageContext.request.contextPath}/product/product_view.do?prdNum=${likeproductList[rowNum-1].product_idx}"><img class="goodlist_thumb" src="${pageContext.request.contextPath}/resources/uploads/${likefileList[rowNum-1].saveFile}"></a>
                    <br><div id="font"><a href="${pageContext.request.contextPath}/product/product_view.do?prdNum=${likeproductList[rowNum-1].product_idx}" class="goodlist"> ${likeproductList[rowNum-1].product_name}</a></div></td>
                        <fmt:formatNumber value="${likeproductList[rowNum-1].product_price}" type="number" var="formatNumber"/>						
						<td><span id="font2">${formatNumber}</span><span id="font3"> 원</span></td>
                    <td >
                        <input type="button" id="td_basket" value="장바구니">
                        <input type="button" id="td_cancel" onclick="deletelikelist(${likeproductList[rowNum-1].like_idx});" value="삭제하기"></td>
                </tr>
                        </c:if>
                            </c:forEach>     
	
            </tbody>


        </table>
</form>
        
        
        <!--페이징처리 -->
        <div class="paging">
            <table>
                <tr>
                    <td id="td_paging" colspan="6">
                    
                        <c:if test="${pageNav.pageNum > pageNav.pages_per_block}">
				            <a href="mypage_like.do?pageNum=1&pageBlock=1">&lt;&lt;</a>&nbsp;
				            <a href="mypage_like.do?pageNum=${(pageNav.pageBlock - 2)*pageNav.pages_per_block + 1}&pageBlock=${pageNav.pageBlock-1}">
				                &lt;이전페이지
				            </a>    
				        </c:if>				        
				        <c:forEach var="i" begin="${(pageNav.pageBlock-1)*pageNav.pages_per_block + 1}" end="${pageNav.pageBlock*pageNav.pages_per_block}">
				            <c:if test="${i le pageNav.totalPageNum}">
				                <c:choose>
				                    <c:when test = "${pageNav.pageNum eq i}">
				                        <a href="mypage_like.do?pageNum=${i}&pageBlock=${pageNav.pageBlock}">
				                            <span style="color:red">${i}&nbsp;</span>
				                        </a>
				                    </c:when>
				                    <c:otherwise>
				                        <a href="mypage_like.do?pageNum=${i}&pageBlock=${pageNav.pageBlock}">${i}&nbsp;</a>
				                    </c:otherwise>
				            </c:choose>
				            </c:if>
				        </c:forEach>				    
				        <c:if test="${((pageNav.rows_per_page*pageNav.pages_per_block) lt pageNav.totalRows) and (pageNav.pageBlock ne pageNav.lastPageBlock) }">
				            <a href="mypage_like.do?pageNum=${pageNav.pageBlock*pageNav.pages_per_block+1}&pageBlock=${pageNav.pageBlock+1}">다음페이지&gt;</a>&nbsp;
				            <a href="mypage_like.do?pageNum=${pageNav.totalPageNum}&pageBlock=${pageNav.lastPageBlock}">&gt;&gt;</a>
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
