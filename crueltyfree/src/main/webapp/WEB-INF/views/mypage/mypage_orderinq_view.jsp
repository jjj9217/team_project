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
        width:915px;
        padding-left: 105px;
        height: auto;      
        float:left;
        margin: 0 auto;
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
    	display: inline-block;
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
	.select_month_box{
		width: auto;
		margin-left: 100px;
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
        height: 32px;
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
    .buy_list_container{display: block; width: 790px; height: auto; padding: 10px 0; margin-top: 50px; }
    .buy_list, .order_list{border-collapse: collapse;}
    .th_date{width: 135px; height: 20px; padding: 10px 0; background-color: rgb(224, 224, 224);}
    .th_name{width: 380px; height: 20px; padding: 10px 0; background-color: rgb(224, 224, 224);}
    .th_amount{width: 65px; height: 20px; padding: 10px 0; background-color: rgb(224, 224, 224);}
    .th_price{width: 115px; height: 20px; padding: 10px 0; background-color: rgb(224, 224, 224);}
    .th_state{width: 115px; height: 20px; padding: 10px 0; background-color: rgb(224, 224, 224);}
	.td_date{width: 125px; height: auto; padding: 30px 5px; text-align: center; border-left: 1px solid #a4a4a4;  font-size:14px; font-weight: bold;}
    .td_name{width: 370px; height: auto; padding: 30px 5px; text-align: center;font-size:14px;}
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
     .pageing{width: 810px; height: 30px; padding-top: 30px; margin-bottom: 20px; text-align: center;}    
     .blue_text{color:#7d99a4; font-weight:bold;}
     .gray_text{color:#a4a4a4; font-weight:bold; text-decoration: underline;}
    .clear{clear:both;}
    #strong{color:#7d99a4; font-weight:bold;}
    .search_box{
    	display: inline-block;
    	width: 750px; height: 30px; padding: 20px;
    	border-radius: 5px;
    	border: 1px solid #a4a4a4;
    }
    .order_date_class{display: inline-block; border-right: 1px solid #a4a4a4;}
    .order_num_class{display: inline-block; margin-left: 20px;}
    .sub_title{color:#4a4a4a; margin-bottom: 10px;}
    .black_text{margin: 0 30px; color:black; font-weight:bold;}
    .num_text{margin: 0 30px; color:#7d99a4; font-weight:bold; text-decoration: underline;}
    
    #tex_box{width: 790px; height: auto; margin-top: 30px;}
    #tb_payment_info{border-collapse: collapse;}
    #payment_info{margin-bottom: 20px;}
    #payment_info, #tb_payment_info{width: 780px; height: auto;}
    .td_payment_title{width: 150px; height: 28px; padding: 15px 0 15px 18px; font-size: 15px;}
    .td_payment_content{width: 500px; height: 20px; padding: 15px 20px; font-size: 15px; text-align: right;}
    .top{border-top: 2px solid #4a4a4a;}
    .bottom{border-bottom: 1px solid #4a4a4a;}
    .title{background-color: #eef3f5; font-weight: bold; font-size: 15px;}
    .txt_color{color: #7d99a4;}
    .big{font-size: 24px;}

    #tb_delivery_info{border-collapse: collapse;}
    #delivery_info{margin-bottom: 40px;}
    #delivery_info, #tb_delivery_info{width: 780px; height: auto;}
    .td_delivery_title{width: 152px; height: 28px; padding: 15px 0 15px 18px; font-size: 15px;}
    .td_delivery_content{width: 500px; height: 28x; padding: 15px 20px 15px 36px; font-size: 15px;}
    .top{border-top: 2px solid #4a4a4a;}
    .bottom{border-bottom: 1px solid #4a4a4a;}
    .title{background-color: #eef3f5; font-weight: bold; font-size: 15px;}
    .order_btn_area{
        width: 740px; height: auto; padding: 35px 20px; border-top: 1px solid #4a4a4a; text-align: center; margin-bottom: 20px;
    }
    #do_shoppig_btn{
        width: 128px; height: 48px; border: 1px solid #7d99a4; background-color: #fff; border-radius: 5px; color: #7d99a4; font-size: 16px; font-weight: bold; margin: 0 5px;
    }
    #order_list_btn{
        width: 128px; height: 48px; border: 1px solid #7d99a4; background-color: #7d99a4; border-radius: 5px; color: #fff; font-size: 16px; font-weight: bold; margin: 0 5px;
    }
    #errmsg_box{
    	width: 1020px; height: auto; padding: 179px 0; margin: 0 auto; font-size: 20px; text-align: center; color: #4a4a4a; font-weight: bold;
    }
</style>
</head>

<body>
	<header>	
		<jsp:include page="../main/header.jsp"/>	
	</header>

<!-- body시작 -->

<div id="Container">
<c:choose>
<c:when test="${!empty errmsg}">
<div id="errmsg_box">
${errmsg}<br><br>
<input type="button" name="do_shoppig_btn" id="do_shoppig_btn" value="돌아가기" onclick="location.href='${pageContext.request.contextPath}/member/login.do';">
</div>
</c:when>
<c:otherwise>
    <div id="mypage-conts">
        <div id="blank">            
        </div>
        <div class="tit_area">
            <h2 class="tit">주문/배송조회</h2>
        </div>
        <h3 class="sub_title">상세정보</h3>
        <div class="search_box">
            <div class="order_date_class">
            주문일자:
            <span class="black_text">
            <fmt:formatDate value="${orderList[0].order_date}" pattern="yyyy.MM.dd" /></span>
            </div>
            <div class="order_num_class">
            주문번호:
            <span class="num_text">${orderList[0].order_num}</span>
            </div>
		</div>
        <p class="buy_list_txt">
        </p>        
        
        <div class="buy_list_container">
        <h3 class="sub_title">배송상품</h3>
		<table class="order_list">
        <tr>            
            <th class="th_name top bottom">상품</th>
            <th class="th_date top bottom">판매가</th>
            <th class="th_amount top bottom">수량</th>
            <th class="th_price top bottom">주문금액</th>
            <th class="th_state top bottom">상태</th>
        </tr>        
        <tr>
        <td>
        <c:forEach var="orderRows" begin="1" end="${orderListCount}">
        <tr>
        <td class="td_name bottom">
   		<div class="basket_item">
        	<a class="prd_name" href="${pageContext.request.contextPath}/product/product_view.do?prdNum=${orderList[orderRows-1].product_idx}">
            	<img src="../resources/uploads/${orderList[orderRows-1].saveFile}" width="85px" height="85px" alt="썸네일이미지">
            </a>
            <a class="prd_name" href="${pageContext.request.contextPath}/product/product_view.do?prdNum=${orderList[orderRows-1].product_idx}">
                <span class="prd_seller">${orderList[orderRows-1].member_nickname}</span>
                <p class="prd_title">${orderList[orderRows-1].product_name}</p>
            </a>
        </div>
		</td>
		<td class="td_date bottom">
		<fmt:formatNumber value="${orderList[orderRows-1].product_price}" pattern="###,###" />원
		</td>
        <td class="td_amount bottom">${orderList[orderRows-1].order_product_count}</td>
        <td class="td_price bottom">
        <fmt:formatNumber value="${orderList[orderRows-1].order_product_count * orderList[orderRows-1].product_price}" pattern="###,###" />원</td>
        <td class="td_state bottom">
        <c:choose>
        <c:when test="${orderList[orderRows-1].order_ing == 0}">
        <!-- 출고대기 상태일때 -->
        주문완료<br><br>
        <button class="refund_btn">환불신청</button>
        </c:when>
        <c:when test="${orderList[orderRows-1].order_ing == 1}">
        <!-- 출고준비중 상태일때 -->
        상품준비중
        <button class="refund_btn">환불신청</button>
        </c:when>
        <c:when test="${orderList[orderRows-1].order_ing == 2}">
        <!-- 배송중 상태일때 -->
        상품배송중
        <input type="hidden" class="refund_btn">
        </c:when>
        <c:when test="${orderList[orderRows-1].order_ing == 3}">
        <!-- 출고완료 상태일때 -->
        배송완료
        <input type="hidden" class="refund_btn">
        </c:when>
        <c:otherwise>
        <!-- 출고취소 상태일때 -->
        <c:choose>
         <c:when test="${orderList[orderRows-1].order_status == 1}">
         <!-- 교환상태 -->
         상품교환
         <input type="hidden" class="refund_btn">
         </c:when>
         <c:when test="${orderList[orderRows-1].order_status == 2}">
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
        <input type="hidden" class="refund_order_idx" value="${orderList[orderRows-1].order_idx}">
        <input type="hidden" class="refund_order_num" value="${orderList[orderRows-1].order_num}">
        </td>
        </tr>
        </c:forEach> 
        </td>        
        </tr>        
        </table>         
		</div>

	<!-- 콘텐츠 700px -->
    <div id="tex_box">
        <h3 class="sub_title">결제정보</h3>
        <div id="payment_info">
            <table id="tb_payment_info">
                <tr>
                    <td class="td_payment_title top bottom title">총상품금액</td>
                    <td class="td_payment_content top bottom">
                        <fmt:formatNumber value="${orderList[0].order_prdPrice}" pattern="###,###" />원
                    </td>
                </tr>
                <tr>
                    <td class="td_payment_title bottom title">총할인금액</td>
                    <td class="td_payment_content bottom txt_color">
                        <fmt:formatNumber value="${orderList[0].order_salePrice}" pattern="###,###" />원
                    </td>
                </tr>
                <tr>
                    <td class="td_payment_title bottom title">총배송비</td>
                    <td class="td_payment_content bottom">
                        <fmt:formatNumber value="${orderList[0].order_dlvPrice}" pattern="###,###" />원
                    </td>
                </tr>
                <tr>
                    <td class="td_payment_title bottom title big">최종 결제금액</td>
                    <td class="td_payment_content bottom txt_color">
                        <span class="big"><fmt:formatNumber value="${orderList[0].order_totalPrice}" pattern="###,###" /></span>원
                    </td>
                </tr> 
            </table>
        </div>	

        <h3 class="sub_title">배송 정보</h3>
        <div id="delivery_info">
            <table id="tb_delivery_info">  
                <tr>
                    <td class="td_delivery_title top bottom title">받는분</td>
                    <td class="td_delivery_content top bottom">
                        ${deliveryVo.delivery_get_name}
                    </td>
                </tr>
                <tr>
                    <td class="td_delivery_title bottom title">연락처</td>
                    <td class="td_delivery_content bottom">
                        ${deliveryVo.delivery_handphone}
                    </td>
                </tr>
                <tr>
                    <td class="td_delivery_title bottom title">주소</td>
                    <td class="td_delivery_content bottom">
                        ${deliveryVo.delivery_address} ${deliveryVo.delivery_address2}
                    </td>
                </tr>
                <tr>
                    <td class="td_delivery_title bottom title">공동현관 출입방법</td>
                    <td class="td_delivery_content bottom">                        
                        <c:choose>
                        <c:when test="${deliveryVo.delivery_pass == 0}">
                        	비밀번호
                        </c:when>
                        <c:when test="${deliveryVo.delivery_pass == 1}">
                        	경비실 호출
                        </c:when>
                        <c:when test="${deliveryVo.delivery_pass == 2}">
                        	자유출입가능
                        </c:when>
                        <c:otherwise>
                        	기타사항
                        </c:otherwise>
                        </c:choose>
                    </td>
                </tr>
                <c:choose>
                <c:when test="${deliveryVo.delivery_pass == 0}">
                <tr>
                    <td class="td_delivery_title bottom title">공동현관 비밀번호</td>
                    <td class="td_delivery_content bottom">${deliveryVo.delivery_pass_content}</td> 
                </tr>       
                </c:when>
                <c:when test="${deliveryVo.delivery_pass == 1}">
                <tr>
                    <td class="td_delivery_title bottom title">경비실 호출 방법</td>
                    <td class="td_delivery_content bottom">${deliveryVo.delivery_pass_content}</td> 
                </tr>  
                </c:when>
                <c:when test="${deliveryVo.delivery_pass == 2}">                	
                </c:when>
                <c:otherwise>
                <tr>
                    <td class="td_delivery_title bottom title">기타 상세 내용</td>
                    <td class="td_delivery_content bottom">${deliveryVo.delivery_pass_content}</td> 
                </tr>  
                </c:otherwise>
                </c:choose>
                <tr>
                    <td class="td_delivery_title bottom title">배송완료 메시지 전송</td>
                    <td class="td_delivery_content bottom">
                        배송직후
                    </td>
                </tr>
            </table>
        </div>
            <div class="order_btn_area">
         <!-- 회원은 목록으로, 비회원은 쇼핑계속 보여주기 -->   
        <c:choose>
        <c:when test="${!empty member}">
        <input type="button" name="do_shoppig_btn" id="do_shoppig_btn" value="목록으로" onclick="location.href='${pageContext.request.contextPath}/mypage/mypage_orderinq.do';">
        </c:when>
        <c:otherwise>
        <input type="button" name="do_shoppig_btn" id="do_shoppig_btn" value="쇼핑계속" onclick="location.href='${pageContext.request.contextPath}/main/home.do';">
        </c:otherwise>
        </c:choose>
    </div>
    </div>	
	
    <div class="clear"></div>
    </div>


</c:otherwise>
</c:choose>        
</div>
	<div class="clear"></div>
    <footer>
		<jsp:include page="../main/footer.jsp"/>		
	</footer>
</body>
</html>
