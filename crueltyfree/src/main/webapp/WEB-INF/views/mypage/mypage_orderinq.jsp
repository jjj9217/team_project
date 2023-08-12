<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List, java.util.HashMap, java.util.Map" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
        
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문/배송 조회 | CrueltyFree</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://cdn.iamport.kr/v1/iamport.js"></script> 
<script>
$(function(){
  $(".refund_btn").click(function(){
	  var index = $(".refund_btn").index(this);
	  var order_idx = $(".refund_order_idx").eq(index).val();
	  var order_num = $(".refund_order_num").eq(index).val();
	  
	  var confirmation = confirm("환불을 진행하시겠습니까?");
	  
	  if(confirmation){
		  $.ajax({
			  type: "post",
			  url: "${pageContext.request.contextPath}/purchase/refund_process.do",
			  data: JSON.stringify({
				  "merchant_uid":order_num,//결제 UID
				  "order_idx":order_idx//order_idx
				  }), 
				  //JSON.stringify(JSON타입 객체): JSON타입 객체를 String객체로 변환시킴
			  contentType: "application/json;charset=utf-8;",
			  //contentType: 사용자가 서버로 보내는 내용의 MIME타입
			  success: function(data) {
				  if(data == "success"){
					  alert("환불에 성공하였습니다.");
					  window.location.href = "${pageContext.request.contextPath}/mypage/mypage_orderinq.do";
				  }else{
					  alert("환불에 실패하였습니다.");
				  }
			  },
			  error: function(error) {
				  alert("ajax 에러 발생");
			  }
		  });//end of ajax		  
	  }else{
		  // 사용자가 취소를 선택한 경우
	      alert("환불이 취소되었습니다.");		  
	  }
	  

  })//end of btn click
	
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
    /* 바디 CSS */

    #Container{
    	display: block;
        width: 1020px; height: auto; margin: 0 auto;
    }
    
    #mypage{
    	margin-top: 30px;
    	display: block;        
        width: 199px;
        height:500px;
        float:left;     
    }

    #mypage-conts{ 
    	display: block;       
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
    }

    #blank{
        width:100%;
        height: 35px;
        
    }

    
    
    .mypage-step {
    overflow: hidden;
    width: 100%;
    height: 120px;  /* 없애면됨*/
    padding-inline-start: 0px;
    border-radius: 10px;
    
    }
	.mypage-step li{background-color: #eef3f5;}
	
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

    .mypage-step li {

    float: left;
    position: relative;
    width: 20%;
    height: 117px;
    
    font-size: 0;
    line-height: 0;
    
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

     .select-month li{       
         list-style:none; 
         float: left; 
     }   


    .serach-period{
        width: 98%;
        border: 0px;
        padding: 15px 0 15px 15px;
        margin:0;
        background-color: #eef3f5;
        border-radius:5px;
    }

    .buy_period_txt{
        float: left;
        color: #4a4a4a;
        font-weight: bold;
    }

    .select-month{
        float: left;
        padding-left: 10px;
    }

    .select-range{
        float: left;
        padding-left: 79px;
        color: #4a4a4a;
        font-size: 14px;
    }

    #do-search-period{
        height: 78px;
        background-color: #7d99a4;
        color: white;       
        margin-left: 74px;
        padding-left: 20px;
        padding-right: 20px;
        border: 0px;
        border-radius: 5px;
        font-weight: bold;
        font-size: 16px;
    }
    .span_txt{
        padding-left: 20px;
        float: left;
        font-size: 12px;
    }
    .select_date{border: 1px solid #7d99a4; outline: none; border-radius: 5px; height: 30px; padding-left: 5px;} 
    .buy_month{margin-right: 10px;}
    .month_btn{width: 60px; height: 30px; border-radius:5px; border: 1px solid #7d99a4; background-color: #fff; color: #7d99a4; font-weight: bold;}
    .month_btn_click{width: 60px; height: 30px; border-radius:5px; border: 1px solid #7d99a4; background-color: #7d99a4; color: #fff; font-weight: bold;}
    .tit_area{margin-bottom: 20px;}
    .buy_list_container{display: block; width: 790px; height: auto; margin: 0 auto; padding: 10px; margin-top: 50px;}
    .buy_list, .order_list{border-collapse: collapse;}
    .th_date{width: 135px; height: 20px; padding: 10px 0; background-color: rgb(224, 224, 224);}
    .th_name{width: 380px; height: 20px; padding: 10px 0; background-color: rgb(224, 224, 224);}
    .th_amount{width: 65px; height: 20px; padding: 10px 0; background-color: rgb(224, 224, 224);}
    .th_price{width: 115px; height: 20px; padding: 10px 0; background-color: rgb(224, 224, 224);}
    .th_state{width: 115px; height: 20px; padding: 10px 0; background-color: rgb(224, 224, 224);}
	.td_date{width: 125px; height: auto; padding: 30px 5px; text-align: center; font-size:14px; font-weight: bold;}
    .td_name{width: 370px; height: auto; padding: 30px 5px; text-align: center; border-left: 1px solid #a4a4a4; font-size:14px;}
    .td_amount{width: 45px; height: auto; padding: 30px 5px; text-align: center; border-left: 1px solid #a4a4a4; font-size:14px;}
    .td_price{width: 105px; height: auto; padding: 30px 5px; text-align: center; border-left: 1px solid #a4a4a4; font-size:14px; color:#7d99a4; font-weight: bold;}
    .td_state{width: 105px; height: auto; padding: 30px 5px; text-align: center; border-left: 1px solid #a4a4a4; font-size:14px; color:#4a4a4a; font-weight: bold;}
    .top{border-top: 2px solid #4a4a4a}
    .bottom{border-bottom: 1px solid #a4a4a4}
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
     .refund_btn{
     	width: 60px; height: 30px; border-radius:5px; border: 1px solid #7d99a4; background-color: #fff; color: #7d99a4; font-weight: bold;
     }    
    .clear{clear:both;}
</style>
</head>

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
            <h2 class="tit">주문/배송조회</h2>
        </div>
        <div class="search_box">
        <a class="order_view" href="#">
            <ul class="mypage-step">
                <li><em>0</em>
                <span>주문접수</span>
                </li>
                <li><em>0</em>
                <span>결제완료</span>
                </li>
                <li><em>0</em>
                <span>배송준비중</span>
                </li>
                <li><em>0</em>
                <span>배송중</span>
                </li>
                <li><em>0</em>
                <span>배송완료</span>
                </li>
            </ul>
        </a>
		<br>
        <fieldset class="serach-period">
            <legend></legend>
            <div class="select_con" id="selectOrderTypeZone.select_con">
                <p class="buy_period_txt">구매 기간</p>
                <ul class="select-month">
                    <li class="buy_month"><button class="month_btn month_btn_click" type="button">1개월</button></li>
                    <li class="buy_month"><button class="month_btn" type="button">3개월</button></li>
                    <li class="buy_month"><button class="month_btn" type="button">6개월</button></li>
                    <li class="buy_month"><button class="month_btn" type="button">12개월</button></li>
                </ul>
            </div>
            <div class="select-range">
                

				<br>
                <select class="select_date" id="cal-start-year" title="년도를 선택하세요" style="width:76px;"><option value="2012">2012</option><option value="2013">2013</option><option value="2014">2014</option><option value="2015">2015</option><option value="2016">2016</option><option value="2017">2017</option><option value="2018">2018</option><option value="2019">2019</option><option value="2020">2020</option><option value="2021">2021</option><option value="2022">2022</option><option value="2023" selected="selected">2023</option></select>
                <label for="cal-start-year">년</label>
                <select class="select_date" id="cal-start-month" title="달월을 선택하세요" style="width:60px;">
                    <option value="01">1</option>
                    <option value="02">2</option>
                    <option value="03">3</option>
                    <option value="04">4</option>
                    <option value="05">5</option>
                    <option value="06" selected="selected">6</option>
                    <option value="07">7</option>
                    <option value="08">8</option>
                    <option value="09">9</option>
                    <option value="10">10</option>
                    <option value="11">11</option>
                    <option value="12">12</option>
                </select>
                <label for="cal-start-month">월</label>
                <select class="select_date"  id="cal-start-day" title="날일을 선택하세요" style="width:60px;">
                <option value="01">1</option><option value="02">2</option><option value="03">3</option><option value="04">4</option><option value="05">5</option><option value="06">6</option><option value="07">7</option><option value="08">8</option><option value="09">9</option><option value="10">10</option><option value="11">11</option><option value="12">12</option><option value="13">13</option><option value="14">14</option><option value="15">15</option><option value="16">16</option><option value="17">17</option><option value="18">18</option><option value="19">19</option><option value="20">20</option><option value="21">21</option><option value="22">22</option><option value="23">23</option><option value="24">24</option><option value="25">25</option><option value="26">26</option><option value="27" selected="selected">27</option><option value="28">28</option><option value="29">29</option><option value="30">30</option></select>
                <label for="cal-start-day">일</label>
                <span class="des">~</span>
                <select class="select_date"  id="cal-end-year" title="년도를 선택하세요" style="width:76px;"><option value="2012">2012</option><option value="2013">2013</option><option value="2014">2014</option><option value="2015">2015</option><option value="2016">2016</option><option value="2017">2017</option><option value="2018">2018</option><option value="2019">2019</option><option value="2020">2020</option><option value="2021">2021</option><option value="2022">2022</option><option value="2023" selected="selected">2023</option></select>
                <label for="cal-end-year">년</label>
                <select class="select_date"  id="cal-end-month" title="달월을 선택하세요" style="width:60px;">
                    <option value="01">1</option>
                    <option value="02">2</option>
                    <option value="03">3</option>
                    <option value="04">4</option>
                    <option value="05">5</option>
                    <option value="06">6</option>
                    <option value="07" selected="selected">7</option>
                    <option value="08">8</option>
                    <option value="09">9</option>
                    <option value="10">10</option>
                    <option value="11">11</option>
                    <option value="12">12</option>
                </select>
                <label for="cal-end-month">월</label>
                <select class="select_date"  id="cal-end-day" title="날일을 선택하세요" style="width:60px;">
                <option value="01">1</option><option value="02">2</option><option value="03">3</option><option value="04">4</option><option value="05">5</option><option value="06">6</option><option value="07">7</option><option value="08">8</option><option value="09">9</option><option value="10">10</option><option value="11">11</option><option value="12">12</option><option value="13">13</option><option value="14">14</option><option value="15">15</option><option value="16">16</option><option value="17">17</option><option value="18">18</option><option value="19">19</option><option value="20">20</option><option value="21">21</option><option value="22">22</option><option value="23">23</option><option value="24">24</option><option value="25">25</option><option value="26">26</option><option value="27" selected="selected">27</option><option value="28">28</option><option value="29">29</option><option value="30">30</option><option value="31">31</option></select>
                <label for="cal-end-day">일</label>                          
            </div>
            <button type="button" class="btnLookup" id="do-search-period">조회</button>
        </fieldset>
        <br>
        <p class="buy_list_txt">
        </p>
        </div>
        <div class="buy_list_container">
		<table class="order_list">
        <tr>
            <th class="th_date top bottom">주문일자</th>
            <th class="th_name top bottom">상품</th>
            <th class="th_amount top bottom">수량</th>
            <th class="th_price top bottom">주문금액</th>
            <th class="th_state top bottom">상태</th>
        </tr>
        <c:forEach var="orderRow" begin="1" end="10">
        <tr>
        <td>
		<table class="buy_list">
                <c:forEach var="orderProduct" items="${orderList[orderRow-1]}" varStatus="loop">
                <tr>
                    <td class="td_date bottom">
                    <fmt:formatDate value="${orderProduct.order_date}" pattern="yyyy.MM.dd" /><br>
                    ${orderProduct.order_num}                    
                    </td>
                    <td class="td_name bottom">
             		<div class="basket_item">
                    	<a class="prd_name" href="${pageContext.request.contextPath}/product/product_view.do?prdNum=${orderProduct.product_idx}">
                        	<img src="../resources/uploads/${orderProduct.saveFile}" width="85px" height="85px" alt="썸네일이미지">
                        </a>
                        <a class="prd_name" href="${pageContext.request.contextPath}/product/product_view.do?prdNum=${orderProduct.product_idx}">
                            <span class="prd_seller">${orderList[rowNum-1].member_nickname}</span>
                            <p class="prd_title">${orderProduct.product_name}</p>
                        </a>
                    </div>
					</td>
                    <td class="td_amount bottom">${orderProduct.order_product_count}</td>
                    <td class="td_price bottom">
                    <fmt:formatNumber value="${orderProduct.order_product_count * orderProduct.product_price}" pattern="###,###" />원</td>
                    <td class="td_state bottom">
                    <c:choose>
                    <c:when test="${orderProduct.order_ing == 0}">
                    <!-- 출고대기 상태일때 -->
                    주문완료<br><br>
                    <button class="refund_btn">환불신청</button>
                    </c:when>
                    <c:when test="${orderProduct.order_ing == 1}">
                    <!-- 출고준비중 상태일때 -->
                    상품준비중
                    <button class="refund_btn">환불신청</button>
                    </c:when>
                    <c:when test="${orderProduct.order_ing == 2}">
                    <!-- 배송중 상태일때 -->
                    상품배송중
                    <input type="hidden" class="refund_btn">
                    </c:when>
                    <c:when test="${orderProduct.order_ing == 3}">
                    <!-- 출고완료 상태일때 -->
                    배송완료
                    <input type="hidden" class="refund_btn">
                    </c:when>
                    <c:otherwise>
                    <!-- 출고취소 상태일때 -->
                    <c:choose>
	                    <c:when test="${orderProduct.order_status == 1}">
	                    <!-- 교환상태 -->
	                    상품교환
	                    <input type="hidden" class="refund_btn">
	                    </c:when>
	                    <c:when test="${orderProduct.order_status == 2}">
	                    <!-- 환불상태 -->
	                    환불완료
	                    <input type="hidden" class="refund_btn">
	                    </c:when>
	                    <c:otherwise>
	                    <!-- 취소상태 -->
	                    취소완료
	                    <input type="hidden" class="refund_btn">
	                    </c:otherwise>
                    </c:choose>
                    </c:otherwise>
                    </c:choose>
                    <input type="hidden" class="refund_order_idx" value="${orderProduct.order_idx}">
                    <input type="hidden" class="refund_order_num" value="${orderProduct.order_num}">
                    </td>
                </tr>
                </c:forEach>      
        </table>
        </td>        
        </tr>
        </c:forEach>
        </table>         
		</div>
    </div>
    <div class="clear"></div>
</div>
	<div class="clear"></div>
    <footer>
		<jsp:include page="../main/footer.jsp"/>		
	</footer>
</body>
</html>
