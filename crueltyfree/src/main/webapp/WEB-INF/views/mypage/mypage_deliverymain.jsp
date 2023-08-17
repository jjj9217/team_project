<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List, java.util.HashMap, java.util.Map" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
        
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>배송지 | CrueltyFree</title>
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
        width: 1020px; margin: 0 auto; height:auto;
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
    	margin-top:10px;
        text-align: center;
    }  
    .addrees_reg_background{
        width: 100%;
        height: 250px;
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
    #adminbutton{
   		width:120px;
   		height:30px;
        margin-top: 3px;
        font: bold 15px Arial, sans-serif;
       	cursor:pointer;/*마우스를 올려놓았을 때 커서가 손모양으로 변경됨*/
       	border:0;
        background-color:#7d99a4;
        color: white;
   		border-radius:3px;    	
    }
	#editbutton{
   		width:120px;
   		height:30px;
        margin-top: 3px;	
        font: bold 15px Arial, sans-serif;	
        border: 1px solid #7d99a4;
        color: #7d99a4;
        background-color: #fff;
        font-weight: bold;   
        border-radius: 3px;    
	}
    #addrees_reg{
   		width:200px;
   		height:50px;
        margin-top: 3px;
        font: bold 20px Arial, sans-serif;
       	cursor:pointer;/*마우스를 올려놓았을 때 커서가 손모양으로 변경됨*/
       	border:0;
        background-color:#7d99a4;
        color: white;
   		border-radius:3px;
    }
    .buy_list_container{display: block; width: 790px; height: auto; margin: 0 auto; padding: 10px; margin-top: 50px;}
    .buy_list, .order_list{border-collapse: collapse;}
    .th_delivery{ height: 20px; padding: 10px 0; background-color: rgb(224, 224, 224);}
    .th_receiver{ height: 20px; padding: 10px 0; background-color: rgb(224, 224, 224);}
    .th_address{ height: 20px; padding: 10px 0; background-color: rgb(224, 224, 224);}
    .th_call{ height: 20px; padding: 10px 0; background-color: rgb(224, 224, 224);}
    .th_admin{ height: 20px; padding: 10px 0; background-color: rgb(224, 224, 224);}
	.td_delivery{ height: auto; padding: 30px 5px; text-align: center; font-size:14px; font-weight: bold;}
    .td_receiver{height: auto; padding: 30px 5px; text-align: center; border-left: 1px solid #a4a4a4; font-size:14px;}
    .td_address{height: auto; padding: 30px 5px; text-align: center; border-left: 1px solid #a4a4a4; font-size:14px;}
    .td_call{height: auto; padding: 30px 5px; text-align: center; border-left: 1px solid #a4a4a4; font-size:14px;}
    .td_admin{height: auto; padding: 30px 5px; text-align: center; border-left: 1px solid #a4a4a4; font-size:14px;}
    .top{border-top: 2px solid #4a4a4a}
    .bottom{border-bottom: 1px solid #a4a4a4}
    #basic{font: bold 15px Arial, sans-serif; color:red;}
    .buy_list td{font: bold 15px Arial, sans-serif;
    		border-bottom: 1px solid gray; height:150px;}
</style>
</head>
<script>
function deletedeliveryPost(delivery_idx) {
    
    var confirmAns = confirm("정말로 삭제하겠습니까?");
    
    if (confirmAns) {

        frm_view.method = "post"; // 전송 방식 
        frm_view.action = "delete_process_comment.do?no="+delivery_idx; // 전송 경로
        frm_view.submit(); // 폼값 전송
        
    }else{

    }
    
}






function vieweditdeliveryPost(delivery_idx) {
    
        frm_view.method = "post"; // 전송 방식 
        frm_view.action = "edit_deliveryreg.do?no="+delivery_idx; // 전송 경로
        frm_view.submit(); // 폼값 전송
        
    
}
	
	
	
	
	
	
	
function updatedeliveryPostdefault(delivery_idx) {
    
        frm_view.method = "post"; // 전송 방식
        frm_view.action = "delete_process_comment2.do?no="+delivery_idx; // 전송 경로
        frm_view.submit(); // 폼값 전송
        
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
            <tr><td><a href="${pageContext.request.contextPath}/mypage/mypage_deliverymain.do" style="font-weight:bold; color:#7d99a4;">배송지</a></td></tr>
        </table>        
    </div>
    <div id="mypage-conts">
        <div id="blank">            
        </div>
        <div class="tit_area">
            <h2 class="tit">배송지</h2>  
            <br>         
        </div>
        
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
                <tr>
                    <th class="th_delivery top bottom" scope="col">배송지명</th>
                    <th class="th_receiver top bottom" scope="col">받는사람</th>
                    <th class="th_address top bottom" scope="col">주소</th>
                    <th class="th_call top bottom" scope="col">연락처</th>
                    <th class="th_admin top bottom" scope="col">관리</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="rowNum" begin="${pageNav.startNum}" end="${pageNav.endNum}">
	                <c:choose>
	                    <c:when test="${deliveryList[rowNum-1].defaultpost==1}">
	                       <c:if test="${!empty deliveryList[rowNum-1].delivery_idx}">
		                       <tr>
				                    <td>${deliveryList[rowNum-1].delivery_address_name}</td>
				                    <td>${deliveryList[rowNum-1].delivery_get_name}</td>
				                    <td><p id="basic">기본 배송지</p>
				                        ${deliveryList[rowNum-1].delivery_postNum}
				                        ${deliveryList[rowNum-1].delivery_address}
				                        ${deliveryList[rowNum-1].delivery_address2}    
				                    <td>${deliveryList[rowNum-1].delivery_handphone}</td>
				                    <td>
				                        <input type="button" onclick="vieweditdeliveryPost(${deliveryList[rowNum-1].delivery_idx});" id="editbutton" value="수정"></td>
				                </tr>
			                </c:if>
	                    </c:when>
	                    <c:otherwise>
	                       <c:if test="${!empty deliveryList[rowNum-1].delivery_idx}">
		                       
		                       <tr>
				                    <td>${deliveryList[rowNum-1].delivery_address_name}</td>
	                                <td>${deliveryList[rowNum-1].delivery_get_name}</td>                                
	                                <td>${deliveryList[rowNum-1].delivery_postNum}
	                                    ${deliveryList[rowNum-1].delivery_address}
	                                    ${deliveryList[rowNum-1].delivery_address2}    
	                                <td>${deliveryList[rowNum-1].delivery_handphone}</td>
	                                <td>
	                                    
				                        <input type="button" onclick="updatedeliveryPostdefault(${deliveryList[rowNum-1].delivery_idx});" id="adminbutton" value="기본배송지 설정"><br>

				                      	<input type="button" onclick="vieweditdeliveryPost(${deliveryList[rowNum-1].delivery_idx});" id="editbutton"  value="수정"><br>			                        
				                        
				                        <input type="button" onclick="deletedeliveryPost(${deliveryList[rowNum-1].delivery_idx});" id="adminbutton"  value="삭제하기">
                                        
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

        