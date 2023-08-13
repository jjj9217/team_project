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
        
        width: 199px;
        height:500px;
        float:left;     
    }

    #mypage-conts{
        
        width:810px;
        height: 950px;      
        float:left;
    }

    #blank{
        width:100%;
        height: 35px;
        
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
        height: 37px;
    }

    .refund_atag{
        float: left;
        width: 392px;
        height: 37px;
    }

    #address_atag{
        float: left;
        width: 392px;
        height: 37px;
        line-height: 35px;
    }

    #refund_atag{
        float: left;
        width: 392px;
        height: 37px;
        line-height: 35px;
    }
    
    ul li{      
        list-style:none;
    
    }
    
    

    .buy_list{
        width: 100%;
        height:340px;
        
        text-align: center;
    }

    .goodlist_thumb{
            width: 85px;
            height: 85px;
    }

    /* 모달 */
    
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
            <th><h3><a href="${pageContext.request.contextPath}/mypage/mypage_main.do" id="mylink">마이페이지</a></h3></th>         
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
            <tr><td><a href="${pageContext.request.contextPath}/mypage/mypage_nonreview.do">리뷰</a></td></tr>
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
        <div class="accumulate_tit">
            <h2 class="tit">누적 리뷰 건수 ${untitled}건</h2>
        </div>
        <table class="buy_list">
            <colgroup>
                <col style="width:359px;">
                <col style="width:310px;">
                <col style="width:auto">
            </colgroup>
            <thead>
                <hr width=100%>
                <tr>
                    <th scope="col">상품</th>
                    <th scope="col">리뷰</th>                 
                </tr>
            </thead>
            <tbody>
            
                        
                
                
                           <c:forEach var="rowNum" begin="${pageNav.startNum}" end="${pageNav.endNum}">
                    <!-- c:if nonreviewfileList[rowNum-1]. = null이면 리뷰안쓴목록만 출력하는방식도 있을 듯? -->
                            <c:if test="${!empty reviewproductList[rowNum-1].review_content}">
                <tr>                
                    <td><img class="goodlist_thumb" src="${pageContext.request.contextPath}/resources/uploads/${reviewfileList[rowNum-1].saveFile}">
                        구매일자: ${reviewproductList[rowNum-1].order_date}
                        상품이름: ${reviewproductList[rowNum-1].product_name}
                    </td>                                        
                    <td>작성날짜: ${reviewproductList[rowNum-1].review_regDate}</td>
                    <td>별점: ${reviewproductList[rowNum-1].review_score}</td>
                    <td>리뷰내용: ${reviewproductList[rowNum-1].review_content}</td>
                    <td>
                        <button type="button" class="reviewmodify" id="review_View" >리뷰 수정</button>
                        <button type="button" class="reviewView" id="review_View" >리뷰 보기</button>
                </tr>


<div id="modal" class="modal">    
    <div class="modal-window">
        <div class="title">
            <h2>리뷰보기</h2>
            <span class="close_modal">&times;</span>
        <p>${rowNum}번째 Modal</p>
        </div>
        <div class="item_info">            
                <c:if test="${!empty reviewproductList[rowNum-1].product_name}">
                    <span class="thum"><img class="goodlist_thumb" src="${pageContext.request.contextPath}/resources/uploads/${reviewfileList[rowNum-1].saveFile}"></span>
                    <dl class="txt_info">
                        <dt>상품이름: ${reviewproductList[rowNum-1].product_name}
                            <input type="hidden" name="product_idx" value="${reviewproductList[rowNum-1].product_idx}">
                        </dt>                                         
                    </dl>
                </c:if>
        </div>
        <ul class="write_step">
            <li class="review_rating"><span class="review_tit">상품은 어떠셨나요? :별점은 숫자로나와야함 ${reviewproductList[rowNum-1].review_score}</span>
                <ul class="star_inner">
                    <input type="hidden" name="review_score" value="3">
                    <li>★</li>
                    <li>★</li>
                    <li>★</li>
                    <li>★</li>
                    <li>★</li>
                </ul>
            </li>                     
            <li id="review_content_back">
                <span class="tit">솔직한 상품 리뷰</span>
                <div class="review_content">
                    <textarea id="review_content_textarea" name="review_content" disabled>${reviewproductList[rowNum-1].review_content}</textarea>
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
                        번호: ${reviewRegList}, ${reviewproductList[0].review_idx}
                    </div>
                    <div class="rw-photo-list">
                        <c:forEach var="fileVoList" items="${reviewRegList}">
                            <c:forEach var="fileVo" items="${fileVoList}">
                                <c:if test="${reviewproductList[rowNum-1].review_idx eq fileVo.review_idx}">
                                       <span class="thum"><img class="goodlist_thumb" src="${pageContext.request.contextPath}/resources/uploads/${fileVo.saveFile}"></span>
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
        <!-- <div class="review_reg_background">                                                                     
            <button type="button" class="btnLookup" id="review_ok">닫기</button>
            <button type="button" class="reviewLookup" id="review_cancel" >리뷰 등록하기</button>                                  
        </div> -->
    </div>    
