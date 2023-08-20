<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List, java.util.HashMap, java.util.Map" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1:1 문의 | CrueltyFree</title>
<link rel="icon" href="${pageContext.request.contextPath}/resources/img/favicon1.png">

<style>
	* {margin:0; padding:0;}
	a{text-decoration: none;}
    input[type="button"], input[type="submit"], input[type="checkbox"], select, label, button{cursor: pointer;}
	body {
		width: 1020px;
		margin: 0 auto;
	}
	
	header{
		top: 0px;
		width: 100%;
		height: 165px;
		background-color: white;
	}
	
	#content {
		font-size: 0;
	}
	
	#title {
		width: 1020px;
		height: 90px;
		text-align: left;
		background-color: #eef3f5;
		margin-bottom: 20px;
		padding: 30px 0 0 0;
	}
	
	#title a {
		text-align: left;
	}
	
	.qna_select {
		width: 100%;
		text-align: center;
		margin-bottom: 40px;
	}
	
	.notice {
		width: 510px;
		height: 50px;
		background-color: #ededed;
		display: inline-block;
		padding-top: 15px;
		cursor: pointer;
	}
	
	.notice a {
		color: #000000;
		font-size: 20px;
		font-weight: bold;
		text-decoration-line: none;
	}
	
	.one_inq {
		width: 510px;
		height: 50px;
		background-color: #7d99a4;
		display: inline-block;
		padding-top: 15px;
		cursor: pointer;
	}
	
	.one_inq a {
		color: #ffffff;
		font-size: 20px;
		font-weight: bold;
		text-decoration-line: none;
	}
	
	#one_inq_list {
		font-size: 14px;
		border-top: 2px solid #a4a4a4;
		border-bottom: 2px solid #a4a4a4;
		text-align: center;
		margin-bottom: 50px;
		color: #4a4a4a;
		border-collapse: collapse;
	}
	
	#one_inq_list a {
	}
	
	#one_inq_list th {
		border-bottom: 1px solid #a4a4a4;
		color: #4a4a4a;
	}
	
	#one_inq_list td {
		height: 50px;
		border-bottom: 1px solid #d9d9d9;
	}
	
	#td_title {
		color: #4a4a4a;
	}
	
	.div_write {
		text-align: center;
		margin-bottom: 50px;
	}
	
	#one_inq_write {
		width: 150px;
		height: 40px;
		font-size: 17px;
		font-weight: bold;
		letter-spacing: -1px;
		text-align: center;
		background-color: #7d99a4;
		color: #ffffff;
		border: none;
		border-radius: 30px;
	}
	
	footer{
		bottom: 0px;
		width: 100%;
		height: 250px;
		line-height: 20px;
		background-color: #eef3f5;	
	}
	
	
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
        width: 450px;
        height: 600px;
        position: relative;
        top: -100px;
        top:5%;
        padding: 10px;
        position: fixed;
        justify-content: center;
        background-color:white;
        top:50%;
        left:50%;
	    transform: translate(-50%, -50%);        
    }
    #modal .title {
        padding-left: 10px;
        display: inline;
        color: black;
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
        color: black;
    }
    .close_modalmodify{float:right; cursor:pointer;}
    #modal .content {
        margin-top: 20px;
        padding: 0px 10px;
        text-shadow: 1px 1px 2px gray;
    }
    .inqView {
    	line-height: 80px;
    	background-color: #eef3f5;
    	display: none;
    }
    
    .oneinqModifyup {
    	width: 80px;
        height: 25px;
        padding-left: 10px;
        padding-right: 10px;
        border-radius: 0.5em;
        background-color: #ffffff;
        color: #7d99a4;
        border: 1px solid #7d99a4;
        font-size: 12px;
        font-weight: bold;
    }
    
    .oneinqdel {
    	width: 78px;
        height: 25px;
        padding-left: 10px;
        padding-right: 10px;
        border-radius: 0.5em;
        background-color: #7d99a4;
        color: #ffffff;
        border: none;
        font-size: 12px;
        font-weight: bold;
    }
	#hr{
		margin-top:10px; 
		height:5px; 
		background-color:#7d99a4;
		border:0;
	}    
	.inq_type{
		padding-left:10px;
		border-color:#7d99a4; 
		border-style:solid; 
		width:375px; 
		height:35px; 
		border-radius:5px;
	}
	#review_content_textarea{
		margin-top:10px;
		padding-left:10px;
		border-color:#7d99a4; 
		border-style:solid; 
		width:360px; 
		border-radius:5px;
		border-width:2px;
		height:300px;
		padding-top:5px;
	}
	#review_cancel{
		margin-top:10px;
		background-color:#7d99a4; 
		color:white; 
		border:0; 
		border-radius:3px; 
		width:170px; 
		height:38px; 
		font: bold 13px Arial, Sans-serif;
	}
</style>

</head>
<body>

<header>
	<jsp:include page="../main/header.jsp" /><br><br>
</header>

<nav id="title">
	&nbsp;&nbsp;<a style="font-size: 30px; font-weight: bold;">고객센터</a>&nbsp;&nbsp;&nbsp;<a>무엇을 도와드릴까요?</a>
</nav>

