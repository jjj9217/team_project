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
    
    .sub-title{
        height: 22px;
        padding-top: 27px;
        padding-bottom: 10px;
        margin: 0;
        
    }   

    
    .address_list{
        width: 100%;
        height:auto; 
        /* height는 auto로 해두면 편함 */
    
        
    }

    .address_list tr {
        width: 100%;
        height:53px;
    }

    .address_list th {
        width: 198px;
        height:53px;
    }

    .address_list td {
        height:53px;
    }

    .request_list{
        width: 100%;
        height:161px;
        
        
    }

   

    .address_reg_background{
        width: 100%;
        height: 80px;
        
        display : flex;
        justify-content: center;
        align-items : center;
    }

    #address_ok{
        width: 200px;
        height: 50px;
        
        color: black;
        margin-left: 20px;                  
    }

    #address_cancel{
        width: 200px;
        height: 50px;
        
        color: black;
        margin-left: 20px;                  
    }

</style>
</head>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
function kakaopost(){
    var width=500;
    var height = 600; //팝업의 높이
    
    new daum.Postcode({     
        oncomplete: function(data) {
            document.querySelector("#member_postNum").value=data.zonecode;
            document.querySelector("#member_address").value=data.address;
        }

    }).open({left:10,top:200});
}

$(function(){		
	//기본배송지 설정 유무	
	if(document.getElementById("defaultpostcheck").checked){
        document.getElementById("defaultpostcheck_hidden").disabled=true;
    }
	
	//공동현관 출입방법 
	$("input[name='delivery_pass']").change(function(){
	    var selectedOptionValue = $(this).val();
	    var deliveryInputMethod = $("#delivery_input_method");
	    var deliveryTitle = $(".td_delivery_title").eq(0);  
	    
	    if (selectedOptionValue == "0") {
	        deliveryInputMethod.show();
	        deliveryTitle.text("공동현관 비밀번호");
	    } else if(selectedOptionValue == "1"){
	        deliveryInputMethod.show();
	        deliveryTitle.text("경비실 호출 방법");
	    } else if(selectedOptionValue == "2){
	        deliveryInputMethod.hide();
	    } else{
	        deliveryInputMethod.show();
	        deliveryTitle.text("기타 상세 내용");
	    }
	});
	
	
	//배송메시지 옵션변경
    $("#delivery_message").change(function() {
        var deliveryOption = $("#delivery_message_option");
        var deliveryText = $("#delivery_message_text");

        if (deliveryOption.is(":selected")) {
          deliveryText.prop("type", "text");
        } else {
          deliveryText.prop("type", "hidden");
        }
    });
    
    //배송메시지 직접입력
    $("#delivery_message_text").on("input", function(){
        var deliveryText = $("#delivery_message_text").val();
        
        if (deliveryText.length > 30) {
            var truncatedText = deliveryText.slice(0, 30);
            $(this).val(truncatedText); // 입력한 텍스트를 최대 50자까지 자른 내용으로 설정
    
            alert("배송메시지는 30자까지만 입력가능합니다.");
        }
        $("#delivery_message_option").val(deliveryText);
    });
	
});//jQuery end



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
        <h3 class="sub-title">배송지 수정</h3>
