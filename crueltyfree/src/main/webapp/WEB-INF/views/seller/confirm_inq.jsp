<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List, java.util.HashMap, java.util.Map" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의 확인 | CrueltyFree</title>
<style>
	* {margin:0; padding:0;}
	a {
		text-decoration: none;
	} 
	input[type="button"], input[type="submit"], input[type="checkbox"], select, label, button{cursor: pointer;}
	
	body{
		width:1020px;
		margin:0 auto;
	}
	
	header {
		top: 0px;
		width: 100%;
		height: 165px;
		background-color: white;
	}
	
	footer {
		bottom: 0px;
		width: 100%;
		height: 250px;
		line-height: 20px;
		background-color: #eef3f5;	
  	}
	
	#full {
		width: 1000px;
		height: 500px;
        margin: 0 auto;
        font: bold 25px Arial, Sans-serif;
      	margin-top:10px;
	}
	
	#title {
		width:230px;
		height:120px;
		text-align:center;
		margin-top:50px;

	}
	
	#tap {
		width: 230px;
		height: 160px;
		float: left;
		margin-left: 20px;
	}
	
	.list {
  		list-style-type: none;
  		width: 230px;
  		height: auto;
  		overflow: auto;
	}
	
	.list >li {
		height: 40px;
	}
	
	.list a {
	  	text-decoration: none;
  		padding: 10px;
  		display: block;
  		color: #000;
  		font-size: 14px;
  		background-color: #eef3f5;
  		width: 170px;
	}
	
	.pro_register {
		width: 190px;
		height: 40px;
		font-size: 15px;
		font-weight: bold;
		letter-spacing: -1px;
		text-align: center;
		background-color: #ffffff;
		color: #7d99a4;
		border: 2px solid #7d99a4;
		border-radius: 30px;
		display: inline-block;
		margin-top: 20px;
	}
	
	#content {
		width:700px;
		float:left;
		margin-left:10px;
	}
	
	.sub_title {
		width: 700px;
		height: 50px;
		border-bottom: 1px solid #a4a4a4;
	}
	
	th {
		font-size: 12px;
		font-weight: none;
	}
	
	td {
		font-size: 14px;
		font-weight: none;
		text-align: center;
	}
	
	#history_tb {
		width: 700px;
	}
	
	#clear{clear: both;}
	
	
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
</style>
</head>
<body>
<header>
	<jsp:include page="../main/header.jsp" />
</header>
<section id="full">
	<div id="title">
		<img src="../resources/img/seller.png" style="width: 50px; height: 50px;">
		<h3>판매자 페이지</h3>	
	</div>
	<div id="tap">
		<ul class="list">
			<li><a href="sale_stats.do">매출통계</a></li>
			<li><a href="purchase_history.do">구매 내역</a></li>
			<li><a href="confirm_inq.do" style="background-color: #7d99a4; color:#ffffff; font-weight: bold;">문의 확인</a></li>
			<li><a href="check_pro.do">등록 상품 확인</a></li>
		</ul>
		<a href="regi_pro.do"><button class="pro_register">상품 등록하기</button></a>
	</div>
	<div id="content">
		<article class="sub_title">
			<h5>문의 확인</h5>
		</article>
		<article class="history_list">
			<table id="history_tb">
		        <tr height="30px;">
		            <th width="100px;">상품번호</th>
		            <th width="400px;">문의 내용</th>
		            <th width="100px;">닉네임</th>
		            <th width="100px;">답변 상태</th>
		        </tr>
		        
		        <!-- 추후 c:choose, c:when 및 데이터베이스를 연동해 페이지 구현 -->
				<!-- 글목록 내용-->
		<c:choose>
			<c:when test="${empty confirmproductList[0].product_inq_idx}">
				<tr>
					<td colspan="3" style="height: 300px; color: #a4a4a4;"> 등록된 문의가 없습니다. </td>
				</tr>
			</c:when>
			<c:otherwise>
				<c:forEach var="rowNum" begin="${pageNav.startNum}" end="${pageNav.endNum}">
					
					<c:if test="${confirmproductList[rowNum-1].product_inq_idx ne null}"> <!-- notice에 저장된 값이 있을 경우에만 출력 -->
						<tr style="cursor:pointer;" class="viewinq">
							<td>${confirmproductList[rowNum-1].product_inq_idx}</td> <!-- 번호 -->
							<td id="td_title">
								${confirmproductList[rowNum-1].product_inq_content} <!-- 제목 -->
							</td>			
							<td>
								<fmt:formatDate value="${confirmproductList[rowNum-1].product_inq_regDate}" type="date"
									pattern="yyyy/MM/dd" /> <!-- 날짜 -->
							</td>
							<td>
		                        <c:choose>
		                            <c:when test="${empty confirmproductList[rowNum-1].product_inq_answer}">
		                                답변대기
		                            </c:when>
		                            <c:when test="${!empty confirmproductList[rowNum-1].product_inq_answer}">
		                                답변완료
		                            </c:when>
		                            <c:otherwise>
		                            </c:otherwise>
		                        </c:choose>                                                                            
		                    </td>
						</tr>
					</c:if>
					
<tbody class="inqView" style="display:none;">
           <tr>
           <td colspan='2'>
           
           
           	                	
           	문의내용 : ${confirmproductList[rowNum-1].product_inq_content}<br>
           	
           	<c:if test="${!empty confirmproductList[rowNum-1].product_inq_answer}">
           	답변내용 : ${confirmproductList[rowNum-1].product_inq_answer} 
           	</c:if>
            
                
            </td>
            <td>
