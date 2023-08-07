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
.image_container{
width:500px;
height:width:500px;}
 
</style>
</head>

<body>
test시작

        <form name="fileForm" enctype="multipart/form-data" action="mypage_review_write_process.do" method="post">    
        <input type="file" name="attachedFile">
        <input type="file" name="attachedFile">
        <input type="file" name="attachedFile">
        <input type="file" name="attachedFile">
        <input type="file" name="attachedFile">
                              
        <input type="hidden" name="member_idx" value="1">
        <input type="hidden" name="product_idx" value="1">
        <input type="hidden" name="review_score" value="1">
        <input type="hidden" name="member_nickname" value="k">                
        <input type="text" name="review_content">        
        <button id="file_submit_btn">전송</button>        
        </form>
<%-- 
<input type="hidden" name="temp2" id="asd"value="3">
<form name="fileForm" enctype="multipart/form-data" action="" method="">
<c:forEach var="asd" begin="1" end="3">
<input type="hidden" name="temp2" id="result_contain"value="">
</c:forEach> --%>
</form>

</body>
 <script>
 function readImage(input) {
	    // 인풋 태그에 파일이 있는 경우
	    if(input.files && input.files[0]) {
	        // 이미지 파일인지 검사 (생략)
	        // FileReader 인스턴스 생성
	        const reader = new FileReader()
	        // 이미지가 로드가 된 경우
	        reader.onload = e => {
	            const previewImage = document.getElementById("preview-image")
	            previewImage.src = e.target.result
	        }
	        // reader가 이미지 읽도록 하기
	        reader.readAsDataURL(input.files[0])
	    }
	}
	// input file에 change 이벤트 부여
	const inputImage = document.getElementById("input-image")
	inputImage.addEventListener("change", e => {
	    readImage(e.target)
	})
	
		
	
2가지 문제	
name$("fileForm")
	id$("#fileForm")
$("fileForm").eq(3).click(function(){
	
}
	2.text type과 hidden type도 다 전송이 되는건지
	1.선택자가 이것이 맞는건지 .click가 맞는건지
	$("#file_submit_btn").click(function(){  
		
		var fileCheck = document.getElementByName("attachedFile").value;
	    
	    for (var i=0; i<5; i++){
	        if(fileCheck[i].value == 0){
	            fileCheck[i].splice(i,1)
	        }	        

	    }
	    
	    var length = fileCheck.length;
	    
	    ㅁㄴㅇ = json형식으로 변환 .(fileCheck)
	    
	    $("#result_contain").val(ㅁㄴㅇ);
	    
	    document.fileForm.submit();
	}
	    	    
	    
	    
        $.ajax({
            type: "post",
            url: "mypage_review_write_process.do",
            data: { "basket_idxs": fileCheck},
            success: function(data) {
                if (data == "success") {
                    alert("선택한 상품의 삭제를 성공하였습니다.");
                    window.location.href = "basket.do";
                } else {
                    alert("선택한 상품의 삭제를 실패하였습니다.");
                }
            },
            error: function(error) {
                alert("ajax 에러 발생");
            }
        });//end of ajax
    });
		
    </script>         
</html>
