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
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
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
        position: relative;
        width: 100%;
        font-size: 0;
        line-height: 0;
        margin-bottom: 30px;
    }

    .tit_area .tit{
        float: left;
        color: black;
        font-size: 24px;
        line-height: 30px;
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
        background-color:#7d99a4;
        font: bold 17px Arial, Sans-serif;
    }

    .refund_atag{
        float: left;
        width: 399px;
        height: 50px;
        background-color:rgb(221, 219, 214);
        font: bold 17px Arial, Sans-serif;
    }

    #address_atag{
        float: left;
        width: 399px;
        height: 37px;
        line-height: 50px;
        color:white;
    }

    #refund_atag{
        float: left;
        width: 392px;
        height: 37px;
        line-height: 50px;
        color:black;
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
        .close_modal{
        	float: right;
        	display: block;
        	font-size: 36px;
        	cursor: pointer;
        }
        .hr_space{
        	margin: 10px 0;
        	width: 560px;
        	height: 5px;
        	background-color: #7d99a4;
        }
        .txt_info{
        	  overflow: hidden;
			  text-overflow: ellipsis;
			  white-space: nowrap;
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
		.text_gray{color:#4a4a4a; font-weight: bold;}
		.review_star_box{
		margin-left: 150px;
		padding-top: 30px;
		padding-bottom: 30px;
		
		}
		.txtAr{
		resize: none;
		padding: 10px;
		outline-color:#7d99a4;
		}
		.review_star{cursor: pointer;}

        .review_reg_background{
        width: 100%;
        height: 80px;
        margin-top: 70px;
        display : flex;
        justify-content: center;
        align-items : center;
        }

        #review_ok{
            width: 200px;
            height: 50px;
            color: #7d99a4;
            font-weight: bold;
            border: 1px solid #7d99a4;
            background-color: #fff;
            border-radius: 5px;
            margin-left: 20px;                  
        }

        #review_cancel{
            width: 200px;
            height: 50px;
            color: #fff;
            font-weight: bold;
            border: 1px solid #7d99a4;
            background-color: #7d99a4;
            border-radius: 5px;
            margin-left: 20px;                  
        }

        .item_info{
            width: 100%;
            height: 85px;

        }

        .item_info .a{
            width: 100%;
            height: 85px;
        }

        .thum{
            float: left;
            width: 120px;
            height: 120px;
            padding: 10px;
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
        	padding: 10px;
            float: left;
        }
        
        #review_content_textarea{
            width: 500px;
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
            padding: 10px;
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


.fileimg{
width:70px;
height:70px;
}


.rw-photo-list img{
float:left;
border: 1px solid black;
margin-right: 1px;
margin-left: 1px;
}

#ppp{
float:left;}
    .buy_list_container{display: block; width: 790px; height: auto; margin: 0 auto; padding: 10px; margin-top: 50px;}
    .buy_list, .order_list{border-collapse: collapse;}
    .th_product{width: 690px; height: 20px; padding: 10px 0; background-color: rgb(224, 224, 224);}
    .th_review{width: 100px; height: 20px; padding: 10px 0; background-color: rgb(224, 224, 224);}
	.td_product{width: 680px; height: auto; padding: 10px 5px; font-size:14px; font-weight: bold;}
    .td_review{width: 90px; height: auto; padding: 30px 5px; text-align: center; border-left: 1px solid #a4a4a4; font-size:14px;}
    .td_empty{width: 790px; height: auto;}
    .top{border-top: 2px solid #4a4a4a}
    .bottom{border-bottom: 1px solid #a4a4a4}
    
    
     .paging{
        width:1020px;
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
        border-color: white;
        background-color: orange;
    }
    .prd_box{
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
    	width:400px;
    	height:80px;
    	cursor: pointer;
    }
    .goodlist_thumb0{
    	width:80px;
    	height:80px;
    }
    .goodlist_thumb{
    	width:120px;
    	height:120px;
    }
    .grayDate{
    display: block;
    width:320px;
    height:16px;
    color: #4a4a4a;
    font-weight: bold;
    }
	.reviewInsertBtn{
	width:80px;
    height:30px;
    border: 1px solid #7d99a4;
    color: #fff;
    background-color: #7d99a4;
    font-weight: bold;
    border-radius: 5px;
	}
	
	#fileclose01{
	float:left;
	margin-top:3px;
	}
	
	#fileclose02{
	float:left;
	margin-top:-10px;
	}
	
	#fileclose03{
	float:left;
	
	}
	
	#fileclose04{
	float:left;
	
	}
	
	#fileclose05{
	float:left;
	
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
	


.onfile{
    font-size:25px;
    cursor:pointer;
}

