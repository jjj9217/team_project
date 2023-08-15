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
</style>
</head>
<script>
function deletelikelist(like_idx) {
    
    var confirmAns = confirm("정말로 삭제하겠습니까?");
    
    if (confirmAns) {
        alert('성공');
        frm_view.method = "post"; // 전송 방식 
        frm_view.action = "delete_process_like.do?no="+like_idx; // 전송 경로
        frm_view.submit(); // 폼값 전송
        
    }else{
        alert('불가');
    }
    
}



function deletelikelistall() {
    
    var confirmAns = confirm("정말로 삭제하겠습니까!?");
    
    if (confirmAns) {
        alert('성공');
        
        frm_view2.method = "get"; // 전송 방식 
        frm_view2.action = "delete_process_likeall.do?" // 전송 경로
        frm_view2.submit(); // 폼값 전송
          
        
    }else{
        alert('불가');
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
            <h2 class="tit">좋아요</h2>
        </div>
        
        

       
        <p class="buy_list_txt">

            <span class="span_txt" style="margin-bottom:10px;">전체${pageNav.totalRows}개<%--  | 좋아요 상품은 최대 ${untitled}일간 보관됩니다. --%>             
            </span>
           <form name="frm_view2"> 
            <c:if test="${!empty likeproductList[0].product_name}">      
            <button type="button" onclick="deletelikelistall();" id="all_del" style="margin-bottom:10px;">전체삭제</button>
            </c:if>
            </from>            
        </p>

		<form name="frm_view">  
        <table class="buy_list">
            <colgroup>
                <col style="width:55%;">
                <col style="width:30%;">
                <col style="width:15%;">
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
                    <img class="goodlist_thumb" src="${pageContext.request.contextPath}/resources/uploads/${likefileList[rowNum-1].saveFile}">
                    ${likeproductList[rowNum-1].product_name}</td>
                    <td>${likeproductList[rowNum-1].product_price}</td>
                    <td>
                        <input type="button" value="장바구니">
                        <input type="button" onclick="deletelikelist(${likeproductList[rowNum-1].like_idx});" value="삭제하기"></td>
                </tr>
                        </c:if>
                                </c:forEach>       
            </tbody>


        </table>
</form>


        
        
    </div>
</div>

    <footer>
		<jsp:include page="../main/footer.jsp"/>		
	</footer>
</body>
</html>
