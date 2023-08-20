<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List, java.util.HashMap, java.util.Map" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
        
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>취소/반품 내역 | CrueltyFree</title>
<link rel="icon" href="${pageContext.request.contextPath}/resources/img/favicon1.png">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://cdn.iamport.kr/v1/iamport.js"></script> 
<script>
function getParameterValue(parameterName) {
    const queryString = window.location.search;
    const urlParams = new URLSearchParams(queryString);

    if (urlParams.has(parameterName)) {
        return urlParams.get(parameterName);
    }

    return null; // 파라미터가 없으면 null 반환
}

function pageNav(pageNum, pageBlock, month) { 	
	// 클래스 정보 추출
	var month01Class = $("#month01").attr("class");
    var month03Class = $("#month03").attr("class");
    var month06Class = $("#month06").attr("class");
    var month12Class = $("#month12").attr("class"); 
    
	var insertSortOrder = "";
	const paramMonth = getParameterValue("month"); //url에서 파라미터값 가져오기
	
	if (month === 'empty') {
		if(paramMonth === null){//조건 아에 안넣은 초기상황
			insertMonth = '1';			
		}else{//기존에 있던 조건상황(url파라미터)
			insertMonth = paramMonth;
		}
	}else{
		insertMonth = month;
	}   
	
    // 현재 스크롤 위치
	var scrollY = window.scrollY || window.pageYOffset;
    
	// 새 URL 구성
    var newURL = "mypage_cancelinq.do?" + 
            "pageNum=" + pageNum +
            "&pageBlock=" + pageBlock +
            "&scrollY=" + scrollY +
            "&month01Class=" + month01Class +
            "&month03Class=" + month03Class + 
            "&month06Class=" + month06Class + 
            "&month12Class=" + month12Class + 
            "&month=" + insertMonth;
    
    // URL로 이동        
    window.location.href = newURL;
}

