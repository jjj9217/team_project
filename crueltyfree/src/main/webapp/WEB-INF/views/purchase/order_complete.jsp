<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문완료 | CrueltyFree</title>
<link rel="icon" href="${pageContext.request.contextPath}/resources/img/favicon1.png">
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

        .order_title{
            width: 1020px; height: auto; padding: 40px 0; border-bottom: 1px solid #4a4a4a; text-align: center;
        }
        .order_title p{font-size: 36px;}
        .order_title p span{color:#7d99a4; font-weight: bold;}
        .order_num_info{
            display: inline-block;
            height: 40px;
            line-height: 36px;
            padding: 6px 20px 0;
            border-radius: 20px;
            background-color: #7d99a4;
            color: #fff;
            font-size: 16px;
            margin: 27px 0 0;
        }

        #tex_box{width: 780px; height: auto; padding: 0 120px;}
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
            width: 980px; height: auto; padding: 35px 20px; border-top: 1px solid #4a4a4a; text-align: center; margin-bottom: 20px;
        }
        #do_shoppig_btn{
            width: 128px; height: 48px; border: 1px solid #7d99a4; background-color: #fff; border-radius: 5px; color: #7d99a4; font-size: 16px; font-weight: bold; margin: 0 5px;
        }
        #order_list_btn{
            width: 128px; height: 48px; border: 1px solid #7d99a4; background-color: #7d99a4; border-radius: 5px; color: #fff; font-size: 16px; font-weight: bold; margin: 0 5px;
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
                    <span id="page_title">주문완료</span>
                </td>
                <td id="td_title_box_step">
                    <span class="title_box_step_num">01</span>
                    <span class="title_box_step_name">장바구니</span>
                    <span class="title_box_step_next"> &nbsp;>&nbsp; </span>
                    <span class="title_box_step_num">02</span>
                    <span class="title_box_step_name">주문/결제</span>
                    <span class="title_box_step_next"> &nbsp;>&nbsp; </span>
                    <span class="title_box_step_num on">03</span>
                    <span class="title_box_step_name on">주문완료</span>
                </td>
            </tr>
        </table>
	</div>
    	
    <!-- 주문완료 안내 -->
    <div class="order_title">
        <p>
            주문이 
            <span>완료</span>되었습니다.
        </p>
        <span class="order_num_info">
            주문번호 : <b>${orderResult.order_num}</b>
        </span>
    </div>

    <!-- 콘텐츠 700px -->
    <div id="tex_box">
        <h2 class="sub_title">결제정보</h2>
        <div id="payment_info">
            <table id="tb_payment_info">
                <tr>
                    <td class="td_payment_title top bottom title">총상품금액</td>
                    <td class="td_payment_content top bottom">
                        <fmt:formatNumber value="${orderResult.order_prdPrice}" pattern="###,###" />원
                    </td>
                </tr>
                <tr>
                    <td class="td_payment_title bottom title">총할인금액</td>
                    <td class="td_payment_content bottom txt_color">
                        <fmt:formatNumber value="${orderResult.order_salePrice}" pattern="###,###" />원
                    </td>
                </tr>
                <tr>
                    <td class="td_payment_title bottom title">총배송비</td>
                    <td class="td_payment_content bottom">
                        <fmt:formatNumber value="${orderResult.order_dlvPrice}" pattern="###,###" />원
                    </td>
                </tr>
                <tr>
                    <td class="td_payment_title bottom title big">최종 결제금액</td>
                    <td class="td_payment_content bottom txt_color">
                        <span class="big"><fmt:formatNumber value="${orderResult.order_totalPrice}" pattern="###,###" /></span>원
                    </td>
                </tr> 
            </table>
        </div>	

        <h2 class="sub_title">배송 정보</h2>
        <div id="delivery_info">
            <table id="tb_delivery_info">  
                <tr>
                    <td class="td_delivery_title top bottom title">받는분</td>
                    <td class="td_delivery_content top bottom">
                        ${deliveryResult.delivery_get_name}
                    </td>
                </tr>
                <tr>
                    <td class="td_delivery_title bottom title">연락처</td>
                    <td class="td_delivery_content bottom">
                        ${deliveryResult.delivery_handphone}
                    </td>
                </tr>
                <tr>
                    <td class="td_delivery_title bottom title">주소</td>
                    <td class="td_delivery_content bottom">
                        ${deliveryResult.delivery_address} ${deliveryResult.delivery_address2}
                    </td>
                </tr>
                <tr>
                    <td class="td_delivery_title bottom title">공동현관 출입방법</td>
                    <td class="td_delivery_content bottom">                        
                        <c:choose>
                        <c:when test="${deliveryResult.delivery_pass == 0}">
                        	비밀번호
                        </c:when>
                        <c:when test="${deliveryResult.delivery_pass == 1}">
                        	경비실 호출
                        </c:when>
                        <c:when test="${deliveryResult.delivery_pass == 2}">
                        	자유출입가능
                        </c:when>
                        <c:otherwise>
                        	기타사항
                        </c:otherwise>
                        </c:choose>
                    </td>
                </tr>
                <c:choose>
                <c:when test="${deliveryResult.delivery_pass == 0}">
                <tr>
                    <td class="td_delivery_title bottom title">공동현관 비밀번호</td>
                    <td class="td_delivery_content bottom">${deliveryResult.delivery_pass_content}</td> 
                </tr>       
                </c:when>
                <c:when test="${deliveryResult.delivery_pass == 1}">
                <tr>
                    <td class="td_delivery_title bottom title">경비실 호출 방법</td>
                    <td class="td_delivery_content bottom">${deliveryResult.delivery_pass_content}</td> 
                </tr>  
                </c:when>
                <c:when test="${deliveryResult.delivery_pass == 2}">                	
                </c:when>
                <c:otherwise>
                <tr>
                    <td class="td_delivery_title bottom title">기타 상세 내용</td>
                    <td class="td_delivery_content bottom">${deliveryResult.delivery_pass_content}</td> 
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
    </div>
    <div class="order_btn_area">
        <input type="button" name="do_shoppig_btn" id="do_shoppig_btn" value="쇼핑계속" onclick="location.href='${pageContext.request.contextPath}/main/home.do';">
        <input type="button" name="order_list_btn" id="order_list_btn" value="주문내역조회" onclick="location.href='${pageContext.request.contextPath}/mypage/mypage_orderinq.do';">
    </div>
    <footer>
		<jsp:include page="../main/footer.jsp"/>		
	</footer>
</body>
</html>