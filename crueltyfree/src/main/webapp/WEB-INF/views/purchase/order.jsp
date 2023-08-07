<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문/결제 | CrueltyFree</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<!-- 우편번호 -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
function kakaopost(){
    var width = 500; // 팝업의 너비
    var height = 600; // 팝업의 높이
   
    var top = (window.screen.height / 2) - (height / 2);

    new daum.Postcode({
        width: width,
        height: height,
        oncomplete: function(data) {
            $("#delivery_postNum").val(data.zonecode);
            $("#delivery_address").val(data.address);
        }
    }).open({
        left: 1700,
        top: top
    });
}
</script>

<!-- 결제 -->
<script src="https://cdn.iamport.kr/v1/iamport.js"></script>
<script>

//yymmdd형태로 날짜 얻기
function formatDateToYYMMDD(date) {
    const year = date.getFullYear().toString().slice(-2);
    const month = String(date.getMonth() + 1).padStart(2, '0');
    const day = String(date.getDate()).padStart(2, '0');
    return year+month+day;
}

//난수생성
function generateRandomNumber(length) {
    const randomNumber = Math.random().toString().slice(2, 2 + length);
    return randomNumber.padStart(length, '0');
}

const currentDate = new Date();
const formattedDate = formatDateToYYMMDD(currentDate);
const randomDigits = generateRandomNumber(8);  //8자리의 난수생성

var IMP = window.IMP;
IMP.init("imp36534356");