$(function(){
	// GET 파라미터 추출
    var urlParams = new URLSearchParams(window.location.search);
    var scrollY = getParameterValue("scrollY");
    
    // 스크롤 위치로 이동
    if (scrollY !== null) {
        $(window).scrollTop(parseInt(scrollY));
    }
    
    // GET 파라미터 추출
    var month01Class = getParameterValue("month01Class");
    var month03Class = getParameterValue("month03Class");
    var month06Class = getParameterValue("month06Class");
    var month12Class = getParameterValue("month12Class");   
    
    // 클래스정보 세팅
	if (month01Class !== null) {
		$("#month01").removeClass().addClass(month01Class);
    }	
	if (month03Class !== null) {
		$("#month03").removeClass().addClass(month03Class);
    }
	if (month06Class !== null) {
		$("#month06").removeClass().addClass(month06Class);
    }
	if (month12Class !== null) {
		$("#month12").removeClass().addClass(month12Class);
    }
	
	//기간 1개월 클릭
	$("#month01").click(function(){
		$(this).addClass("month_btn_click");
		$("#month03").removeClass("month_btn_click");
		$("#month06").removeClass("month_btn_click");
		$("#month12").removeClass("month_btn_click");		
		pageNav(1, 1, 1);
	});	
	//기간 3개월 클릭
	$("#month03").click(function(){
		$(this).addClass("month_btn_click");
		$("#month01").removeClass("month_btn_click");
		$("#month06").removeClass("month_btn_click");
		$("#month12").removeClass("month_btn_click");
		pageNav(1, 1, 3);
	});	
	//기간 6개월 클릭
	$("#month06").click(function(){
		$(this).addClass("month_btn_click");
		$("#month03").removeClass("month_btn_click");
		$("#month01").removeClass("month_btn_click");
		$("#month12").removeClass("month_btn_click");
		pageNav(1, 1, 6);
	});	
	//기간 12개월 클릭
	$("#month12").click(function(){
		$(this).addClass("month_btn_click");
		$("#month03").removeClass("month_btn_click");
		$("#month06").removeClass("month_btn_click");
		$("#month01").removeClass("month_btn_click");
		pageNav(1, 1, 12);
	});	
	
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
        overflow:hidden;
        width: 1020px; margin: 0 auto;
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

    #mypage-conts {
        width:810px;
        height: 950px;      
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
    .td_empty{text-align: center; padding: 60px 0; color: #4a4a4a; font-weight: bold;}
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
	.hoverClass{color: #4a4a4a;}
    .hoverClass:hover{color: #7d99a4;}
	#next{
		background-color:#7d99a4;
		border :0;
		color:white;
		font: bold 15px Arial, Sans-serif;
		border-radius:3px;
		width:50px;
		height:25px;
	}
	#end{
		background-color:rgb(221, 219, 214);
		border :0;
		font: bold 15px Arial, Sans-serif;
		border-radius:3px;
		width:50px;
		height:25px;
	}
	.other{color:#4a4a4a;}
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
            <tr><th><h3><a class="hoverClass"  href="${pageContext.request.contextPath}/mypage/mypage_main.do" id="mylink">마이페이지</a></h3></th></tr>         
            <tr><td class="mypagetable">마이 쇼핑</td></tr>
            <tr><td><a class="hoverClass"  href="${pageContext.request.contextPath}/mypage/mypage_orderinq.do">주문/배송조회</a></td></tr>
            <tr><td><a class="hoverClass"  href="${pageContext.request.contextPath}/mypage/mypage_cancelinq.do"style="font-weight:bold; color:#7d99a4;">취소/반품내역</a></td></tr>
            <tr><td><hr width=100%></td></tr>
            <tr><td><a class="hoverClass"  href="${pageContext.request.contextPath}/purchase/basket.do">장바구니</a></td></tr>
            <tr><td><a class="hoverClass"  href="${pageContext.request.contextPath}/mypage/mypage_like.do">좋아요</a></td></tr>
            <tr><td><a class="hoverClass"  href="${pageContext.request.contextPath}/mypage/mypage_coupon.do">쿠폰</a></td></tr>
            <tr><td><hr width=100%></td></tr>
            <tr><td class="mypagetable">마이활동</td></tr>
            <tr><td><a class="hoverClass"  href="${pageContext.request.contextPath}/one_inq/one_inq_list.do">1:1문의내역</a></td></tr>
            <tr><td><a class="hoverClass"  href="${pageContext.request.contextPath}/mypage/mypage_nonreview.do">리뷰</a></td></tr>
            <tr><td><a class="hoverClass"  href="${pageContext.request.contextPath}/mypage/mypage_productQnA.do">상품문의내역</a></td></tr>
            <tr><td><hr width=100%></td></tr>
            <tr><td class="mypagetable">마이 정보</td></tr>
            <tr><td><a class="hoverClass"  href="${pageContext.request.contextPath}/mypage/mypage_modifymain.do">회원정보 수정</a></td></tr>
            <tr><td><a class="hoverClass"  href="${pageContext.request.contextPath}/mypage/mypage_deliverymain.do">배송지</a></td></tr>
        </table>        
    </div>
    
    <div id="mypage-conts">
        <div id="blank">            
        </div>
        <div class="tit_area">
            <h2 class="tit">취소/반품 내역</h2>
        </div>
        <div class="search_box">        
        <fieldset class="serach-period">
            <div class="select_con" id="selectOrderTypeZone.select_con">
                <p class="buy_period_txt">구매 기간</p>
                <div class="select_month_box">
                <ul class="select-month">
                    <li class="buy_month"><button id="month01" class="month_btn month_btn_click" type="button">1개월</button></li>
                    <li class="buy_month"><button id="month03" class="month_btn" type="button">3개월</button></li>
                    <li class="buy_month"><button id="month06" class="month_btn" type="button">6개월</button></li>
                    <li class="buy_month"><button id="month12" class="month_btn" type="button">12개월</button></li>
                </ul>
                </div>
            </div>
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
        <c:forEach var="orderRow" begin="${mPageNav.startNum}" end="${mPageNav.endNum}">
        <c:choose>
        <c:when test="${empty orderList}">
        <c:if test="${orderRow == 1}">
        <tr>
        <td class="td_empty" colspan="5">
        	취소/반품 내역이 없습니다.
        </td>
        </tr>
        </c:if>
        </c:when>
        <c:otherwise>
        <tr>
        <td>
        <c:forEach var="orderProduct" items="${orderList[orderRow-1]}" varStatus="loop">
        <tr>
		<c:if test="${loop.first}">
		<td class="td_date bottom" rowspan="${orderProductCounts[orderRow-1]}">
		<fmt:formatDate value="${orderProduct.order_date}" pattern="yyyy.MM.dd" /><br>
		<span class="blue_text">${orderProduct.order_num}</span>
		<a class="gray_text" href="${pageContext.request.contextPath}/mypage/mypage_orderinq_view.do?ordNum=${orderProduct.order_num}">상세보기</a><br>               
        </td>
 	    </c:if>
        <td class="td_name bottom">
   		<div class="basket_item">
        	<a class="prd_name" href="${pageContext.request.contextPath}/product/product_view.do?prdNum=${orderProduct.product_idx}">
            	<img src="../resources/uploads/${orderProduct.saveFile}" width="85px" height="85px" alt="썸네일이미지">
            </a>
            <a class="prd_name" href="${pageContext.request.contextPath}/product/product_view.do?prdNum=${orderProduct.product_idx}">
                <span class="prd_seller">${orderProduct.member_nickname}</span>
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
        </td>        
        </tr>
        </c:otherwise>
        </c:choose>
        </c:forEach>
        </table>         
		</div>
	<!-- 페이지 네비게이션 -->
	<div class="pageing">
	<c:if test="${mPageNav.pageNum > mPageNav.pages_per_block}">
	<a href="#" onclick="pageNav(1,1, 'empty')"><input type="button" id="end" value="처음"></a>&nbsp;
	<a href="#" onclick="pageNav(${(mPageNav.pageBlock - 2)*mPageNav.pages_per_block + 1},${mPageNav.pageBlock-1}, 'empty')">
		<input type="button" id="next" value="이전">
	</a>   	
	</c:if>
	
	<c:forEach var="i" begin="${(mPageNav.pageBlock-1)*mPageNav.pages_per_block + 1}" end="${mPageNav.pageBlock*mPageNav.pages_per_block}">
	<c:if test="${i le mPageNav.totalPageNum}">
	<c:choose>
	<c:when test = "${mPageNav.pageNum eq i}">
	<a href="#" onclick="pageNav(${i},${mPageNav.pageBlock}, 'empty')">
	<span style="color:#7d99a4;">${i}&nbsp;</span>
	</a>
	</c:when>
	<c:otherwise>
	<a href="#" onclick="ProductDetail('${ExploreVo.category_code}', '${ExploreVo.category_code_small}','${ExploreVo.sort_salecount}', '${ExploreVo.sort_view}', '${i}', '${pageNav.pageBlock}')">
	    <span class="other">${i}&nbsp;</span>
	</a>
	</c:otherwise>
	</c:choose>
	</c:if>
	</c:forEach>
	
	<c:if test="${((mPageNav.rows_per_page*mPageNav.pages_per_block) lt mPageNav.totalRows) and (mPageNav.pageBlock ne mPageNav.lastPageBlock) }">
	<a href="#" onclick="pageNav(${mPageNav.pageBlock*mPageNav.pages_per_block+1},${mPageNav.pageBlock+1}, 'empty')"><input type="button" id="next" value="다음"></a>&nbsp;
	<a href="#" onclick="pageNav(${mPageNav.totalPageNum},${mPageNav.lastPageBlock}, 'empty')"><input type="button" id="end" value="마지막"></a>
	</c:if>
	</div>  
    <div class="clear"></div>
    </div>
</div>
	<div class="clear"></div>
    <footer>
		<jsp:include page="../main/footer.jsp"/>		
	</footer>
</body>
</html>
