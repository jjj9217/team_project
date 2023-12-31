<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List, java.util.HashMap, java.util.Map" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
       
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰 | CreultyFree</title>
<link rel="icon" href="${pageContext.request.contextPath}/resources/img/favicon1.png">

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

    .tit_area{
        overflow: hidden;
        margin-bottom: 30px;
        position: relative;
        width: 100%;
        font-size: 0;
        line-height: 0;
        
    }

    .tit_area .tit{
        float: left;
        color: black;
        font-size: 24px;
        line-height: 30px;
    }

    .accumulate_tit{
        overflow: hidden;
        margin-top: 10px;       
        width: 100%;        
        line-height: 0;
        
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
        height: 50px;
        background-color:rgb(221, 219, 214);
        font: bold 17px Arial, Sans-serif;
    }

    .refund_atag{
        float: left;
        width: 399px;
        height: 50px;
        background-color:#7d99a4; 
        font: bold 17px Arial, Sans-serif;
    }

    #address_atag{
        float: left;
        width: 399px;
        height: 37px;
        line-height: 50px;
        color:black;
    }

    #refund_atag{
        float: left;
        width: 392px;
        height: 37px;
        line-height: 50px;
        color:white;
    }
    
    ul li{      
        list-style:none;
    
    }
    
    

    .buy_list{
    	margin-left: 10px;
        width: 790px;
        height:340px;
    	margin-top:30px;
        text-align: center;
    }

    .goodlist_thumb0{
    	width:80px;
    	height:80px;
    }
    .goodlist_thumb{
    	width:120px;
    	height:120px;
    }
    
    
    
    
    /* 모달 */
    
    /* Modal */

        .modal{
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
        .modal-window {
            background-color: #ffffff;
            border-radius: 5px;
            width: 560px;
            height: 700px;
            position: absolute;
            padding: 10px;
            top: 100px;
            left: 400px;
             
        }
    .title {
        	width: 540px;
            padding-left: 10px;
            padding-right: 10px;
            display: block;
            color: #7d99a4;
            font-weight:bold;
            font-size: 20px;
            margin-bottom: 20px;
    }
            .hr_space{
        	margin: 10px 0;
        	width: 560px;
        	height: 5px;
        	background-color: #7d99a4;
        }
            .close_modal, .close_modalmodify{
        	float: right;
        	display: block;
        	font-size: 36px;
        	cursor: pointer;
        }
    .title h2 {
        display: inline;
    }
    .close-area {
        display: inline;
        float: right;
        padding-right: 10px;
        cursor: pointer;
        text-shadow: 1px 1px 2px gray;
        color: white;
    }
    
    .content {
        margin-top: 20px;
        padding: 0px 10px;
        text-shadow: 1px 1px 2px gray;
        color: white;
    }

		.hidden {
	 	display: none;
	 	}
        .txt_info{
        	width: 420px;
        	margin-left: 130px;
        }
	 	.text_gray{
	 	display: block;
	 	width: 420px;
	 	color:#4a4a4a; 
	 	font-weight: bold;
		  overflow: hidden;
		  text-overflow: ellipsis;
		  white-space: nowrap;
	 	}
		.review_star_box{
		margin-left: 150px;
		padding-top: 20px;
		padding-bottom: 30px;
		
		}
		.txtAr1{
		resize: none;
		padding: 10px;
		border: 1px solid #7d99a4;
		outline:none;
		}
		.txtAr2{
		resize: none;
		padding: 10px;
		border: 1px solid #7d99a4;
		outline-color:#7d99a4;
		}



    .review_reg_background{
    width: 100%;
    height: 80px;
    
    display : flex;
    justify-content: center;
    align-items : center;
    }


    .item_info{
    	display: block;
        width: 100%;
        height: 165px;
    }

    .item_info .a{
        width: 100%;
        height: 85px;
    }

    .thum{
        float: left;
        width: 85px;
        height: 85px;
    }

    .write_step{
        width: 480px;
        height: auto;
        
    }

    .review_rating{
        width: 100%;
        height: 32px;
        padding-top: 25px;
        padding-bottom: 7px;
        
    }

    .review_tit{
        float: left;
        width: auto;
        margin-right: 50px;
    }

    .star_inner li{
        float:left;
    }

    

    #review_content_back{
        height: 210px;
        
    }

    .review_content{
        height: auto;
    	margin-top: 10px;
    	padding: 10px;
        float: right;
    }
     .review_content2{
        height: auto;
    	margin-top: 10px;
    	padding: 10px;
        float: left;
    }   
    #review_content_textarea{
        width: 475px;
        height: 155px;
        font-size: 15px;
    }

    .review_content_bottom{
        float: right;
        
    }

    .photo-update{
        height: 170px;
        
    }

    .step_cont{
        height: 160px;          
    }
    .step_cont1{
    	display: block;
        height: auto;          
    }
    .photo-list-info{
        margin-bottom: 12px;
        line-height: 40px;
        font-size: 20px;
    }



    #imgArea{
        width: 100%;
        height: 80px;
        padding-inline-start: 0px;
        
        display : flex;
        justify-content: center;
        align-items : center;
        text-align: center;
    }

    #imgArea li{
        width: 120px;
        height: 80px;
        float: left;
    }

    .btn_img_add{
        width: 80px;
        height: 80px;
    }

    .rw-photo-list p{
        font-size: 10px;
        text-align: center;
        
    }
    .buy_list_container{display: block; width: 790px; height: auto; margin: 0 auto; padding: 10px; margin-top: 50px;}
    .buy_list, .order_list{border-collapse: collapse;}
    .th_product{width: 290px; height: 20px; padding: 10px 0; background-color: rgb(224, 224, 224);}
    .th_review{width: 500px; height: 20px; padding: 10px 0; background-color: rgb(224, 224, 224);}
	.td_product{width: 280px; height: auto; padding: 10px 5px; font-size:14px; font-weight: bold;}
    .td_review{width: 490px; height: auto; padding: 30px 5px; text-align: center; border-left: 1px solid #a4a4a4; font-size:14px;}
    .td_empty{width: 790px; height: auto;}
    .top{border-top: 2px solid #4a4a4a}
    .bottom{border-bottom: 1px solid #a4a4a4}
    
     .paging{ 
        width:790px;
        height:150px;
        float:left;
        display: flex;
        justify-content: center;
        align-items: center;
    }

    #td_paging{
        height: 70px;
        font: 20px Arial, Sans-serif;
        text-align: center;
    }
    
    .prd_box,.review_box{
    	display:flex;
    }
    .prd_img_box{
    	display:block;
    	margin-right: 10px;
    	cursor: pointer;
    }
    .prd_item_box{    	
    	display:block;
    	text-align: left;
    	width:260px;
    	height:80px;
    	cursor: pointer;
    }
    .grayDate{
    display: block;
    width:200px;
    height:16px;
    color: #4a4a4a;
    font-weight: bold;
    }
    .prd_item_name{
      overflow: hidden;
  text-overflow: ellipsis;
  white-space: nowrap;
        display: block;
    width:260px;
    height:16px;
    }
    .review_item_box{
        	display:block;
    	text-align: left;
    	width:280px;
    	height:80px;
    	margin-left: 10px;
    }
    .review_btn_box{
            	display:block;
    	text-align: center;
    	width:120px;
    	height:80px;
    	cursor: pointer;
    }
    .star_box{
    padding: 5px;
    margin: 5px 0;
    }
    .review_content_box{
          overflow: hidden;
  text-overflow: ellipsis;
  white-space: nowrap;
        display: block;
    width:260px;
    height:16px;
    }
    .review_edit_btn{
    	padding: 10px 0; 
    }
    .review_view_btn{
    padding-bottom: 10px;
    }    
    .reviewmodify{
    	width: 80px;
    	height: 30px;
    	border: 1px solid #7d99a4;
    	color: #7d99a4;
    	background-color: #fff;
    	border-radius: 5px;
    	font-weight: bold;
    }
    .reviewView{
    	width: 80px;
    	height: 30px;
    	border: 1px solid #7d99a4;
    	color: #fff;
    	background-color: #7d99a4;
    	border-radius: 5px;
    	font-weight: bold;
    }
    .rvContentTitle{
    	color: #7d99a4;
    	font-weight: bold;
    }
    .grayText{
    color:#4a4a4a;
    font-size:10px;
    font-weight: bold;
    }
    .btnLookup{
        width: 200px;
        height: 50px;
        color: #7d99a4;
        margin-left: 20px;       
    	font-weight: bold;
    	border-radius: 5px;
    	border: 1px solid #7d99a4;
    	background-color: #fff;
    }
    .reviewModifyup{
        width: 200px;
        height: 50px;
        color: #fff;
        margin-left: 20px; 
        font-weight: bold;
    	border-radius: 5px;
    	border: 1px solid #7d99a4;
    	background-color: #7d99a4;     
    }
    .edit_star{
    	cursor: pointer;
    }
    
    
    
    
    /*       파일업로드 선택 디자인 */

	    .gallery-file {
  display: none; /* input 노드 숨기기 */
}

.file-button {
	width:65px;
	height:65px;
	margin-right: 1px;
	margin-left: 1px;
  background-color: orange;
  border: 1px solid black;
  border-radius: 5px;
  padding: 5px 10px;
  cursor: pointer;
  float:left;
}

	    .gallery-file2 {
  display: none; /* input 노드 숨기기 */
}

.file-button2 {
	width:65px;
	height:65px;
	margin-right: 1px;
	margin-left: 1px;
  background-color: orange;
  border: 1px solid black;
  border-radius: 5px;
  padding: 5px 10px;
  cursor: pointer;
  float:left;
}

	    .gallery-file3 {
  display: none; /* input 노드 숨기기 */
}

.file-button3 {
	width:65px;
	height:65px;
	margin-right: 1px;
	margin-left: 1px;
  background-color: orange;
  border: 1px solid black;
  border-radius: 5px;
  padding: 5px 10px;
  cursor: pointer;
  float:left;
}

	    .gallery-file4 {
  display: none; /* input 노드 숨기기 */
}

.file-button4 {
	width:65px;
	height:65px;
	margin-right: 1px;
	margin-left: 1px;
  background-color: orange;
  border: 1px solid black;
  border-radius: 5px;
  padding: 5px 10px;
  cursor: pointer;
  float:left;
}

	    .gallery-file5 {
  display: none; /* input 노드 숨기기 */
}

.file-button5 {
	width:65px;
	height:65px;
	margin-right: 1px;
	margin-left: 1px;
  background-color: orange;
  border: 1px solid black;
  border-radius: 5px;
  padding: 5px 10px;
  cursor: pointer;
  float:left;
}

.modifyreviewimg{
	width:75px;
	height:75px;
	margin-right: 1px;
	margin-left: 1px;
	  
  
}
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

.onfile{
	display: flex;
	justify-content:center;
    align-content:center;
    align-items:center;
	width:44px; height:20px;
    font-size:25px;
    cursor:pointer;
}

  .file{
display: none; }
.imgEditContent{
	width:96px;
    height:96px;
}
.originimg{
        width:96px;
        height:96px;
    }
    .rw-photo-list {
    	width: 500px;
    	height: 120px;
    	margin-left: 10px;
    	display: flex;
    	justify-content: center;
    	align-items: center;
    }
    .imgSpan{
    	width: 96px; height: 116px;
    	padding: 2px;
    	border-radius:5px;
    	border:1px solid #7d99a4;
    }
    .reviewViewImg{
    width:96px;
	height:116px;
    }
    .rw-photo-list2{
    display:flex;
    width: 500px;
    height: 130px;
    }
    .imgEditBox{
    display:block;
    width: 96px;
    height: 126px;
    padding: 2px;
    border: 1px solid #7d99a4;
    border-radius: 5px;
    margin-right: 5px;
    }
    .imgEditBtnBox{
    display:flex;
    width: 96px;
    height: 26px;
    padding: 0;
    }
    .imgEditPlusBtn{
    display:flex;
    width: 44px;
    height: 26px;
    justify-content:center;
    align-content:center;
    align-items:center;
    }
    .imgEditCloseBtn{
    display:flex;
    width: 44px;
    height: 26px;
    justify-content:center;
    align-content:center;
    align-items:center;
    }
    .fileclose{
    display:flex;
    justify-content:center;
    align-content:center;
    align-items:center;
    width: 44px;
    height: 20px;
    border:1px solid #7d99a4;
    border-radius: 5px;
    color: #fff;
    background-color: #7d99a4;
    font-weight: bold;
    font-size: 12px;
    }
    
    .viewrwviewimg{
    width:500px;
    height:500px;
    position: absolute;
    left : 40px;
    top: 120px;
    }
    
    
    .viewrwviewimgclose{
    width:50;
    height:50px;
    position: absolute;
    z-index: 2;
    cursor: pointer;
    top:120px;
    right:40px;
    }
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
            <tr><th><h3><a class="hoverClass" href="${pageContext.request.contextPath}/mypage/mypage_main.do" id="mylink">마이페이지</a></h3></th></tr>         
            <tr><td class="mypagetable">마이 쇼핑</td></tr>
            <tr><td><a class="hoverClass" href="${pageContext.request.contextPath}/mypage/mypage_orderinq.do">주문/배송조회</a></td></tr>
            <tr><td><a class="hoverClass" href="${pageContext.request.contextPath}/mypage/mypage_cancelinq.do">취소/반품내역</a></td></tr>
            <tr><td><hr width=100%></td></tr>
            <tr><td><a class="hoverClass" href="${pageContext.request.contextPath}/purchase/basket.do">장바구니</a></td></tr>
            <tr><td><a class="hoverClass" href="${pageContext.request.contextPath}/mypage/mypage_like.do">좋아요</a></td></tr>
            <tr><td><a class="hoverClass" href="${pageContext.request.contextPath}/mypage/mypage_coupon.do">쿠폰</a></td></tr>
            <tr><td><hr width=100%></td></tr>
            <tr><td class="mypagetable">마이활동</td></tr>
            <tr><td><a class="hoverClass" href="${pageContext.request.contextPath}/one_inq/one_inq_list.do">1:1문의내역</a></td></tr>
            <tr><td><a class="hoverClass" href="${pageContext.request.contextPath}/mypage/mypage_nonreview.do"style="font-weight:bold; color:#7d99a4;">리뷰</a></td></tr>
            <tr><td><a class="hoverClass" href="${pageContext.request.contextPath}/mypage/mypage_productQnA.do">상품문의내역</a></td></tr>
            <tr><td><hr width=100%></td></tr>
            <tr><td class="mypagetable">마이 정보</td></tr>
            <tr><td><a class="hoverClass" href="${pageContext.request.contextPath}/mypage/mypage_modifymain.do">회원정보 수정</a></td></tr>
            <tr><td><a class="hoverClass" href="${pageContext.request.contextPath}/mypage/mypage_deliverymain.do">배송지</a></td></tr>
        </table>        
    </div>
    <div id="mypage-conts">
        <div id="blank">            
        </div>
        <div class="tit_area">
            <h2 class="tit">&nbsp;&nbsp;리뷰</h2>         
        </div>
        <ul class="address_or_refund">
            <li class="address_atag">
            <form name="caf2" action="${pageContext.request.contextPath}/mypage/mypage_nonreview.do" method="get">                        
                    </form>          
            <a href="#" id="address_atag" onclick="document.forms['caf2'].submit();">리뷰작성</a></li>            
            <li class="refund_atag">            
            <form name="caf" action="${pageContext.request.contextPath}/mypage/mypage_review.do" method="get">
                       
                    </form>
                    <a href="#" id="refund_atag" onclick="document.forms['caf'].submit();">
            나의 리뷰</a></li>
        </ul>
        <table class="buy_list">        
         <tr>
             <th class="th_product top bottom" scope="col">상품</th>
             <th class="th_review top bottom" scope="col">리뷰</th>                 
         </tr>
         <c:forEach var="rowNum" begin="${pageNav.startNum}" end="${pageNav.endNum}">
	        <c:if test="${empty reviewproductList[rowNum-1]}">
	        
	        <c:choose>
	        <c:when test="${!empty reviewproductList[0].product_name}">
	        </c:when>
	        <c:otherwise>
	        <c:if test="${rowNum == 1}">
	        	<tr>
	           <td class="td_empty bottom" colspan="2">
	           작성하신 리뷰가 없습니다.
	           </td>
	           </tr>
	        </c:if>
	        </c:otherwise>
	        </c:choose>                
	           
	        </c:if>         
         <!-- c:if nonreviewfileList[rowNum-1]. = null이면 리뷰안쓴목록만 출력하는방식도 있을 듯? -->
         <c:if test="${!empty reviewproductList[rowNum-1].review_content}">
         <tr>                
             <td class="td_product bottom">
             <div class="prd_box">
             <div class="prd_img_box">
             <img class="goodlist_thumb0" src="${pageContext.request.contextPath}/resources/uploads/${reviewfileList[rowNum-1].saveFile}">
             </div>
             <div class="prd_item_box">
             <span class="grayDate">구매일자: &nbsp;<fmt:formatDate value="${reviewproductList[rowNum-1].order_date}" pattern="yyyy.MM.dd" /></span><br>
             <div class="prd_item_name">
             ${reviewproductList[rowNum-1].product_name}
             <input type="hidden" class="prdIdxClass" value="${reviewproductList[rowNum-1].product_idx}">
             </div>
             </div>
             </div>
             </td>                                        
             <td class="td_review bottom">
             <div class="review_box">
             <div class="review_item_box">
             <span class="grayDate">&nbsp;작성날짜: &nbsp;<fmt:formatDate value="${reviewproductList[rowNum-1].review_regDate}" pattern="yyyy.MM.dd" /></span>
	         <div class="star_box">
          	<c:choose>
          	<c:when test="${reviewproductList[rowNum-1].review_score == 1}">
          	<img src="../resources/img/star_full.png" width="20px" height="20px">
          	<img src="../resources/img/star_empty.png" width="20px" height="20px">
          	<img src="../resources/img/star_empty.png" width="20px" height="20px">
          	<img src="../resources/img/star_empty.png" width="20px" height="20px">
          	<img src="../resources/img/star_empty.png" width="20px" height="20px">
          	</c:when>
          	<c:when test="${reviewproductList[rowNum-1].review_score == 2}">
          	<img src="../resources/img/star_full.png" width="20px" height="20px">
          	<img src="../resources/img/star_full.png" width="20px" height="20px">
          	<img src="../resources/img/star_empty.png" width="20px" height="20px">
          	<img src="../resources/img/star_empty.png" width="20px" height="20px">
          	<img src="../resources/img/star_empty.png" width="20px" height="20px">
          	</c:when>
          	<c:when test="${reviewproductList[rowNum-1].review_score == 3}">
          	<img src="../resources/img/star_full.png" width="20px" height="20px">
          	<img src="../resources/img/star_full.png" width="20px" height="20px">
          	<img src="../resources/img/star_full.png" width="20px" height="20px">
          	<img src="../resources/img/star_empty.png" width="20px" height="20px">
          	<img src="../resources/img/star_empty.png" width="20px" height="20px">
          	</c:when>
          	<c:when test="${reviewproductList[rowNum-1].review_score == 4}">
          	<img src="../resources/img/star_full.png" width="20px" height="20px">
          	<img src="../resources/img/star_full.png" width="20px" height="20px">
          	<img src="../resources/img/star_full.png" width="20px" height="20px">
          	<img src="../resources/img/star_full.png" width="20px" height="20px">
          	<img src="../resources/img/star_empty.png" width="20px" height="20px">
          	</c:when>
          	<c:otherwise>
          	<img src="../resources/img/star_full.png" width="20px" height="20px">
          	<img src="../resources/img/star_full.png" width="20px" height="20px">
          	<img src="../resources/img/star_full.png" width="20px" height="20px">
          	<img src="../resources/img/star_full.png" width="20px" height="20px">
          	<img src="../resources/img/star_full.png" width="20px" height="20px">  
          	</c:otherwise>
          	</c:choose>                                    
	         </div>
	         <div class="review_content_box">
	         &nbsp;${reviewproductList[rowNum-1].review_content}
	         </div>
             </div>
             <div class="review_btn_box">
             <div class="review_edit_btn">
                 <button type="button" class="reviewmodify" id="review_View" >리뷰 수정</button>
             </div>
             <div class="review_view_btn">
                 <button type="button" class="reviewView" id="review_View" >리뷰 보기</button>
             </div>
             </div>
             </div>
             </td>    
         </tr>


<div id="modal" class="modal_modify0 modal hidden">    
    <div class="modal-window">
        <div class="title">
            <h2>리뷰 보기</h2>
            <span class="close_modal">X</span>
        </div>
        <div class="hr_space"></div>
        <div class="item_info">            
                <c:if test="${!empty reviewproductList[rowNum-1].product_name}">
                    <span class="thum"><img class="goodlist_thumb" src="${pageContext.request.contextPath}/resources/uploads/${reviewfileList[rowNum-1].saveFile}"></span>
                    <div class="txt_info">
                        <span class="text_gray">${reviewproductList[rowNum-1].product_name}</span>
                        <input type="hidden" name="product_idx" value="${reviewproductList[rowNum-1].product_idx}">
                    </div>
                </c:if>
        <div class="review_star_box">
          	<c:choose>
          	<c:when test="${reviewproductList[rowNum-1].review_score == 1}">
          	<img src="../resources/img/star_full.png" width="50px" height="50px">
          	<img src="../resources/img/star_empty.png" width="50px" height="50px">
          	<img src="../resources/img/star_empty.png" width="50px" height="50px">
          	<img src="../resources/img/star_empty.png" width="50px" height="50px">
          	<img src="../resources/img/star_empty.png" width="50px" height="50px">
          	</c:when>
          	<c:when test="${reviewproductList[rowNum-1].review_score == 2}">
          	<img src="../resources/img/star_full.png" width="50px" height="50px">
          	<img src="../resources/img/star_full.png" width="50px" height="50px">
          	<img src="../resources/img/star_empty.png" width="50px" height="50px">
          	<img src="../resources/img/star_empty.png" width="50px" height="50px">
          	<img src="../resources/img/star_empty.png" width="50px" height="50px">
          	</c:when>
          	<c:when test="${reviewproductList[rowNum-1].review_score == 3}">
          	<img src="../resources/img/star_full.png" width="50px" height="50px">
          	<img src="../resources/img/star_full.png" width="50px" height="50px">
          	<img src="../resources/img/star_full.png" width="50px" height="50px">
          	<img src="../resources/img/star_empty.png" width="50px" height="50px">
          	<img src="../resources/img/star_empty.png" width="50px" height="50px">
          	</c:when>
          	<c:when test="${reviewproductList[rowNum-1].review_score == 4}">
          	<img src="../resources/img/star_full.png" width="50px" height="50px">
          	<img src="../resources/img/star_full.png" width="50px" height="50px">
          	<img src="../resources/img/star_full.png" width="50px" height="50px">
          	<img src="../resources/img/star_full.png" width="50px" height="50px">
          	<img src="../resources/img/star_empty.png" width="50px" height="50px">
          	</c:when>
          	<c:otherwise>
          	<img src="../resources/img/star_full.png" width="50px" height="50px">
          	<img src="../resources/img/star_full.png" width="50px" height="50px">
          	<img src="../resources/img/star_full.png" width="50px" height="50px">
          	<img src="../resources/img/star_full.png" width="50px" height="50px">
          	<img src="../resources/img/star_full.png" width="50px" height="50px">  
          	</c:otherwise>
          	</c:choose>         
        </div>        
        </div>
        <div class="review_content">
        	<span class="rvContentTitle">리뷰내용</span>
            <textarea id="review_content_textarea" class="txtAr1" name="review_content" readonly>${reviewproductList[rowNum-1].review_content}</textarea>
        </div>          
        <ul class="write_step">
            <li class="photo-update"><!-- 리뷰 고도화 : class 추가 -->
                <div class="step_cont">
                    <!-- 리뷰 고도화 : 추가 -->
                    <div class="photo-list-info">                        
                        <strong>리뷰 포토</strong>
                    </div>
                    <div class="rw-photo-list">
                        <c:forEach var="fileVoList" items="${reviewRegList}">										
                            <c:forEach var="fileVo" items="${fileVoList}">                            		                            	
                                <c:if test="${reviewproductList[rowNum-1].review_idx eq fileVo.review_idx}">
                                        <c:if test ="${fileVo.saveFile ne null}">
                                       <span class="thum imgSpan"><img class="goodlist_thumb reviewViewImg" src="${pageContext.request.contextPath}/resources/uploads/${fileVo.saveFile}" style="cursor:pointer;"></span>
                                                    <img class="viewrwviewimg" src="${pageContext.request.contextPath}/resources/uploads/${fileVo.saveFile}" style="display:none;">
                                                    <img class="viewrwviewimgclose" src="${pageContext.request.contextPath}/resources/uploads/reviewclose.png" style="display:none;" >
                                        </c:if>
                                </c:if>                         
                            </c:forEach>
                        </c:forEach>
                        
                        <%-- <c:forEach var="rowNumE" begin="1" end="5">
                            <c:if test="${!empty reviewRegList[rowNumE-1].saveFile}">
                                <span class="thum"><img class="goodlist_thumb" src="${pageContext.request.contextPath}/resources/uploads/${reviewReg[rowNumE-1].saveFile}"></span>
                            </c:if>
                        </c:forEach>   --%>                      
                    </div>
                </div>
            </li>       
        </ul>
       
    </div>    
</div>

                                        <!-- 아래는 리뷰수정 Modal -->
<form name="caq" class="test01" enctype="multipart/form-data">
<div id="modal" class="modal_modify1 modal hidden">    
    <div class="modal-window">
        <div class="title">
            <h2>리뷰 수정</h2>
            <span class="close_modalmodify">X</span>
        </div>
        <div class="item_info">            
                <c:if test="${!empty reviewproductList[rowNum-1].product_name}">
                    <span class="thum"><img class="goodlist_thumb" src="${pageContext.request.contextPath}/resources/uploads/${reviewfileList[rowNum-1].saveFile}"></span>
                    <div class="txt_info">
                        <span class="text_gray">${reviewproductList[rowNum-1].product_name}</span>
                        <input type="hidden" name="product_idx" value="${reviewproductList[rowNum-1].product_idx}">
                    </div>
                </c:if>
        <input type="hidden" class="review_score_input" name="review_score" value="${reviewproductList[rowNum-1].review_score}">        
        <div class="review_star_box edit_star">
          	<c:choose>
          	<c:when test="${reviewproductList[rowNum-1].review_score == 1}">
          	<img class="review_star" src="../resources/img/star_full.png" width="50px" height="50px">
          	<img class="review_star" src="../resources/img/star_empty.png" width="50px" height="50px">
          	<img class="review_star" src="../resources/img/star_empty.png" width="50px" height="50px">
          	<img class="review_star" src="../resources/img/star_empty.png" width="50px" height="50px">
          	<img class="review_star" src="../resources/img/star_empty.png" width="50px" height="50px">
          	</c:when>
          	<c:when test="${reviewproductList[rowNum-1].review_score == 2}">
          	<img class="review_star" src="../resources/img/star_full.png" width="50px" height="50px">
          	<img class="review_star" src="../resources/img/star_full.png" width="50px" height="50px">
          	<img class="review_star" src="../resources/img/star_empty.png" width="50px" height="50px">
          	<img class="review_star" src="../resources/img/star_empty.png" width="50px" height="50px">
          	<img class="review_star" src="../resources/img/star_empty.png" width="50px" height="50px">
          	</c:when>
          	<c:when test="${reviewproductList[rowNum-1].review_score == 3}">
          	<img class="review_star" src="../resources/img/star_full.png" width="50px" height="50px">
          	<img class="review_star" src="../resources/img/star_full.png" width="50px" height="50px">
          	<img class="review_star" src="../resources/img/star_full.png" width="50px" height="50px">
          	<img class="review_star" src="../resources/img/star_empty.png" width="50px" height="50px">
          	<img class="review_star" src="../resources/img/star_empty.png" width="50px" height="50px">
          	</c:when>
          	<c:when test="${reviewproductList[rowNum-1].review_score == 4}">
          	<img class="review_star" src="../resources/img/star_full.png" width="50px" height="50px">
          	<img class="review_star" src="../resources/img/star_full.png" width="50px" height="50px">
          	<img class="review_star" src="../resources/img/star_full.png" width="50px" height="50px">
          	<img class="review_star" src="../resources/img/star_full.png" width="50px" height="50px">
          	<img class="review_star" src="../resources/img/star_empty.png" width="50px" height="50px">
          	</c:when>
          	<c:otherwise>
          	<img class="review_star" src="../resources/img/star_full.png" width="50px" height="50px">
          	<img class="review_star" src="../resources/img/star_full.png" width="50px" height="50px">
          	<img class="review_star" src="../resources/img/star_full.png" width="50px" height="50px">
          	<img class="review_star" src="../resources/img/star_full.png" width="50px" height="50px">
          	<img class="review_star" src="../resources/img/star_full.png" width="50px" height="50px">  
          	</c:otherwise>
          	</c:choose>         
        </div>                
        </div>
        <div class="review_content2">
            <textarea id="review_content_textarea"  class="txtAr2" name="review_content" placeholder="꿀팁 가득, 상세한 리뷰를 작성해보세요!&#10;도움수가 올라가면 포인트도 받고,&#10;탑리뷰어가 될 확률도 높아져요!&#10;반품, 환불 관련 내용은 고객센터로 별도 문의해주세요.">${reviewproductList[rowNum-1].review_content}</textarea>
	        <div class="step_cont1">
	            <div class="photo-list-info">
	                <strong>포토</strong>	                
	            </div>
	            <div class="rw-photo-list2">                            	                                                                          	            
	             
	                <!-- 0 -->
               <div class="imgEditBox">
               <div class="imgEditContent">
               <c:forEach var="fileVoList" items="${reviewRegList}" >                                     
                      <c:forEach var="fileVo" items="${fileVoList}" varStatus="status">                         
                            <c:if test="${(reviewproductList[rowNum-1].review_idx eq fileVo.review_idx) and (status.index eq 0)}">
                            		<c:choose>
                            		<c:when test="${fileVo.saveFile ne null}">
                                     <img class="originimg" src="${pageContext.request.contextPath}/resources/uploads/${fileVo.saveFile}" id="${status.index}" style="display:flex">                                     
                            		</c:when>
                            		<c:otherwise>
                            		 <input type="hidden" class="originimg">                                     
                            		</c:otherwise>
                            		</c:choose>
                            </c:if>                                                                               
                   </c:forEach>
               </c:forEach>
               <div class="boxtest"></div>
               </div>
               <div class="imgEditBtnBox">
	               <input type="file" class="file" name="attachedFile" >
	           <div class="imgEditPlusBtn">
	               <span class="onfile">+</span>
	           </div>    
	               <input type="hidden" class="originDel" name="para" value="0"> 
	           <div class="imgEditCloseBtn">    
	               <input type="button" class="fileclose" value="삭제" style="dispaly:flex">
	           </div>    
               </div>   
                                                        
               </div>
               
	                
	                
	                
	                <div class="imgEditBox">
	                <div class="imgEditContent">
               <c:forEach var="fileVoList" items="${reviewRegList}" >                                     
                      <c:forEach var="fileVo" items="${fileVoList}" varStatus="status">                         
                            <c:if test="${(reviewproductList[rowNum-1].review_idx eq fileVo.review_idx) and (status.index eq 1)}">
                            		<c:choose>
                            		<c:when test="${fileVo.saveFile ne null}">
                                     <img class="originimg" src="${pageContext.request.contextPath}/resources/uploads/${fileVo.saveFile}" id="${status.index}" style="display:flex">                                     
                            		</c:when>
                            		<c:otherwise>
                            		 <input type="hidden" class="originimg">                                     
                            		</c:otherwise>
                            		</c:choose>                                         
                            </c:if>                                                                               
                   </c:forEach>
               </c:forEach>
               <div class="boxtest"></div>
               </div>
               <div class="imgEditBtnBox">
	               <input type="file" class="file" name="attachedFile" >
	           <div class="imgEditPlusBtn">
	               <span class="onfile">+</span>
	           </div>    
	               <input type="hidden" class="originDel" name="para" value="0"> 
	           <div class="imgEditCloseBtn">    
	               <input type="button" class="fileclose" value="삭제" style="dispaly:flex">
	           </div>    
               </div>                
                     </div>
	                
	                
	                
	                <div class="imgEditBox">
	                <div class="imgEditContent">
               <c:forEach var="fileVoList" items="${reviewRegList}" >                                     
                      <c:forEach var="fileVo" items="${fileVoList}" varStatus="status">                         
                            <c:if test="${(reviewproductList[rowNum-1].review_idx eq fileVo.review_idx) and (status.index eq 2)}">
                            		<c:choose>
                            		<c:when test="${fileVo.saveFile ne null}">
                                     <img class="originimg" src="${pageContext.request.contextPath}/resources/uploads/${fileVo.saveFile}" id="${status.index}" style="display:flex">                                     
                            		</c:when>
                            		<c:otherwise>
                            		 <input type="hidden" class="originimg">                                     
                            		</c:otherwise>
                            		</c:choose>                                       
                            </c:if>                                                                               
                   </c:forEach>
               </c:forEach>
               <div class="boxtest"></div>
               </div>   
               <div class="imgEditBtnBox">
	               <input type="file" class="file" name="attachedFile" >
	           <div class="imgEditPlusBtn">
	               <span class="onfile">+</span>
	           </div>    
	               <input type="hidden" class="originDel" name="para" value="0"> 
	           <div class="imgEditCloseBtn">    
	               <input type="button" class="fileclose" value="삭제" style="dispaly:flex">
	           </div>    
               </div>                                 
                     </div>
	                
	                
	                <div class="imgEditBox">
	                <div class="imgEditContent">
               <c:forEach var="fileVoList" items="${reviewRegList}" >                                     
                      <c:forEach var="fileVo" items="${fileVoList}" varStatus="status">                         
                            <c:if test="${(reviewproductList[rowNum-1].review_idx eq fileVo.review_idx) and (status.index eq 3)}">
                            		<c:choose>
                            		<c:when test="${fileVo.saveFile ne null}">
                                     <img class="originimg" src="${pageContext.request.contextPath}/resources/uploads/${fileVo.saveFile}" id="${status.index}" style="display:flex">                                     
                            		</c:when>
                            		<c:otherwise>
                            		 <input type="hidden" class="originimg">                                     
                            		</c:otherwise>
                            		</c:choose>                                      
                            </c:if>                                                                               
                   </c:forEach>
               </c:forEach>
               <div class="boxtest"></div>  
               </div> 
               <div class="imgEditBtnBox">
	               <input type="file" class="file" name="attachedFile" >
	           <div class="imgEditPlusBtn">
	               <span class="onfile">+</span>
	           </div>    
	               <input type="hidden" class="originDel" name="para" value="0"> 
	           <div class="imgEditCloseBtn">    
	               <input type="button" class="fileclose" value="삭제" style="dispaly:flex">
	           </div>    
               </div>                                      
                     </div>
	                
	                
	                <div class="imgEditBox">
	                <div class="imgEditContent">
               <c:forEach var="fileVoList" items="${reviewRegList}" >                                     
                      <c:forEach var="fileVo" items="${fileVoList}" varStatus="status">                         
                            <c:if test="${(reviewproductList[rowNum-1].review_idx eq fileVo.review_idx) and (status.index eq 4)}">
                            		<c:choose>
                            		<c:when test="${fileVo.saveFile ne null}">
                                     <img class="originimg" src="${pageContext.request.contextPath}/resources/uploads/${fileVo.saveFile}" id="${status.index}" style="display:flex">                                     
                            		</c:when>
                            		<c:otherwise>
                            		 <input type="hidden" class="originimg">                                     
                            		</c:otherwise>
                            		</c:choose>                                         
                            </c:if>                                                                               
                   </c:forEach>
               </c:forEach>
               <div class="boxtest"></div>   
               </div>
               <div class="imgEditBtnBox">
	               <input type="file" class="file" name="attachedFile" >
	           <div class="imgEditPlusBtn">
	               <span class="onfile">+</span>
	           </div>    
	               <input type="hidden" class="originDel" name="para" value="0"> 
	           <div class="imgEditCloseBtn">    
	               <input type="button" class="fileclose" value="삭제" style="dispaly:flex">
	           </div>    
               </div>                               
                     </div>
	                
	                
	                
	                
	            </div>
	                <span class="grayText">	사진은 8MB이하의 PNG, JPG 파일만 등록 가능합니다.</span>
	        </div>            
	        <div class="review_reg_background">
	            <input type="hidden" name="review_idx" value="${reviewproductList[rowNum-1].review_idx}">                                                                     
	            <button type="button" class="btnLookup" id="review_ok">닫기</button>
	            <button type="button" class="reviewModifyup" >리뷰 수정하기</button>                                  
	        </div>
        </div>          
    </div>    
</div>
</form>



                            </c:if>
                                </c:forEach>

        </table>
        
        
        <!--페이징처리 -->
        <div class="paging">
            <table>
                <tr>
                    <td id="td_paging" colspan="6">
                    
                        <c:if test="${pageNav.pageNum > pageNav.pages_per_block}">
                            <a href="mypage_review.do?pageNum=1&pageBlock=1"><input type="button" id="end" value="처음"></a>&nbsp;
                            <a href="mypage_review.do?pageNum=${(pageNav.pageBlock - 2)*pageNav.pages_per_block + 1}&pageBlock=${pageNav.pageBlock-1}">
                                <input type="button" id="next" value="이전">
                            </a>    
                        </c:if>                     
                        <c:forEach var="i" begin="${(pageNav.pageBlock-1)*pageNav.pages_per_block + 1}" end="${pageNav.pageBlock*pageNav.pages_per_block}">
                            <c:if test="${i le pageNav.totalPageNum}">
                                <c:choose>
                                    <c:when test = "${pageNav.pageNum eq i}">
                                        <a href="mypage_review.do?pageNum=${i}&pageBlock=${pageNav.pageBlock}">
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
                        <c:if test="${((pageNav.rows_per_page*pageNav.pages_per_block) lt pageNav.totalRows) and (pageNav.pageBlock ne pageNav.lastPageBlock) }">
                            <a href="mypage_review.do?pageNum=${pageNav.pageBlock*pageNav.pages_per_block+1}&pageBlock=${pageNav.pageBlock+1}"><input type="button" id="next" value="다음"></a>&nbsp;
                            <a href="mypage_review.do?pageNum=${pageNav.totalPageNum}&pageBlock=${pageNav.lastPageBlock}"><input type="button" id="end" value="마지막"></a>
                        </c:if>                                                          
                    </td>
                </tr>
            </table>
        </div>
        
   
    </div>
</div>

<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
$(function(){//jQuery
    $(".reviewView").click(function(){ 
        var index = $(".reviewView").index(this);
        
        $(".modal_modify0").eq(index).removeClass("hidden");      
    });        
    $(".close_modal").click(function(){
        var index2 = $(".close_modal").index(this);        
        $(".modal_modify0").eq(index2).addClass("hidden");
    });
    $(".reviewmodify").click(function(){ 
        var index = $(".reviewmodify").index(this);        
        $(".modal_modify1").eq(index).removeClass("hidden");      
    });
    
    //리뷰수정 x버튼 클릭시 초기화
    $(".close_modalmodify").click(function(){
        var index2 = $(".close_modalmodify").index(this);        
        $(".modal_modify1").eq(index2).addClass("hidden");
        
        $(".test01").eq(index2).each(function() {
            this.reset();
        });       
    });
  
    //리뷰수정 닫기 버튼 클릭시 초기화  
    $(".btnLookup").click(function(){
		var index = $(".btnLookup").index(this);
	    $(".modal_modify1").eq(index).addClass("hidden");
	    
	    $(".test01").eq(index).each(function() {
            this.reset();
        }); 
	});
    
    
   
    $(".prd_item_box").click(function(){
		var index = $(".prd_item_box").index(this);
	    var prdNum = $(".prdIdxClass").eq(index).val();
	    
	    window.location.href = "${pageContext.request.contextPath}/product/product_view.do?prdNum=" + prdNum;
	});
    
    
//     $(".reviewModifyup").click(function(){
//         var index2 = $(".reviewModifyup").index(this);
//         alert("작성이 완료되었습니다.");
//         $(".test01").eq(index2).submit();                   
//     });
});
















//index번째 모달창의 리뷰수정버튼 클릭
$(function(){//jQuery                        
    $(".reviewModifyup").click(function(){
        var index2 = $(".reviewModifyup").index(this);       
        var formClass = $(".test01").eq(index2);        
        formClass.attr('method', 'POST');
        formClass.attr('action', '${pageContext.request.contextPath}/mypage/mypage_reviewModifyReg_process.do');                    
        formClass.submit();
        alert("작성이 완료되었습니다.");        
    });
});
//리뷰 파일 수정에 대한 이벤트 처리들
//Span +를 클릭시 .file클래스로 사진을 클릭하도록 수행하는 구문
document.querySelectorAll('.onfile').forEach((onfile) => {            
    onfile.addEventListener("click", function () {
        var fileonindex = $(".onfile").index(this);
        $(".file").eq(fileonindex).click();     
    });
});
//1.파일 등록시 일어나는 이벤트
document.querySelectorAll('.file').forEach((file) => {
      file.addEventListener('change', function() {              // .file클래스의 파일이 선택되어 값이 체인지시 아래 구문 실행 
          var reader = new FileReader();
          var fileindex = $(".file").index(this);               // .file class에 해당되는 인덱스값 구하기          
          var imgdisplay = $(".originimg").eq(fileindex).css('display');
          if (imgdisplay === 'flex'){
        $(".originimg").eq(fileindex).css('display','none')  
        $(".onfile").eq(fileindex).css('display','none');       // Span +버튼 감추기
        $(".fileclose").eq(fileindex).css('display','flex');    // 삭제버튼 보이기    
         reader.onload = function(event) {
           var img = document.createElement("img");
           img.setAttribute("src", event.target.result);
           img.setAttribute("width", "96");
           img.setAttribute("height", "96");
           img.setAttribute("class", "fileimg");           
           var name = document.querySelectorAll(".boxtest");    // div클래스명 boxtest에 이미지 생성하기
           name[fileindex].appendChild(img);                                                    
         };                                                     // reader.onload = funciton 끝나는 }
      }else{
          $(".onfile").eq(fileindex).css('display','none');       // Span +버튼 감추기
          $(".fileclose").eq(fileindex).css('display','flex');    // 삭제버튼 보이기    
           reader.onload = function(event) {
             var img = document.createElement("img");
             img.setAttribute("src", event.target.result);
             img.setAttribute("width", "96");
             img.setAttribute("height", "96");
             img.setAttribute("class", "fileimg");
             img.setAttribute("style", "flex");             
             var name = document.querySelectorAll(".boxtest");    // div클래스명 boxtest에 이미지 생성하기
             if(name[fileindex]){
             name[fileindex].appendChild(img);
             };
           };  
      }      
          reader.readAsDataURL(file.files[0]);                   // reader.onload에서 사진생성이 끝나면 화면에 실제로 사진이 출력되게하기    
      });            
});

//2.선택삭제버튼 클릭시 일어나는 이벤트
document.querySelectorAll('.fileclose').forEach((fileclose) => {
fileclose.addEventListener('click', function() {                 //선택삭제 버튼을 클릭했을 때.
    var filecloseindex = $(".fileclose").index(this);            // OriginFile을 제거할 input tpye=hidden으로value 생성하기
    $(".originDel").eq(filecloseindex).val('1');
   var imgdisplay = $(".originimg").eq(filecloseindex).css('display');
//OriginFile이 화면에 존재 and 이 display가 flex일 때                                                 //OriginFile이 화면에 있는 상태에서 선택삭제버튼을 클릭하면,
    if (imgdisplay === 'flex'){                                                        
    var name = document.querySelectorAll(".boxtest");           
    $(".originimg").eq(filecloseindex).css('display','none');     // 기존 OriginFile 사진 숨기기 (숨기지만 사실상 OriginFile은 제거된다는 의미)
//    $(".fileclose").eq(filecloseindex).css('display','none');    // 선택삭제 버튼 숨기기
    $(".onfile").eq(filecloseindex).css('display','flex');       // Span + 버튼 보이기
    }
    else if(imgdisplay === 'none'){ 
//  $(".fileclose").eq(filecloseindex).css('display','none');    // 선택삭제 버튼 숨기기       
//OriginFile이 화면에 존재하지 않을 경우                                                   // 기존의 OriginFile이 없고, 처음부터 Span + 버튼에서 새롭게 생성된 이미지에 대해서 선택삭제버튼을 클릭하면,            
    var name = document.querySelectorAll(".boxtest");
    name[filecloseindex].remove();                               // 새로 추가된 img class="fileimg" 제거
    $(".file").eq(filecloseindex).val('');                       // 사진을 삭제했기 때문에 사진파일의 값을 ''로 세팅
    $(".onfile").eq(filecloseindex).css('display','flex');       // Span + 버튼 보이기   
    }    
    else{                                                         
    var name = document.querySelectorAll(".boxtest");        
    var name2 = document.querySelectorAll(".fileimg");
    if(!name2){
    var newimgdisplay = $(".fileimg").eq(fileindex).css('display');
    if(newimgdisplay){
    if (newimgdisplay === 'flex'){     
    name[filecloseindex].remove();                               // 새로 추가된 img class="fileimg" 제거
    };
    $(".file").eq(filecloseindex).val('');                       // 사진을 삭제했기 때문에 사진파일의 값을 ''로 세팅
    $(".onfile").eq(filecloseindex).css('display','flex');       // Span + 버튼 보이기   
    }
    }
    }
  
  });
});










$(function(){
    //jQuery
    $(".reviewViewImg").click(function(){ 
    	var index = $(".reviewViewImg").index(this);    	
        $(".viewrwviewimg").eq(index).css('display','flex');
        $(".viewrwviewimgclose").eq(index).css('display','flex');
        
//         var index = $(".goodlist_thumb").index(this);
        
//         $(".viewrwviewimg").eq(index).toggle();      
    });

});


// $(function(){
//     //jQuery
//     $(".viewrwviewimg").click(function(){ 
//         var index = $(".viewrwviewimg").index(this);        
//         $(".viewrwviewimg").eq(index).css('display','none');
//         $(".viewrwviewimgclose").eq(index).css('display','none');
//     });
    
// });



$(function(){
    //jQuery
    $(".viewrwviewimgclose").click(function(){ 
        var index = $(".viewrwviewimgclose").index(this);        
        $(".viewrwviewimg").eq(index).css('display','none');
        $(".viewrwviewimgclose").eq(index).css('display','none');
    });
    
});



















</script>
<script>
$(function() {    
    const stars = $('.review_star');
    const starGroups = Math.ceil(stars.length / 5);

    stars.on('click', function() {
        const index = stars.index(this);
        const groupIndex = Math.floor(index / 5);
        let filledCount = 0;
        const startIndex = groupIndex * 5;
        const endIndex = startIndex + 4;

        stars.each(function(i) {
            if (i >= startIndex && i <= endIndex) {
                if (i <= index) {
                    $(this).attr('src', '${pageContext.request.contextPath}/resources/img/star_full.png');
                    filledCount++;
                } else {
                    $(this).attr('src', '${pageContext.request.contextPath}/resources/img/star_empty.png');
                }
            }
        });
        
        $(".review_score_input").eq(groupIndex).val(filledCount);
    });
    
    
});
</script>
<!-- footer -->
 <footer>
        <jsp:include page="../main/footer.jsp"/>        
    </footer>
</body>
</body>
</html>