function doPayment(name, amount, buyer_email, buyer_name, buyer_tel, buyer_addr, buyer_postcode){
	IMP.request_pay({
	      pg: "html5_inicis.INIpayTest",
	      pay_method: "card",
	      merchant_uid: "CF"+formattedDate+randomDigits,   // 주문번호
	      name: name,
	      amount: amount,                         // 숫자 타입
	      buyer_email: buyer_email,
	      buyer_name: buyer_name,
	      buyer_tel: buyer_tel,
	      buyer_addr: buyer_addr,
	      buyer_postcode: buyer_postcode
	    }, function (rsp) { // callback
	      //rsp.imp_uid 값으로 결제 단건조회 API를 호출하여 결제결과를 판단합니다.
	          if (rsp.success) {
	        	  var msg = '결제가 완료되었습니다.';
			      alert(msg);
// 			      location.href = "결제 완료 후 이동할 페이지 url"
			    } else {
			      var msg = '결제에 실패하였습니다.';
			      msg += '에러내용 : ' + rsp.error_msg;
			      alert(msg);
			    }
	    });	
}
</script>
<script>
$(function(){
	//전체 체크박스 클릭
	$("#all_agree_check").click(function(){
		const checkAllState = $(this).prop("checked");
		
		$(".agree_check").prop("checked", checkAllState);
	});
	//개별 체크박스 클릭
	$(".agree_check").click(function() {
        const anyUnchecked = $(".agree_check:not(:checked)").length > 0;

        $("#all_agree_check").prop("checked", !anyUnchecked);
    });
	//동의 탭 클릭
	$("#all_agree_open").click(function(){
	    var index = $(".other_agree").index(this);
	    var targetDetail = $(".other_agree").eq(index);
	    
	    $(".other_agree").not(targetDetail).removeClass("show");
	    targetDetail.toggleClass("show");
	    
	    var allAgreeOpenText = $("#all_agree_open").text();
	    $("#all_agree_open").text(allAgreeOpenText == "^" ? "v" : "^");
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
	
	//공동현관 출입방법 
	$("input[name='dv_input']").change(function(){
	    var selectedOptionValue = $(this).val();
	    var deliveryInputMethod = $("#delivery_input_method");
	    var deliveryTitle = $(".td_delivery_title").eq(6);	
	    
	    if (selectedOptionValue == "1") {
	    	deliveryInputMethod.show();
	        deliveryTitle.text("공동현관 비밀번호");
	    } else if(selectedOptionValue == "2"){
	        deliveryInputMethod.show();
	        deliveryTitle.text("경비실 호출 방법");
	    } else if(selectedOptionValue == "3"){
	        deliveryInputMethod.hide();
	    } else{
	    	deliveryInputMethod.show();
	        deliveryTitle.text("기타 상세 내용");
	    }
	});
	
	//우편번호찾기
	$("#delivery_postNum_btn").click(function(){
		kakaopost();
	});
	
	//결제하기 버튼 클릭
	$("#order_btn").click(function(){		
	    var client_num = "";
	    if(${!empty member}){
	    	client_num = $("#order_member_idx").val();
	    }else{
	    	client_num = $("#order_client_num").val();
	    }
	    
	    $("#clientNum").val(client_num);
	    
	    //상품이름설정
	    var name = "";
	    if(${listCount} > 1){
	    	name = $(".prd_title").eq(0).text() + " 외 " + ${listCount - 1} + "건";	    	
	    }else{
	    	name = $(".prd_title").eq(0).text();
	    }
	    
	    //상품가격설정
	    var amount = parseInt(${total_price + total_delivery});
	    
	    //주문자이메일설정
	    var buyer_email = "";
	    if(${!empty member}){
	    	buyer_email = $("#order_member_email").val();
	    }else{
	    	buyer_email = $("#guest_email").val();
	    }
	    
	    //주문자이름설정
	    var buyer_name = "";
	    if(${!empty member}){
	    	buyer_name = $("#order_member_name").val();
	    }else{
	    	buyer_name = $("#guest_name").val();
	    }
	    
	    //주문자 전화번호 설정
	    var buyer_tel = "";
	    if(${!empty member}){
	    	buyer_tel = $("#order_member_phone").val();
	    }else{
	    	buyer_tel = $("#guest_phone").val();
	    }
	    //주문자 주소
	    var buyer_addr = $("#delivery_address").val() + " " + $("#delivery_address2").val();
	    
	    //주문자 우편번호
	    var buyer_postcode = $("#delivery_postNum").val();
	    
	    doPayment(name, amount, buyer_email, buyer_name, buyer_tel, buyer_addr, buyer_postcode);
	});
})
  
</script>

    <style>
        *{margin: 0; padding: 0;}
        a{text-decoration: none;}
        input[type="button"], input[type="submit"], input[type="checkbox"], select, input[type="radio"], label{cursor: pointer;}
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
        #title_box{width: 1020px; height: 140px;}
        #tb_title_box{
            width: 1020px;
            height: 140px;            
            border-bottom: 5px solid #7d99a4;
        }
        #page_title{font-size: 40px; font-weight: bold;}
        .title_box_step_name{font-size: 24px; color: #4a4a4a;}
        .title_box_step_next, .title_box_step_num{font-size: 20px; color: #4a4a4a;}
        #td_title_box_step{text-align: right;}
        .on{font-weight: bold; color: black;} 
        
        .sub_title {
            width: 1020px;
            margin: 40px auto 10px;
            color: #4a4a4a;
            font-size: 20px;
            font-weight: 400;
        }
        #tb_delivery_info{border-collapse: collapse;}
        #delivery_info{margin-bottom: 20px;}
        #delivery_info, #tb_delivery_info{width: 1020px; height: auto;}
        .td_delivery_title{width: 152px; height: 28px; padding: 15px 0 15px 18px; font-size: 15px;}
        .td_delivery_content{width: 794px; height: 28x; padding: 15px 20px 15px 36px; font-size: 15px;}
        .td_delivery_address_title{width: 152px; height: 120px; padding: 15px 0 15px 18px;}
        .td_delivery_address_content{width: 794px; height: 120px; padding: 15px 20px 15px 36px;}
        .top{border-top: 2px solid #4a4a4a;}
        .bottom{border-bottom: 1px solid #4a4a4a;}
        .title{background-color: #eef3f5; font-weight: bold; font-size: 15px;}
        
        select:focus, input[type="text"]:focus {outline:none; border: 1px solid #7d99a4;}
        #delivery_address_name, #delivery_get_name, #delivery_get_method{width: 193px; height: 26px; border-width: 1px; border-style: solid; border-radius: 5px; padding-left: 8px;}
        #delivery_handphone_begin{width: 83px; height: 26px; border-width: 1px; border-style: solid; border-radius: 5px; padding-left: 5px;}
        #delivery_handphone_middle, #delivery_handphone_end, #delivery_postNum{width: 68px; height: 26px; border-width: 1px; border-style: solid;  border-radius: 5px; padding: 0 10px;}
        #delivery_postNum_btn{width: 88px; height: 26px; border: 2px solid #7d99a4; color:#7d99a4; background-color: white; border-radius: 5px; padding: 0 5px; font-size: 12px; font-weight: bold;}
        #delivery_address{width: 478px; height: 26px; border-width: 1px; border-style: solid;  border-radius: 5px; padding: 0 10px; margin: 6px 0;}
        #delivery_address2{width: 478px; height: 26px; border-width: 1px; border-style: solid;  border-radius: 5px; padding: 0 10px;}
        .gray_bg{background-color: #f8f8f8;}
        .dv_input{
            width: 80px; height: 20px;
            margin-right: 20px;
            font-size: 14px;            
        }
        #delivery_message{width: 346px; height: 26px; border-width: 1px; border-style: solid;  border-radius: 5px; padding-left: 5px;}
    
        #tb_delivery_item{border-collapse: collapse;}
        #delivery_item th{background-color: #eef3f5;}
        #tb_delivery_item th{border-top: 2px solid #4a4a4a; border-bottom: 1px solid #a4a4a4;}
        #tb_delivery_item td{border: 1px solid #a4a4a4;}
        #tb_delivery_item .td_product_info{border-left: 0px;}
        #tb_delivery_item .td_buy_price{border-right: 0px;}

        #delivery_item, #tb_delivery_item{width: 1020px; height: auto; margin-bottom: 20px;}        
        #th_product_info{width: 700px; height: 40px;} .td_product_info{width: 640px; height: 92px; padding: 0px;}
        #th_sell_price{width: 110px; height: 40px;} .td_sell_price{width: 110px; height: 152px; text-align: center; color: #4a4a4a; font-weight: bold; font-size: 14px;}
        #th_product_count{width: 100px; height: 40px;} .td_product_count{width: 100px; height: 152px; text-align: center; color: #a4a4a4; font-weight: bold; font-size: 14px;}
        #th_buy_price{width: 110px; height: 40px;} .td_buy_price{width: 110px; height: 152px; text-align: center; color: #7d99a4; font-weight: bold; font-size: 14px;}
       
        .basket_item{
            display: flex;
            flex-wrap: wrap; 
            width: 600px; height: 152px;
            justify-content: center;
            align-items: center;
        }
        .prd_seller{
            display: inline-block;
            width: 404px; height: 20px;
            color:#4a4a4a;
            font-size: 15px; font-weight: bold;
            margin-bottom: 10px;
            text-align: left;
            margin-left: 15px;
        }
        .prd_title{
            width: 404px; height: 36px;
            color:black;
            font-size: 14px;
            margin-bottom: 5px;
            text-align: left;
            margin-left: 15px;
        }

        .order_payment_box{
            display: block;
            position: relative;
            width: 1020px; height: auto;
            margin-bottom: 20px;
        }
        .left_area{
            float: left;
            display: block;
            width: 700px; height: auto;
            margin-bottom: 20px;
        }
        .right_area{
            float: right;
            display: block;
            width: 300px; height: auto;
            margin-bottom: 20px;
        }

        .clean{clear: both;}

        #tb_coupon_info{border-collapse: collapse;}
        #coupon_info{margin-bottom: 20px;}
        #coupon_info, #tb_coupon_info{width: 700px; height: auto;}
        .td_coupon_title{width: 152px; height: 28px; padding: 15px 0 15px 18px; font-size: 15px;}
        .td_coupon_content{width: 490px; height: 28x; padding: 15px 20px; font-size: 15px;}

        #coupon{width: 293px; height: 26px; border-width: 1px; border-style: solid;  border-radius: 5px; padding-left: 5px;}
        .txt_right_discount{
            position: absolute;
            top: 109px;
            right: 340px;
            margin-top: -10px;
            height: 20px;
            line-height: 20px;
            color: #7d99a4;
            font-weight: bold;
        }
        .total_payment_box{border: 2px solid #4a4a4a;}
        .tb_total_payment_box{border-collapse: collapse;}
        .total_payment_box, .tb_total_payment_box{
            width: 296px; height: auto; padding: 10px 0;
        }
        .middle{height: 52px; padding: 10px 0;}
        .pay_bottom{height: 42px; padding-bottom: 10px;}
        .td_pay_title{width: 140px; height: 32px; padding-left: 20px; font-size: 14px;}
        .td_pay_content{width: 116px; height: 32px; padding-right: 20px; font-size: 14px; font-weight: bold; text-align: right;}
        .discount{color: #7d99a4;}
        .total_pay_price_title{font-size: 16px; font-weight: bold;}
        .total_pay_price{font-size: 24px;}
        
        .td_order_btn{
            width: 26px; height: 88px; text-align: center;
        }
        #order_btn{
            width: 256px; height: 68px;
            border-width: 0px;
            background-color: #7d99a4;
            color: #fff;
            font-size: 20px;
            font-weight: bold;
            border-radius: 5px;
        }
        .td_payment_method{
            width: 700px; height: auto; padding: 10px 0;
            background-color: #eef3f5;
        }
        .payment_method_radio{
            display: block; float: left;
            width: 135px; height: 20px; padding: 5px 20px;
        }
        #credit_card{
            width: 193px; height: 26px; border-width: 1px; border-style: solid;  border-radius: 5px; padding-left: 5px;
        }

        .agree_payment_box{width: 300px; height: auto; margin-top: 20px;}
        .all_agree{width: 258px; height: 75px; padding: 20px; background-color: #eef3f5; border: 1px solid #4a4a4a; font-size: 14px;}
        .all_agree_text{font-size: 16px; font-weight: bold;}
        #all_agree_open{padding-left: 150px; font-size: 24px; font-weight: bold; color: #4a4a4a; cursor: pointer;}
        .other_agree{width: 298px; height: auto; background-color: #eef3f5; border: 1px solid #4a4a4a; font-size: 14px;}
        .tb_other_agree td{width: 258px; height: auto; padding: 10px 20px;}
        .agree_box{display: flex; flex-wrap: wrap;}
        .agree_check_area{display: inline-block;}
        .agree_check_text{display: inline-block; width: 200px; padding-left: 10px; font-size: 12px; color: #4a4a4a; font-weight: bold;}
        .agree_check_text_small{display: inline-block; width: 150px; padding-left: 10px; font-size: 12px; color: #4a4a4a; font-weight: bold;}
        .agree_check_btn_area{display: inline-block; width: 40px; padding-left: 10px;}
        .agree_check_btn{width: 70px; height: 24px; color:#4a4a4a; font-size: 12px; font-weight: bold; background-color: #fff; border: 1px solid #4a4a4a; border-radius: 5px;}
        
        .right_title{width: 300px;}
        
        section{display: none; width: 298px; height: auto;}
     	.show{display: flex; flex-wrap: wrap;}
     	
     	#delivery_message_text{margin-top:5px; width: 478px; height: 26px; border-width: 1px; border-style: solid;  border-radius: 5px; padding: 0 10px;}
     	#delivery_input_method {display: none;}
     	
		.modalContainer {
		  width: 100%;
		  height: 100%;
		  position: fixed;
		  top: 0;
		  left: 0;
		  display: flex;
		  justify-content: center;
		  align-items: center;
		  background: rgba(0, 0, 0, 0.5);
		}
		
		.modalContent {
		  position: absolute;
		  background-color: #ffffff;
		  width: 300px;
		  height: 150px;
		  padding: 15px;
		}
		
		.hidden {
		  display: none;
		}     	
		
		.guest_input {width: 193px; height: 26px; border-width: 1px; border-style: solid; border-radius: 5px; padding-left: 8px;}
    </style>
</head>
<body>
	<header>	
		<jsp:include page="../main/header.jsp"/>	
	</header>
	
	<!-- 페이지 제목 -->
	<div id="title_box">
		<table id="tb_title_box">
            <tr>
                <td id="td_title_box">
                    <span id="page_title">주문결제</span>
                </td>
                <td id="td_title_box_step">
                    <span class="title_box_step_num">01</span>
                    <span class="title_box_step_name">장바구니</span>
                    <span class="title_box_step_next"> &nbsp;>&nbsp; </span>
                    <span class="title_box_step_num on">02</span>
                    <span class="title_box_step_name on">주문/결제</span>
                    <span class="title_box_step_next on"> &nbsp;>&nbsp; </span>
                    <span class="title_box_step_num">03</span>
                    <span class="title_box_step_name">주문완료</span>
                </td>
            </tr>
        </table>
	</div>
	<h2 class="sub_title">배송지 정보</h2>
	<div id="delivery_info">
        <table id="tb_delivery_info">
        	<c:choose>
        		<c:when test="${!empty member}">
        			<!-- 회원만 배송지 정보 선택할 수 있게 처리 -->
		            <tr>
		                <td class="td_delivery_title top bottom title">배송지선택</td>
		                <td class="td_delivery_content top bottom">
		                    <select name="delivery_address_name" id="delivery_address_name">
		                        <option value="1">집</option>
		                        <option value="2">학원</option>
		                    </select>
		                </td>
		            </tr>
		            <tr>
		                <td class="td_delivery_title bottom title">배송지명</td>
		                <!-- 배송지선택의 select값에 따라 변경 -->
		                <td class="td_delivery_content bottom">집</td>
		            </tr>
        		</c:when>
        		<c:otherwise>
		            <tr>
		                <td class="top"></td>
		                <td class="top">
		            </tr>
        		</c:otherwise>
        	</c:choose>
            
            <tr>
                <td class="td_delivery_title bottom title">받는분</td>
                <td class="td_delivery_content bottom">
                    <input class="input_focus" type="text" name="delivery_get_name" id="delivery_get_name" value="">
                </td>
            </tr>
            <tr>
                <td class="td_delivery_title bottom title">연락처</td>
                <td class="td_delivery_content bottom">
                    <input type="text" class="guest_input" id="delivery_handphone" placeholder="-없이 연락처를 입력해주세요.">
                </td>
            </tr>
            <tr>
                <td class="td_delivery_address_title bottom title">주소</td>
                <td class="td_delivery_address_content bottom">
                    <input type="text" class="gray_bg" name="delivery_postNum" id="delivery_postNum" value="" readonly="readonly">
                    <input type="button" name="delivery_postNum_btn" id="delivery_postNum_btn" value="우편번호찾기"><br>
                    <input type="text" class="gray_bg" name="delivery_address" id="delivery_address" value="" readonly="readonly"><br>
                    <input type="text" name="delivery_address2" id="delivery_address2" value="">
                </td>
            </tr>
        </table>
    </div>	

	<h2 class="sub_title">배송 요청사항</h2>
	<div id="delivery_info">
        <table id="tb_delivery_info">
            <tr>
                <td class="td_delivery_title top bottom title">배송 메시지</td>
                <td class="td_delivery_content top bottom">
                    <select name="delivery_message" id="delivery_message">
                        <option value="">배송메시지를 선택해주세요</option>
                        <option value="그냥 문 앞에 놓아주시면 돼요.">그냥 문 앞에 놓아주시면 돼요.</option>
                        <option value="직접 받을게요.(부재시 문앞)">직접 받을게요.(부재시 문앞)</option>
                        <option value="벨을 누르지 말아주세요.">벨을 누르지 말아주세요.</option>
                        <option value="도착 후 전화주시면 직접 받으러 갈게요.">도착 후 전화주시면 직접 받으러 갈게요.</option>
                        <option id="delivery_message_option" value="">직접 입력하기</option>
                    </select>
                    <br>
                    <input id="delivery_message_text" type="hidden">
                </td>
            </tr>
            <tr>
                <td class="td_delivery_title bottom title">공동현관 출입방법</td>
                <td class="td_delivery_content bottom">
                    <span class="dv_input"><input type="radio" name="dv_input" id="dv_input_1" value="0"><label for="dv_input_1"> 비밀번호</label></span>
                    <span class="dv_input"><input type="radio" name="dv_input" id="dv_input_2" value="1"><label for="dv_input_2"> 경비실 호출</label></span>
                    <span class="dv_input"><input type="radio" name="dv_input" id="dv_input_3" value="2"><label for="dv_input_3"> 자유출입가능</label></span>
                    <span class="dv_input"><input type="radio" name="dv_input" id="dv_input_4" value="3"><label for="dv_input_4"> 기타사항</label></span>
                </td>
            </tr>
            <tr id="delivery_input_method">
                <td class="td_delivery_title bottom title">공동현관 비밀번호</td>
                <td class="td_delivery_content bottom">
                    <input class="input_focus" type="text" name="delivery_get_name" id="delivery_get_method" value="">
                </td>
            </tr> 
        </table>
    </div>	

    <h2 class="sub_title">배송상품</h2>
	<div id="delivery_item">
        <table id="tb_delivery_item">
            <tr id="tr_delivery_title">
                <th id="th_product_info">상품정보</th>
                <th id="th_sell_price">판매가</th>
                <th id="th_product_count">수량</th>
                <th id="th_buy_price">구매가</th>
            </tr>
            <!-- 장바구니 개수 따라서 forEach, el문 -->
            <c:forEach var="rowNum" begin="1" end="${listCount}">
            <tr class="tr_delivery_content">
               <td class="td_product_info">
                    <div class="basket_item">
                        <a class="prd_name" href="${pageContext.request.contextPath}/product/product_view.do?prdNum=${basketList[rowNum-1].product_idx}">
                            <img src="../resources/img/${basketList[rowNum-1].saveFile}" width="85px" height="85px" alt="썸네일 이미지">
                        </a>
                        <a class="prd_name" href="${pageContext.request.contextPath}/product/product_view.do?prdNum=${basketList[rowNum-1].product_idx}">
	                        <span class="prd_seller">${basketList[rowNum-1].member_nickname}</span>
	                        <p class="prd_title">${basketList[rowNum-1].product_name}</p>
                        </a>
                    </div>
               </td>
               <td class="td_sell_price">
                    <fmt:formatNumber value="${basketList[rowNum-1].product_price}" pattern="###,###" />원
               </td>
               <td class="td_product_count">
                    ${basketList[rowNum-1].basket_count}
               </td>
               <td class="td_buy_price">
                     <fmt:formatNumber value="${basketList[rowNum-1].product_price * basketList[rowNum-1].basket_count}" pattern="###,###" />원
               </td>
            </tr>
            </c:forEach>            
        </table>
    </div>	

    <!-- 결제관련한 사항들 div -->
    <div class="order_payment_box">
        <div class="left_area">
        
			<c:if test="${!empty member}">
            <!-- 쿠폰은 로그인된 회원에게만 보이게 처리 -->
            <h2 class="sub_title">[회원] 쿠폰 할인</h2>
            <div id="coupon_info">
                <table id="tb_coupon_info">
                    <tr>
                        <td class="td_coupon_title top bottom title">할인 정보</td>
                        <td class="td_coupon_content top bottom">
                            <select name="coupon" id="coupon">
                                <!-- 로그인되어있는 회원의 쿠폰 불러오기 -->
                                <option value="0">적용 안함</option>
                                <option value="1">신규 가입 환영 20% 할인</option>
                            </select>
                            <!-- 결제금액에 할인정보 계산한 결과 값 -->
                            <p class="txt_right_discount"> - 0원</p>
                        </td>
                    </tr>                   
                </table>
            </div>	
			</c:if>
			
			<c:if test="${empty member}">
			<h2 class="sub_title">[비회원] 주문자 정보 입력</h2>
            <div id="coupon_info">
                <table id="tb_coupon_info">
                    <tr>
                        <td class="td_coupon_title top bottom title">이름</td>
                        <td class="td_coupon_content top bottom">
                            <input type="text" class="guest_input"  id="guest_name"> 
                        </td>
                    </tr> 
                    <tr>
                        <td class="td_coupon_title bottom title">연락처</td>
                        <td class="td_coupon_content bottom">
                            <input type="text" class="guest_input" id="guest_phone" placeholder="-없이 연락처를 입력해주세요."> 
                        </td>
                    </tr> 
                    <tr>
                        <td class="td_coupon_title bottom title">이메일</td>
                        <td class="td_coupon_content bottom">
                            <input type="text" class="guest_input"  id="guest_email"> 
                        </td>
                    </tr>                                                           
                </table>
            </div>	
			</c:if>
            
        </div>

        <div class="right_area">
            <h2 class="sub_title right_title">최종 결제정보</h2>
            <div class="total_payment_box">
                <table class="tb_total_payment_box">
                    <tr>
                        <td class="td_pay_title">총 상품금액</td>
                        <td class="td_pay_content">
                            <fmt:formatNumber value="${total_price}" pattern="###,###" />원
                        </td>
                    </tr>
                    <tr>
                        <td class="td_pay_title bottom pay_bottom">쿠폰할인금액</td>
                        <td class="td_pay_content bottom discount">
                            - 0원
                        </td>
                    </tr>
                    <tr>
                        <td class="td_pay_title middle">총 배송비</td>
                        <td class="td_pay_content middle">
                            + <fmt:formatNumber value="${total_delivery}" pattern="###,###" />원
                        </td>
                    </tr>
                    <tr>
                        <td class="td_pay_title top total_pay_price_title middle">
                            최종 결제금액
                        </td>
                        <td class="td_pay_content top discount middle">
                            <span class="total_pay_price">
                            <fmt:formatNumber value="${total_price + total_delivery}" pattern="###,###" />
                            </span>원
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" class="td_order_btn">
                            <input type="submit" name="order_btn" id="order_btn" value="결제하기">
	                        <input type="hidden" id="order_member_idx" value="${member.member_idx}">
	                        <input type="hidden" id="order_member_email" value="${member.member_email}">
	                        <input type="hidden" id="order_member_name" value="${member.member_name}">
	                        <input type="hidden" id="order_member_phone" value="${member.member_handphone}">
	                        <input type="hidden" id="order_client_num" value="${client_num}">
                        </td>
                    </tr>
                </table>
            </div>
            <!-- 결제하기 버튼 누를시 전송되는 값들 -->
            <form name="order_form" id="order_form" action="order_process.do" method="post">
            <input type="hidden" id="clientNum" name="client_num" value="">
            <input type="hidden" id="order_form_delivery_get_name" name="delivery_get_name" value="">
            <input type="hidden" id="order_form_delivery_handphone" name="delivery_handphone" value="">
            <input type="hidden" id="order_form_delivery_message" name="delivery_message" value="">
            <input type="hidden" id="order_form_delivery_pass" name="delivery_pass" value="">
            <input type="hidden" id="order_form_delivery_pass_content" name="delivery_pass_content" value="">
            <input type="hidden" id="order_form_delivery_postNum" name="delivery_postNum" value="">
            <input type="hidden" id="order_form_delivery_address" name="delivery_address" value="">
            <input type="hidden" id="order_form_delivery_address2" name="delivery_address2" value="">            
            </form>                       
        </div> <!-- end of right_area -->
    </div> <!-- end of order_payment_box -->

    <!-- float 속성 해제 -->
    <div class="clean"></div>
    <footer>
		<jsp:include page="../main/footer.jsp"/>		
	</footer>
</body>
</html>