<form class="inqdelform" action="${pageContext.request.contextPath}/one_inq/one_ifdfds.do" method="post">
           <input type="hidden" name="one_inq_idx" value="${confirmproductList[rowNum-1].product_inq_idx}">
           <c:if test="${empty confirmproductList[rowNum-1].product_inq_answer}">
           <button type="button" class="oneinqModifyup">답변하기</button>
           </c:if>
           <c:if test="${!empty confirmproductList[rowNum-1].product_inq_answer}">
           <button type="button" class="oneinqModifyup2">수정하기</button>
           </c:if>                
           </form>
           
           </td>
           
           </tr>
           </tbody>
           
           

<!-- 상품문의 답변하기 Modal -->
<form name="caq" class="oneModifyModal" action="${pageContext.request.contextPath}/seller/confirm_process.do" method="post">
<div id="modal" class="modal_modify">    
    <div class="modal-window">
        <div class="title">
            <h2>상품문의 </h2>
            <span class="close_modalmodify">&times;</span>
            <br>
            <h1>문의내용 : ${confirmproductList[rowNum-1].product_inq_content}</h1>                   
            <h1>문의자닉네임 : ${confirmproductList[rowNum-1].member_nickname}</h1>
        </div>        
        <ul class="write_step">                           
            <li id="review_content_back">  				             	            
                <div class="review_content">
                    <br><textarea id="review_content_textarea" name="product_inq_answer" placeholder="답변을 입력해주세요."></textarea>                          
              			<input type="hidden" name="product_inq_idx" value="${confirmproductList[rowNum-1].product_inq_idx}">
                </div>          
            </li>
        </ul>
        <div class="review_reg_background">                                                                     
<!--             <button type="button" class="btnLookup" id="review_ok">닫기</button> -->

					

            <button type="button" class="reviewModifyup" id="review_cancel" >답변하기</button>                                  
        </div>
    </div>    
</div>
</form>


<!-- 상품문의 수정하기 Modal -->
<form name="caq" class="oneModifyModal2" action="${pageContext.request.contextPath}/seller/confirmModify_process.do" method="post">
<div id="modal" class="modal_modify2">    
    <div class="modal-window">
        <div class="title">
            <h2>상품문의 </h2>
            <span class="close_modalmodify2">&times;</span>
            <br>
            <h1>문의내용 : ${confirmproductList[rowNum-1].product_inq_content}</h1>                   
            <h1>문의자닉네임 : ${confirmproductList[rowNum-1].member_nickname}</h1>
        </div>        
        <ul class="write_step">                           
            <li id="review_content_back">  				             	            
                <div class="review_content">
                    <br><textarea id="review_content_textarea" name="product_inq_answer" placeholder="답변을 입력해주세요.">${confirmproductList[rowNum-1].product_inq_answer}123123123</textarea>                          
              			<input type="hidden" name="product_inq_idx" value="${confirmproductList[rowNum-1].product_inq_idx}">
                </div>          
            </li>
        </ul>
        <div class="review_reg_background">                                                                     
<!--             <button type="button" class="btnLookup" id="review_ok">닫기</button> -->

					

            <button type="button" class="reviewModifyup2" id="review_cancel" >수정하기</button>                                  
        </div>
    </div>    
</div>
</form>

						
				</c:forEach>
				
			</c:otherwise>
		</c:choose>
				
		
				<tr>
					<td id="history_paging" colspan="6">
						<!-- 추후 페이징 구현 -->
						<%@ include file="paging_confirm_inq.jsp" %>
					</td>
				</tr>
    </table>
		</article>
	</div>
</section>
<div id="clear"></div>
</body>
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
    
    
    //답변하기 버튼 클릭시 모달 띄우기
    $(".oneinqModifyup").click(function(){
        var index = $(".oneinqModifyup").index(this);
        
        $(".modal_modify").eq(index).css("display", "block");      
    });
    
    //수정하기 버튼 클릭시 모달 띄우기
    $(".oneinqModifyup2").click(function(){
        var index = $(".oneinqModifyup2").index(this);
        
        $(".modal_modify2").eq(index).css("display", "block");      
    });

    //답변하기 폼 전달
    $(".reviewModifyup").click(function(){
        var index2 = $(".reviewModifyup").index(this);
        alert("답변이 완료되었습니다.");
        $(".oneModifyModal").eq(index2).submit();	//폼클래스명 적기                   
    });
    
 	//수정하기 폼 전달
    $(".reviewModifyup2").click(function(){
        var index2 = $(".reviewModifyup2").index(this);
        alert("수정이 완료되었습니다.");
        $(".oneModifyModal2").eq(index2).submit();	//폼클래스명 적기                   
    });

 	
    //답변하기 띄운 모달의 x버튼 클릭시 모달 닫기    
    $(".close_modalmodify").click(function(){
        var index2 = $(".close_modalmodify").index(this);
        
        $(".modal_modify").eq(index2).css("display", "none");
    });
        
    //수정 띄운 모달의 x버튼 클릭시 모달 닫기    
    $(".close_modalmodify2").click(function(){
        var index2 = $(".close_modalmodify2").index(this);
        
        $(".modal_modify2").eq(index2).css("display", "none");
    });
});
</script>

<footer>
	<jsp:include page="../main/footer.jsp" />
</footer>

</body>
</html>