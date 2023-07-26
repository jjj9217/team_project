<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>{상품이름} | CrueltyFree</title>
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
        .prd_detail_box{
            display: block; width: 1020px; height: auto; padding-top: 35px; border-top: 1px solid #4a4a4a;
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
            width: 251px;
            border-top: 2px solid #7d99a4;
            border-left: 2px solid #7d99a4;
            border-right: 2px solid #7d99a4;
            border-bottom: 0px;
            background-color: #fff;
        }

        .prd_detail_content{width: 1020px; height: auto; padding-top: 40px; margin-bottom: 20px;}
        
        section{display: none; width: 1020px; height: auto;}
        .show{display: block;}

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
                        <input type="text" name="prd_cart_cnt" id="prd_cart_cnt" value="1">
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
            <aside id="review_info" class="">리뷰(97)</aside>
            <aside id="qna_info" class="">상품문의(4)</aside>
        </div>

        <div class="prd_detail_content">
            <!-- 상품설명 -->
            <section id="prd_content" class="show">
                상품설명
            </section>
            <!-- 구매정보 -->
            <section id="buy_content" class="">
                구매정보
            </section>
            <!-- 리뷰 -->
            <section id="review_content" class="">
                리뷰
            </section>
            <!-- 상품문의 -->
            <section id="qna_content" class="">
                상품문의
            </section>
        </div>
    </div>
    
    
    <footer>
		<jsp:include page="../main/footer.jsp"/>		
	</footer>
</body>
</html>