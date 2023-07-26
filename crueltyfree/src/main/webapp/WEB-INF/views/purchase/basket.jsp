<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니 | CrueltyFree</title>

    <style>
        *{margin: 0; padding: 0;}
        a{text-decoration: none;}
        input[type="button"], input[type="submit"], input[type="checkbox"], select{cursor: pointer;}
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
        #title_num{
            display: inline-block;
            width: 36px;
            height: 36px;
            line-height: 36px;
            font-size: 16px;
            color: #fff;
            background: #7d99a4;
            border-radius: 18px;
            text-align: center;
            vertical-align: 10px;
        }
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
        #basket_box, #tb_basket_box{width: 1020px; height: auto;}
        #th_all_checkbox{width: 40px; height: 40px;} .td_checkbox{width: 40px; height: 152px; text-align: center;}
        #th_product_info{width: 390px; height: 40px;} .td_product_info{width: 390px; height: 152px; text-align: center;}
        #th_sell_price{width: 110px; height: 40px;} .td_sell_price{width: 110px; height: 152px; text-align: center; color: #4a4a4a; font-weight: bold; font-size: 14px;}
        #th_product_count{width: 100px; height: 40px;} .td_product_count{width: 100px; height: 152px; text-align: center;}
        #th_buy_price{width: 110px; height: 40px;} .td_buy_price{width: 110px; height: 152px; text-align: center; color: #7d99a4; font-weight: bold; font-size: 14px;}
        #th_delivery_info{width: 120px; height: 40px;} .td_delivery_info{width: 120px; height: 152px; text-align: center;}
        #th_select{width: 150px; height: 40px;} .td_select{width: 150px; height: 152px; text-align: center;}
        
        .basket_item{
            display: flex;
            flex-wrap: wrap; 
            width: 390px; height: 152px;
            justify-content: center;
            align-items: center;
        }
        .prd_seller{
            display: inline-block;
            width: 235px; height: 20px;
            color:#4a4a4a;
            font-size: 15px; font-weight: bold;
            margin-bottom: 10px;
            text-align: left;
            margin-left: 15px;
        }
        .prd_title{
            width: 235px; height: 36px;
            color:black;
            font-size: 14px;
            margin-bottom: 5px;
            text-align: left;
            margin-left: 15px;
        }
        .count_item{
            display: flex;
            justify-content: center;
            align-items: center;
        }
        .count_plus_btn, .count_minus_btn{
            width: 15px; height: 15px;
            text-align: center;
            border: 1px solid #a4a4a4;
        }
        .basket_count{
            width: 48px; height: 24px;
            margin-left: 5px; margin-right: 5px;
            text-align: center;
            border: 1px solid #a4a4a4;
            border-radius: 4px;
        }
        .delivery_price{font-size: 14px; font-weight: bold; color: #4a4a4a;}
        .delivery_notice{font-size: 12px; color:#a4a4a4;}
        .select_item{display: flex; flex-wrap: wrap; justify-content: center; align-items: center; width: 149px; height: 99px;}
        .select_item_buy{
            width: 109px; height: 28px;
            background-color: #fff;
            border: 2px solid #7d99a4;
            color: #7d99a4;
            font-weight: bold;
            border-radius: 9px;
        }
        .select_item_delete{
            width: 109px; height: 28px;
            background-color: #fff;
            border: 1px solid #a4a4a4;
            color: #4a4a4a;
            font-weight: bold;
            border-radius: 9px;
        }
        #tb_basket_box{border-collapse: collapse;}
        #basket_box th{background-color: #eef3f5;}
        #tb_basket_box th{border-top: 2px solid #4a4a4a; border-bottom: 1px solid #a4a4a4;}
        #tb_basket_box td{border: 1px solid #a4a4a4;}
        #tb_basket_box .td_checkbox, #tb_basket_box .td_product_info{border-left: 0px;}
        #tb_basket_box .td_select, #tb_basket_box .td_checkbox{border-right: 0px;}

        .basket_price_info, #tb_basket_price_info{width: 1028px; height: 28px; margin-top: 10px;}
        .basket_price_btn{width: 300px; height: 28px;display: flex; align-items: center;}
        #td_basket_sum_price{width: 700px; height: 19px; text-align: right;}
        .basket_sum_price{width: 700px; height: 19px; text-align: right;}

        #select_prd_item_delete, #sold_out_item_delete{
            width: 101px; height: 28px; 
            margin: 0 2px;
            background-color: #fff;
            border: 1px solid #a4a4a4;
            color: #4a4a4a;
            font-size: 12px;
            font-weight: bold;
            border-radius: 4px;
        }
        .basket_sum_text{color: #4a4a4a; font-size: 14px; font-weight: bold;} 
        .basket_sum_result_text{color: #7d99a4; font-size: 14px; font-weight: bold;}
        
        .total_price_info{margin-top: 60px;}
        .total_price_info, #tb_total_price_info{width: 1020px; height: 190px;}
        #td_total_buy_price, #td_total_delivery_price{width: 510px; height: 110px; text-align: center;}
        #td_total_sum_price_notice{width: 490px; height: 80px; text-align: left; padding-left: 20px;}
        #td_total_sum_price{width: 490px; height: 80px; text-align: right; padding-right:  20px;}

        #tb_total_price_info{border-collapse: collapse;}
        #tr_total_sum td{
            border-top: 2px solid #7d99a4;
            border-bottom: 2px solid #4a4a4a;
        }
        #tr_total_sum_price td{
            background-color: #eef3f5;
            border-bottom: 1px solid #4a4a4a;
        }

        .price_text{font-size: 16px; font-weight: bold;}
        .price_num, .total_price_text{font-size: 24px; font-weight: bold;}
        #total_price_noitce_text{font-size: 14px; color: #4a4a4a; font-weight: bold;}
        .total_price_num{font-size: 24px; color:#7d99a4; font-weight: bold;}
        #total_price_noitce{
            display: inline-block;
            width: 22px;
            height: 22px;
            line-height: 22px;
            font-size: 14px;
            color: #fff;
            background:#a4a4a4;
            border-radius: 18px;
            text-align: center;
        }
        .basket_order_btn{
            width: 1020px; height: 50px; 
            margin-top: 30px;
            margin-bottom: 60px;
            display: flex;
            justify-content: center;
            align-items: center;
        }
        .select_order_btn{
            width: 180px; height: 45px;
            margin: 0 5px;
            background: #fff;
            color: #7d99a4;
            font-weight: bold;
            border-radius: 24px;
            border: 2px solid #7d99a4;
        }
        .all_order_btn{
            width: 180px; height: 45px;
            margin: 0 5px;
            background: #7d99a4;
            color: #fff;
            font-weight: bold;
            border-radius: 24px;
            border: 2px solid #7d99a4;
        }
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
                    <span id="page_title">장바구니</span>
                    <!-- 아래 숫자 장바구니 개수 el로 변경해야함-->
                    <span id="title_num">2</span>
                </td>
                <td id="td_title_box_step">
                    <span class="title_box_step_num on">01</span>
                    <span class="title_box_step_name on">장바구니</span>
                    <span class="title_box_step_next on"> &nbsp;>&nbsp; </span>
                    <span class="title_box_step_num">02</span>
                    <span class="title_box_step_name">주문/결제</span>
                    <span class="title_box_step_next"> &nbsp;>&nbsp; </span>
                    <span class="title_box_step_num">03</span>
                    <span class="title_box_step_name">주문완료</span>
                </td>
            </tr>
        </table>
	</div>
    <h2 class="sub_title">장바구니 상품목록</h2>
    <!-- 장바구니 목록 -->    
    <div id="basket_box">
        <table id="tb_basket_box">
            <tr id="tr_basket_title">
                <th id="th_all_checkbox"><input type="checkbox" name="all_checkbox"value=""></th>                
                <th id="th_product_info">상품정보</th>
                <th id="th_sell_price">판매가</th>
                <th id="th_product_count">수량</th>
                <th id="th_buy_price">구매가</th>
                <th id="th_delivery_info">배송정보</th>
                <th id="th_select">선택</th>                
            </tr>
            <!-- 이 밑 tr은 foreach문 사용하여 리스트, 각 td el문으로 들어갈 예정 -->
                <tr class="tr_basket_content">
                    <td class="td_checkbox"><input type="checkbox" name="all_checkbox" value=""></td>
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
                        <div class="count_item">
                            <input type="button" class="count_plus_btn" value="-">
                            <input type="text" name="basket_count" class="basket_count" value="1">
                            <input type="button" class="count_minus_btn" value="+">
                        </div>                    
                    </td>
                    <td class="td_buy_price">
                        4,500원
                    </td>
                    <td class="td_delivery_info">
                        <!-- 배송비 0일때 아래문구, 0초과시 해당 가격-->
                        <span class="delivery_price">무료배송</span><br>
                        <span class="delivery_notice">도서·산간제외</span>
                    </td>
                    <td class="td_select">
                        <div class="select_item">
                            <input type="button" class="select_item_buy" value="바로구매">
                            <input type="button" class="select_item_delete" value="X 삭제">
                        </div>  
                    </td>
                </tr>
                
                <tr class="tr_basket_content">
                    <td class="td_checkbox"><input type="checkbox" name="all_checkbox" value=""></td>
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
                        <div class="count_item">
                            <input type="button" class="count_plus_btn" value="-">
                            <input type="text" name="basket_count" class="basket_count" value="2">
                            <input type="button" class="count_minus_btn" value="+">
                        </div>                    
                    </td>
                    <td class="td_buy_price">
                        27,000원
                    </td>
                    <td class="td_delivery_info">
                        <span class="delivery_price">2,500원</span>
                    </td>
                    <td class="td_select">
                        <div class="select_item">
                            <input type="button" class="select_item_buy" value="바로구매">
                            <input type="button" class="select_item_delete" value="X 삭제">
                        </div>  
                    </td>
                </tr>
        </table>
    </div>	
    
    <!-- 하위 내용 장바구니 내용물 있을때만 보이게 함 -->
    <!-- 장바구니 내부 상품 체크박스이용 삭제버튼, 장바구니 내용물 총합 -->
    <div class="basket_price_info">
        <table id="tb_basket_price_info">
            <tr>
                <td id="td_basket_price_btn">
                    <div class="basket_price_btn">
                        <input type="button" id="select_prd_item_delete" value="선택상품 삭제">
                        <input type="button" id="sold_out_item_delete" value="품절상품 삭제">
                    </div>
                </td>
                <td id="td_basket_sum_price">
                    <div class="basket_sum_price">
                        <span class="basket_sum_text">총 구매가 31,500원 + 배송비 2,500원 =</span>
                        <span class="basket_sum_result_text">총 결제금액 34,000원</span>
                    </div>
                </td>
            </tr>
        </table>   
    </div>
    <!-- 구매단계 넘어가기전 총 가격 표시 -->
    <div class="total_price_info">
        <table id="tb_total_price_info">
            <tr id="tr_total_sum">
                <td id="td_total_buy_price">
                    <span class="price_text">총 구매가</span><br>
                    <span class="price_num">31,500원</span>
                </td>
                <td id="td_total_delivery_price">
                    <span class="price_text">배송비</span><br>
                    <span class="price_num">2,500원</span>                 
                </td>
            </tr>
            <tr id="tr_total_sum_price">
                <td id="td_total_sum_price_notice">
                    <span id="total_price_noitce">!</span>
                    <span id="total_price_noitce_text">배송비는 쿠폰할인금액에 따라 변경될 수 있습니다.</span><br>
                </td>
                <td id="td_total_sum_price">
                    <span class="total_price_text">총 결제예상금액&nbsp;&nbsp;</span>
                    <span class="total_price_num">2,500</span>
                    <span class="total_price_text">원</span>                 
                </td>
            </tr>
        </table>     
    </div>
    <!-- 장바구니 주문 버튼 -->
    <div class="basket_order_btn">
        <input type="button" class="select_order_btn" value="선택주문(2)">
        <input type="button" class="all_order_btn" value="전체주문">
    </div>
	<footer>
		<jsp:include page="../main/footer.jsp"/>		
	</footer>
</body>
</html>