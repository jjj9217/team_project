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

    .address_or_refund{
        width: 100%;
        height: 52px;   
    
        padding-inline-start: 0px;
        display : flex;
        justify-content: center;
        align-items : center;
        text-align: center;
        margin: 0px;    
    }

    .address_atag{
        float: left;
        width: 392px;
        height: 37px;
    }

    .refund_atag{
        float: left;
        width: 392px;
        height: 37px;
    }

    #address_atag{
        float: left;
        width: 392px;
        height: 37px;
        line-height: 35px;
    }

    #refund_atag{
        float: left;
        width: 392px;
        height: 37px;
        line-height: 35px;
    }
    
    ul li{      
        list-style:none;
    
    }
    
    .notice-text{
        width: 792px;
        height: 20px;
        padding-left: 10px;
        margin-top: 30px;
        margin-bottom: 0px;
    
    }

    .buy_list{
        width: 100%;
        height:340px;
    
        text-align: center;
    }

  
    .addrees_reg_background{
        width: 100%;
        height: 80px;
    
        display : flex;
        justify-content: center;
        align-items : center;
    }

    #addrees_reg{
        width: 200px;
        height: 50px;
    
        color: black;
        margin-left: 20px;                  
    }

</style>
</head>
<script>
function deletedeliveryPost(delivery_idx) {
    
    var confirmAns = confirm("정말로 삭제하겠습니까?");
    
    if (confirmAns) {
    	alert('성공');
        frm_view.method = "post"; // 전송 방식 
        frm_view.action = "delete_process_comment.do?no="+delivery_idx; // 전송 경로
        frm_view.submit(); // 폼값 전송
        
    }else{
    	alert('불가');
    }
    
}






function vieweditdeliveryPost(delivery_idx) {
    
    var confirmAns = confirm("테스트");
    
    if (confirmAns) {
        alert('성공');
        frm_view.method = "post"; // 전송 방식 
        frm_view.action = "edit_deliveryreg.do?no="+delivery_idx; // 전송 경로
        frm_view.submit(); // 폼값 전송
        
    }else{
        alert('불가');
    }
    
}
	
	
	
	
	
	
	
function updatedeliveryPostdefault(delivery_idx) {
    
    var confirmAns = confirm("정말로 기본배송지로 설정하겠습니까?");
    
    if (confirmAns) {
        alert('성공');
        frm_view.method = "post"; // 전송 방식 
        frm_view.action = "delete_process_comment2.do?no="+delivery_idx; // 전송 경로
        frm_view.submit(); // 폼값 전송
        
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
            <h2 class="tit">배송지/환불계좌</h2>           
        </div>
        <ul class="address_or_refund">
            <li class="address_atag"><a href="#" id="address_atag">배송지</a></li>
            <li class="refund_atag"><a href="#" id="refund_atag">환불계좌</a></li>
        </ul>
        <p class="notice-text">배송지는 최대 <strong class="colorGreen">${untitled}</strong>까지 등록 가능합니다.</p>
<form name="frm_view">        
        <table class="buy_list">
            <colgroup>
                <col style="width:10%;">
                <col style="width:10%;">
                <col style="width:40%;">
                <col style="width:20%;">
                <col style="width:20%;">
            </colgroup>
            <thead>
                <hr width=100%>
                <tr>
                    <th scope="col">배송지명</th>
                    <th scope="col">받는사람</th>
                    <th scope="col">주소</th>
                    <th scope="col">연락처</th>
                    <th scope="col">관리</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="rowNum" begin="${pageNav.startNum}" end="${pageNav.endNum}">
	                <c:choose>
	                    <c:when test="${deliveryList[rowNum-1].defaultpost==1}">
	                       <c:if test="${!empty deliveryList[rowNum-1].delivery_idx}">
		                       <tr>
				                    <td>${deliveryList[rowNum-1].delivery_address_name}배송지명</td>
				                    <td>${deliveryList[rowNum-1].delivery_get_name}받는사람</td>
				                    <td>기본배송지 오늘드림
				                        ${deliveryList[rowNum-1].delivery_postNum}
				                        ${deliveryList[rowNum-1].delivery_address}
				                        ${deliveryList[rowNum-1].delivery_address2}    
				                        <c:if test="${!empty deliveryList[rowNum-1].delivery_pass_content}">
				                        ${deliveryList[rowNum-1].delivery_pass_content}
				                        </c:if>
				                    <td>${deliveryList[rowNum-1].delivery_handphone}연락처</td>
				                    <td>
				                        <input type="button" onclick="vieweditdeliveryPost(${deliveryList[rowNum-1].delivery_idx});" value="수정"></td>
				                </tr>
			                </c:if>
	                    </c:when>
	                    <c:otherwise>
	                       <c:if test="${!empty deliveryList[rowNum-1].delivery_idx}">
		                       
		                       <tr>
				                    <td>${deliveryList[rowNum-1].delivery_address_name}배송지명</td>
	                                <td>${deliveryList[rowNum-1].delivery_get_name}받는사람</td>                                
	                                <td>${deliveryList[rowNum-1].delivery_postNum}
	                                    ${deliveryList[rowNum-1].delivery_address}
	                                    ${deliveryList[rowNum-1].delivery_address2}    
	                                    <c:if test="${!empty deliveryList[rowNum-1].delivery_pass_content}">
	                                    ${deliveryList[rowNum-1].delivery_pass_content}
	                                    </c:if>
	                                <td>${deliveryList[rowNum-1].delivery_handphone}연락처</td>
	                                <td>
	                                    
				                        <input type="button" onclick="updatedeliveryPostdefault(${deliveryList[rowNum-1].delivery_idx});" value="기본배송지 설정">

				                      	<input type="button" onclick="vieweditdeliveryPost(${deliveryList[rowNum-1].delivery_idx});" value="수정">			                        
				                        
				                        <input type="button" onclick="deletedeliveryPost(${deliveryList[rowNum-1].delivery_idx});" value="삭제하기">
                                        
				                        <%-- <input type="button" onclick="updatedeliveryPost(${deliveryList[rowNum-1].delivery_idx});" value="수정"> --%></td>
				                        
				                </tr>
				                
			                </c:if>
	                    </c:otherwise>
		            </c:choose>
		        </c:forEach>                   
            </tbody>        
        </table>
</form>        
        <div class="addrees_reg_background">                                                                        
            <button type="button" class="btnLookup" id="addrees_reg" onClick="location.href='mypage_deliveryreg.do'">배송지 등록</button>                       
        </div>
    
    
    
    
    
    
    
    
    
    
    
    </div>
</div>

<!-- footer -->
    <footer>
        <jsp:include page="../main/footer.jsp"/>        
    </footer>
</body>
</body>
</html>

        