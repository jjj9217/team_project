<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문/결제 | CrueltyFree</title>
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
        #delivery_address_name, #delivery_get_name{width: 193px; height: 26px; border-width: 1px; border-style: solid; border-radius: 5px; padding-left: 8px;}
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
            <tr>
                <td class="td_delivery_title bottom title">받는분</td>
                <td class="td_delivery_content bottom">
                    <input class="input_focus" type="text" name="delivery_get_name" id="delivery_get_name" value="정종진">
                </td>
            </tr>
            <tr>
                <td class="td_delivery_title bottom title">연락처</td>
                <td class="td_delivery_content bottom">
                    <select name="delivery_handphone_begin" id="delivery_handphone_begin">
                        <option value>선택</option>
                        <option value="010" selected="selected">010</option>
                        <option value="011">011</option>
                        <option value="016">016</option>
                        <option value="017">017</option>
                        <option value="018">018</option>
                        <option value="019">019</option>
                        <option value="02">02</option>
                        <option value="031">031</option>
                        <option value="032">032</option>
                        <option value="033">033</option>
                        <option value="041">041</option>
                        <option value="042">042</option>
                        <option value="043">043</option>
                        <option value="051">051</option>
                        <option value="052">052</option>
                        <option value="053">053</option>
                        <option value="061">061</option>
                        <option value="062">062</option>
                        <option value="063">063</option>
                        <option value="064">064</option>
                    </select>-
                    <input type="text" name="delivery_handphone_middle" id="delivery_handphone_middle" value="9388">-
                    <input type="text" name="delivery_handphone_end" id="delivery_handphone_end" value="8058">
                </td>
            </tr>
            <tr>
                <td class="td_delivery_address_title bottom title">주소</td>
                <td class="td_delivery_address_content bottom">
                    <input type="text" class="gray_bg" name="delivery_postNum" id="delivery_postNum" value="31572" readonly="readonly">
                    <input type="button" name="delivery_postNum_btn" id="delivery_postNum_btn" value="우편번호찾기"><br>
                    <input type="text" class="gray_bg" name="delivery_address" id="delivery_address" value="도로명:충남 아산시 어의정로 46(용화동, 온천마을아파트)" readonly="readonly"><br>
                    <input type="text" name="delivery_address2" id="delivery_address2" value="102-1107">
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
                        <option value>배송메시지를 선택해주세요</option>
                        <option value="1">그냥 문 앞에 놓아주시면 돼요.</option>
                        <option value="2">직접 받을게요.(부재시 문앞)</option>
                        <option value="3">벨을 누르지 말아주세요.</option>
                        <option value="4">도착 후 전화주시면 직접 받으러 갈게요.</option>
                        <option value="5">직접 입력하기</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td class="td_delivery_title bottom title">공동현관 출입방법</td>
                <td class="td_delivery_content bottom">
                    <span class="dv_input"><input type="radio" name="dv_input" id="dv_input_1" value="1"><label for="dv_input_1"> 비밀번호</label></span>
                    <span class="dv_input"><input type="radio" name="dv_input" id="dv_input_2" value="2"><label for="dv_input_2"> 경비실 호출</label></span>
                    <span class="dv_input"><input type="radio" name="dv_input" id="dv_input_3" value="3"><label for="dv_input_3"> 자유출입가능</label></span>
                    <span class="dv_input"><input type="radio" name="dv_input" id="dv_input_4" value="4"><label for="dv_input_4"> 기타사항</label></span>
                </td>
            </tr>
            <tr id="delivery_input_method">
                <td class="td_delivery_title bottom title">공동현관 비밀번호</td>
                <td class="td_delivery_content bottom">
                    <input class="input_focus" type="text" name="delivery_get_name" id="delivery_get_name" value="1234">
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
            <tr class="tr_delivery_content">
               <td class="td_product_info">
                    <div class="basket_item">
                        <a class="prd_name" href="#">
                            <img src="../resources/img/test01.jpg" width="85px" height="85px" alt="다람쥐1">
                        </a>
                        <a class="prd_name" href="#">
                            <span class="prd_seller">람쥐천국</span>
                            <p class="prd_title">람쥐천국 기획행사 한국산 다람쥐털 볶음밥 1+1기획</p>
                        </a>
                    </div>
               </td>
               <td class="td_sell_price">
                    4,500원
               </td>
               <td class="td_product_count">
                    1
               </td>
               <td class="td_buy_price">
                    4,500원
               </td>
            </tr>
            <tr class="tr_delivery_content">
                <td class="td_product_info">
                    <div class="basket_item">
                        <a class="prd_name" href="#">
                            <img src="../resources/img/test02.jpg" width="85px" height="85px" alt="다람쥐1">
                        </a>
                        <a class="prd_name" href="#">
                            <span class="prd_seller">라쿤보호협회</span>
                            <p class="prd_title">라쿤보호협회 이벤트상품 한정판 고급 라쿤뒷다리살튀김 </p>
                        </a>
                    </div>
               </td>
               <td class="td_sell_price">
                    13,500원
               </td>
               <td class="td_product_count">
                    2
               </td>
               <td class="td_buy_price">
                    27,000원
               </td>
            </tr> 
        </table>
    </div>	

    <!-- 결제관련한 사항들 div -->
    <div class="order_payment_box">
        <div class="left_area">

            <!-- 쿠폰은 로그인된 회원에게만 보이게 처리 -->
            <h2 class="sub_title">쿠폰 할인</h2>
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
                            <p class="txt_right_discount"> - 6,300원</p>
                        </td>
                    </tr>                   
                </table>
            </div>	

            <!-- 결제 API에 따라 변경 가능성 많음 -->
            <h2 class="sub_title">결제 수단 선택</h2>
            <div id="coupon_info">
                <table id="tb_coupon_info">
                    <tr>
                        <td class="td_payment_method top bottom" colspan="2">
                            <span class="payment_method_radio"><input type="radio" name="payment_method" id="payment_method_1" value="1"><label for="payment_method_1"> 신용카드</label></span>
                            <span class="payment_method_radio"><input type="radio" name="payment_method" id="payment_method_2" value="2"><label for="payment_method_2"> 무통장입금</label></span>
                            <span class="payment_method_radio"><input type="radio" name="payment_method" id="payment_method_3" value="3"><label for="payment_method_3"> PAYCO</label></span>
                            <span class="payment_method_radio"><input type="radio" name="payment_method" id="payment_method_4" value="4"><label for="payment_method_4"> 카카오페이</label></span>
                            <br>
                            <span class="payment_method_radio"><input type="radio" name="payment_method" id="payment_method_5" value="5"><label for="payment_method_5"> 네이버페이</label></span>
                            <span class="payment_method_radio"><input type="radio" name="payment_method" id="payment_method_6" value="6"><label for="payment_method_6"> 휴대폰결제</label></span>
                            <span class="payment_method_radio"><input type="radio" name="payment_method" id="payment_method_7" value="7"><label for="payment_method_7"> 계좌이체</label></span>
                            <span class="payment_method_radio"><input type="radio" name="payment_method" id="payment_method_8" value="8"><label for="payment_method_8"> 도서상품권</label></span>
                            <br>
                            <span class="payment_method_radio"><input type="radio" name="payment_method" id="payment_method_9" value="9"><label for="payment_method_9"> 문화상품권</label></span>
                        </td>                        
                    </tr>
                    <tr>
                        <td class="td_coupon_title bottom title">카드 종류</td>
                        <td class="td_coupon_content bottom">
                            <select name="credit_card" id="credit_card">
                                <option value>카드를 선택해주세요</option>
                                <option value="1">BC 카드</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td class="td_coupon_title bottom title">할부 종류</td>
                        <td class="td_coupon_content bottom">
                            <select name="credit_card" id="credit_card">
                                <option value="0">일시불</option>
                                <option value="1">1개월</option>
                            </select>
                        </td>
                    </tr>                              
                </table>
            </div>	
        </div>

        <div class="right_area">
            <h2 class="sub_title">최종 결제정보</h2>
            <div class="total_payment_box">
                <table class="tb_total_payment_box">
                    <tr>
                        <td class="td_pay_title">총 상품금액</td>
                        <td class="td_pay_content">
                            34,000원
                        </td>
                    </tr>
                    <tr>
                        <td class="td_pay_title bottom pay_bottom">쿠폰할인금액</td>
                        <td class="td_pay_content bottom discount">
                            - 6,300원
                        </td>
                    </tr>
                    <tr>
                        <td class="td_pay_title middle">총 배송비</td>
                        <td class="td_pay_content middle">
                            + 2,500원
                        </td>
                    </tr>
                    <tr>
                        <td class="td_pay_title top total_pay_price_title middle">
                            최종 결제금액
                        </td>
                        <td class="td_pay_content top discount middle">
                            <span class="total_pay_price">30,200</span>원
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" class="td_order_btn">
                            <input type="submit" name="order_btn" id="order_btn" value="결제하기">
                        </td>
                    </tr>
                </table>
            </div>
            
            <!-- 약관동의 창 -->
            <div class="agree_payment_box">
                <div class="all_agree">
                    주문 상품정보 및 결제대행 서비스 이용약관에 모두 동의하십니까?<br><br>
                    <input type="checkbox" name="all_agree_check" id="all_agree_check">
                    <span class="all_agree_text"><label for="all_agree_check"> 모두동의</label></span>
                    <span id="all_agree_open">^</span>
                </div>
                <div class="other_agree">
                    <table class="tb_other_agree">
                        <tr>
                            <td class="all_agree_text">
                                주문 상품정보에 대한 동의
                            </td>
                        </tr>
                        <tr>
                            <td class="bottom">
                                <div class="agree_box">
                                    <span class="agree_check_area"><input type="checkbox" name="agree_check" id="agree_check_1"></span>
                                    <label for="agree_check_1"><span class="agree_check_text"> 주문하실 상품, 가격, 배송정보, 할인내역등을 최종 확인하였으며, 구매에 동의합니다.</span></label>
                                </div>                                
                            </td>
                        </tr>
                        <tr>
                            <td class="all_agree_text">
                                결제대행 서비스 이용약관 동의
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <span class="agree_check_area"><input type="checkbox" name="agree_check" id="agree_check_2"></span>
                                <label for="agree_check_2"><span class="agree_check_text_small"> 전자금융거래기본약관</span></label>
                                <span class="agree_check_btn_area">
                                    <input type="button" class="agree_check_btn" id="agree_check_btn_1" value="약관보기">
                                </span>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <span class="agree_check_area"><input type="checkbox" name="agree_check" id="agree_check_3"></span>
                                <label for="agree_check_3"><span class="agree_check_text_small"> 개인정보 수집 및 이용동의</span></label>
                                <span class="agree_check_btn_area">
                                    <input type="button" class="agree_check_btn" id="agree_check_btn_2" value="약관보기">
                                </span>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <span class="agree_check_area"><input type="checkbox" name="agree_check" id="agree_check_4"></span>
                                <label for="agree_check_4"><span class="agree_check_text_small"> 개인정보 제공 및 위탁 동의</span></label>
                                <span class="agree_check_btn_area">
                                    <input type="button" class="agree_check_btn" id="agree_check_btn_3" value="약관보기">
                                </span>
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
    </div>

    <!-- float 속성 해제 -->
    <div class="clean"></div>
    <footer>
		<jsp:include page="../main/footer.jsp"/>		
	</footer>
</body>
</html>