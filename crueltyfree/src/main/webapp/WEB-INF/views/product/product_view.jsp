<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>{상품이름} | CrueltyFree</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
$(function(){
	//상세보기탭 상품설명 클릭
	$("#product_info").click(function(){
		$(this).addClass("tap_open");
		$("#buy_info").removeClass("tap_open");
		$("#review_info").removeClass("tap_open");
		$("#qna_info").removeClass("tap_open");
		$("#prd_content_box").addClass("show");
		$("#buy_content_box").removeClass("show");
		$("#review_content_box").removeClass("show");
		$("#qna_content_box").removeClass("show");
	});
	//상세보기탭 구매정보 클릭
	$("#buy_info").click(function(){
		$(this).addClass("tap_open");
		$("#product_info").removeClass("tap_open");
		$("#review_info").removeClass("tap_open");
		$("#qna_info").removeClass("tap_open");
		$("#buy_content_box").addClass("show");
		$("#prd_content_box").removeClass("show");
		$("#review_content_box").removeClass("show");
		$("#qna_content_box").removeClass("show");
	});
	//상세보기탭 리뷰 클릭
	$("#review_info").click(function(){
		$(this).addClass("tap_open");
		$("#buy_info").removeClass("tap_open");
		$("#product_info").removeClass("tap_open");
		$("#qna_info").removeClass("tap_open");
		$("#review_content_box").addClass("show");
		$("#buy_content_box").removeClass("show");
		$("#prd_content_box").removeClass("show");
		$("#qna_content_box").removeClass("show");
	});
	//상세보기탭 상품문의 클릭
	$("#qna_info").click(function(){
		$(this).addClass("tap_open");
		$("#buy_info").removeClass("tap_open");
		$("#review_info").removeClass("tap_open");
		$("#product_info").removeClass("tap_open");
		$("#qna_content_box").addClass("show");
		$("#buy_content_box").removeClass("show");
		$("#review_content_box").removeClass("show");
		$("#prd_content_box").removeClass("show");
	});
	
	//상품문의 질문 클릭
	$(".qna_content").click(function(){
	    var index = $(".qna_content").index(this);
	    var targetDetail = $(".qna_detail_content").eq(index);
	    
	    $(".qna_detail_content").not(targetDetail).removeClass("show");
	    targetDetail.toggleClass("show");			
	});
});
</script>
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
     .prd_detail_box{
         display: block; width: 1020px; height: auto; margin-top: 40px; padding-top: 35px; border-top: 1px solid #4a4a4a;
     }
     .left_area{
         display: block; float: left; width: 510px; height: auto;
     }
     .right_area{
         display: block; float: right; width: 450px; height: auto;
     }
     .clean{clear: both;}

     .prd_img img{ width: 510px; height: 510px;}
     .prd_review_score_avg{width: 480px; height: 33px; padding: 30px 15px 0 15px; font-size: 18px;}        
     .txt_blue{color: #7d99a4;}
     .prd_info{width: 450px; height: auto;}
     .prd_seller{color: #4a4a4a; font-weight: bold;}
     .prd_name{margin-top: 10px; font-size: 26px; line-height: 34px;}
     .prd_price{margin: 15px 0; color: #7d99a4; font-size: 28px; font-weight: bold;}
     .prd_delivery_info{width: 450px; height: auto; padding: 15px 0; border-bottom: 1px solid #4a4a4a;}
     .prd_delivery_title{width: 450px; height: 30px; font-weight: bold; font-size: 18px;}
     .prd_delivery_box{display: flex; flex-wrap: wrap; width: 450px; height: 40px;}
     .delivery_title{display: block; width: 80px; height: 40px; color: #4a4a4a; font-weight: bold;} 
     .delivery_content{display: block;  width: 360px; height: 40px; color: #4a4a4a; padding-left: 10px;}
     .prd_cnt_box{display: flex; flex-wrap: wrap; width: 408px; height: 30px; line-height: 30px; margin-top: 20px; padding: 15px 20px; background-color: #eef3f5; border: 1px solid #4a4a4a;}
     .prd_cnt_title{display: flex; font-size: 14px; font-weight: bold; color: #4a4a4a;}
     .prd_cnt_area{display: flex; align-items: center; padding-left: 230px; width: 120px; height: 30px;}
     #prd_cart_minus_btn, #prd_cart_plus_btn{width: 28px; height: 28px; color: #4a4a4a; font-weight: bold; font-size: 14px;}
     #prd_cart_minus_btn{border-left: 1px solid #4a4a4a; border-right: 0; border-top: 1px solid #4a4a4a; border-bottom: 1px solid #4a4a4a; border-radius: 5px 0 0 5px;}
     #prd_cart_plus_btn{border-left: 0; border-right: 1px solid #4a4a4a; border-top: 1px solid #4a4a4a; border-bottom: 1px solid #4a4a4a; border-radius: 0 5px 5px 0;}
     #prd_cart_cnt{width: 40px; height: 26px; border-radius: 0%; border-left: 0; border-right: 0; border-top: 1px solid #4a4a4a; border-bottom: 1px solid #4a4a4a; text-align: center;}
     #prd_cart_cnt:focus{outline: none;}
     .prd_total_price{width: 450px; height: 40px; padding-top: 18px; border-bottom: 2px solid #7d99a4; margin-top: 10px;}
     .prd_total_price_title{font-size: 22px; font-weight: bold;}
     .total_price{font-size: 22px; padding-left: 210px;}

     .prd_btn_area{display: flex; justify-content: space-between; width: 450px; height: 65px; margin-top: 25px;}
     #basket_btn{width: 177px; height: 65px; border: 1px solid #7d99a4; background-color: #fff; color: #7d99a4; font-weight: bold; font-size: 20px;}
     #order_btn{width: 177px; height: 65px; border: 1px solid #7d99a4; background-color: #7d99a4; color: #fff; font-weight: bold; font-size: 20px;}
     #like_btn{width: 74px; height: 65px; border: 1px solid #4a4a4a; background-color: #fff; color: #7d99a4; font-weight: bold; font-size: 32px; line-height: 35px;}
  
     .prd_detail_tab{width: 1020px; height: 51px; margin-top: 40px; border-bottom: 1px solid #7d99a4;}
    
     
     #product_info, #buy_info, #review_info, #qna_info{
         width: 254px;
         float: left;
         color: #4a4a4a;
         font-size: 14px; font-weight: bold;
         line-height: 51px;
         text-align: center;            
     }
     aside{
         background-color: #eef3f5;
         cursor: pointer;
     }
     .tap_open{
         width: 251px; height:50px;
         border-top: 2px solid #7d99a4;
         border-left: 2px solid #7d99a4;
         border-right: 2px solid #7d99a4;
         border-bottom: 0px;
         background-color: #fff;
     }

     .prd_detail_content{width: 1020px; height: auto; padding-top: 40px; margin-bottom: 20px;}
     
     section{display: none; width: 1020px; height: auto;}
     .show{display: flex; flex-wrap: wrap;}

     .category_align_box{display: flex; width: 1020px; height: 53px; padding-top: 21px; border-bottom: 5px solid #7d99a4; border-top: 1px solid #a4a4a4;}
     .align_sort{width: 560px; height: 35px; display: flex; align-items: center; }
     #align_new,#align_score,#align_recom{width: 86px; height: 20px; padding: 0 20px; text-align: center; margin-top: auto; cursor: pointer;}
     #align_score{border-left: 1px solid #4a4a4a; border-right: 1px solid #4a4a4a;}
     .bold{font-weight: bold;}
     .align_reivew{width: 460px; height: 35px; display: flex;}
     #align_space,#align_text, #align_photo{width: 140px; height: 16px; padding: 0 5px; text-align: center;  margin-top: auto;}
     #align_photo_check, #align_text_check{width: 16px; height: 16px;}

     .review_list{margin-top: 40px;}
     .review_list, .tb_review_list{width: 1020px; height: auto;}
     .tb_review_list{border-collapse: collapse;}
     .td_review_title, .td_review_content{border-bottom: 1px solid #4a4a4a; padding: 20px;}
     .td_review_title{width: 225px; height: auto; font-weight: bold; padding-left: 30px; vertical-align: top;}
     .td_review_content, .review_content{width: 765px; height: auto;}
     .score_area{display: flex; flex-wrap: wrap; width: 765px; height: 22px; margin-bottom: 15px; justify-items: center;}
     .review_score, .review_score img{width: 112px; height: 20px;}
     .review_regDate{width: 85px; height: 20px; margin-left: 15px; color: #a4a4a4; font-weight: bold;}
     .txt_inner{width: 765px; height: auto; margin-bottom: 15px;}
     .recom_area{display: flex; flex-wrap: wrap; width: 765px; height: 32px; margin-top: 20px;}
     .recom_btn{border: 0px; background-color: #fff; font-size: 16px;}
     .recom_num{
         height: 28px;
         margin-left: 14px; 
         padding: 3px 25px;
         color: #4a4a4a;
         border: 1px solid #4a4a4a;
         border-radius: 14px;            
     }

     .pageing{width: 1020px; height: 30px; padding-top: 30px; margin-bottom: 20px; text-align: center;}
     
     .prd_qna_title{width: 1000px; height: 34px; padding-right: 20px; padding-bottom: 20px; border-bottom: 1px solid #4a4a4a; text-align: right;}
     #prd_qna_write_btn{width: 120px; height: 34px; border: 0; background-color: #7d99a4; color: #fff; font-size: 16px; font-weight: bold; border-radius: 5px;}
     .prd_qna_list{width: 1020px; height: auto;}
     .qna_title_box{display: flex; flex-wrap:wrap; width: 1020px; height: 80px; line-height: 80px; border-bottom: 1px solid #4a4a4a;}
     .qna_status{display: inline-block; width: 70px; height: 22px; line-height: 20px; font-size: 12px; color: #4a4a4a; background-color: #eef3f5; border-radius: 11px; text-align: center; vertical-align: middle;}
     .complete{display: inline-block; width: 70px; height: 22px; line-height: 20px; font-size: 12px; color: #fff; background-color: #7d99a4; border-radius: 11px; text-align: center; vertical-align: middle;}
     .qna_content{display: inline-block; width: 665px; height: 85px; padding-left: 10px; color: #4a4a4a; overflow: hidden; white-space: nowrap; text-overflow: ellipsis; cursor: pointer;}        
     .member_nickname{display: inline-block; width: 170px; height: 85px; color: #4a4a4a; text-align: center;}
     .product_inq_regDate{display: inline-block; width: 85px; height: 85px; color: #4a4a4a;text-align: center;}
     .question_title{display: inline-block; width: 110px; padding-left: 60px; font-size: 32px; color: #a4a4a4; font-weight: bold; vertical-align: top;}
     .answer_title{display: inline-block; width: 110px; padding-left: 60px; font-size: 32px; color: #7d99a4; font-weight: bold; vertical-align: top;}
     .question_content,.answer_content{display: inline-block; width: 765px; height: auto; font-size: 14px; color: #4a4a4a;}
     .qna_question_box, .qna_answer_box{width: 1020px; padding: 20px 0; background-color: #eef3f5;}
     .qna_answer_box{border-bottom: 1px solid #4a4a4a;} 
     .answer_content{padding: 20px 0; border-top: 1px solid #4a4a4a;}
     
     .nickname_txt{height: 20px; line-height: 60px;}
     .qna_update_btn, .qna_delete_btn{width: 40px; height: 28px; border: 0; background-color: #7d99a4; color: #fff; border-radius: 5px; cursor: pointer;}
     
     .sub_title {
         width: 1020px;
         margin: 20px auto 10px;
         color: #7d99a4;
         font-size: 20px;
         font-weight: bold;
     }
     #tb_product_buy_info{border-collapse: collapse;}
     #product_buy_info{margin-bottom: 40px;}
     #product_buy_info, #tb_product_buy_info{width: 1020px; height: auto;}
     .td_buy_info_title{width: 242px; height: 28px; padding: 15px 0 15px 18px; font-size: 15px;}
     .td_buy_info_content{width: 704px; height: 28x; padding: 15px 20px 15px 36px; font-size: 14px; color: #4a4a4a;}
     .top{border-top: 2px solid #4a4a4a;}
     .bottom{border-bottom: 1px solid #4a4a4a;}
     .title{background-color: #eef3f5; font-weight: bold; font-size: 15px;}
     
     #prd_content{margin: 0 auto;}
</style>
</head>
<body>
	<header>	
		<jsp:include page="../main/header.jsp"/>	
	</header>
	
    <!-- 상품 이미지 및 정보,장바구니,구매하기 창 -->
    <div class="prd_detail_box">
        <div class="left_area">
            <!-- 상품 대표 이미지 -->
            <div class="prd_img">
                <img src="../resources/img/test02.jpg" alt="상품 메인 이미지">
            </div>
            
            <div class="prd_review_score_avg">
                <b>고객리뷰 <span class="txt_blue">4.8</span></b> (97건)
            </div>
        </div>
        <div class="right_area">
            <div class="prd_info">
                <p class="prd_seller">라쿤보호협회</p>
                <p class="prd_name">라쿤보호협회 이벤트상품 한정판 고급 라쿤뒷다리살튀김</p>
                <p class="prd_price">13,500원</p>
                <div class="prd_delivery_info">
                    <p class="prd_delivery_title">배송정보</p>
                    <div class="prd_delivery_box">
                        <span class="delivery_title">일반배송 |</span>
                        <span class="delivery_content">2,500원<br>평균 3일 이내 배송</span>                        
                    </div>                   
                </div>
                <div class="prd_cnt_box">
                    <div class="prd_cnt_title">구매수량</div>
                    <div class="prd_cnt_area">
                        <input type="button" name="prd_cart_minus_btn" id="prd_cart_minus_btn" value="-">
                        <input type="text" name="prd_cart_cnt" id="prd_cart_cnt" value="1" oninput="this.value = this.value.replace(/[^0-9]/g,'').replace(/(\..*)\./g, '$1');">
                        <input type="button" name="prd_cart_plus_btn" id="prd_cart_plus_btn"  value="+">
                    </div>
                </div>
                <div class="prd_total_price txt_blue ">
                    <span class="prd_total_price_title">상품금액 합계</span>
                    <span class="total_price"><b>13,500</b></span>원                    
                </div>

                <div class="prd_btn_area">
                    <input type="button" id="basket_btn" value="장바구니">
                    <input type="button" id="order_btn" value="바로구매">
                    <input type="button" id="like_btn" value="♡">
                </div>
            </div>
        </div>

        <div class="clean"></div>

        <!-- 상품설명/구매정보/리뷰/문의 탭 -->
        <div class="prd_detail_tab">
            <aside id="product_info" class="tap_open">상품설명</aside>
            <aside id="buy_info" class="">구매정보</aside>
            <aside id="review_info" class="">리뷰 (97)</aside>
            <aside id="qna_info" class="">상품문의 (4)</aside>
        </div>

        <div class="prd_detail_content">
            <!-- 상품설명 -->
            <section id="prd_content_box" class="show">
            	<div id="prd_content">
	            	<!-- 이미지 개수만큼 if문걸기 -->
	                <img src="../resources/img/상품설명 테스트.jpg" alt="상품 설명 이미지">
            	</div>
            </section>
             <!-- 구매정보 -->
            <section id="buy_content_box" class="">
                <h3 class="sub_title">상품정보 제공고시</h3>
                <div id="product_buy_info">
                    <!-- content값으로 상품정보 -->
                    <table id="tb_product_buy_info">  
                        <tr>
                            <td class="td_buy_info_title top bottom title">내용물의 용량 또는 중량</td>
                            <td class="td_buy_info_content top bottom">
                                600g
                            </td>
                        </tr>
                        <tr>
                            <td class="td_buy_info_title bottom title">사용방법</td>
                            <td class="td_buy_info_content bottom">
                                맛있게먹기
                            </td>
                        </tr>
                        <tr>
                            <td class="td_buy_info_title bottom title">제조국</td>
                            <td class="td_buy_info_content bottom">
                                대한민국
                            </td>
                        </tr>
                        <tr>
                            <td class="td_buy_info_title bottom title">책임자 전화번호</td>
                            <td class="td_buy_info_content bottom">
                                010-9388-8058
                            </td>
                        </tr>
                    </table>                    
                </div>

                <h3 class="sub_title">배송안내</h3>
                <div id="product_buy_info">
                    <!-- content값으로 상품정보 -->
                    <table id="tb_product_buy_info">  
                        <tr>
                            <td class="td_buy_info_title top bottom title">배송비/배송가능일</td>
                            <td class="td_buy_info_content top bottom">
                                <b>[일반 배송]</b><br>
                                <b>배송지역</b> : 전국<br>
                                <!-- 배송비는 해당 상품에 대한 값 -->
                                <b>배송비</b> : 2,500원<br>
                                도서, 산간, 오지 일부 지역은 배송비가 추가될 수 있습니다.<br>
                                배송가능일 : 3일<br>
                                배송가능일이란 본 상품을 주문하신 고객님들께 상품 배송이 가능한 기간을 의미합니다. 단, 연휴 및 공휴일은 기간 계산시 제외하며 현금 주문일 경우 입금일 기준 입니다.<br>
                                예약 상품의 경우 예약된 날짜에 출고되며, 상품의 입고가 빠르게 진행된 경우 예약일 보다 일찍 배송될 수 있습니다.<br>
                            </td>
                        </tr>                      
                    </table>                    
                </div>

                <h3 class="sub_title">교환/반품/환불 안내</h3>
                <div id="product_buy_info">
                    <!-- content값으로 상품정보 -->
                    <table id="tb_product_buy_info">  
                        <tr>
                            <td class="td_buy_info_title top bottom title">교환/반품 신청 방법</td>
                            <td class="td_buy_info_content top bottom">
                                마이페이지 내 주문내역에서 신청가능하며,<br>
                                반품 신청의 경우 택배회수를 선택하여 신청가능합니다.<br>
                            </td>
                        </tr>
                        <tr>
                            <td class="td_buy_info_title top bottom title">교환/반품 신청 기간</td>
                            <td class="td_buy_info_content top bottom">
                                교환, 반품 신청은 배송이 완료된 후 15일 이내 가능합니다.<br>
                                고객님이 배송 받으신 상품의 내용이 표시∙광고의 내용과 다르거나 계약내용과 다르게 이행된 경우에는 배송 받으신 날로부터 3개월 이내, 혹은 그 사실을 알 수 있었던 날로 부터 30일 이내에 가능합니다.<br>
                            </td>
                        </tr>   
                        <tr>
                            <td class="td_buy_info_title top bottom title">교환/반품/회수 비용</td>
                            <td class="td_buy_info_content top bottom">
                                <b>[택배 회수 반품]</b><br>
                                고객님의 사유에 의한 교환 및 반품은 회수 및 배송에 필요한 비용을 부담해주셔야 합니다.<br>
                                기본 비용은 교환 5,000원(회수비+배송비), 반품 2,500원(회수비)입니다.<br>
                                제주도 및 도서산간 지방에는 추가 운임이 발생합니다.<br>
                                당사의 사유(상품의 하자, 배송의 오류 등)로 인한 경우 교환 및 반품에 필요한 비용은 당사에서 부담합니다.<br>
                            </td>
                        </tr>   
                        <tr>
                            <td class="td_buy_info_title top bottom title">교환/반품 불가안내</td>
                            <td class="td_buy_info_content top bottom">
                                고객님의 사유에 의한 교환 및 반품이 불가한 경우<br>
                                1. 배송이 완료된 후 15일이 경과한 경우<br>
                                2. 포장 훼손 및 사용 또는 일부 소비, 구성품 누락 및 상품의 결함 발생으로 인해 상품의 가치가 훼손된 경우<br>
                                <br>
                                당사의 사유에 의한 교환 및 반품이 불가한 경우<br>
                                1. 배송 받으신 날로부터 3개월, 혹은 그 사실을 알 수 있었던 날로 부터 30일이 경과한 경우<br>
                                2. 당사의 귀책(상품의 불량, 생산 및 제조 및 배송 간의 파손 등)으로 인한 현상이 아닌 해당 상품의 고유한 특성, 혹은 상품 수령 후 고객님의 과실로 인한 문제임이 규명된 경우<br>
                            </td>
                        </tr>                         
                    </table>                    
                </div>                
            </section>
            <!-- 리뷰 -->
            <section id="review_content_box" class="">
                <div class="category_align_box">
                    <div class="align_sort">
                        <div id="align_new" class="bold">최신순</div>
                        <div id="align_score" class="">평점순</div>
                        <div id="align_recom" class="">추천순</div>
                    </div>
                    <div class="align_reivew">
                        <div id="align_space" class="">                            
                        </div>
                        <div id="align_photo" class="bold">
                            <input type="checkbox" name="align_photo_check" id="align_photo_check">
                            <label for="align_photo_check">포토리뷰</label>
                        </div>
                        <div id="align_text" class="">
                            <input type="checkbox" name="align_text_check" id="align_text_check">
                            <label for="align_text_check">일반리뷰</label>
                        </div>
                    </div>
                </div>
                <div class="review_list">
                    <table class="tb_review_list">
                        <!-- forEach문 통한 상품별 리뷰 불러오기 -->
                        <tr>
                            <td class="td_review_title">
                                라쿤러버
                            </td>
                            <td class="td_review_content">
                                <div class="review_content">
                                    <div class="score_area">
                                        <span class="review_score">
                                            <img src="../resources/img/review_score_5.png"  alt="5점">
                                        </span>
                                        <span class="review_regDate">
                                            2023.07.27
                                        </span>
                                    </div>
                                    <div class="txt_inner">
                                        <!-- 첨부파일 있으면 img 불러오기 -->
                                        정말 맛있어요! 정말 맛있어요! 정말 맛있어요! 정말 맛있어요! 정말 맛있어요! 정말 맛있어요! 정말 맛있어요! 정말 맛있어요! 정말 맛있어요! 정말 맛있어요! 정말 맛있어요! 정말 맛있어요! 정말 맛있어요! 정말 맛있어요! 정말 맛있어요! 정말 맛있어요! 정말 맛있어요! 정말 맛있어요! 정말 맛있어요! 정말 맛있어요! 정말 맛있어요! 정말 맛있어요! 정말 맛있어요! 정말 맛있어요! 정말 맛있어요! 정말 맛있어요! 정말 맛있어요! 정말 맛있어요! 정말 맛있어요! 정말 맛있어요! 정말 맛있어요! 정말 맛있어요! 정말 맛있어요! 정말 맛있어요! 정말 맛있어요! 정말 맛있어요! 정말 맛있어요! 정말 맛있어요! 정말 맛있어요! 정말 맛있어요! 정말 맛있어요! 정말 맛있어요! 정말 맛있어요! 정말 맛있어요! 정말 맛있어요! 정말 맛있어요! 정말 맛있어요! 정말 맛있어요! 정말 맛있어요! 정말 맛있어요! 정말 맛있어요! 정말 맛있어요! 정말 맛있어요! 정말 맛있어요! 정말 맛있어요! 정말 맛있어요! 정말 맛있어요! 정말 맛있어요! 정말 맛있어요! 정말 맛있어요! 정말 맛있어요! 정말 맛있어요! 정말 맛있어요! 
                                    </div>
                                    <div class="recom_area">
                                        <button class="recom_btn">
                                            <b>리뷰 추천하기</b>
                                            <span class="recom_num">
                                                <img src="../resources/img/icon_recom_off.png" width="15px" height="15px">
                                                2
                                            </span>
                                        </button>
                                    </div>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td class="td_review_title">
                                라쿤맘
                            </td>
                            <td class="td_review_content">
                                <div class="review_content">
                                    <div class="score_area">
                                        <span class="review_score">
                                            <img src="../resources/img/review_score_5.png" alt="5점">
                                        </span>
                                        <span class="review_regDate">
                                            2023.07.27
                                        </span>
                                    </div>
                                    <div class="txt_inner">
                                        정말 맛있어요!
                                    </div>
                                    <div class="recom_area">
                                        <button class="recom_btn">
                                            <b>리뷰 추천하기</b>
                                            <span class="recom_num">
                                                <img src="../resources/img/icon_recom_off.png" width="15px" height="15px">
                                                3                                                
                                            </span>
                                        </button>
                                    </div>
                                </div>
                            </td>
                        </tr>
                    </table>
                </div>
                <!-- 페이지 네비게이션 -->
                <div class="pageing">
                    페이징 들어갈 자리
                </div>
            </section>
            <!-- 상품문의 -->
            <section id="qna_content_box" class="">
                <div class="prd_qna_title">
                    <input type="button" id="prd_qna_write_btn" value="상품문의">
                </div>
                
                <div class="prd_qna_list">                    
                    <!-- 타이틀 퀘스쳔 앤서 3개 묶음으로 forEach문, 상품이 가지고 있는 리뷰 개수만큼 -->
                    <div class="qna_title_box">
                        <div class="qna_status_box">                           
                            <div class="qna_status complete">
                                답변완료
                            </div>
                        </div>                        
                        <div class="qna_content">
                            원산지가 미국 맞나요? ellipsis 테스트를 위한 의도적 긴글 만들기 ellipsis 테스트를 위한 의도적 긴글 만들기
                        </div>
                        <div class="member_nickname">
                        	<!-- 본인글이면 이걸로 표시 -->
                            <div class="nickname_txt">라쿤러버</div>
                            <button class="qna_update_btn">수정</button>
                            <button class="qna_delete_btn">삭제</button>
                            <!-- 본인이 아니면 텍스트로 닉네임만 처리-->
                        </div>
                        <div class="product_inq_regDate">
                            2023.07.27
                        </div>
                    </div>
                    <!-- 이 아래로 클릭에 따라 보여지는 구간 -->
                    <section class="qna_detail_content">
                        <div class="qna_question_box">
                            <div class="question_title">
                                Q
                            </div>
                            <div class="question_content">
                                원산지가 미국 맞나요?
                            </div>                        
                        </div>                    
                        <div class="qna_answer_box">
                            <div class="answer_title">
                                A
                            </div>
                            <div class="answer_content">
                                네 북아메리카산 라쿤입니다.
                            </div>                        
                        </div>
                    </section>
                     <!-- 타이틀 퀘스쳔 앤서 3개 묶음으로 forEach문, 상품이 가지고 있는 리뷰 개수만큼 -->
                     <div class="qna_title_box">
                        <div class="qna_status_box">
                            <div class="qna_status">
                                답변대기
                            </div>
                        </div>
                        <div class="qna_content">
                            유통기한은 언제까지인가요?
                        </div>
                        <div class="member_nickname">
                            라쿤맘
                        </div>
                        <div class="product_inq_regDate">
                            2023.07.27
                        </div>
                    </div>
                    <!-- 이 아래로 클릭에 따라 보여지는 구간 -->
                    <section class="qna_detail_content">
                        <div class="qna_question_box">
                            <div class="question_title">
                                Q
                            </div>
                            <div class="question_content">
                                유통기한은 언제까지인가요?
                            </div>                                                    
                        </div> 
                        
                    </section>                   
                </div>
                <!-- 페이지 네비게이션 -->
                <div class="pageing">
                    페이징 들어갈 자리
                </div>
            </section>
        </div>
    </div>
    
    
    <footer>
		<jsp:include page="../main/footer.jsp"/>		
	</footer>
</body>
</html>