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
            <h2 class="tit">상품 Q&A</h2>
        </div>
        

        
        
        <table class="buy_list">
            <colgroup>
                <col style="width:367px;">
                <col style="width:272px;">
                <col style="width:150px;">
            </colgroup>
            <thead>
                <hr width=100%>
                <tr>
                    <th scope="col">상품</th>
                    <th scope="col">문의내용</th>
                    <th scope="col">답변상태</th>
                </tr>
            </thead>
            <tbody>
            
            
            
                   
            <c:forEach var="rowNum" begin="${pageNav.startNum}" end="${pageNav.endNum}">
                    <!-- c:if nonreviewfileList[rowNum-1]. = null이면 리뷰안쓴목록만 출력하는방식도 있을 듯? -->
                            <c:if test="${!empty inqproductList[rowNum-1].product_inq_content}">
				
				
                <tr style="cursor:pointer;" class="viewinq">     	                
                    <td><img class="goodlist_thumb" src="${pageContext.request.contextPath}/resources/uploads/${inqfileList[rowNum-1].saveFile}">
                        상품이름: ${inqproductList[rowNum-1].product_name}
                        문의날짜: ${inqproductList[rowNum-1].product_inq_regDate}
                    </td>                                        
                    <td>문의내용: ${inqproductList[rowNum-1].product_inq_content}</td>
                    <td>
                        <c:choose>
                            <c:when test="${empty inqproductList[rowNum-1].product_inq_answer}">
                                답변대기
                            </c:when>
                            <c:when test="${!empty inqproductList[rowNum-1].product_inq_answer}">
                                답변완료
                            </c:when>
                            <c:otherwise>
                            </c:otherwise>
                        </c:choose>                                                                            
                    </td>
                </tr>
                <tbody class="inqView" style="display:none;">
                <tr>
                <td colspan='2'>
                
                
                	                	
                	문의내용 : ${inqproductList[rowNum-1].product_inq_content}<br>
                	
                	<c:if test="${!empty inqproductList[rowNum-1].product_inq_answer}">
                	답변내용 : ${inqproductList[rowNum-1].product_inq_answer} 
                	</c:if>
                
                    
                </td>
                <td>
				<form class="inqdelform" action="${pageContext.request.contextPath}/mypage/mypage_inqdel_process.do" method="post">
                <input type="hidden" name="product_inq_idx" value="${inqproductList[rowNum-1].product_inq_idx}">
                <c:if test="${empty inqproductList[rowNum-1].product_inq_answer}">
                <button type="button" class="oneinqModifyup">수정하기</button>
                </c:if>
                <button type="button" class="oneinqdel">삭제하기</button>                
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
            <span class="close_modalmodify">&times;</span>        
        </div>
        <div class="item_info">            
                <c:if test="${!empty inqproductList[rowNum-1].product_inq_idx}">
                    <span class="thum"><img class="goodlist_thumb" src="${pageContext.request.contextPath}/resources/uploads/${inqfileList[rowNum-1].saveFile}"></span>
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
                    <br><textarea id="review_content_textarea" name="product_inq_content" placeholder="문의내용을 입력해주세요.">${inqproductList[rowNum-1].product_inq_content}</textarea>                          
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
            
                        <tr><td>
                        <c:if test="${empty inqproductList[0].product_inq_content}">
                                문의한 상품내역이 없습니다.
                            </c:if>
                        </td></tr>                            
            </tbody>


        </table>



        
        
    </div>
</div>

<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
$(function(){
    //jQuery
   	$(".viewinq").click(function(){ 
        var index = $(".viewinq").index(this);
        
        $(".inqView").eq(index).css("display", "block");      
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
