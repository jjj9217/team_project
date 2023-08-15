<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List, java.util.HashMap, java.util.Map" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
       
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Header</title>
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
    
    #mypage{
    	margin-top:30px;
        font-family:'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif;
       	font-size:15px;
        width: 199px;
        height:500px;
        float:left;
    }
	#mypage a{color:black;}

    #mypage-conts{
        
        width:810px;
        height: 950px;      
        float:left;
    }
    #mylink{
        color: black;
        font-size: 30px;
        text-decoration: none;
    }
    #blank{
        width:100%;
        height: 35px;
    
    }
    .mypagetable{
        font-size: 20px;
        font-family:'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif;
        font-weight: bold;      
        color:#7d99a4;
    }
    .tit_area{
        overflow: hidden;
        margin-top: 30px;
        position: relative;
        width: 100%;
        font-size: 0;
        line-height: 0;
        
    }

    .tit_area .tit{
        float: left;
        color: #333;
        font-size: 20px;
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
        width: 100%;
        height:340px;
    
        text-align: center;
    }

    /* Modal */
			
        #modal{
            width:100%;
            height:100%;           
            display: none;
            
            justify-content: center;
        }  
        #modal .modal-window {
            background: rgba( 69, 139, 197, 0.70 );
            box-shadow: 0 8px 32px 0 rgba( 31, 38, 135, 0.37 );
            backdrop-filter: blur( 13.5px );
            -webkit-backdrop-filter: blur( 13.5px );
            border-radius: 10px;
            border: 1px solid rgba( 255, 255, 255, 0.18 );
            width: 560px;
            height: 700px;
            position: relative;
            top: -100px;
            padding: 10px;
            position: fixed;
            top: 5%;
            justify-content: center;
             
        }
        #modal .title {
            padding-left: 10px;
            display: inline;
            text-shadow: 1px 1px 2px gray;
            color: white;
            font-size: 20px;
            
        }
        #modal .title h2 {
            display: inline;
        }
        #modal .close-area {
            display: inline;
            float: right;
            padding-right: 10px;
            cursor: pointer;
            text-shadow: 1px 1px 2px gray;
            color: white;
        }
        
        #modal .content {
            margin-top: 20px;
            padding: 0px 10px;
            text-shadow: 1px 1px 2px gray;
            color: white;
        }







        .review_reg_background{
        width: 100%;
        height: 80px;
        
        display : flex;
        justify-content: center;
        align-items : center;
        }

        #review_ok{
            width: 200px;
            height: 50px;
            
            color: white;
            margin-left: 20px;                  
        }

        #review_cancel{
            width: 200px;
            height: 50px;
            
            color: white;
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
            width: 85px;
            height: 85px;
        }

        .goodlist_thumb{
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
        
            float: right;
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
    .th_product{width: 135px; height: 20px; padding: 10px 0; background-color: rgb(224, 224, 224);}
    .th_date{width: 380px; height: 20px; padding: 10px 0; background-color: rgb(224, 224, 224);}
    .th_review{width: 65px; height: 20px; padding: 10px 0; background-color: rgb(224, 224, 224);}
	.td_product{width: 125px; height: auto; padding: 30px 5px; text-align: center; font-size:14px; font-weight: bold;}
    .td_date{width: 370px; height: auto; padding: 30px 5px; text-align: center; border-left: 1px solid #a4a4a4; font-size:14px;}
    .td_review{width: 45px; height: auto; padding: 30px 5px; text-align: center; border-left: 1px solid #a4a4a4; font-size:14px;}
    .top{border-top: 2px solid #4a4a4a}
    .bottom{border-bottom: 1px solid #a4a4a4}
    
</style>
<script>

function setThumbnail(event) {
    var reader = new FileReader();

    reader.onload = function(event) {
      var img = document.createElement("img");
      img.setAttribute("src", event.target.result);
      img.setAttribute("width", "75");
      img.setAttribute("height", "75");
      document.querySelector("div#image_container").appendChild(img);
    };

    reader.readAsDataURL(event.target.files[0]);
    
    var con = document.getElementById("myimg1"); 	
    if(con.style.display=='none'){ 		
    	con.style.display = 'block'; 	
    }else{ 		
    	con.style.display = 'none'; 	
    }     
}

function setThumbnail2(event) {
    var reader = new FileReader();

    reader.onload = function(event) {
      var img = document.createElement("img");
      img.setAttribute("src", event.target.result);
      img.setAttribute("width", "75");
      img.setAttribute("height", "75");
      document.querySelector("div#image_container2").appendChild(img);
    };

    reader.readAsDataURL(event.target.files[0]);
    
    var con = document.getElementById("myimg2"); 	
    if(con.style.display=='none'){ 		
    	con.style.display = 'block'; 	
    }else{ 		
    	con.style.display = 'none'; 	
    }     
}

function setThumbnail3(event) {
    var reader = new FileReader();

    reader.onload = function(event) {
      var img = document.createElement("img");
      img.setAttribute("src", event.target.result);
      img.setAttribute("width", "75");
      img.setAttribute("height", "75");
      document.querySelector("div#image_container3").appendChild(img);
    };

    reader.readAsDataURL(event.target.files[0]);
    
    var con = document.getElementById("myimg3"); 	
    if(con.style.display=='none'){ 		
    	con.style.display = 'block'; 	
    }else{ 		
    	con.style.display = 'none'; 	
    }     
}

function setThumbnail4(event) {
    var reader = new FileReader();

    reader.onload = function(event) {
      var img = document.createElement("img");
      img.setAttribute("src", event.target.result);
      img.setAttribute("width", "75");
      img.setAttribute("height", "75");
      document.querySelector("div#image_container4").appendChild(img);
    };

    reader.readAsDataURL(event.target.files[0]);
    
    var con = document.getElementById("myimg4"); 	
    if(con.style.display=='none'){ 		
    	con.style.display = 'block'; 	
    }else{ 		
    	con.style.display = 'none'; 	
    }     
}

function setThumbnail5(event) {
    var reader = new FileReader();

    reader.onload = function(event) {
      var img = document.createElement("img");
      img.setAttribute("src", event.target.result);
      img.setAttribute("width", "75");
      img.setAttribute("height", "75");
      document.querySelector("div#image_container5").appendChild(img);
    };

    reader.readAsDataURL(event.target.files[0]);
    
    var con = document.getElementById("myimg5"); 	
    if(con.style.display=='none'){ 		
    	con.style.display = 'block'; 	
    }else{ 		
    	con.style.display = 'none'; 	
    }     
}
</script>

</head>
<body>

    <header>    
        <jsp:include page="../main/header.jsp"/>    
    </header>

<!-- body시작 -->

<div id="Container">
    <div id="mypage">       
        <table>
            <tr><th><h3><a href="${pageContext.request.contextPath}/mypage/mypage_main.do" id="mylink">마이페이지</a></h3></th></tr>         
            <tr><td class="mypagetable">마이 쇼핑</td></tr>
            <tr><td><a href="${pageContext.request.contextPath}/mypage/mypage_orderinq.do">주문/배송조회</a></td></tr>
            <tr><td><a href="${pageContext.request.contextPath}/mypage/mypage_cancelinq.do">취소/반품내역</a></td></tr>
            <tr><td><hr width=100%></td></tr>
            <tr><td><a href="${pageContext.request.contextPath}/purchase/basket.do">장바구니</a></td></tr>
            <tr><td><a href="${pageContext.request.contextPath}/mypage/mypage_like.do">좋아요</a></td></tr>
            <tr><td><a href="${pageContext.request.contextPath}/mypage/mypage_coupon.do">쿠폰</a></td></tr>
            <tr><td><hr width=100%></td></tr>
            <tr><td class="mypagetable">마이활동</td></tr>
            <tr><td><a href="${pageContext.request.contextPath}/one_inq/one_inq_list.do">1:1문의내역</a></td></tr>
            <tr><td><a href="${pageContext.request.contextPath}/mypage/mypage_nonreview.do">리뷰</a></td></tr>
            <tr><td><a href="${pageContext.request.contextPath}/mypage/mypage_productQnA.do">상품문의내역</a></td></tr>
            <tr><td><hr width=100%></td></tr>
            <tr><td class="mypagetable">마이 정보</td></tr>
            <tr><td><a href="${pageContext.request.contextPath}/mypage/mypage_modifymain.do">회원정보 수정</a></td></tr>
            <tr><td><a href="${pageContext.request.contextPath}/mypage/mypage_deliverymain.do">배송지</a></td></tr>
        </table>        
    </div>
    <div id="mypage-conts">
        <div id="blank">            
        </div>
        <div class="tit_area">
            <h2 class="tit">리뷰</h2>         
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
        <table class="buy_list" style="margin-top:30px;">
            <colgroup>
                <col style="width:62%;">
                <col style="width:21%;">
                <col style="width:17%;">
            </colgroup>
            <thead>
                <tr>
                    <th class="th_product top bottom" scope="col">상품</th>
                    <th class="th_date top bottom"scope="col">작성기간</th>                   
                    <th class="th_review top bottom"scope="col">리뷰작성</th>
                </tr>
            </thead>
            <tbody>
                                <c:forEach var="rowNum" begin="${pageNav.startNum}" end="${pageNav.endNum}">
                    <!-- c:if nonreviewfileList[rowNum-1]. = null이면 리뷰안쓴목록만 출력하는방식도 있을 듯? -->
                            <c:if test="${!empty nonreviewproductList[rowNum-1].product_name}">
                <tr>                
                    <td><img class="goodlist_thumb" src="${pageContext.request.contextPath}/resources/uploads/${nonreviewfileList[rowNum-1].saveFile}">
                        구매일자: ${nonreviewproductList[rowNum-1].order_date}
                        상품이름: ${nonreviewproductList[rowNum-1].product_name}
                    </td>
                    <td>작성기간: ${nonreviewproductList[rowNum-1].order_date} +90일</td>
                    <td>
                        <input type="button" class="btn" id="btn-modal" name="btn-modal" value="리뷰작성">
                </tr>

                                        <!-- 아래는 Modal -->
<form name="caq" class="test01" enctype="multipart/form-data" action="${pageContext.request.contextPath}/mypage/mypage_reviewReg_process.do" method="post">
<div id="modal" class="modal">    
    <div class="modal-window">
        <div class="title">
            <h2>리뷰작성</h2>
            <span class="close_modal">&times;</span>
        <p>${rowNum}번째 Modal</p>
        </div>
        <div class="item_info">            
                <c:if test="${!empty nonreviewproductList[rowNum-1].product_name}">
                    <span class="thum"><img class="goodlist_thumb" src="${pageContext.request.contextPath}/resources/uploads/${nonreviewfileList[rowNum-1].saveFile}"></span>
                    <dl class="txt_info">
                        <dt>상품이름: ${nonreviewproductList[rowNum-1].product_name}
                            <input type="hidden" name="product_idx" value="${nonreviewproductList[rowNum-1].product_idx}">
                        </dt>                                         
                    </dl>
                </c:if>
        </div>
        <ul class="write_step">
            <li class="review_rating"><span class="review_tit">상품은 어떠셨나요? ${nonreviewproductList[rowNum-1].order_product_idx}</span>
                <ul class="star_inner">
                    <input type="hidden" name="review_score" value="3">
                    <input type="hidden" name="order_product_idx" value="${nonreviewproductList[rowNum-1].order_product_idx}">
                    <li>★</li>
                    <li>★</li>
                    <li>★</li>
                    <li>★</li>
                    <li>★</li>
                </ul>
            </li>                     
            <li id="review_content_back">
                <span class="tit">솔직한 상품 리뷰를 남겨주세요</span>
                <div class="review_content">
                    <textarea id="review_content_textarea" name="review_content" placeholder="꿀팁 가득, 상세한 리뷰를 작성해보세요!&#10;도움수가 올라가면 포인트도 받고,&#10;탑리뷰어가 될 확률도 높아져요!&#10;반품, 환불 관련 내용은 고객센터로 별도 문의해주세요."></textarea>
                    <div class="review_content_bottom">
                        <div class="count fix_txtNum" style="color:red"><!-- 25자 이하 입력 시 error class 추가 -->
                            <b class="txt_en" style="color:red">0</b>
                            <span>/</span> 1,000
                        </div>
                    </div>
                </div>          
            </li>                        
            <li class="photo-update"><!-- 리뷰 고도화 : class 추가 -->
                <div class="step_cont">
                    <!-- 리뷰 고도화 : 추가 -->
                    <div class="photo-list-info">
                        <strong>포토</strong>
                    </div>
                    <div class="rw-photo-list">                            
                    	<div>
                        <input type="file" class="gallery-file" name="attachedFile" onchange="setThumbnail(event);">
                        <span class="file-button" id="myimg1">+</span>
                        <div id="image_container"></div>
                        </div>
                        <div>                        
                        <input type="file" class="gallery-file2" name="attachedFile" onchange="setThumbnail2(event);">
                        <span class="file-button2" id="myimg2">+</span>
                        <div id="image_container2"></div>
                        </div>
                        <div>
                        <input type="file" class="gallery-file3" name="attachedFile" onchange="setThumbnail3(event);">
                        <span class="file-button3" id="myimg3">+</span>
                        <div id="image_container3"></div>
                        </div>
                        
                        <div>
                        <input type="file" class="gallery-file4" name="attachedFile" onchange="setThumbnail4(event);">
                        <span class="file-button4" id="myimg4">+</span>
                        <div id="image_container4"></div>
                        </div>
                        
                        <div>
                        <input type="file" class="gallery-file5" name="attachedFile" onchange="setThumbnail5(event);">
                        <span class="file-button5" id="myimg5">+</span>
                        <div id="image_container5"></div>
                        </div>                                                                

                    	<p id="ppp">                     
                                <br>사진은 10MB이하의 PNG, GIF, JPG 파일만 등록 가능합니다.                                             
                        </p>
                        </div>
                </div>
            </li>       
        </ul>
        <div class="review_reg_background">                                                                     
            <button type="button" class="btnLookup" id="review_ok">닫기</button>
            <button type="button" class="reviewLookup" id="review_cancel" >리뷰 등록하기</button>                                  
        </div>
    </div>    
</div>
</form>

                
                           </c:if>
                                </c:forEach>       
            </tbody>        
        </table>                   
    </div>
</div>

<!-- 모달 스크립트 -->
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
$(function(){
	//jQuery
	$(".btn").click(function(){ 
		var index = $(".btn").index(this);
		
		$(".modal").eq(index).css("display", "block");		
	});

		
	$(".close_modal").click(function(){
		var index2 = $(".close_modal").index(this);
	    
		$(".modal").eq(index2).css("display", "none");
	});
	
    
	$(".reviewLookup").click(function(){
        var index2 = $(".reviewLookup").index(this);
        alert("작성이 완료되었습니다.");
        $(".test01").eq(index2).submit();                   
    });

            

        
});






	
	const fileButton = document.querySelector(".file-button");
    const galleryFile = document.querySelector(".gallery-file");
    
    fileButton.addEventListener("click", function () {
    
      // 클릭 마우스이벤트 생성
      const event = new MouseEvent("click", {
        bubbles: true,
        cancelable: true,
        view: window
      });
      
      // 위에서 생성한 이벤트를 스팬 노드로 전달
      galleryFile.dispatchEvent(event);
      
    });	
	
    const fileButton2 = document.querySelector(".file-button2");
    const galleryFile2 = document.querySelector(".gallery-file2");
    
    fileButton2.addEventListener("click", function () {
    
      // 클릭 마우스이벤트 생성
      const event = new MouseEvent("click", {
        bubbles: true,
        cancelable: true,
        view: window
      });
      
      // 위에서 생성한 이벤트를 스팬 노드로 전달
      galleryFile2.dispatchEvent(event);
      
    });
    
    const fileButton3 = document.querySelector(".file-button3");
    const galleryFile3 = document.querySelector(".gallery-file3");
    
    fileButton3.addEventListener("click", function () {
    
      // 클릭 마우스이벤트 생성
      const event = new MouseEvent("click", {
        bubbles: true,
        cancelable: true,
        view: window
      });
      
      // 위에서 생성한 이벤트를 스팬 노드로 전달
      galleryFile3.dispatchEvent(event);
      
    });
    
    const fileButton4 = document.querySelector(".file-button4");
    const galleryFile4 = document.querySelector(".gallery-file4");
    
    fileButton4.addEventListener("click", function () {
    
      // 클릭 마우스이벤트 생성
      const event = new MouseEvent("click", {
        bubbles: true,
        cancelable: true,
        view: window
      });
      
      // 위에서 생성한 이벤트를 스팬 노드로 전달
      galleryFile4.dispatchEvent(event);
      
    });
    
    const fileButton5 = document.querySelector(".file-button5");
    const galleryFile5 = document.querySelector(".gallery-file5");
    
    fileButton5.addEventListener("click", function () {
    
      // 클릭 마우스이벤트 생성
      const event = new MouseEvent("click", {
        bubbles: true,
        cancelable: true,
        view: window
      });
      
      // 위에서 생성한 이벤트를 스팬 노드로 전달
      galleryFile5.dispatchEvent(event);
      
    });
    
    
    
    
   
    
    
    
    
    
	
</script>

<!-- footer -->
<footer>
        <jsp:include page="../main/footer.jsp"/>        
    </footer>
</body>
</body>
</html>

