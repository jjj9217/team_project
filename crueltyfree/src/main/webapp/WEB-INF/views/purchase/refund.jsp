<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>환불테스트 | CrueltyFree</title>
<link rel="icon" href="${pageContext.request.contextPath}/resources/img/favicon1.png">
    <style>
        *{margin: 0; padding: 0;}
        a{text-decoration: none;}
        input[type="button"], input[type="submit"], input[type="checkbox"], select, input[type="radio"], label{cursor: pointer;}
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
		#refund_box{
			padding: 20px;
		}
       </style>

<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://cdn.iamport.kr/v1/iamport.js"></script> 
<script>
var IMP = window.IMP;
IMP.init("imp36534356");

function doPayment(){	
	IMP.certification({
			pg:'inicis_unified.MIIiasTest',//본인인증 설정이 2개이상 되어 있는 경우 필수 
		    merchant_uid: "ORD20180131-0001123", // 주문 번호
	    }, function (rsp) { // callback
	      	  //rsp.imp_uid 값으로 결제 단건조회 API를 호출하여 결제결과를 판단합니다.
	          if (rsp.success) {
	        	  $.ajax({
	        	    	type: "post",
	        	    	url: "${pageContext.request.contextPath}/purchase/certifications_process.do",
	        	    	data: JSON.stringify({
	        	    		"imp_uid": rsp.imp_uid //인증 UID
	        	    	}), 
	        	    		//JSON.stringify(JSON타입 객체): JSON타입 객체를 String객체로 변환시킴
	        	    	contentType: "application/json;charset=utf-8;",
	        	    	//contentType: 사용자가 서버로 보내는 내용의 MIME타입
	        	    	dataType: "json",
	        	    	success: function(data) {
	        	    		$("#name").val(data.name);
        	    		    $("#birthday").val(data.birthday);
        	    		    $("#phone").val(data.phone);
        	    		    
        	    		    $("#join_form").submit();
	        	        },
	        	        error: function(error) {
	        	        	alert("ajax 에러 발생");
	        	        }
	        	    });//end of ajax
			    } else {
			      var msg = '인증에 실패하였습니다.';
			      msg += '에러내용 : ' + rsp.error_msg;
			      alert(msg);
			    }
	    });	
}
</script>  
<script>
$(function(){
	
  $("#test_btn1").click(function(){
	  doPayment()
  });		
  
  $("#refund_btn").click(function(){
    $.ajax({
    	type: "post",
    	url: "${pageContext.request.contextPath}/purchase/refund_process.do",
    	data: JSON.stringify({
    		"merchant_uid":"CF23080838900372",//결제 UID
    		"order_idx":"15"//order_idx
    	}), 
    		//JSON.stringify(JSON타입 객체): JSON타입 객체를 String객체로 변환시킴
    	contentType: "application/json;charset=utf-8;",
    	//contentType: 사용자가 서버로 보내는 내용의 MIME타입
    	success: function(data) {
    		if(data == "success"){
    			alert("환불에 성공하였습니다.");
    		}else{
    			alert("환불에 실패하였습니다.");
    		}
        },
        error: function(error) {
        	alert("ajax 에러 발생");
        }
    });//end of ajax
  })//end of btn click
	
});
</script>       
</head>
<body>
	<header>	
		<jsp:include page="../main/header.jsp"/>	
	</header>
	<div id="refund_box">
		<button id="refund_btn">환불하기</button>
	</div>
	<div id="refund_box">
		<button id="test_btn1">테스트용</button>
		<form id="join_form" action="${pageContext.request.contextPath}/member/join.do" method="post">
		<input type="hidden" id="name" value="">
		<input type="hidden" id="birthday" value="">
		<input type="hidden" id="phone" value="">
		</form>
	</div>
	
    <footer>
		<jsp:include page="../main/footer.jsp"/>		
	</footer>
</body>
</html>