<form name="caq" action="${pageContext.request.contextPath}/mypage/edit_process_deliveryreg.do" method="post">
        <table class="address_list">
            <colgroup>
                <col style="width:25%;">
                <col style="width:75%;">
            </colgroup>
            <tbody>
                <tr>
                    <th>배송지명</th>
                    <td><input type="text" name="delivery_address_name" placeholder="최대 10자" value="${DeliveryVo.delivery_address_name}"><input type="checkbox" id="defaultpostcheck" name="defaultpost" value="1"><input type="hidden" name="defaultpost" value="0" id="defaultpostcheck_hidden"/><label for="base-dlvp-yn-check">기본 배송지 설정</label>
                    </td>
                </tr>           
                <tr>
                    <th>받는분</th>
                    <td><input type="text" name="delivery_get_name" placeholder="최대 10자" value="${DeliveryVo.delivery_get_name}"></td>
                </tr>
                <tr>
                    <th>연락처</th>
                    <td><input type="text" name="delivery_handphone" placeholder="- 를 제외한 숫자입력" value="${DeliveryVo.delivery_handphone}"></td>
                </tr>
                <tr>
                 <th><label>주소<br>                   
                </label></th>                  
                    <td><input type="text" name="delivery_postNum" id="member_postNum" placeholder="우편번호" value="${DeliveryVo.delivery_postNum}" readonly>
                    <input type="button" name="select_postNum" id="select_postNum" value="우편번호 검색&nbsp;&nbsp;" onclick="kakaopost()" >
                    <input type="text" name="delivery_address" id="member_address" placeholder="주소" value="${DeliveryVo.delivery_address}" readonly>
                    <input type="text" name="delivery_address2" id="member_address2" placeholder="상세 주소" value="${DeliveryVo.delivery_address2}" ></td>
                </tr>
        </table>
        <h3 class="sub-title">배송지 요청사항</h3>
        <table class="request_list">
            <colgroup>
                <col style="width:170px">
                <col style="width:622px">
            </colgroup>
            <tbody>
                <tr>
	                <td class="td_delivery_titl top bottom title">배송 메시지</td>
	                <td class="td_delivery_content top bottom">
	                    <c:choose>
	                       <c:when test="${!empty DeliveryVo.delivery_message}">
	                           <select name="delivery_message" id="delivery_message" >                                
                                <option value="">${DeliveryVo.delivery_message}</option>
                                <option value="">배송메시지를 선택해주세요</option>
                                <option value="그냥 문 앞에 놓아주시면 돼요.">그냥 문 앞에 놓아주시면 돼요.</option>
                                <option value="직접 받을게요.(부재시 문앞)">직접 받을게요.(부재시 문앞)</option>
                                <option value="벨을 누르지 말아주세요.">벨을 누르지 말아주세요.</option>
                                <option value="도착 후 전화주시면 직접 받으러 갈게요.">도착 후 전화주시면 직접 받으러 갈게요.</option>
                                <option id="delivery_message_option" value="">직접 입력하기</option>
                               </select>
                                <br>
                                <input id="delivery_message_text" type="hidden">
	                       </c:when>   
	                       <c:otherwise>
		                        <select name="delivery_message" id="delivery_message" >
	                            <option value="">배송메시지를 선택해주세요</option>
	                            <option value="그냥 문 앞에 놓아주시면 돼요.">그냥 문 앞에 놓아주시면 돼요.</option>
	                            <option value="직접 받을게요.(부재시 문앞)">직접 받을게요.(부재시 문앞)</option>
	                            <option value="벨을 누르지 말아주세요.">벨을 누르지 말아주세요.</option>
	                            <option value="도착 후 전화주시면 직접 받으러 갈게요.">도착 후 전화주시면 직접 받으러 갈게요.</option>
	                            <option id="delivery_message_option" value="">직접 입력하기</option>
	                           </select>
		                        <br>
		                        <input id="delivery_message_text" type="hidden">
	                       </c:otherwise>
	                    </c:choose>	                    	                   
	                </td>
                </tr>
                <tr>
                    <th scope="row">공동현관 출입방법</th>
                    <td class="imp_data">
                        <c:choose>
                        <c:when test="${DeliveryVo.delivery_pass eq 1}">
                            <span class="dv_input"><input type="radio" checked="checked" name="delivery_pass" id="dv_input_1" value="0" ><label for="dv_input_1" >비밀번호</label></span>
                        <span class="dv_input"><input type="radio" name="delivery_pass" id="dv_input_2" value="1" ><label for="dv_input_2" >경비실 호출</label></span>
                        <span class="dv_input"><input type="radio" name="delivery_pass" id="dv_input_3" value="2" ><label for="dv_input_3" >자유출입가능</label></span>
                        <span class="dv_input"><input type="radio" name="delivery_pass" id="dv_input_4" value="3" ><label for="dv_input_4" >기타사항</label></span>
                        </c:when>
                        <c:when test="${DeliveryVo.delivery_pass eq 2}">
                            <span class="dv_input"><input type="radio" name="delivery_pass" id="dv_input_1" value="0" ><label for="dv_input_1" >비밀번호</label></span>
                        <span class="dv_input"><input type="radio" checked="checked" name="delivery_pass" id="dv_input_2" value="1" ><label for="dv_input_2" >경비실 호출</label></span>
                        <span class="dv_input"><input type="radio" name="delivery_pass" id="dv_input_3" value="2" ><label for="dv_input_3" >자유출입가능</label></span>
                        <span class="dv_input"><input type="radio" name="delivery_pass" id="dv_input_4" value="3" ><label for="dv_input_4" >기타사항</label></span>
                        </c:when>
                        <c:when test="${DeliveryVo.delivery_pass eq 3}">
                            <span class="dv_input"><input type="radio" name="delivery_pass" id="dv_input_1" value="0" ><label for="dv_input_1" >비밀번호</label></span>
                        <span class="dv_input"><input type="radio" name="delivery_pass" id="dv_input_2" value="1" ><label for="dv_input_2" >경비실 호출</label></span>
                        <span class="dv_input"><input type="radio" checked="checked" name="delivery_pass" id="dv_input_3" value="2" ><label for="dv_input_3" >자유출입가능</label></span>
                        <span class="dv_input"><input type="radio" name="delivery_pass" id="dv_input_4" value="3" ><label for="dv_input_4" >기타사항</label></span>
                        </c:when>
                        <c:when test="${DeliveryVo.delivery_pass eq 4}">
                        <span class="dv_input"><input type="radio" name="delivery_pass" id="dv_input_1" value="0" ><label for="dv_input_1" >비밀번호</label></span>
                        <span class="dv_input"><input type="radio" name="delivery_pass" id="dv_input_2" value="1" ><label for="dv_input_2" >경비실 호출</label></span>
                        <span class="dv_input"><input type="radio" name="delivery_pass" id="dv_input_3" value="2" ><label for="dv_input_3" >자유출입가능</label></span>
                        <span class="dv_input"><input type="radio" checked="checked" name="delivery_pass" id="dv_input_4" value="3" ><label for="dv_input_4" >기타사항</label></span>                        
                        </c:when>
                        <c:otherwise>
                        <span class="dv_input"><input type="radio" name="delivery_pass" id="dv_input_1" value="1" ><label for="dv_input_1" >비밀번호</label></span>
                        <span class="dv_input"><input type="radio" name="delivery_pass" id="dv_input_2" value="2" ><label for="dv_input_2" >경비실 호출</label></span>
                        <span class="dv_input"><input type="radio" name="delivery_pass" id="dv_input_3" value="3" ><label for="dv_input_3" >자유출입가능</label></span>
                        <span class="dv_input"><input type="radio" name="delivery_pass" id="dv_input_4" value="4" ><label for="dv_input_4" >기타사항</label></span>
                        </c:otherwise>                        
                        </c:choose>
                        <!-- <input type="button" id="test111" value="test"> -->
                    </td>
                </tr>
                <tr id="delivery_input_method">
                    <th class="td_delivery_title">공동현관 비밀번호</th>
                    
                    <td class="td_delivery_content bottom">
                        <input class="input_focus" type="text" name="delivery_pass_content" id="delivery_get_method" value="${DeliveryVo.delivery_pass_content}">
                    </td>                    
                </tr>
                <!--
                <tr type="exist" class="quick_area">
                    <th scope="row">경비실 호출방법</th>
                    <td class="imp_data">
                        <input type="text" id="door_type_exist" name="o2oVisitTypeDesc" value="" class="inpH28" title="공동현관 출입방법 상세내용." maxlength="20" style="width: 500px" data-attr="^배송지정보_PC^1_공동현관 비밀번호">
                    </td>
                </tr>
                <tr type="exist" class="quick_area">
                    <th scope="row">기타사항</th>
                    <td class="imp_data">
                        <input type="text" id="door_type_exist" name="o2oVisitTypeDesc" value="" class="inpH28" title="공동현관 출입방법 상세내용." maxlength="20" style="width: 500px" data-attr="^배송지정보_PC^1_공동현관 비밀번호">
                    </td>
                </tr>
                -->
            </tbody>
        </table>
</form>        
        <div class="address_reg_background">                                                                        
            <button type="button" class="btnLookup" id="address_ok" onclick="document.forms['caq'].submit();">확인</button>
            
           <%--  <form name="caq" action="${pageContext.request.contextPath}/mypage/mypage_deliverymain.do" method="get">
                        <input type="hidden" name="member_idx" value="1">
                    </form>
                    <a href="#" onclick="document.forms['caq'].submit();">
            배송지TEST</a> --%>
            
            <button type="button" class="btnLookup" id="address_cancel">취소</button>                                     
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
        