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

<form name="fileForm" action="mypage_review_write_process.do" method="post" enctype="multipart/form-data">
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
        <button>전송</button>        
    
        

<!-- 
<div class="image-container">
    <img style="width: 150px;" id="preview-image" src="https://dummyimage.com/500x500/ffffff/000000.png&text=preview+image">
    <input style="display: block; float:left;" type="file" id="input-image" name="attachedFile">
</div>

 -->

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
	
	
	
	
	
	
	
	
	
	
	$("#XXXmypage_review_write_process.do").click(function(){
        //선택된 체크박스 담을 변수 설정
        var selectedValues = [];
        
        //체크된 체크박스의 value를 넣음
        $(".checkboxes:checked").each(function() {
            selectedValues.push($(this).val());
        });
        
        // 체크된 항목이 없을 경우 알림을 띄우고 함수를 종료
        if (selectedValues.length === 0) {
            alert("상품을 선택해 주세요.");
            return;
        }
        
        $.ajax({
            type: "post",
            url: "basket_delete_multiple.do",
            data: { "basket_idxs": selectedValues},
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