.file{
display: none;
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
            <tr><th><h3><a class="hoverClass"  href="${pageContext.request.contextPath}/mypage/mypage_main.do" id="mylink">마이페이지</a></h3></th></tr>         
            <tr><td class="mypagetable">마이 쇼핑</td></tr>
            <tr><td><a class="hoverClass"  href="${pageContext.request.contextPath}/mypage/mypage_orderinq.do">주문/배송조회</a></td></tr>
            <tr><td><a class="hoverClass"  href="${pageContext.request.contextPath}/mypage/mypage_cancelinq.do">취소/반품내역</a></td></tr>
            <tr><td><hr width=100%></td></tr>
            <tr><td><a class="hoverClass"  href="${pageContext.request.contextPath}/purchase/basket.do">장바구니</a></td></tr>
            <tr><td><a class="hoverClass"  href="${pageContext.request.contextPath}/mypage/mypage_like.do">좋아요</a></td></tr>
            <tr><td><a class="hoverClass"  href="${pageContext.request.contextPath}/mypage/mypage_coupon.do">쿠폰</a></td></tr>
            <tr><td><hr width=100%></td></tr>
            <tr><td class="mypagetable">마이활동</td></tr>
            <tr><td><a class="hoverClass"  href="${pageContext.request.contextPath}/one_inq/one_inq_list.do">1:1문의내역</a></td></tr>
            <tr><td><a class="hoverClass"  href="${pageContext.request.contextPath}/mypage/mypage_nonreview.do" style="font-weight:bold; color:#7d99a4;">리뷰</a></td></tr>
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
            <th class="th_review top bottom"scope="col">리뷰작성</th>
        </tr>
        <c:forEach var="rowNum" begin="${pageNav.startNum}" end="${pageNav.endNum}">
        <c:if test="${empty nonreviewproductList[rowNum-1]}">
        
        <c:choose>
        <c:when test="${!empty nonreviewproductList[0].product_name}">
        </c:when>
        <c:otherwise>
        <c:if test="${rowNum == 1}">
        	<tr>
           <td class="td_empty bottom" colspan="2">
           리뷰를 작성할 수 있는 상품이 없습니다.
           </td>
           </tr>
        </c:if>
        </c:otherwise>
        </c:choose>                
           
        </c:if>
        <!-- c:if nonreviewfileList[rowNum-1]. = null이면 리뷰안쓴목록만 출력하는방식도 있을 듯? -->
        <c:if test="${!empty nonreviewproductList[rowNum-1].product_name}">
        <tr>                
           <td class="td_product bottom">
           <div class="prd_box">
           <div class="prd_img_box">
           <img class="goodlist_thumb0" src="${pageContext.request.contextPath}/resources/uploads/${nonreviewfileList[rowNum-1].saveFile}">
           </div>
           <div class="prd_item_box">
           <span class="grayDate">구매일자: &nbsp;<fmt:formatDate value="${nonreviewproductList[rowNum-1].order_date}" pattern="yyyy.MM.dd" /></span><br>
           <div class="prd_item_name">
           ${nonreviewproductList[rowNum-1].product_name}
           <input type="hidden" class="prdIdxClass" value="${nonreviewproductList[rowNum-1].product_idx}">
           </div>
           </div>
           </div>
           </td>
           <td class="td_review bottom">
           <input type="button" class="btn reviewInsertBtn" id="btn-modal" name="btn-modal" value="리뷰작성">
           </td>
        </tr>
<!-- 아래는 Modal -->
<form name="caq" class="test01" enctype="multipart/form-data" action="${pageContext.request.contextPath}/mypage/mypage_reviewReg_process.do" method="post">
<div id="modal" class="modal hidden">    
    <div class="modal-window">
        <div class="title">
            <h2>리뷰작성</h2>
            <span class="close_modal">X</span>
        </div>
        <div class="hr_space"></div>
        <div class="item_info">            
                <c:if test="${!empty nonreviewproductList[rowNum-1].product_name}">
                    <span class="thum"><img class="goodlist_thumb" src="${pageContext.request.contextPath}/resources/uploads/${nonreviewfileList[rowNum-1].saveFile}"></span>
                    <div class="txt_info">
                    <span class="text_gray"> ${nonreviewproductList[rowNum-1].product_name} </span>
                    
                    <input type="hidden" name="product_idx" value="${nonreviewproductList[rowNum-1].product_idx}">
                    </div>
                </c:if>
        <div class="review_star_box">
        <img class="review_star" src="${pageContext.request.contextPath}/resources/img/star_empty.png" width="50px" height="50px">
        <img class="review_star" src="${pageContext.request.contextPath}/resources/img/star_empty.png" width="50px" height="50px">
        <img class="review_star" src="${pageContext.request.contextPath}/resources/img/star_empty.png" width="50px" height="50px">
        <img class="review_star" src="${pageContext.request.contextPath}/resources/img/star_empty.png" width="50px" height="50px">
        <img class="review_star" src="${pageContext.request.contextPath}/resources/img/star_empty.png" width="50px" height="50px">
        </div>
        </div>
        <input type="hidden" class="review_score_input" name="review_score" value="">
        <input type="hidden" name="order_product_idx" value="${nonreviewproductList[rowNum-1].order_product_idx}">
        <ul class="write_step">
            <li id="review_content_back">
                <div class="review_content">
                    <textarea id="review_content_textarea" class="txtAr" name="review_content" placeholder="리뷰내용을 작성해 주세요!&#10;반품, 환불 관련 내용은 고객센터로 별도 문의해주세요."></textarea>
                </div>          
            </li>                        
            <li class="photo-update">
                <div class="step_cont">
                    <div class="photo-list-info">
                        <strong>포토</strong>
                    </div>
                    <div class="rw-photo-list">                            
                    	<div>
                        <input type="file" class="file" name="attachedFile" >
                             <span class="onfile">+</span>
<!--                         <span class="file-button">+</span>                         -->
                        <div class="boxtest"></div>                        
                        </div>
                        <div>
                        <input type="file" class="file" name="attachedFile">
                             <span class="onfile">+</span>                        
                        <div class="boxtest"></div>                        
                        </div>
                        <div>
                        <input type="file" class="file" name="attachedFile">
                             <span class="onfile">+</span>                  
                        <div class="boxtest"></div>                        
                        </div>
                        <div>
                        <input type="file" class="file" name="attachedFile">
                             <span class="onfile">+</span>                  
                        <div class="boxtest"></div>                        
                        </div>
                        <div>
                        <input type="file" class="file" name="attachedFile">
                             <span class="onfile">+</span>                  
                        <div class="boxtest"></div>                        
                        </div>                                                              
						
                    	<p id="ppp">
                                <br>사진은 8MB이하의 PNG, JPG 파일만 등록 가능합니다. 
                                                                            
                        </p>
                        
                        </div>
                </div>
            </li>       
        </ul>
        <div class="review_reg_background">        	                                                                   
            <button type="button" class="btnLookup closeBtnBottom" id="review_ok">닫기</button>
            <button type="button" class="reviewLookup" id="review_cancel" >리뷰 등록하기</button>                                  
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
                            <a href="mypage_nonreview.do?pageNum=1&pageBlock=1"><input type="button" id="end" value="처음"></a>&nbsp;
                            <a href="mypage_nonreview.do?pageNum=${(pageNav.pageBlock - 2)*pageNav.pages_per_block + 1}&pageBlock=${pageNav.pageBlock-1}">
                                <input type="button" id="next" value="이전">
                            </a>    
                        </c:if>                     
                        <c:forEach var="i" begin="${(pageNav.pageBlock-1)*pageNav.pages_per_block + 1}" end="${pageNav.pageBlock*pageNav.pages_per_block}">
                            <c:if test="${i le pageNav.totalPageNum}">
                                <c:choose>
                                    <c:when test = "${pageNav.pageNum eq i}">
                                        <a href="mypage_nonreview.do?pageNum=${i}&pageBlock=${pageNav.pageBlock}">
                                            <span style="color:#7d99a4;">${i}&nbsp;</span>
                                        </a>
                                    </c:when>
                                    <c:otherwise>
                                        <a href="mypage_nonreview.do?pageNum=${i}&pageBlock=${pageNav.pageBlock}">${i}&nbsp;</a>
                                    </c:otherwise>
                            </c:choose>
                            </c:if>
                        </c:forEach>                    
                        <c:if test="${((pageNav.rows_per_page*pageNav.pages_per_block) lt pageNav.totalRows) and (pageNav.pageBlock ne pageNav.lastPageBlock) }">
                            <a href="mypage_nonreview.do?pageNum=${pageNav.pageBlock*pageNav.pages_per_block+1}&pageBlock=${pageNav.pageBlock+1}"><input type="button" id="next" value="다음"></a>&nbsp;
                            <a href="mypage_nonreview.do?pageNum=${pageNav.totalPageNum}&pageBlock=${pageNav.lastPageBlock}"><input type="button" id="end" value="마지막"></a>
                        </c:if>                                                          
                    </td>
                </tr>
            </table>
        </div>
        
                           
    </div>
</div>

<!-- 모달 스크립트 -->
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
$(function(){
	//jQuery
	$(".prd_img_box").click(function(){ 
		var index = $(".prd_img_box").index(this);
		var prdNum = $(".prdIdxClass").eq(index).val();
		window.location.href = "${pageContext.request.contextPath}/product/product_view.do?prdNum="+prdNum;
	});
	
	$(".prd_item_box").click(function(){ 
		var index = $(".prd_item_box").index(this);
		var prdNum = $(".prdIdxClass").eq(index).val();
		window.location.href = "${pageContext.request.contextPath}/product/product_view.do?prdNum="+prdNum;
	});
	
	$(".btn").click(function(){ 
		var index = $(".btn").index(this);
	    $(".modal").eq(index).removeClass("hidden");
	});
	
		
	$(".close_modal").click(function(){
		var index = $(".close_modal").index(this);
	    $(".modal").eq(index).addClass("hidden");
	});
	
	$(".closeBtnBottom").click(function(){
		var index = $(".closeBtnBottom").index(this);
	    $(".modal").eq(index).addClass("hidden");
	});
    
	$(".reviewLookup").click(function(){
        var index = $(".reviewLookup").index(this);
        if($(".review_score_input").eq(index).val().length == 0){
	        alert("별점을 입력해주세요.");
			return false;        	
        }else if($(".txtAr").eq(index).val().trim().length == 0){
        	alert("리뷰내용을 입력해주세요.");
        	$(".txtAr").eq(index).focus();
			return false;  
        }else{
        	alert("리뷰작성이 완료 되었습니다.");
	        $(".test01").eq(index).submit();                 
        }
    });     
});


















document.querySelectorAll('.onfile').forEach((onfile) => {      
    onfile.addEventListener("click", function () {
        // 실행할 코드
        var fileonindex = $(".onfile").index(this);
        $(".file").eq(fileonindex).click();     
    });
});

document.querySelectorAll('.file').forEach((file) => {
       
      file.addEventListener('change', function() {
          var reader = new FileReader();
          var fileindex = $(".file").index(this);
//          alert(fileindex+'번째 리뷰번호의 파일방:');
        $(".onfile").eq(fileindex).css('display','none');        
         reader.onload = function(event) {
           var img = document.createElement("img");
           img.setAttribute("src", event.target.result);
           img.setAttribute("width", "75");
           img.setAttribute("height", "75");
           img.setAttribute("class", "fileimg");
           
           var name = document.querySelectorAll(".boxtest"); 
           name[fileindex].appendChild(img);                    
           
           var button = document.createElement('input');
           button.type = 'button';
           button.value = '1번째';                  
           button.className = 'fileclose';
           
           name[fileindex].appendChild(button); 
                 
           button.addEventListener('click', function() {
               img.remove();
               button.remove();
               $(".file").eq(fileindex).val('');
               $(".onfile").eq(fileindex).css('display','flex');
               
           });
           
         };
         reader.readAsDataURL(file.files[0]);        
     });                            
});











// $(function(){
//     //jQuery
//     $(".prd_img_box").click(function(){ 
//         var index = $(".prd_img_box").index(this);
//         var prdNum = $(".prdIdxClass").eq(index).val();
//         window.location.href = "${pageContext.request.contextPath}/product/product_view.do?prdNum="+prdNum;
//     });
    
//     $(".prd_item_box").click(function(){ 
//         var index = $(".prd_item_box").index(this);
//         var prdNum = $(".prdIdxClass").eq(index).val();
//         window.location.href = "${pageContext.request.contextPath}/product/product_view.do?prdNum="+prdNum;
//     });
    
//     $(".btn").click(function(){ 
//         var index = $(".btn").index(this);
//         $(".modal").eq(index).removeClass("hidden");
//     });
    
        
//     $(".close_modal").click(function(){
//         var index = $(".close_modal").index(this);
//         $(".modal").eq(index).addClass("hidden");
//     });
    
//     $(".closeBtnBottom").click(function(){
//         var index = $(".closeBtnBottom").index(this);
//         $(".modal").eq(index).addClass("hidden");
//     });
    
//     $(".reviewLookup").click(function(){
//         var index = $(".reviewLookup").index(this);
//         if($(".review_score_input").eq(index).val().length == 0){
//             alert("별점을 입력해주세요.");
//             return false;           
//         }else if($(".txtAr").eq(index).val().trim().length == 0){
//             alert("리뷰내용을 입력해주세요.");
//             $(".txtAr").eq(index).focus();
//             return false;  
//         }else{
//             alert("리뷰작성이 완료 되었습니다.");
//             $(".test01").eq(index).submit();                 
//         }
//     });

            
    
        
// });

    
    
    
    
    
	
</script>

<!-- footer -->
<footer>
        <jsp:include page="../main/footer.jsp"/>        
    </footer>
</body>
</body>
</html>

