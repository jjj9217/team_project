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
<link rel="icon" href="${pageContext.request.contextPath}/resources/img/favicon.png">

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
		font-size: 13px;
		font-weight: none;
	}
	
	td {
		font-size: 12px;
		font-weight: none;
		text-align: center;
	}
	
	#history_tb {
		width: 700px;
		border-collapse: collapse;
	}
	
	#clear{clear: both;}
	
	
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
        .inq_user, .inq_user_content{
        	padding: 10px;
        	font-size: 16px;
        	font-weight: normal;
        }
        .inq_user_title{
        	display: block;
        	color: #7d99a4;
        	font-size: 20px;
        	font-weight: bold;
        }
        .review_reg_background{
        	margin-top: 30px;
        	text-align: center;
        }
        .reviewModifyup, reviewModifyup2{
        	width: 100px;
        	height: 40px;
        	border: 1px solid #7d99a4;
        	border-radius: 5px;
        	color:  #fff;
        	background-color: #7d99a4;
        	font-weight: bold;
        }
		.txtAr{
		width: 540px;
		height: 240px;
		resize: none;
		padding: 10px;
		outline-color:#7d99a4;
		}
    .close_modalmodify, .close_modalmodify2{
            	float: right;
        	display: block;
        	font-size: 36px;
        	cursor: pointer;
    }
    .modal .close-area {
        display: inline;
        float: right;
        padding-right: 10px;
        cursor: pointer;
        text-shadow: 1px 1px 2px gray;
        color: white;
    }
    .title h2 {
            display: inline;
        }
    .modal .content {
        margin-top: 20px;
        padding: 0px 10px;
        text-shadow: 1px 1px 2px gray;
        color: white;
    }
    		.hidden {
	 	display: none;
	 	}
    #history_tb td{
    	border-bottom: 1px solid #a4a4a4;
    }
    #history_tb th{
    	border-top: 1px solid #a4a4a4;
    	border-bottom: 1px solid #a4a4a4;
    }
    #history_tb .content_text{
    	text-align: left;
    	padding: 15px;
    	background-color: #eef3f5;
    }
    #history_tb .content_bgblue{
    background-color: #eef3f5;
    }
	#history_paging{
    	padding-top: 10px;
    }
    
    .answer_wait{
    	margin-left: 5px;
    	display: block;
    	width: 80px; height: 20px;
    	border-radius: 5px;
    	color: #7d99a4;
    	background-color: #fff;
    	border: 1px solid #7d99a4;
    	font-weight: bold;
    	font-size: 12px;
    }
    .answer_wait2{
    	margin-left: 5px;
    	display: block;
    	width: 80px; height: 20px;
    	border-radius: 5px;
    	color: #7d99a4;
    	background-color: #fff;
    	border: 1px solid #7d99a4;
    	font-weight: bold;
    	font-size: 12px;
    }
    .answer_comp{
    	margin-left: 5px;
    	display: block;
    	width: 80px; height: 20px;
    	border-radius: 5px;
    	color: #fff;
    	background-color: #7d99a4;
    	border: 1px solid #7d99a4;
    	font-weight: bold;
    	font-size: 12px;
    }
    .blueText{
    	color: #7d99a4;
    	font-weight: bold;
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
					<td colspan="4" style="height: 300px; color: #a4a4a4;"> 등록된 문의가 없습니다. </td>
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
		                                <span class="answer_wait">답변대기</span>
		                            </c:when>
		                            <c:when test="${!empty confirmproductList[rowNum-1].product_inq_answer}">
		                                <span class="answer_comp">답변완료</span>
		                            </c:when>
		                            <c:otherwise>
		                            </c:otherwise>
		                        </c:choose>                                                                            
		                    </td>
						</tr>
					</c:if>
					
<tbody class="inqView" style="display:none;">
           <tr>
           <td class="content_text" colspan='3'>
           
           
           	                	
           	<span class="blueText">문의내용 :</span><br>
           	${confirmproductList[rowNum-1].product_inq_content}<br>
           	
           	<c:if test="${!empty confirmproductList[rowNum-1].product_inq_answer}">
           	<br><span class="blueText">답변내용 :</span><br> 
           	${confirmproductList[rowNum-1].product_inq_answer}<br> 
           	</c:if>
            
                
            </td>
            <td class="content_bgblue">
<form class="inqdelform" action="${pageContext.request.contextPath}/one_inq/one_ifdfds.do" method="post">
           <input type="hidden" name="one_inq_idx" value="${confirmproductList[rowNum-1].product_inq_idx}">
           <c:if test="${empty confirmproductList[rowNum-1].product_inq_answer}">
           <button type="button" class="oneinqModifyup answer_wait2">답변하기</button>
           <input type="hidden" class="oneinqModifyup2">
           </c:if>
           <c:if test="${!empty confirmproductList[rowNum-1].product_inq_answer}">
           <button type="button" class="oneinqModifyup2 answer_comp">수정하기</button>
           <input type="hidden" class="oneinqModifyup">
           </c:if>                
           </form>
           
           </td>
           
           </tr>
           </tbody>
           
           

<!-- 상품문의 답변하기 Modal -->
<form name="caq" class="oneModifyModal" action="${pageContext.request.contextPath}/seller/confirm_process.do" method="post">
<div id="modal" class="modal_modify modal hidden">    
    <div class="modal-window">
        <div class="title">
            <h2>상품문의 답변</h2>
            <span class="close_modalmodify">X</span>
        </div>
        <div class="hr_space"></div>                
        <ul class="write_step">                           
            <li id="review_content_back">  				             	            
                <div class="review_content">
		            <div class="inq_user">
		            <span class="inq_user_title">문의자닉네임 :</span> <br>
		            ${confirmproductList[rowNum-1].member_nickname} <br><br>
		            <span class="inq_user_title">문의상품 :</span> <br>
		            ${confirmproductList[rowNum-1].product_name}
		            </div>
		            <div class="inq_user_content">
		            <span class="inq_user_title">문의내용 :</span> <br>
		            ${confirmproductList[rowNum-1].product_inq_content}                   
		            </div>
                    <br><textarea id="review_content_textarea" class="txtAr" name="product_inq_answer" placeholder="답변을 입력해주세요."></textarea>                          
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
<div id="modal" class="modal_modify2 modal hidden">    
    <div class="modal-window">
        <div class="title">
            <h2>상품문의 답변</h2>
            <span class="close_modalmodify2">X</span>
        </div>
        <div class="hr_space"></div>  
        <ul class="write_step">                           
            <li id="review_content_back">  				             	            
                <div class="review_content">
                	<div class="inq_user">
		            <span class="inq_user_title">문의자닉네임 :</span> <br>
		            ${confirmproductList[rowNum-1].member_nickname}
		            </div>
		            <div class="inq_user_content">
		            <span class="inq_user_title">문의내용 :</span> <br>
		            ${confirmproductList[rowNum-1].product_inq_content}                   
		            </div>
                    <br><textarea id="review_content_textarea" class="txtAr" name="product_inq_answer" placeholder="답변을 입력해주세요.">${confirmproductList[rowNum-1].product_inq_answer}123123123</textarea>                          
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
					<td id="history_paging" colspan="4" style="border-bottom:none;">
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
        
        $(".inqView").eq(index).toggle();      
    });
    
    
    //답변하기 버튼 클릭시 모달 띄우기
    $(".oneinqModifyup").click(function(){
        var index = $(".oneinqModifyup").index(this);
        
        $(".modal_modify").eq(index).removeClass("hidden");      
    });
    
    //수정하기 버튼 클릭시 모달 띄우기
    $(".oneinqModifyup2").click(function(){
        var index = $(".oneinqModifyup").index(this);
        
        $(".modal_modify2").eq(index).removeClass("hidden");      
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
        
        $(".modal_modify").eq(index2).addClass("hidden");
    });
        
    //수정 띄운 모달의 x버튼 클릭시 모달 닫기    
    $(".close_modalmodify2").click(function(){
        var index2 = $(".close_modalmodify2").index(this);
        
        $(".modal_modify2").eq(index2).addClass("hidden");
    });
});
</script>

<footer>
	<jsp:include page="../main/footer.jsp" />
</footer>

</body>
</html>