<section id="content">
	<div class="qna_select">
		<article class="notice" onclick="location.href='${pageContext.request.contextPath}/one_inq/notice.do';">
			<a href="${pageContext.request.contextPath}/one_inq/notice.do">공지사항</a>
		</article>
		<article class="one_inq" onclick="location.href='${pageContext.request.contextPath}/one_inq/one_inq_list.do';">
			<a href="${pageContext.request.contextPath}/one_inq/one_inq_list.do">1:1 문의</a>
		</article>
	</div>
		
	<!-- 글목록 테이블 -->
    <table id="one_inq_list">
        <tr height="50px;">
            <th width="100px;">번호</th>
            <th width="620px;">제목</th>
            <th width="200px;">등록일</th>
            <th width="100px;">상태</th>
        </tr>
        
        <!-- 글목록 내용-->
		<c:choose>
			<c:when test="${empty oneinqList[0].one_inq_idx}">
				<tr>
					<td colspan="4" style="height: 300px; color: #a4a4a4;"> 등록하신 1:1 문의가 없습니다. </td>
				</tr>
			</c:when>
			<c:otherwise>
				<c:forEach var="rowNum" begin="${pageNav.startNum}" end="${pageNav.endNum}">
					<c:if test="${oneinqList[rowNum-1].one_inq_idx ne null}"> <!-- notice에 저장된 값이 있을 경우에만 출력 -->
						<tr style="cursor:pointer;" class="viewinq">
							<td>${oneinqList[rowNum-1].one_inq_idx}</td> <!-- 번호 -->
							<td id="td_title">
								${oneinqList[rowNum-1].one_inq_title} <!-- 제목 -->
							</td>			
							<td>
								<fmt:formatDate value="${oneinqList[rowNum-1].one_inq_regDate}" type="date"
									pattern="yyyy/MM/dd" /> <!-- 날짜 -->
							</td>
							<c:choose>
								<c:when test="${empty oneinqList[rowNum-1].one_inq_answer}">
									<td style="color: #a4a4a4; font-weight: bold;">답변대기</td>
								</c:when>
								<c:otherwise>
									<td style="color: #7d99a4; font-weight: bold;">답변완료</td>
								</c:otherwise>
							</c:choose>
						</tr>
					</c:if>
					
					<!-- 클릭 시 보이는 내용 -->
					<tr class="inqView">
						<td style="height: 100px; font-size: 30px; font-weight: bold;">
							<div style="color: #7d99a4;"><a>Q<br></a></div>
							<c:if test="${!empty oneinqList[rowNum-1].one_inq_answer}">
								<div style="color: #a4a4a4;"><a>A</a></div>
							</c:if>
						</td>
						<td>
							${oneinqList[rowNum-1].one_inq_content}<br>
							<c:if test="${!empty oneinqList[rowNum-1].one_inq_answer}">
								${oneinqList[rowNum-1].one_inq_answer}
							</c:if>
						</td>
						<td></td>
						<td>
							<form class="inqdelform" action="${pageContext.request.contextPath}/one_inq/one_inqdel_process.do" method="post">
								<input type="hidden" name="one_inq_idx" value="${oneinqList[rowNum-1].one_inq_idx}">
								<c:if test="${empty oneinqList[rowNum-1].one_inq_answer}">
									<button type="button" class="oneinqModifyup">수정하기</button>
								</c:if>
								<button type="button" class="oneinqdel">삭제하기</button>
							</form>
						</td>
					</tr>

					<!-- 상품문의 수정하기 Modal -->
					<form name="caq" class="oneModifyModal" action="${pageContext.request.contextPath}/one_inq/one_inqModify_process.do" method="post">
					<div id="modal" class="modal_modify">    
					    <div class="modal-window">
					        <div class="title">
					            <span><h2>1:1문의수정 </h2></span><span>문의내용 : ${oneinqList[rowNum-1].one_inq_title}</span>
					            <span class="close_modalmodify">&times;</span>
					            <hr id="hr">
					            <br>
					                               
					        </div>        
					        <ul class="write_step">                           
					            <li id="review_content_back">  				             
						            <select name="one_inq_title" class="inq_type">
										<option value="회원정보">회원정보</option>
										<option value="주문/결제">주문/결제</option>
										<option value="배송문의">배송문의</option>
										<option value="취소/교환/환불">취소/교환/환불</option>
										<option value="사이트 이용 오류/개선">사이트 이용 오류/개선</option>
										<option value="판매자 등급 문의">판매자 등급 문의</option>
									</select>
					                <div class="review_content">
					                    <br><textarea id="review_content_textarea" name="one_inq_content" placeholder="문의내용을 입력해주세요.">${oneinqList[rowNum-1].one_inq_content}</textarea>                          
					              			<input type="hidden" name="one_inq_idx" value="${oneinqList[rowNum-1].one_inq_idx}">
					                </div>          
					            </li>
					        </ul>
					        <div class="review_reg_background">                                                                     
					<!--   <button type="button" class="btnLookup" id="review_ok">닫기</button> -->
					
										
					
					            <button type="button" class="reviewModifyup" id="review_cancel" >문의 수정하기</button>                                  
					        </div>
					    </div>    
					</div>
					</form>

						
				</c:forEach>
				
			</c:otherwise>
		</c:choose>
		

		<tr>
			<td id="td_paging" colspan="4" style="border: none;">
				<%@ include file="paging_oneinq.jsp" %>
			</td>
		</tr>
    </table>
	<!-- 문의 등록 버튼 -->
	<!-- 비회원이 문의하기 누르면 로그인 버튼으로 가게 조건문 걸어주세요 -->
	<div class="div_write">
		<a href="${pageContext.request.contextPath}/one_inq/one_inq_write.do"><button id="one_inq_write">1:1 문의하기</button></a>
	</div>
	
</section>
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
        alert("삭제가 완료되었습니다.");
        $(".inqdelform").eq(index2).submit();        
    });
});
</script>
<footer>
	<jsp:include page="../main/footer.jsp" />
</footer>

</body>
</html>