</div>

                                        <!-- 아래는 Modal -->
<form name="caq" class="test01" enctype="multipart/form-data" action="${pageContext.request.contextPath}/mypage/mypage_reviewModifyReg_process.do" method="post">
<div id="modal" class="modal_modify">    
    <div class="modal-window">
        <div class="title">
            <h2>리뷰작성</h2>
            <span class="close_modalmodify">&times;</span>
        <p>${rowNum}번째 Modal </p>
        
        </div>
        <div class="item_info">            
                <c:if test="${!empty reviewproductList[rowNum-1].product_name}">
                    <span class="thum"><img class="goodlist_thumb" src="${pageContext.request.contextPath}/resources/uploads/${reviewfileList[rowNum-1].saveFile}"></span>
                    <dl class="txt_info">
                        <dt>상품이름: ${reviewproductList[rowNum-1].product_name}
                            <input type="hidden" name="product_idx" value="${reviewproductList[rowNum-1].product_idx}">
                        </dt>                                         
                    </dl>
                </c:if>
        </div>
        <ul class="write_step">
            <li class="review_rating"><span class="review_tit">상품은 어떠셨나요? :별점은 숫자로나와야함 ${reviewproductList[rowNum-1].review_score}</span>
                <ul class="star_inner">
                    <input type="hidden" name="review_score" value="3">
                    <input type="hidden" name="review_idx" value="${reviewproductList[rowNum-1].review_idx}">
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
                    <textarea id="review_content_textarea" name="review_content" placeholder="꿀팁 가득, 상세한 리뷰를 작성해보세요!&#10;도움수가 올라가면 포인트도 받고,&#10;탑리뷰어가 될 확률도 높아져요!&#10;반품, 환불 관련 내용은 고객센터로 별도 문의해주세요.">${reviewproductList[rowNum-1].review_content}</textarea>
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
                        <input type="file" class="CattachedFile" name="attachedFile">
                        <input type="file" class="CattachedFile" name="attachedFile">
                        <input type="file" class="CattachedFile" name="attachedFile">
                        <input type="file" class="CattachedFile" name="attachedFile">
                        <input type="file" class="CattachedFile" name="attachedFile">                                                                
                        <p>                     
                                사진은 10MB이하의 PNG, GIF, JPG 파일만 등록 가능합니다.                                             
                        </p>
                    </div>
                </div>
            </li>       
        </ul>
        <div class="review_reg_background">                                                                     
            <button type="button" class="btnLookup" id="review_ok">닫기</button>
            <button type="button" class="reviewModifyup" id="review_cancel" >리뷰 수정하기</button>                                  
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

<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
$(function(){
    //jQuery
    $(".reviewView").click(function(){ 
        var index = $(".reviewView").index(this);
        
        $(".modal").eq(index).css("display", "block");      
    });

        
    $(".close_modal").click(function(){
        var index2 = $(".close_modal").index(this);
        
        $(".modal").eq(index2).css("display", "none");
    });
    
    
    
    
    
    
    $(".reviewmodify").click(function(){ 
        var index = $(".reviewmodify").index(this);
        
        $(".modal_modify").eq(index).css("display", "block");      
    });

        
    $(".close_modalmodify").click(function(){
        var index2 = $(".close_modalmodify").index(this);
        
        $(".modal_modify").eq(index2).css("display", "none");
    });
    
    
    
    
    
    $(".reviewModifyup").click(function(){
        var index2 = $(".reviewModifyup").index(this);
        alert("작성이 완료되었습니다.");
        $(".test01").eq(index2).submit();                   
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



