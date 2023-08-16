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
        height: auto;      
        float:left;
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

    .mypagetable{
        font-size: 20px;
        font-family:'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif;
        font-weight: bold;      
        color:#7d99a4;
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

    ul li{      
        list-style:none;
        float: left;
    }   


    

    .buy_list{
        width: 100%;
        height:340px;
        margin-top:30px;
        text-align: center;
    }
    
    .goodlist_thumb{
    	width:75px;
    	height:75px;
    }
    
    
    
    /* 모달 css*/
    
    #modal{
        display: none;
        justify-content: center;
        width:100%;
        height:100%;
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
        background-color:white;
         
    }
    #modal .title {
        padding-left: 10px;
        display: inline;
        text-shadow: 1px 1px 2px gray;
        color: black;
        font-size: 20px;
        
    }
	#hr{
		margin-top:10px; 
		height:5px; 
		background-color:#7d99a4;
		border:0;
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
	#review_cancel{
		background-color:#7d99a4; 
		color:white; 
		border:0; 
		border-radius:3px; 
		width:170px; 
		height:38px; 
		font: bold 13px Arial, Sans-serif;
	}	
	
	#review_content_back{
        height: 210px;
        
    }

	#mypage{margin-top:30px;}


    .review_content{
        height: auto;
    
    }
    
    #review_content_textarea{
        width: 475px;
        height: 155px;
        font-size: 15px;
    }
    .buy_list_container{display: block; width: 790px; height: auto; margin: 0 auto; padding: 10px; margin-top: 50px;}
    .buy_list, .order_list{border-collapse: collapse;}
    .th_product{ height: 20px; padding: 10px 0; background-color: rgb(224, 224, 224);}
    .th_content{ height: 20px; padding: 10px 0; background-color: rgb(224, 224, 224);}
    .th_state{ height: 20px; padding: 10px 0; background-color: rgb(224, 224, 224);}
	.td_product{ height: auto; padding: 30px 5px; text-align: center; font-size:14px; font-weight: bold;}
    .td_content{height: auto; padding: 30px 5px; text-align: center; border-left: 1px solid #a4a4a4; font-size:14px;}
    .td_state{height: auto; padding: 30px 5px; text-align: center; border-left: 1px solid #a4a4a4; font-size:14px;}
    .top{border-top: 2px solid #4a4a4a}
    .bottom{border-bottom: 1px solid #a4a4a4}
    
     .paging{
        width:820px;
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
    }
	#no_coupon{text-align:center; }
    .buy_list td{border-bottom: 1px solid gray; height:100px;}
    #blue{font: bold 20px Arial, sans-serif; color:#7d99a4;}
    #red{font: bold 20px Arial, sans-serif; color:red;}
     .oneinqdel{
        width: 100px;
        height: 30px;
        border-radius: 5px;
        border: 1px solid #7d99a4;
        background-color: #fff;
        color:  #7d99a4;
        font-weight: bold;
        margin-right: 40px;               
    }
    .oneinqModifyup{
    	width: 100px;
        height: 30px;
        border-radius: 5px;
        border: 1px solid #7d99a4;
        background-color: #7d99a4;
        color:  #fff;
        font-weight: bold;
    }
#font{font: bold 13px Arial, sans-serif;}
#font2{font: bold 13px Arial, sans-serif; color:gray;}
</style>
</head>
<script>
function reviewReg(){
    alert("방가");
const before = { d: new Date() };
before.d instanceof Date // true
const json = JSON.stringify(before);
const after = JSON.parse(json);
after.d instanceof Date // false
typeof after.d // "string"

after.d = new Date(after.d); // 사용자의 타임존 기준으로 표시
after.d instanceof Data // true
submit();
}




</script>

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
            <h2 class="tit">상품 Q&A</h2>
        </div>
        

        
        
        <table class="buy_list">
            <colgroup>
                <col style="width:367px;">
                <col style="width:272px;">
                <col style="width:150px;">
            </colgroup>
            <thead>
                <tr>
                    <th class="th_product top bottom"scope="col">상품</th>
                    <th class="th_content top bottom"scope="col">문의내용</th>
                    <th class="th_state top bottom"scope="col">답변상태</th>
                </tr>
            </thead>
            <tbody>
            
            
            
                   
            <c:forEach var="rowNum" begin="${pageNav.startNum}" end="${pageNav.endNum}">
                    <!-- c:if nonreviewfileList[rowNum-1]. = null이면 리뷰안쓴목록만 출력하는방식도 있을 듯? -->
                            <c:if test="${!empty inqproductList[rowNum-1].product_inq_content}">
				
				
                <tr style="cursor:pointer;" class="viewinq">     	                
                    <td><img class="goodlist_thumb" style="width:150px;height:150px;" src="${pageContext.request.contextPath}/resources/uploads/${inqfileList[rowNum-1].saveFile}">
                       <br><div id="font">${inqproductList[rowNum-1].product_name}</div>
                    </td>                                        
                    <td><div id="font">${inqproductList[rowNum-1].product_inq_content}</div><br>
                         <fmt:formatDate value="${inqproductList[rowNum-1].product_inq_regDate}" type="date" pattern="yyyy-MM-dd HH:mm" var="formatDate"/>						
						<div id="font2">${formatDate}</div>
                    </td>
                    <td>
                        <c:choose>
                            <c:when test="${empty inqproductList[rowNum-1].product_inq_answer}">
                                <div id="blue">답변대기</div>
                            </c:when>
                            <c:when test="${!empty inqproductList[rowNum-1].product_inq_answer}">
                                <div id="blue">답변완료</div>
                            </c:when>
                            <c:otherwise>
                            </c:otherwise>
                        </c:choose>                                                                            
                    </td>
                </tr>
                <tbody class="inqView" style="display:none;">
                <tr>
                <td colspan='2' style="background-color:#eef3f5;">
                
                
                	                	
                	문의내용 : ${inqproductList[rowNum-1].product_inq_content}<br>
                	
                	<c:if test="${!empty inqproductList[rowNum-1].product_inq_answer}">
                	답변내용 : ${inqproductList[rowNum-1].product_inq_answer} 
                	</c:if>
                
                    
                </td>
                <td style="background-color:#eef3f5;">
				<form class="inqdelform" action="${pageContext.request.contextPath}/mypage/mypage_inqdel_process.do" method="post">
                <input type="hidden" name="product_inq_idx" value="${inqproductList[rowNum-1].product_inq_idx}">
                <c:if test="${empty inqproductList[rowNum-1].product_inq_answer}">
                <div><button type="button" class="oneinqModifyup" style="margin-right:35px;">수정하기</button></div>
                </c:if>
                <div><button type="button" class="oneinqdel" style="margin-top:10px;">삭제하기</button></div>               
                </form>
                </td>
                </tr>
                </tbody>
			                   







<!-- 상품문의 수정하기 Modal -->
<form name="caq" class="oneModifyModal" action="${pageContext.request.contextPath}/mypage/mypage_oneinqModify_process.do" method="post">
<div id="modal" class="modal_modify">    
    <div class="modal-window">
        <div class="title">
            <h2>상품문의수정</h2>
            <span class="close_modalmodify" style="float:right; cursor:pointer;">&times;</span>  
            <hr id="hr">
      
        </div>
        <div class="item_info">            
                <c:if test="${!empty inqproductList[rowNum-1].product_inq_idx}">
                    <span class="thum"><img class="goodlist_thumb" style="width:200px; height:200px;"src="${pageContext.request.contextPath}/resources/uploads/${inqfileList[rowNum-1].saveFile}"></span>
                    <dl class="txt_info">
                        <dt>상품이름: ${inqproductList[rowNum-1].product_name}                            
                        </dt>                                         
                    </dl>
                </c:if>
        </div>
        <ul class="write_step">                           
            <li id="review_content_back">
                <span class="tit">문의내용<br></span>
                <div class="review_content">
                    <textarea id="review_content_textarea" name="product_inq_content" placeholder="문의내용을 입력해주세요.">${inqproductList[rowNum-1].product_inq_content}</textarea>                          
              			<input type="hidden" name="product_inq_idx" value="${inqproductList[rowNum-1].product_inq_idx}">
                </div>          
            </li>
        </ul>
        <div class="review_reg_background">                                                                     
<!--             <button type="button" class="btnLookup" id="review_ok">닫기</button> -->
            <button type="button" class="reviewModifyup" id="review_cancel" >문의 수정하기</button>                                  
        </div>
    </div>    
</div>
</form>


                
                            </c:if>
            </c:forEach>
                             <tr><td style="border-bottom:0px;">
                        <c:if test="${empty inqproductList[0].product_inq_content}">
                               <tr><td id="no_coupon" colspan="3">문의한 상품내역이 없습니다.</td></tr>
                            </c:if>
                        </td></tr>   

                         
            </tbody>


        </table>
    
    
    <!--페이징처리 -->
        <div class="paging">         
                        <c:if test="${pageNav.pageNum > pageNav.pages_per_block}">
                            <a href="mypage_productQnA.do?pageNum=1&pageBlock=1">&lt;&lt;</a>&nbsp;
                            <a href="mypage_productQnA.do?pageNum=${(pageNav.pageBlock - 2)*pageNav.pages_per_block + 1}&pageBlock=${pageNav.pageBlock-1}">
                                &lt;이전페이지
                            </a>    
                        </c:if>                     
                        <c:forEach var="i" begin="${(pageNav.pageBlock-1)*pageNav.pages_per_block + 1}" end="${pageNav.pageBlock*pageNav.pages_per_block}">
                            <c:if test="${i le pageNav.totalPageNum}">
                                <c:choose>
                                    <c:when test = "${pageNav.pageNum eq i}">
                                        <a href="mypage_productQnA.do?pageNum=${i}&pageBlock=${pageNav.pageBlock}">
                                            <span style="color:red">${i}&nbsp;</span>
                                        </a>
                                    </c:when>
                                    <c:otherwise>
                                        <a href="mypage_productQnA.do?pageNum=${i}&pageBlock=${pageNav.pageBlock}">${i}&nbsp;</a>
                                    </c:otherwise>
                            </c:choose>
                            </c:if>
                        </c:forEach>                    
                        <c:if test="${((pageNav.rows_per_page*pageNav.pages_per_block) lt pageNav.totalRows) and (pageNav.pageBlock ne pageNav.lastPageBlock) }">
                            <a href="mypage_productQnA.do?pageNum=${pageNav.pageBlock*pageNav.pages_per_block+1}&pageBlock=${pageNav.pageBlock+1}">다음페이지&gt;</a>&nbsp;
                            <a href="mypage_productQnA.do?pageNum=${pageNav.totalPageNum}&pageBlock=${pageNav.lastPageBlock}">&gt;&gt;</a>
                        </c:if>                                                          
        </div>





        
        
    </div>
</div>

<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
$(function(){
    //jQuery
   	$(".viewinq").click(function(){ 
        var index = $(".viewinq").index(this);
        
        $(".inqView").eq(index).toggle();      
    });

        
//     $(".viewinq").click(function(){
//         var index2 = $(".viewinq").index(this);
        
//         $(".inqView").eq(index2).css("display", "none");
//     });
    
    
    //수정하기 버튼 클릭시 모달 띄우기
    $(".oneinqModifyup").click(function(){
        var index = $(".oneinqModifyup").index(this);
        
        $(".modal_modify").eq(index).css("display", "block");      
    });

    //띄운 모달의 x버튼 클릭시 모달 닫기    
    $(".close_modalmodify").click(function(){
        var index2 = $(".close_modalmodify").index(this);
        
        $(".modal_modify").eq(index2).css("display", "none");
    });
        
    //수정하기 폼 전달
    $(".reviewModifyup").click(function(){
        var index2 = $(".reviewModifyup").index(this);
        alert("수정이 완료되었습니다.");
        $(".oneModifyModal").eq(index2).submit();	//폼클래스명 적기                   
    });
    
    
    //삭제하기버튼
    $(".oneinqdel").click(function(){
        var index2 = $(".oneinqdel").index(this);
        alert("작성이 완료되었습니다.");
        $(".inqdelform").eq(index2).submit();        
    });
});
</script>



    <footer>
		<jsp:include page="../main/footer.jsp"/>		
	</footer>
</body>
</html>
