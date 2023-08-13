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
                    <th scope="col">상품${inqfileList[0].saveFile}</th>
                    <th scope="col">문의내용</th>
                    <th scope="col">답변상태</th>
                </tr>
            </thead>
            <tbody>
            
            
            
            
            <c:forEach var="rowNum" begin="${pageNav.startNum}" end="${pageNav.endNum}">
                    <!-- c:if nonreviewfileList[rowNum-1]. = null이면 리뷰안쓴목록만 출력하는방식도 있을 듯? -->
                            <c:if test="${!empty inqproductList[rowNum-1].product_inq_content}">
                <tr>                
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

    <footer>
		<jsp:include page="../main/footer.jsp"/>		
	</footer>
</body>
</html>
