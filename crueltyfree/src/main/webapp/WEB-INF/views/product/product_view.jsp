<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>      
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${productVo.product_name} | CrueltyFree</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>

function getParameterValue(parameterName) {
    const queryString = window.location.search;
    const urlParams = new URLSearchParams(queryString);

    if (urlParams.has(parameterName)) {
        return urlParams.get(parameterName);
    }

    return null; // 파라미터가 없으면 null 반환
}

function pageNav(prdNum, pageNum, pageBlock, sortOrder, photoReview, textReview) { 
	// 클래스 정보 추출
	var productInfoClass = $("#product_info").attr("class");
    var buyInfoClass = $("#buy_info").attr("class");
    var reviewInfoClass = $("#review_info").attr("class");
    var qnaInfoClass = $("#qna_info").attr("class"); 
    
    var prdContentClass = $("#prd_content_box").attr("class"); 
	var buyContentClass = $("#buy_content_box").attr("class"); 
	var reviewContentClass = $("#review_content_box").attr("class"); 
	var qnaContentClass = $("#qna_content_box").attr("class"); 
	
	var insertSortOrder = "";
	const paramSortOrder = getParameterValue("sortOrder"); //url에서 파라미터값 가져오기
	
	if (sortOrder === 'empty') {
		if(paramSortOrder === null){//조건 아에 안넣은 초기상황
			insertSortOrder = 'date';			
		}else{//기존에 있던 조건상황(url파라미터)
			insertSortOrder = paramSortOrder;
		}
	}else{
		insertSortOrder = sortOrder;
	}
	
	var insertPhotoReview = "";	
	const paramPhotoReview = getParameterValue("photoReview");
	
	if (photoReview === 'empty') {
		if(paramPhotoReview === null){
			insertPhotoReview = 'ok';
		}else{
			insertPhotoReview = paramPhotoReview;
		}
	}else{
		insertPhotoReview = photoReview;
	}
	
	var insertTextReview = "";
	const paramTextReview = getParameterValue("textReview");
	
	if (textReview === 'empty') {
		if(paramTextReview === null){
			insertTextReview = 'ok';
		}else{
			insertTextReview = paramTextReview;
		}
	}else{
		insertTextReview = textReview;
	}
	
    // 현재 스크롤 위치
	var scrollY = window.scrollY || window.pageYOffset;
    
    
    
	// 새 URL 구성
    var newURL = "product_view.do" + 
            "?prdNum=" + prdNum +
            "&pageNum=" + pageNum +
            "&pageBlock=" + pageBlock +
            "&scrollY=" + scrollY +
            "&productInfoClass=" + productInfoClass +
            "&buyInfoClass=" + buyInfoClass +
            "&reviewInfoClass=" + reviewInfoClass +
            "&qnaInfoClass=" + qnaInfoClass +
            "&prdContentClass=" + prdContentClass +
            "&buyContentClass=" + buyContentClass +
            "&reviewContentClass=" + reviewContentClass +
            "&qnaContentClass=" + qnaContentClass +
            "&qnaContentClass=" + qnaContentClass +
            "&sortOrder=" + insertSortOrder +
            "&photoReview=" + insertPhotoReview +
            "&textReview=" + insertTextReview;
    
    
    
    // URL로 이동        
    window.location.href = newURL;
}

$(function(){	
	
	$("#align_photo_check").click(function(){
	    if ($(this).prop("checked")) { // photo 체크 상태일 때
	        var prdNum = getParameterValue("prdNum");	    
	        var pageNum = getParameterValue("pageNum");
	        if (pageNum == null) {
	            pageNum = 1; 
	        }
	        var pageBlock = getParameterValue("pageBlock");
	        if (pageBlock == null) {
	        	pageBlock = 1;
	        }
	        var sortOrder = getParameterValue("sortOrder");
	        if (sortOrder == null) {
	        	sortOrder = 'date';
	        }
	        if($("#align_text_check").prop("checked")){ //photo:체크 text:체크
		        pageNav(prdNum, pageNum, pageBlock, sortOrder, 'ok', 'ok');	        	
	        }else{//photo:체크 text:언체크
	        	pageNav(prdNum, pageNum, pageBlock, sortOrder, 'ok', 'fail');
	        }
	    } else { // 체크가 해제되었을 때
	        var prdNum = getParameterValue("prdNum");	    
	        var pageNum = getParameterValue("pageNum");
	        if (pageNum == null) {
	            pageNum = 1; 
	        }
	        var pageBlock = getParameterValue("pageBlock");
	        if (pageBlock == null) {
	        	pageBlock = 1;
	        }
	        var sortOrder = getParameterValue("sortOrder");
	        if (sortOrder == null) {
	        	sortOrder = 'date';
	        }
	        if($("#align_text_check").prop("checked")){ //photo: 언체크 text:체크
		        pageNav(prdNum, pageNum, pageBlock, sortOrder, 'fail', 'ok');	        	
	        }else{//photo:언체크 text:언체크
	        	pageNav(prdNum, pageNum, pageBlock, sortOrder, 'fail', 'fail');
	        }
	    }
	});
	
	$("#align_text_check").click(function(){
	    if ($(this).prop("checked")) { // text 체크 상태일 때
	        var prdNum = getParameterValue("prdNum");	    
	        var pageNum = getParameterValue("pageNum");
	        if (pageNum == null) {
	            pageNum = 1; 
	        }
	        var pageBlock = getParameterValue("pageBlock");
	        if (pageBlock == null) {
	        	pageBlock = 1;
	        }
	        var sortOrder = getParameterValue("sortOrder");
	        if (sortOrder == null) {
	        	sortOrder = 'date';
	        }
	        if($("#align_photo_check").prop("checked")){ //photo:체크 text:체크
		        pageNav(prdNum, pageNum, pageBlock, sortOrder, 'ok', 'ok');	        	
	        }else{//photo:언체크 text:체크
	        	pageNav(prdNum, pageNum, pageBlock, sortOrder, 'fail', 'ok');
	        }
	    } else { // 체크가 해제되었을 때
	        var prdNum = getParameterValue("prdNum");	    
	        var pageNum = getParameterValue("pageNum");
	        if (pageNum == null) {
	            pageNum = 1; 
	        }
	        var pageBlock = getParameterValue("pageBlock");
	        if (pageBlock == null) {
	        	pageBlock = 1;
	        }
	        var sortOrder = getParameterValue("sortOrder");
	        if (sortOrder == null) {
	        	sortOrder = 'date';
	        }
	        if($("#align_photo_check").prop("checked")){ //photo: 체크 text:언체크
		        pageNav(prdNum, pageNum, pageBlock, sortOrder, 'ok', 'fail');	        	
	        }else{//photo:언체크 text:언체크
	        	pageNav(prdNum, pageNum, pageBlock, sortOrder, 'fail', 'fail');
	        }
	    }
	});
	
    // GET 파라미터 추출
    var urlParams = new URLSearchParams(window.location.search);
    var scrollY = getParameterValue("scrollY");
    
    // 스크롤 위치로 이동
    if (scrollY !== null) {
        $(window).scrollTop(parseInt(scrollY));
    }
    
    // GET 파라미터 추출
    var productInfoClass = getParameterValue("productInfoClass");
    var buyInfoClass = getParameterValue("buyInfoClass");
    var reviewInfoClass = getParameterValue("reviewInfoClass");
    var qnaInfoClass = getParameterValue("qnaInfoClass");
    var prdContentClass = getParameterValue("prdContentClass");
    var buyContentClass = getParameterValue("buyContentClass");
    var reviewContentClass = getParameterValue("reviewContentClass");
    var qnaContentClass = getParameterValue("qnaContentClass");
    var reviewContentClass = getParameterValue("reviewContentClass");
    var sortOrder = getParameterValue("sortOrder");
    var photoReview = getParameterValue("photoReview");
    var textReview = getParameterValue("textReview");
    
    // 클래스정보 세팅
	if (productInfoClass !== null) {
		$("#product_info").removeClass().addClass(productInfoClass);
    }
	if (buyInfoClass !== null) {
		$("#buy_info").removeClass().addClass(buyInfoClass);
    }
	if (reviewInfoClass !== null) {
		$("#review_info").removeClass().addClass(reviewInfoClass);
    }
	if (qnaInfoClass !== null) {
		$("#qna_info").removeClass().addClass(qnaInfoClass);
    }
	if (prdContentClass !== null) {
		$("#prd_content_box").removeClass().addClass(prdContentClass);
    }
	if (buyContentClass !== null) {
		$("#buy_content_box").removeClass().addClass(buyContentClass);
    }
	if (reviewContentClass !== null) {
		$("#review_content_box").removeClass().addClass(reviewContentClass);
    }
	if (qnaContentClass !== null) {
		$("#qna_content_box").removeClass().addClass(qnaContentClass);
    }
	if (sortOrder != null){
		if(sortOrder == "score"){			
			$("#align_new").removeClass();
			$("#align_score").addClass("bold");
		}else if(sortOrder == "recom"){
			$("#align_new").removeClass();
			$("#align_recom").addClass("bold");
		}
	}
	if (photoReview != null){
		if(photoReview == "ok"){
			$("#align_photo_check").prop("checked", true);			
		}else{
			$("#align_photo_check").prop("checked", false);
			$("#align_photo").removeClass();
		}
	}
	if (textReview != null){
		if(textReview == "ok"){
			$("#align_text_check").prop("checked", true);			
		}else{
			$("#align_text_check").prop("checked", false);
			$("#align_text").removeClass();
		}
	}
	//수량 + 클릭
	$("#prd_cart_plus_btn").click(function(){			
		//현재 상품의 count 값 가져오기
	    var currentValue = parseInt($("#prd_cart_cnt").val());
	    
		//현재상품 가격 가져오기
		var productPrice = parseInt($(".product_price").eq(0).val());
		
		if(currentValue >= ${productVo.product_capa}){
			alert("상품의 재고 수량이 "+${productVo.product_capa}+"개 남았습니다.");
		}else{
		    $("#prd_cart_cnt").val(currentValue + 1);
		    $("#cart_cnt").val(currentValue + 1);
		    
		    //가격 * 수량
		    var buyPrice = productPrice * (currentValue + 1);
		    $(".total_price").eq(0).text(buyPrice);	    
		    $(".total_price").eq(0).text(buyPrice.toLocaleString());
		    //hidden에 값지정
		    $(".buyPrice").eq(0).val(buyPrice);			
		}
		
	});	
	
	//장바구니 수량 - 클릭
	$("#prd_cart_minus_btn").click(function(){		
		//현재 상품의 count 값 가져오기		
	    var currentValue = parseInt($("#prd_cart_cnt").val());
		
	    if (currentValue > 1) {	    		    	
	    	//현재상품 가격 가져오기
			var productPrice = parseInt($(".product_price").eq(0).val());
			
			$("#prd_cart_cnt").val(currentValue - 1);
			$("#cart_cnt").val(currentValue - 1);
			
		    //가격 * 수량
		    var buyPrice = productPrice * (currentValue - 1);
		    $(".total_price").eq(0).text(buyPrice);
		    $(".total_price").eq(0).text(buyPrice.toLocaleString());
		    //hidden에 값지정
		    $(".buyPrice").eq(0).val(buyPrice);
	    } else {
	    	alert("수량은 1개 이상이여야 합니다.");
	    	$("#prd_cart_cnt").val(1);
	    }    
	});
	
	//장바구니 수량 직접 변경
	$("#prd_cart_cnt").change(function(){		
		//현재 상품의 count 값 가져오기		
	    var currentValue = parseInt($("#prd_cart_cnt").val());
		
	    if(currentValue >= ${productVo.product_capa}){
			alert("상품의 재고 수량이 "+${productVo.product_capa}+"개 남았습니다.");
			//현재상품 가격 가져오기
			var productPrice = parseInt($(".product_price").eq(0).val());
			
			//가격 * 수량
		    var buyPrice = productPrice * (${productVo.product_capa});
		    $(".total_price").eq(0).text(buyPrice);		    
		    $(".total_price").eq(0).text(buyPrice.toLocaleString());
		    //hidden에 값지정
		    $(".buyPrice").eq(0).val(buyPrice);
			
			$("#prd_cart_cnt").eq(0).val(${productVo.product_capa}).focus();		
			
		}else if (currentValue > 0) {	    
			$("#cart_cnt").val(currentValue);
			
	    	//현재상품 가격 가져오기
			var productPrice = parseInt($(".product_price").eq(0).val());
		    
		    //가격 * 수량
		    var buyPrice = productPrice * (currentValue);
		    $(".total_price").eq(0).text(buyPrice);		    
		    $(".total_price").eq(0).text(buyPrice.toLocaleString());
		    //hidden에 값지정
		    $(".buyPrice").eq(0).val(buyPrice);
	    } else {
	    	alert("수량은 1개 이상이여야 합니다.");
	    	$("#prd_cart_cnt").eq(0).val(1).focus();
	    }    
			
	});
	
	//상세보기탭 상품설명 클릭
	$("#product_info").click(function(){
		$(this).addClass("tap_open");
		$("#buy_info").removeClass("tap_open");
		$("#review_info").removeClass("tap_open");
		$("#qna_info").removeClass("tap_open");
		$("#prd_content_box").addClass("show");
		$("#buy_content_box").removeClass("show");
		$("#review_content_box").removeClass("show");
		$("#qna_content_box").removeClass("show");
	});
	//상세보기탭 구매정보 클릭
	$("#buy_info").click(function(){
		$(this).addClass("tap_open");
		$("#product_info").removeClass("tap_open");
		$("#review_info").removeClass("tap_open");
		$("#qna_info").removeClass("tap_open");
		$("#buy_content_box").addClass("show");
		$("#prd_content_box").removeClass("show");
		$("#review_content_box").removeClass("show");
		$("#qna_content_box").removeClass("show");
	});
	//상세보기탭 리뷰 클릭
	$("#review_info").click(function(){
		$(this).addClass("tap_open");
		$("#buy_info").removeClass("tap_open");
		$("#product_info").removeClass("tap_open");
		$("#qna_info").removeClass("tap_open");
		$("#review_content_box").addClass("show");
		$("#buy_content_box").removeClass("show");
		$("#prd_content_box").removeClass("show");
		$("#qna_content_box").removeClass("show");
		
		var prdNum = getParameterValue("prdNum");
		pageNav(prdNum, 1, 1, 'empty', 'empty', 'empty');
	});
	//상세보기탭 상품문의 클릭
	$("#qna_info").click(function(){
		$(this).addClass("tap_open");
		$("#buy_info").removeClass("tap_open");
		$("#review_info").removeClass("tap_open");
		$("#product_info").removeClass("tap_open");
		$("#qna_content_box").addClass("show");
		$("#buy_content_box").removeClass("show");
		$("#review_content_box").removeClass("show");
		$("#prd_content_box").removeClass("show");
		
		var prdNum = getParameterValue("prdNum");
		pageNav(prdNum, 1, 1, 'empty', 'empty', 'empty');
	});
	
	//상품문의 질문 클릭
	$(".qna_content").click(function(){
	    var index = $(".qna_content").index(this);
	    var targetDetail = $(".qna_detail_content").eq(index);
	    
	    $(".qna_detail_content").not(targetDetail).removeClass("show");
	    targetDetail.toggleClass("show");			
	});
	
	//장바구니 담기 스크립트
	// 비회원 식별값을 가져오는 함수
	function getGuestId() {
		let guestId = getCookie("guestId");
		if (!guestId) {
			// 쿠키에 비회원 식별값이 없으면 새로 생성하여 쿠키에 저장
			guestId = generateGuestId(10);
			document.cookie = "guestId=" + guestId + "; max-age=" + (60 * 60 * 24 * 7) + "; path=/";
		}
		return guestId;
	}

	// 쿠키 값을 가져오는 함수
	function getCookie(name) {
		const value = "; " + document.cookie;
		const parts = value.split("; " + name + "=");
		if (parts.length === 2) return parts.pop().split(";").shift();
	}

	// 비회원 식별값 생성 함수 (랜덤 문자열 생성)
	function generateGuestId(length) {
		const characters = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
		let result = '';
		for (let i = 0; i < length; i++) {
			result += characters.charAt(Math.floor(Math.random() * characters.length));
		}
		return result;
	}

	// 장바구니 담기 버튼 클릭 이벤트 처리
	$("#basket_btn").click(function() {
		// 비회원 식별값 가져오기
		const guestId = getGuestId();		
		
		//cart_cnt의 값 가져오기
	    var cart_cnt = parseInt($("#cart_cnt").val());
	  	//현재 product_idx의 값 가져오기
	    var product_idx = parseInt($("#product_idx").val());	  
		
	    $.ajax({
	        type: "post",
	        url: "basket_insert.do",
	        data: { "product_idx": product_idx,
	        		"prd_cart_cnt": cart_cnt },
	        success: function(data) {
	        	if (data == "success") {
	        		// 모달 열기
	        		//현재 index값의 modalContainer클래스에 hidden클래스 제거
	        		$(".modalContainer").eq(0).removeClass("hidden");
	            } else if(data == "fail"){
	            	alert("장바구니 담기 실패");
	            } else if(data == "soldout"){
	            	alert("현재 품절된 상품 입니다.");
	            } else{
	            	alert("장바구니에 담을 수 있는 남은 상품의 수는 "+data+"개 입니다.");
	            	$("#cart_cnt").focus();	            	
	            }
	        },
	        error: function(error) {
	        	alert("ajax 에러 발생");
	        }
	    });//end of ajax
	  	
	    
	});
	
	//장바구니 모달창 내부 닫기 버튼
	$(".modalCloseButton").each(function(index) {
	    $(this).click(function() {
	        var containerIndex = Math.floor(index / 2);
	        $(".inq_text").eq(containerIndex - 1).val("")
			$(".inq_text_count").eq(containerIndex - 1).text("0 / 250")	        
	        $(".modalContainer").eq(containerIndex).addClass("hidden");
	        
	    });
	});
	
	//상품문의 작성 버튼
	$("#prd_qna_write_btn").click(function(){
		if(${empty member}){//비회원의 경우 로그인 페이지로 이동
			alert("로그인한 회원만 문의를 작성할 수 있습니다.");
			window.location.href = "${pageContext.request.contextPath}/member/login.do";
		}else{
			$(".modalContainer").eq(1).removeClass("hidden");
		}		
	});
		
	//상품문의 작성 텍스트 수 세기
	var maxLength = 250;	
	$(".inq_text").each(function(index) {
		$(this).on("input", function() {
			var currentLength = $(this).val().length;
			var remainingLength = maxLength - currentLength;
			
			if (remainingLength < 0) {
	            var truncatedText = $(this).val().substring(0, maxLength);
	            $(this).val(truncatedText);
	
	            // alert 창 띄우기
	            alert("250자 이상 입력할 수 없습니다.");
	            currentLength = maxLength;
	        }
	
	        $(".inq_text_count").eq(index).text(currentLength + " / " + maxLength);
		});
	});
	
	//상품문의 등록버튼
	$(".writeButton").eq(0).click(function(){
		
		var contentLength = $(".inq_text").val().length;
		
		if(contentLength == 0){
			alert("문의 내용을 입력해주세요.");
			$(".inq_text").eq(0).focus();
		}else{
			document.inq_form.submit();			
		}
	});
	
	//상품문의 수정버튼 클릭
	$(".qna_update_btn").each(function(index) {
	    $(this).click(function() {
	    	var answer = $(".product_inq_answer").eq(index + 1).val();
	    	if(answer == null){
	    		alert("답변이 달린 문의글은 수정하실 수 없습니다.");
	    	}else{
		        $(".modalContainer").eq(index + 2).removeClass("hidden");
		        var inq_text = $(".product_inq_content").eq(index + 1).val();
		        
		        $(".inq_text").eq(index + 1).val(inq_text);
		        
		        var currentLength = inq_text.length;
		        $(".inq_text_count").eq(index + 1).text(currentLength + " / " + maxLength);	    		
	    	}
	    });
	});
		
	//모달창 내부 등록버튼 클릭
	$(".edit_updateButton").each(function(index) {
	    $(this).click(function() {	    	
	    	var contentLength = $(".inq_text").eq(index+1).val().length;
	    	
	    	if(contentLength == 0){
				alert("문의 내용을 입력해주세요.");
				$(".inq_text").eq(index+1).focus();
			}else{
				$(".edit_form").eq(index).submit();			
			}
	    	
	    });
	});
	
	//상품문의 삭제버튼 클릭
	$(".qna_delete_btn").each(function(index) {
	    $(this).click(function() {
	    	var result = confirm("문의 내용을 삭제하시겠습니까?");
	        if (result) {
	            $(".delete_form").eq(index).submit();
	        }		
	    });
	});	
	
	//좋아요 버튼 클릭
	var liked = false;
	
	if(${likeVo != null}){
		liked = true;
		$("#like_btn").val("♥");
        $("#like_btn").css("font-size", "48px");
	}

	$("#like_btn").click(function(){
		if(${empty member}){//비회원의 경우 로그인 페이지로 이동
			alert("로그인한 회원만 좋아요를 할 수 있습니다.");
			window.location.href = "${pageContext.request.contextPath}/member/login.do";			
		}else{
		    if (liked) {	    	
		    	var product_idx = ${productVo.product_idx};
		    	var member_idx = $("#like_member_idx").val();
			    $.ajax({
			        type: "post",
			        url: "like_delete.do",
			        data: { "product_idx": product_idx,
			        		"member_idx": member_idx },
			        success: function(data) {
			        	if(data == "success"){
			    	    	$(".likeContent").css("background-color", "#fff");
			    	    	$(".likeContent").css("border", "1px solid #7d99a4");
			    	    	$(".likeHeart").text("♡");
			    	    	$(".likeHeart").css("font-size", "36px");
			    	    	$(".likeHeart").css("color", "#7d99a4");
			    	    	$(".likeText").css("color", "#7d99a4");
			    	    	
			    	    	// 서서히 likeContainer 보여주기
			    	        $(".likeContainer").fadeIn();
	
			    	        // 2초 뒤에 likeContainer 다시 숨기기
			    	        setTimeout(function() {
			    	            $(".likeContainer").fadeOut();
			    	        }, 500);
			    	    	
			    	        $("#like_btn").val("♡");
			    	        $("#like_btn").css("font-size", "32px");
			    	        liked = false;		        		
			        	}else{
			        		alert("좋아요 삭제에 실패하였습니다.");
			        	}
			        },
			        error: function(error) {
			        	alert("ajax 에러 발생");
			        }
			    });//end of ajax	   	    	
		    } else {
		    	var product_idx = ${productVo.product_idx};
		    	var member_idx = $("#like_member_idx").val();
			    $.ajax({
			        type: "post",
			        url: "like_insert.do",
			        data: { "product_idx": product_idx,
			        		"member_idx": member_idx },
			        success: function(data) {
			        	if(data == "success"){
			    	    	$(".likeContent").css("background-color", "#7d99a4");
			    	    	$(".likeContent").css("border", "1px solid #7d99a4");
			    	    	$(".likeHeart").text("♥");
			    	    	$(".likeHeart").css("font-size", "36px");
			    	    	$(".likeHeart").css("color", "#fff");
			    	    	$(".likeText").css("color", "#fff");
			    	    	
			    	        // 서서히 likeContainer 보여주기
			    	        $(".likeContainer").fadeIn();
	
			    	        // 2초 뒤에 likeContainer 다시 숨기기
			    	        setTimeout(function() {
			    	            $(".likeContainer").fadeOut();
			    	        }, 500);
			    	    	
			    	        $("#like_btn").val("♥");
			    	        $("#like_btn").css("font-size", "48px");
			    	        liked = true;
			        	}else{
			        		alert("좋아요 등록에 실패하였습니다.");
			        	}
			        },
			        error: function(error) {
			        	alert("ajax 에러 발생");
			        }
			    });//end of ajax		
		    }//end of if(좋아요 클릭에 따른 등록/삭제)			
		}//end of if(로그인 유무에 따른 로그인창이동/좋아요 동작)		
	});//end of #like_btn 클릭
	
	//바로구매 클릭시
	$("#order_btn").click(function(){		
	 	// 폼 제출 (submit)
        document.basket_order_form.submit();
	});
	
	//추천 초기세팅
	var recomValues = []; // 결과를 저장할 배열
	$(".recom_recom_idx").each(function() {
	    var value = $(this).val(); // 클래스가 recom_recom_idx인 요소의 값

	    // 조건에 따라 'F' 또는 'T'로 변환하여 배열에 추가
	    var result = value === '0' ? 'T' : 'F';
	    recomValues.push(result);
	});
	
	//추천 클릭시
	$(".recom_btn").click(function(){
		var index = $(".recom_btn").index(this);
		var member_idx = $(".recom_member_idx").eq(index).val();
		var review_member_idx = $(".review_member_idx").eq(index).val();
		var review_idx = $(".recom_review_idx").eq(index).val();
		var recom_idx = $(".recom_recom_idx").eq(index).val();
		var recom_recom_count = parseInt($(".recom_recom_count").eq(index).val(), 10);
		
		var recom_plus = recom_recom_count + 1;
		var recom_minus = recom_recom_count - 1;
		
		var recom_change_elements = $(".recom_change").eq(index).attr("class");
		
		if(${empty member}){//비회원의 경우 로그인 페이지로 이동
			alert("로그인한 회원만 추천을 할 수 있습니다.");
			window.location.href = "${pageContext.request.contextPath}/member/login.do";			
		}else{
			if(member_idx == review_member_idx){
				alert("본인 리뷰에는 추천을 할 수 없습니다.");
			}else{
				if(recomValues[index] == 'T'){//추천하지않은 리뷰
					$.ajax({
				        type: "post",
				        url: "recom_insert.do",
				        data: { "review_idx": review_idx,
				        		"member_idx": member_idx },
				        success: function(data) {
				        	if(data == "success"){
				        		$(".recom_change").eq(index).css("border", "2px solid #7d99a4");
				        		$(".recom_change").eq(index).css("color", "#7d99a4");
				        		$(".recom_change").eq(index).css("background-color", "#eef3f5");
				        		$(".recom_change").eq(index).css("font-weight", "bold");
				        		if(recom_change_elements === "recom_num_o recom_change"){
				        			$(".recom_target").eq(index).text(recom_recom_count);
				        		}else{
				        			$(".recom_target").eq(index).text(recom_plus);
				        		}
				        		recomValues[index] = 'F';
				        	}else{
				        		alert("리뷰 추천 등록에 실패하였습니다.");
				        	}
				        },
				        error: function(error) {
				        	alert("ajax 에러 발생");
				        }
				    });//end of ajax		
				}else{//추천한 리뷰
					$.ajax({
				        type: "post",
				        url: "recom_delete.do",
				        data: { "review_idx": review_idx,
				        		"member_idx": member_idx },
				        success: function(data) {
				        	if(data == "success"){
				        		$(".recom_change").eq(index).css("border", "1px solid #4a4a4a");
				        		$(".recom_change").eq(index).css("color", "#4a4a4a");
				        		$(".recom_change").eq(index).css("background-color", "#fff");
				        		$(".recom_change").eq(index).css("font-weight", "normal");
								if(recom_change_elements === "recom_num_o recom_change"){
									$(".recom_target").eq(index).text(recom_minus);
				        		}else{
				        			$(".recom_target").eq(index).text(recom_recom_count);
				        		}
				        		recomValues[index] = 'T';				        	
				        	}else{
				        		alert("리뷰 추천 삭제에 실패하였습니다.");
				        	}
				        },
				        error: function(error) {
				        	alert("ajax 에러 발생");
				        }
				    });//end of ajax	
				}
			}//본인리뷰 추천막기						
		}//로그인한 회원만 추천하기
		
	});
});
</script>
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
     .prd_detail_box{
         display: block; width: 1020px; height: auto; margin-top: 40px; padding-top: 35px; border-top: 1px solid #4a4a4a;
     }
     .left_area{
         display: block; float: left; width: 510px; height: auto;
     }
     .right_area{
         display: block; float: right; width: 450px; height: auto;
     }
     .clean{clear: both;}

     .prd_img img{ width: 510px; height: 510px;}
     .prd_review_score_avg{width: 480px; height: 33px; padding: 30px 15px 0 15px; font-size: 18px;}        
     .txt_blue{color: #7d99a4;}
     .prd_info{width: 450px; height: auto;}
     .prd_seller{color: #4a4a4a; font-weight: bold;}
     .prd_name{margin-top: 10px; font-size: 26px; line-height: 34px;}
     .prd_price{margin: 15px 0; color: #7d99a4; font-size: 28px; font-weight: bold;}
     .prd_delivery_info{width: 450px; height: auto; padding: 15px 0; border-bottom: 1px solid #4a4a4a;}
     .prd_delivery_title{width: 450px; height: 30px; font-weight: bold; font-size: 18px;}
     .prd_delivery_box{display: flex; flex-wrap: wrap; width: 450px; height: 40px;}
     .delivery_title{display: block; width: 80px; height: 40px; color: #4a4a4a; font-weight: bold;} 
     .delivery_content{display: block;  width: 360px; height: 40px; color: #4a4a4a; padding-left: 10px;}
     .prd_cnt_box{display: flex; flex-wrap: wrap; width: 408px; height: 30px; line-height: 30px; margin-top: 20px; padding: 15px 20px; background-color: #eef3f5; border: 1px solid #4a4a4a;}
     .prd_cnt_title{display: flex; font-size: 14px; font-weight: bold; color: #4a4a4a;}
     .prd_cnt_area{display: flex; align-items: center; padding-left: 230px; width: 120px; height: 30px;}
     #prd_cart_minus_btn, #prd_cart_plus_btn{width: 28px; height: 28px; color: #4a4a4a; font-weight: bold; font-size: 14px;}
     #prd_cart_minus_btn{border-left: 1px solid #4a4a4a; border-right: 0; border-top: 1px solid #4a4a4a; border-bottom: 1px solid #4a4a4a; border-radius: 5px 0 0 5px;}
     #prd_cart_plus_btn{border-left: 0; border-right: 1px solid #4a4a4a; border-top: 1px solid #4a4a4a; border-bottom: 1px solid #4a4a4a; border-radius: 0 5px 5px 0;}
     #prd_cart_cnt{width: 40px; height: 26px; border-radius: 0%; border-left: 0; border-right: 0; border-top: 1px solid #4a4a4a; border-bottom: 1px solid #4a4a4a; text-align: center;}
     #prd_cart_cnt:focus{outline: none;}
     .prd_total_price{width: 450px; height: 40px; padding-top: 18px; border-bottom: 2px solid #7d99a4; margin-top: 10px;}
     .prd_total_price_title{font-size: 22px; font-weight: bold;}
     .total_price{font-size: 22px;}

     .prd_btn_area{display: flex; justify-content: space-between; width: 450px; height: 65px; margin-top: 25px;}
     #basket_btn{width: 177px; height: 65px; border: 1px solid #7d99a4; background-color: #fff; color: #7d99a4; font-weight: bold; font-size: 20px;}
     #order_btn{width: 177px; height: 65px; border: 1px solid #7d99a4; background-color: #7d99a4; color: #fff; font-weight: bold; font-size: 20px;}
     #like_btn{width: 74px; height: 65px; border: 1px solid #4a4a4a; background-color: #fff; color: #7d99a4; font-weight: bold; font-size: 32px; line-height: 35px;}
  
     .prd_detail_tab{width: 1020px; height: 51px; margin-top: 40px; border-bottom: 1px solid #7d99a4;}
    
     
     #product_info, #buy_info, #review_info, #qna_info{
         width: 254px;
         float: left;
         color: #4a4a4a;
         font-size: 14px; font-weight: bold;
         line-height: 51px;
         text-align: center;            
     }
     aside{
         background-color: #eef3f5;
         cursor: pointer;
     }
     .tap_open{
         width: 251px; height:50px;
         border-top: 2px solid #7d99a4;
         border-left: 2px solid #7d99a4;
         border-right: 2px solid #7d99a4;
         border-bottom: 0px;
         background-color: #fff;
     }

     .prd_detail_content{width: 1020px; height: auto; padding-top: 40px; margin-bottom: 20px;}
     
     section{display: none; width: 1020px; height: auto;}
     .show{display: flex; flex-wrap: wrap;}

     .category_align_box{display: flex; width: 1020px; height: 53px; padding-top: 21px; border-bottom: 5px solid #7d99a4; border-top: 1px solid #a4a4a4;}
     .align_sort{width: 560px; height: 35px; display: flex; align-items: center; }
     #align_new,#align_score,#align_recom{width: 86px; height: 20px; padding: 0 20px; text-align: center; margin-top: auto; cursor: pointer;}
     #align_score{border-left: 1px solid #4a4a4a; border-right: 1px solid #4a4a4a;}
     .bold{font-weight: bold;}
     .align_reivew{width: 460px; height: 35px; display: flex;}
     #align_space,#align_text, #align_photo{width: 140px; height: 16px; padding: 0 5px; text-align: center;  margin-top: auto;}
     #align_photo_check, #align_text_check{width: 16px; height: 16px;}

     .review_list{margin-top: 40px;}
     .review_list, .tb_review_list{width: 1020px; height: auto;}
     .tb_review_list{border-collapse: collapse;}
     .td_review_title, .td_review_content{border-bottom: 1px solid #a4a4a4; padding: 20px;}
     .td_review_title{width: 225px; height: auto; font-weight: bold; padding-left: 30px; vertical-align: top;}
     .td_review_content, .review_content{width: 765px; height: auto;}
     .td_review_empty{width: 1020px; height: auto; text-align:center; font-size:24px; color: #4a4a4a;}
     .score_area{display: flex; flex-wrap: wrap; width: 765px; height: 22px; margin-bottom: 25px; justify-items: center;}
     .review_score{width: auto; height: 20px;}
     .review_regDate{width: 85px; height: 20px; margin-left: 15px; color: #a4a4a4; font-weight: bold;}
     .txt_inner{width: 765px; height: auto;  margin-bottom: 15px;}
     .recom_area{display: flex; flex-wrap: wrap; width: 765px; height: 32px; margin-top: 20px;}
     .recom_btn{border: 0px; background-color: #fff; font-size: 16px;}
     .recom_num_x{
         height: 28px;
         margin-left: 14px; 
         padding: 3px 25px;
         color: #4a4a4a;
         border: 1px solid #4a4a4a;
         border-radius: 14px;            
     }
     .recom_num_o{
         height: 28px;
         margin-left: 14px; 
         padding: 3px 25px;
         color: #7d99a4;
         font-weight: bold;
         border: 2px solid #7d99a4;
         background-color: #eef3f5;
         border-radius: 14px;            
     }    

     .pageing{width: 1020px; height: 30px; padding-top: 30px; margin-bottom: 20px; text-align: center;}
     
     .prd_qna_title{width: 1000px; height: 34px; padding-right: 20px; padding-bottom: 20px; border-bottom: 1px solid #4a4a4a; text-align: right;}
     #prd_qna_write_btn{width: 120px; height: 34px; border: 0; background-color: #7d99a4; color: #fff; font-size: 16px; font-weight: bold; border-radius: 5px;}
     .prd_qna_list{width: 1020px; height: auto;}
     .qna_title_box{display: flex; flex-wrap:wrap; width: 1020px; height: 80px; line-height: 80px; border-bottom: 1px solid #4a4a4a;}
     .qna_none_box{display: flex; flex-wrap:wrap; width: 1020px; height: 80px; line-height: 80px; border-bottom: 1px solid #4a4a4a; color:#4a4a4a; font-size: 24px; justify-content: center;}
     .qna_status{display: inline-block; width: 70px; height: 22px; line-height: 20px; font-size: 12px; color: #4a4a4a; background-color: #eef3f5; border-radius: 11px; text-align: center; vertical-align: middle;}
     .complete{display: inline-block; width: 70px; height: 22px; line-height: 20px; font-size: 12px; color: #fff; background-color: #7d99a4; border-radius: 11px; text-align: center; vertical-align: middle;}
     .qna_content{display: inline-block; width: 665px; height: 85px; padding-left: 10px; color: #4a4a4a; overflow: hidden; white-space: nowrap; text-overflow: ellipsis; cursor: pointer;}        
     .member_nickname{display: inline-block; width: 170px; height: 85px; color: #4a4a4a; text-align: center;}
     .product_inq_regDate{display: inline-block; width: 85px; height: 85px; color: #4a4a4a;text-align: center;}
     .question_title{display: inline-block; width: 110px; padding-left: 60px; font-size: 32px; color: #a4a4a4; font-weight: bold; vertical-align: top;}
     .answer_title{display: inline-block; width: 110px; padding-left: 60px; font-size: 32px; color: #7d99a4; font-weight: bold; vertical-align: top;}
     .question_content,.answer_content{display: inline-block; width: 765px; height: auto; font-size: 14px; color: #4a4a4a;}
     .qna_question_box, .qna_answer_box{width: 1020px; padding: 20px 0; background-color: #eef3f5;}
     .qna_answer_box{border-bottom: 1px solid #4a4a4a;} 
     .answer_content{padding: 20px 0; border-top: 1px solid #4a4a4a;}
     
     .nickname_txt{height: 20px; line-height: 60px;}
     .qna_update_btn, .qna_delete_btn{width: 40px; height: 28px; border: 0; background-color: #7d99a4; color: #fff; border-radius: 5px; cursor: pointer;}
     
     .sub_title {
         width: 1020px;
         margin: 20px auto 10px;
         color: #7d99a4;
         font-size: 20px;
         font-weight: bold;
     }
     #tb_product_buy_info{border-collapse: collapse;}
     #product_buy_info{margin-bottom: 40px;}
     #product_buy_info, #tb_product_buy_info{width: 1020px; height: auto;}
     .td_buy_info_title{width: 242px; height: 28px; padding: 15px 0 15px 18px; font-size: 15px;}
     .td_buy_info_content{width: 704px; height: 28x; padding: 15px 20px 15px 36px; font-size: 14px; color: #4a4a4a;}
     .top{border-top: 2px solid #4a4a4a;}
     .bottom{border-bottom: 1px solid #4a4a4a;}
     .title{background-color: #eef3f5; font-weight: bold; font-size: 15px;}
     
     #prd_content{margin: 0 auto;}
     #prd_content img{width: 1020px;}
     .total_price{font-weight: bold;}
     .total_price_right{float: right;}
     
	 .modalContainer {
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
		
	 .modalContent {
		position: absolute;
	 	background-color: #ffffff;
	 	border-radius: 5px;
	 	width: 450px;
	 	height: 250px;
	 	padding: 15px;
	 }
	 .likeContainer {
	 	width: 100%;
	 	height: 100%;
	 	position: fixed;
	 	top: 300px;
	 	left: 500px;
	 	display: flex;
	 	justify-content: center;
	 	align-items: center;
	 }
	 .likeContent {
		position: absolute;
	 	background-color: #7d99a4;
	 	border-radius: 100%;
	 	width: 200px;
	 	height: 200px;
	 	padding: 15px;
	 	text-align: center;
	 	line-height: 50px;
	 }
	 .likeHeart{
	 	width: 200px;
	 	margin-top: 50px;
	 	font-size: 36px;
	 	color: #fff;
	 }
	 .likeText{
	 	width: 200px;
	 	font-size: 24px;
	 	font-weight: bold;
	 	color: #fff;
	 }	 
	 .hidden {
	 	display: none;
	 }
	.modal_title{width:450px; font-size: 24px; font-weight: bold; margin-bottom: 10px;}
	.modal_content{width:450px; height:130px; line-height:130px; color:#a4a4a4; font-weight: bold; text-align: center;}
	.modal_hr{width:450px; height: 5px; background-color: #7d99a4; margin-bottom: 10px;}
	.modal_btn{width:450px; display: flex; justify-content: center;}
	.modal_title_text{display:inline-block;}
	.modal_title_right{float:right;}
	.close{border:0;color:#4a4a4a; font-weight: bold; font-size: 24px; background-color: #fff;}	     
	.shoppingButton{width:130px; height:40px; margin-right: 10px; border-radius: 2px; background-color: #fff; color:#7d99a4; font-weight: bold; border: 1px solid #7d99a4}
	.basketPageButton{width:130px; height:40px; margin-left: 10px; border-radius: 2px; background-color: #7d99a4; color:#fff; font-weight: bold; border: 1px solid #7d99a4}
	
	.modalInqContent {
		position: absolute;
	 	background-color: #ffffff;
	 	border-radius: 5px;
	 	width: 550px;
	 	height: 500px;
	 	padding: 15px;
	 }
	 .modal_inq_title{width:550px; font-size: 24px; font-weight: bold; margin-bottom: 10px;}
	 .modal_inq_content{width:550px; height:auto;}
	 .modal_inq_hr{width:550px; height: 5px; background-color: #7d99a4; margin-bottom: 20px;}
	 .inq_text_box{width:530px; height: 280px; margin-top: 10px; margin-bottom: 20px; border-radius: 5px; border: 1px solid #a4a4a4; padding: 10px;}	
	 .inq_text{width:510px; height: 180px; padding: 10px; border: none; resize: none;}
	 .inq_text:focus{outline: none;}
	 .inq_text_count{width:510px; height:50px; line-height:50px; border-top: 1px solid #a4a4a4; padding: 10px;}     
	 .modal_inq_btn{width:550px; display: flex; justify-content: center; border-top: 1px solid #a4a4a4; padding-top: 20px; padding-bottom: 20px;}
	 .cancelButton, .edit_cancelButton{width:130px; height:40px; margin-right: 10px; border-radius: 2px; background-color: #fff; color:#7d99a4; font-weight: bold; border: 1px solid #7d99a4}
	 .writeButton, .edit_updateButton{width:130px; height:40px; margin-left: 10px; border-radius: 2px; background-color: #7d99a4; color:#fff; font-weight: bold; border: 1px solid #7d99a4}
	 .sortClass{color:black}
	 #soldOutNotice{color:rgb(216, 98, 98); font-size: 24px;}
</style>
</head>
<body>
	<header>	
		<jsp:include page="../main/header.jsp"/>	
	</header>
	
    <!-- 상품 이미지 및 정보,장바구니,구매하기 창 -->
    <div class="prd_detail_box">
        <div class="left_area">
            <!-- 상품 대표 이미지 -->
            <div class="prd_img">
                <img src="../resources/uploads/${fileVoList[0].saveFile}" alt="상품 메인 이미지">
            </div>
            
            <div class="prd_review_score_avg">
                <b>고객리뷰 <span class="txt_blue">${reviewScoreAvg}</span></b>&nbsp;&nbsp; 
                <span class="review_score">
               	<c:choose>
               	<c:when test="${reviewScoreAvg < 1}">
               	<img src="../resources/img/star_empty.png" width="20px" height="20px">
               	<img src="../resources/img/star_empty.png" width="20px" height="20px">
               	<img src="../resources/img/star_empty.png" width="20px" height="20px">
               	<img src="../resources/img/star_empty.png" width="20px" height="20px">
               	<img src="../resources/img/star_empty.png" width="20px" height="20px">
               	</c:when>
               	<c:when test="${reviewScoreAvg < 2}">
               	<img src="../resources/img/star_full.png" width="20px" height="20px">
               	<img src="../resources/img/star_empty.png" width="20px" height="20px">
               	<img src="../resources/img/star_empty.png" width="20px" height="20px">
               	<img src="../resources/img/star_empty.png" width="20px" height="20px">
               	<img src="../resources/img/star_empty.png" width="20px" height="20px">
               	</c:when>
               	<c:when test="${reviewScoreAvg < 3}">
               	<img src="../resources/img/star_full.png" width="20px" height="20px">
               	<img src="../resources/img/star_full.png" width="20px" height="20px">
               	<img src="../resources/img/star_empty.png" width="20px" height="20px">
               	<img src="../resources/img/star_empty.png" width="20px" height="20px">
               	<img src="../resources/img/star_empty.png" width="20px" height="20px">
               	</c:when>
               	<c:when test="${reviewScoreAvg < 4}">
               	<img src="../resources/img/star_full.png" width="20px" height="20px">
               	<img src="../resources/img/star_full.png" width="20px" height="20px">
               	<img src="../resources/img/star_full.png" width="20px" height="20px">
               	<img src="../resources/img/star_empty.png" width="20px" height="20px">
               	<img src="../resources/img/star_empty.png" width="20px" height="20px">
               	</c:when>
               	<c:when test="${reviewScoreAvg >= 4 && reviewScoreAvg < 5}">
               	<img src="../resources/img/star_full.png" width="20px" height="20px">
               	<img src="../resources/img/star_full.png" width="20px" height="20px">
               	<img src="../resources/img/star_full.png" width="20px" height="20px">
               	<img src="../resources/img/star_full.png" width="20px" height="20px">
               	<img src="../resources/img/star_empty.png" width="20px" height="20px">
               	</c:when>               	
               	<c:otherwise>
               	<img src="../resources/img/star_full.png" width="20px" height="20px">
               	<img src="../resources/img/star_full.png" width="20px" height="20px">
               	<img src="../resources/img/star_full.png" width="20px" height="20px">
               	<img src="../resources/img/star_full.png" width="20px" height="20px">
               	<img src="../resources/img/star_full.png" width="20px" height="20px">  
               	</c:otherwise>
               	</c:choose>                                        	                                          
               </span>
                (${productReviewRows}건)
            </div>
        </div>
        <div class="right_area">
            <div class="prd_info">
                <p class="prd_seller">${productVo.member_nickname}</p>
                <p class="prd_name">${productVo.product_name}</p>
                <p class="prd_price">
                <input type="hidden" class="product_price" value="${productVo.product_price}"></input>
                <span class="prdPrice">
                <c:choose>
                <c:when test="${productVo.product_capa == 0}">
                <span id="soldOutNotice">현재 상품이 일시 품절 되었습니다!</span>
                </c:when>
                <c:otherwise>
                <fmt:formatNumber value="${productVo.product_price}" pattern="###,###" /></span>원
                </c:otherwise>
                </c:choose>          
                </p>      
                <div class="prd_delivery_info">
                    <p class="prd_delivery_title">배송정보</p>
                    <div class="prd_delivery_box">
                        <span class="delivery_title">일반배송 |</span>
                        <span class="delivery_content">
                        <c:choose>
                        	<c:when test="${productVo.delivery_company == 0}">
                        		배송비 무료
                        	</c:when>
                        	<c:otherwise>
                        		<fmt:formatNumber value="${productVo.delivery_company}" pattern="###,###" />원                        		
                        	</c:otherwise>
                        </c:choose>                        
                        <br>평균 3일 이내 배송</span>                        
                    </div>                   
                </div>
                <div class="prd_cnt_box">
                    <div class="prd_cnt_title">구매수량</div>
                    <div class="prd_cnt_area">
                        <input type="button" name="prd_cart_minus_btn" id="prd_cart_minus_btn" value="-">
                        <input type="text" name="prd_cart_cnt" id="prd_cart_cnt" value="1" oninput="this.value = this.value.replace(/[^0-9]/g,'').replace(/(\..*)\./g, '$1');">
                        <input type="button" name="prd_cart_plus_btn" id="prd_cart_plus_btn"  value="+">
                        
                        <!-- 바로구매 폼전송 -->     
					    <form name="basket_order_form" action="${pageContext.request.contextPath}/purchase/order.do" method="post">
	                        <input type="hidden" id="product_idx" name="product_idx" value="${productVo.product_idx}">
	                        <input type="hidden" id="cart_cnt" name="cart_cnt" value="1">
					    </form>          
                    </div>
                </div>
                <div class="prd_total_price txt_blue ">
                    <span class="prd_total_price_title">상품금액 합계</span>
                    <div class="total_price_right">
                    <span class="total_price">
                    <fmt:formatNumber value="${productVo.product_price}" pattern="###,###" /></span>원</div>                     
                    <input type="hidden" class="buyPrice" value="${productVo.product_price}">                  
                </div>

                <div class="prd_btn_area">
                	<!-- 장바구니 담기 완료시 모달창 -->
                	<div class="modalContainer hidden">
					<div class="modalContent">
						<div class="modal_title">
							<div class="modal_title_text">선택완료</div>
							<div class="modal_title_right"><button class="modalCloseButton close">X</button></div>							
						</div>
						<div class="modal_hr">
						</div>
						<div class="modal_content">
							장바구니에 추가되었습니다.
						</div>
						<div class="modal_btn">
						    <button class="modalCloseButton shoppingButton">쇼핑 계속하기</button>
						    <button class="basketPageButton" onclick="location.href='${pageContext.request.contextPath}/purchase/basket.do';">
						    장바구니 확인</button>
						</div>
				    </div>				    
					</div>
                    <input type="button" id="basket_btn" value="장바구니">
                    <input type="button" id="order_btn" value="바로구매">
                    <input type="button" id="like_btn" value="♡">
                    <input type="hidden" id="like_member_idx" value="${member.member_idx}">
                    <!-- 좋아요 누를시 나타나는 창 -->
                    <div class="likeContainer hidden">
						<div class="likeContent">
							<div class="likeHeart">♡</div>
							<div class="likeText">좋아요</div>
					    </div>				    
					</div>
                </div>
            </div>
        </div>

        <div class="clean"></div>

        <!-- 상품설명/구매정보/리뷰/문의 탭 -->
        <div class="prd_detail_tab">
            <aside id="product_info" class="tap_open">상품설명</aside>
            <aside id="buy_info" class="">구매정보</aside>
            <aside id="review_info" class="">리뷰 (${productReviewRows})</aside>
            <aside id="qna_info" class="">상품문의 (${productInqRows})</aside>
        </div>

        <div class="prd_detail_content">
            <!-- 상품설명 -->
            <section id="prd_content_box" class="show">
            	<div id="prd_content">	                
	                <c:forEach items="${fileVoList}" var="fileVo" varStatus="status">
					    <c:if test="${status.index != 0}">
					        <img src="../resources/uploads/${fileVo.saveFile}" alt="상품 설명 이미지">					        
					    </c:if>
					</c:forEach>
            	</div>
            </section>
             <!-- 구매정보 -->
            <section id="buy_content_box" class="">
                <h3 class="sub_title">상품정보 제공고시</h3>
                <div id="product_buy_info">
                    <!-- content값으로 상품정보 -->
                    <table id="tb_product_buy_info">  
                        <tr>
                            <td class="td_buy_info_title top bottom title">내용물의 용량 또는 중량</td>
                            <td class="td_buy_info_content top bottom">
                                ${productInfoVo.product_info_amount}
                            </td>
                        </tr>
                        <tr>
                            <td class="td_buy_info_title bottom title">사용방법</td>
                            <td class="td_buy_info_content bottom">
                                ${productInfoVo.product_info_useMethod}
                            </td>
                        </tr>
                        <tr>
                            <td class="td_buy_info_title bottom title">제조국</td>
                            <td class="td_buy_info_content bottom">
                                ${productInfoVo.product_info_maker}
                            </td>
                        </tr>
                        <tr>
                            <td class="td_buy_info_title bottom title">책임자 전화번호</td>
                            <td class="td_buy_info_content bottom">
                                ${productInfoVo.product_info_handphone}
                            </td>
                        </tr>
                    </table>                    
                </div>

                <h3 class="sub_title">배송안내</h3>
                <div id="product_buy_info">
                    <!-- content값으로 상품정보 -->
                    <table id="tb_product_buy_info">  
                        <tr>
                            <td class="td_buy_info_title top bottom title">배송비/배송가능일</td>
                            <td class="td_buy_info_content top bottom">
                                <b>[일반 배송]</b><br>
                                <b>배송지역</b> : 전국<br>
                                <!-- 배송비는 해당 상품에 대한 값 -->
                                <b>배송비</b> : ${productVo.delivery_company}원<br>
                                도서, 산간, 오지 일부 지역은 배송비가 추가될 수 있습니다.<br>
                                배송가능일 : 3일<br>
                                배송가능일이란 본 상품을 주문하신 고객님들께 상품 배송이 가능한 기간을 의미합니다. 단, 연휴 및 공휴일은 기간 계산시 제외하며 현금 주문일 경우 입금일 기준 입니다.<br>
                                예약 상품의 경우 예약된 날짜에 출고되며, 상품의 입고가 빠르게 진행된 경우 예약일 보다 일찍 배송될 수 있습니다.<br>
                            </td>
                        </tr>                      
                    </table>                    
                </div>

                <h3 class="sub_title">교환/반품/환불 안내</h3>
                <div id="product_buy_info">
                    <!-- content값으로 상품정보 -->
                    <table id="tb_product_buy_info">  
                        <tr>
                            <td class="td_buy_info_title top bottom title">교환/반품 신청 방법</td>
                            <td class="td_buy_info_content top bottom">
                                마이페이지 내 주문내역에서 신청가능하며,<br>
                                반품 신청의 경우 택배회수를 선택하여 신청가능합니다.<br>
                            </td>
                        </tr>
                        <tr>
                            <td class="td_buy_info_title top bottom title">교환/반품 신청 기간</td>
                            <td class="td_buy_info_content top bottom">
                                교환, 반품 신청은 배송이 완료된 후 15일 이내 가능합니다.<br>
                                고객님이 배송 받으신 상품의 내용이 표시∙광고의 내용과 다르거나 계약내용과 다르게 이행된 경우에는 배송 받으신 날로부터 3개월 이내, 혹은 그 사실을 알 수 있었던 날로 부터 30일 이내에 가능합니다.<br>
                            </td>
                        </tr>   
                        <tr>
                            <td class="td_buy_info_title top bottom title">교환/반품/회수 비용</td>
                            <td class="td_buy_info_content top bottom">
                                <b>[택배 회수 반품]</b><br>
                                고객님의 사유에 의한 교환 및 반품은 회수 및 배송에 필요한 비용을 부담해주셔야 합니다.<br>
                                기본 비용은 교환 5,000원(회수비+배송비), 반품 2,500원(회수비)입니다.<br>
                                제주도 및 도서산간 지방에는 추가 운임이 발생합니다.<br>
                                당사의 사유(상품의 하자, 배송의 오류 등)로 인한 경우 교환 및 반품에 필요한 비용은 당사에서 부담합니다.<br>
                            </td>
                        </tr>   
                        <tr>
                            <td class="td_buy_info_title top bottom title">교환/반품 불가안내</td>
                            <td class="td_buy_info_content top bottom">
                                고객님의 사유에 의한 교환 및 반품이 불가한 경우<br>
                                1. 배송이 완료된 후 15일이 경과한 경우<br>
                                2. 포장 훼손 및 사용 또는 일부 소비, 구성품 누락 및 상품의 결함 발생으로 인해 상품의 가치가 훼손된 경우<br>
                                <br>
                                당사의 사유에 의한 교환 및 반품이 불가한 경우<br>
                                1. 배송 받으신 날로부터 3개월, 혹은 그 사실을 알 수 있었던 날로 부터 30일이 경과한 경우<br>
                                2. 당사의 귀책(상품의 불량, 생산 및 제조 및 배송 간의 파손 등)으로 인한 현상이 아닌 해당 상품의 고유한 특성, 혹은 상품 수령 후 고객님의 과실로 인한 문제임이 규명된 경우<br>
                            </td>
                        </tr>                         
                    </table>                    
                </div>                
            </section>
            <!-- 리뷰 -->
            <section id="review_content_box" class="">
                <div class="category_align_box">
                    <div class="align_sort">
                        <div id="align_new" class="bold">
                        <a class="sortClass" id="sortDate" href="#" onclick="pageNav(${productVo.product_idx},1,1,'date','empty','empty')">최신순</a>                       
                        </div>
                        <div id="align_score" class="">
                        <a class="sortClass" id="sortScore" href="#" onclick="pageNav(${productVo.product_idx},1,1,'score','empty','empty')">평점순</a>
                        </div>
                        <div id="align_recom" class="">
                        <a class="sortClass" id="sortRecom" href="#" onclick="pageNav(${productVo.product_idx},1,1,'recom','empty','empty')">추천순</a>
                        </div>
                    </div>
                    <div class="align_reivew">
                        <div id="align_space" class="">                            
                        </div>
                        <div id="align_photo" class="bold">
                            <input type="checkbox" name="align_photo_check" id="align_photo_check" checked>
                            <label for="align_photo_check">포토리뷰</label>
                        </div>
                        <div id="align_text" class="bold">
                            <input type="checkbox" name="align_text_check" id="align_text_check" checked>
                            <label for="align_text_check">일반리뷰</label>
                        </div>
                    </div>
                </div>
                <div class="review_list">
                    <table class="tb_review_list">
						<c:choose>
	                    <c:when test="${reviewListCount == 0}">
						<tr>
                            <td class="td_review_empty" colspan="2">
                                등록된 리뷰가 없습니다.
                            </td>
                        </tr>
	                    </c:when>
	                    <c:otherwise>
		  				<c:forEach var="productReviewRows" begin="${pvrPageNav.startNum}" end="${pvrPageNav.endNum}">
						<tr>
                            <td class="td_review_title">
                                ${reviewList[productReviewRows-1].member_nickname}
                            </td>
                            <td class="td_review_content">
                                <div class="review_content">
                                    <div class="score_area">
                                        <span class="review_score">
                                        	<c:choose>
                                        	<c:when test="${reviewList[productReviewRows-1].review_score == 1}">
                                        	<img src="../resources/img/star_full.png" width="20px" height="20px">
                                        	<img src="../resources/img/star_empty.png" width="20px" height="20px">
                                        	<img src="../resources/img/star_empty.png" width="20px" height="20px">
                                        	<img src="../resources/img/star_empty.png" width="20px" height="20px">
                                        	<img src="../resources/img/star_empty.png" width="20px" height="20px">
                                        	</c:when>
                                        	<c:when test="${reviewList[productReviewRows-1].review_score == 2}">
                                        	<img src="../resources/img/star_full.png" width="20px" height="20px">
                                        	<img src="../resources/img/star_full.png" width="20px" height="20px">
                                        	<img src="../resources/img/star_empty.png" width="20px" height="20px">
                                        	<img src="../resources/img/star_empty.png" width="20px" height="20px">
                                        	<img src="../resources/img/star_empty.png" width="20px" height="20px">
                                        	</c:when>
                                        	<c:when test="${reviewList[productReviewRows-1].review_score == 3}">
                                        	<img src="../resources/img/star_full.png" width="20px" height="20px">
                                        	<img src="../resources/img/star_full.png" width="20px" height="20px">
                                        	<img src="../resources/img/star_full.png" width="20px" height="20px">
                                        	<img src="../resources/img/star_empty.png" width="20px" height="20px">
                                        	<img src="../resources/img/star_empty.png" width="20px" height="20px">
                                        	</c:when>
                                        	<c:when test="${reviewList[productReviewRows-1].review_score == 4}">
                                        	<img src="../resources/img/star_full.png" width="20px" height="20px">
                                        	<img src="../resources/img/star_full.png" width="20px" height="20px">
                                        	<img src="../resources/img/star_full.png" width="20px" height="20px">
                                        	<img src="../resources/img/star_full.png" width="20px" height="20px">
                                        	<img src="../resources/img/star_empty.png" width="20px" height="20px">
                                        	</c:when>
                                        	<c:otherwise>
                                        	<img src="../resources/img/star_full.png" width="20px" height="20px">
                                        	<img src="../resources/img/star_full.png" width="20px" height="20px">
                                        	<img src="../resources/img/star_full.png" width="20px" height="20px">
                                        	<img src="../resources/img/star_full.png" width="20px" height="20px">
                                        	<img src="../resources/img/star_full.png" width="20px" height="20px">  
                                        	</c:otherwise>
                                        	</c:choose>                                        	                                          
                                        </span>
                                        <span class="review_regDate">
                                            <fmt:formatDate value="${reviewList[productReviewRows-1].review_regDate}" pattern="yyyy.MM.dd" />
                                        </span>
                                    </div>
                                    <div class="txt_inner">
                                        <!-- 첨부파일 있으면 img 불러오기 -->
                                        ${reviewList[productReviewRows-1].review_content}
                                        <c:if test="${!empty reviewList[productReviewRows-1].saveFiles[0]}">
                                        <br><br>
                                        </c:if>
                                        <c:forEach var="imgIndex" begin="1" end="5">
                                        <c:if test="${!empty reviewList[productReviewRows-1].saveFiles[imgIndex-1]}">
                                        <img src="../resources/uploads/${reviewList[productReviewRows-1].saveFiles[imgIndex-1]}" width="145px" height="145px">
                                        </c:if>
                                        </c:forEach>
                                    </div>
                                    <div class="recom_area">
                                    	<input type="hidden" class="recom_member_idx" value="${member.member_idx}">
                                        <input type="hidden" class="recom_review_idx" value="${reviewList[productReviewRows-1].review_idx}">
                                        <input type="hidden" class="recom_recom_idx" value="${reviewList[productReviewRows-1].review_recom_idx}">
                                        <input type="hidden" class="recom_recom_count" value="${reviewList[productReviewRows-1].review_recom_count}">
                                        <input type="hidden" class="review_member_idx" value="${reviewList[productReviewRows-1].member_idx}">
                                        <input type="hidden" class="recom_temp" value="base">
                                        <button class="recom_btn">
                                            <b>리뷰 추천하기</b>
                                            <c:choose>
                                            <c:when test="${reviewList[productReviewRows-1].review_recom_idx != 0}">
                                            <span class="recom_num_o recom_change">
                                                <img src="../resources/img/recom_up.png" width="15px" height="15px">
                                                <span class=" recom_target">${reviewList[productReviewRows-1].review_recom_count}</span>
                                            </span>                                            
                                            </c:when>
                                            <c:otherwise>
                                            <span class="recom_num_x recom_change">
                                                <img src="../resources/img/recom_up.png" width="15px" height="15px">
                                                <span class=" recom_target">${reviewList[productReviewRows-1].review_recom_count}</span>
                                            </span>
                                            </c:otherwise>
                                            </c:choose>
                                        </button>
                                    </div>
                                </div>
                            </td>
                        </tr>		  				
		  				</c:forEach>
		  				</c:otherwise>
		  				</c:choose>
                    </table>
                </div>
                <!-- 페이지 네비게이션 -->
                <div class="pageing">
		    		<c:if test="${pvrPageNav.pageNum > pvrPageNav.pages_per_block}">
				    	<a href="#" onclick="pageNav(${productVo.product_idx},1,1,'empty','empty','empty')">&lt;&lt;</a>&nbsp;
			    		<a href="#"onclick="pageNav(${productVo.product_idx},${(pvrPageNav.pageBlock - 2)*pvrPageNav.pages_per_block + 1},${pvrPageNav.pageBlock-1},'empty','empty','empty')">
			    			&lt;이전페이지
			    		</a>   	
			    	</c:if>
			    	
			    	<c:forEach var="i" begin="${(pvrPageNav.pageBlock-1)*pvrPageNav.pages_per_block + 1}" end="${pvrPageNav.pageBlock*pvrPageNav.pages_per_block}">
			    		<c:if test="${i le pvrPageNav.totalPageNum}">
			    			<c:choose>
			    				<c:when test = "${pvrPageNav.pageNum eq i}">
			    					<a href="#" onclick="pageNav(${productVo.product_idx},${i},${pvrPageNav.pageBlock},'empty','empty','empty')">
			    						<span style="color:red">${i}&nbsp;</span>
			    					</a>
			    				</c:when>
			    				<c:otherwise>
			    					<a href="#" onclick="pageNav(${productVo.product_idx},${i},${pvrPageNav.pageBlock},'empty','empty','empty')">${i}&nbsp;</a>
			    				</c:otherwise>
			   			</c:choose>
			    		</c:if>
			    	</c:forEach>
			    
			    	<c:if test="${((pvrPageNav.rows_per_page*pvrPageNav.pages_per_block) lt pvrPageNav.totalRows) and (pvrPageNav.pageBlock ne pvrPageNav.lastPageBlock) }">
			    		<a href="#" onclick="pageNav(${productVo.product_idx},${pvrPageNav.pageBlock*pvrPageNav.pages_per_block+1},${pvrPageNav.pageBlock+1},'empty','empty','empty')">다음페이지&gt;</a>&nbsp;
			    		<a href="#" onclick="pageNav(${productVo.product_idx},${pvrPageNav.totalPageNum},${pvrPageNav.lastPageBlock},'empty','empty','empty')">&gt;&gt;</a>
			    	</c:if>
                </div>
            </section>
            <!-- 상품문의 -->
            <section id="qna_content_box" class="">
            
                <div class="prd_qna_title">
                    <input type="button" id="prd_qna_write_btn" value="상품문의">
                </div>
			    <!-- 상품문의 등록 성공 메시지 -->
				<c:if test="${not empty inqSuccess}">
				    <script>
				        alert("${inqSuccess}");
				    </script>
				</c:if>
				
				<!-- 상품문의 등록 실패 메시지 -->
				<c:if test="${not empty inqError}">
				    <script>
				        alert("${inqError}");
				    </script>
				</c:if>                
                <!-- 상품문의 버튼 누를시 뜨는 상품문의 작성 모달창 -->
                <div class="modalContainer hidden">
				<div class="modalInqContent">
					<div class="modal_inq_title">
						<div class="modal_title_text">상품 문의 작성</div>
						<div class="modal_title_right"><button class="modalCloseButton close">X</button></div>							
					</div>
					<div class="modal_inq_hr">
					</div>
					<form name="inq_form" action="product_inq_write.do" method="post">
					<div class="modal_inq_content">
						${productVo.product_name}
						<div class="inq_text_box">
							<textarea class="inq_text" name="product_inq_content" rows="30" cols="10" placeholder="문의 내용을 입력해주세요. (250자 이내)"></textarea>
							<div class="inq_text_count">
							0 / 250
							</div>
						</div>
						<input type="hidden" class="product_inq_content" value="">
						<input type="hidden" name="member_idx" value="${member.member_idx}">
						<input type="hidden" name="product_idx" value="${productVo.product_idx}">
						<input type="hidden" name="member_nickname" value="${member.member_nickname}">
					</div>
					</form>
					<div class="modal_inq_btn">
					    <button class="modalCloseButton cancelButton">취소</button>
					    <button class="writeButton">
					    등록</button>
					</div>
			    </div>				    
				</div>
                
                <div class="prd_qna_list">                    
                    
                    <c:choose>
	                    <c:when test="${productInqRows == 0}">
	                    <div class="qna_none_box">
	                    	등록된 상품문의가 없습니다.
	                    </div>
	                    </c:when>
	                    <c:otherwise>
		  				<c:forEach var="productInqRows" begin="${pviPageNav.startNum}" end="${pviPageNav.endNum}">
		                    <div class="qna_title_box">
		                        <div class="qna_status_box">
		                        	<c:choose>
		                        		<c:when test="${productInqList[productInqRows-1].product_inq_answer == null}">
		                        			<div class="qna_status">
				                                답변대기
				                            </div>
		                        		</c:when>
		                        		<c:otherwise>
				                            <div class="qna_status complete">
				                                답변완료
				                            </div>
		                        		</c:otherwise>
		                        	</c:choose>                           
		                        </div>                        
		                        <div class="qna_content">
		                            ${productInqList[productInqRows-1].product_inq_content}
		                        </div>
		                        <div class="member_nickname">
		                        	<c:choose>
		                        		<c:when test="${productInqList[productInqRows-1].member_idx != member.member_idx}">
		                        			<div class="member_nickname">${productInqList[productInqRows-1].member_nickname}</div>
		                        			<input type="hidden" class="qna_update_btn">
		                        			<input type="hidden" class="qna_delete_btn">
		                        		</c:when>
		                        		<c:otherwise><!-- 본인글이면 수정/삭제 표시 -->
		                        			<div class="nickname_txt">${productInqList[productInqRows-1].member_nickname}</div>                            
		                            		<button class="qna_update_btn">수정</button>
		                            		<button class="qna_delete_btn">삭제</button>   
		                        		</c:otherwise>
		                        	</c:choose>                         
		                        </div>
		                        <div class="product_inq_regDate">
		                            <fmt:formatDate value="${productInqList[productInqRows-1].product_inq_regDate}" pattern="yyyy.MM.dd" />
		                        </div>
		                    </div>
		                    <!-- 이 아래로 클릭에 따라 보여지는 구간 -->
		                    <section class="qna_detail_content">
		                        <div class="qna_question_box">
		                            <div class="question_title">
		                                Q
		                            </div>
		                            <div class="question_content">
		                                ${productInqList[productInqRows-1].product_inq_content}
		                            </div>                        
		                        </div>
		                        <!-- 답변유무에 따라 보이게 설정-->
		                        <c:if test="${productInqList[productInqRows-1].product_inq_answer != null}">                 
		                        <div class="qna_answer_box">
		                            <div class="answer_title">
		                                A
		                            </div>
		                            <div class="answer_content">
		                                ${productInqList[productInqRows-1].product_inq_answer}
		                            </div>                        
		                        </div>
		                        </c:if>   
		                    </section>
		                <!-- 상품 문의 수정 모달창 -->    
		                <div class="modalContainer hidden">
						<div class="modalInqContent">
							<div class="modal_inq_title">
								<div class="modal_title_text">상품 문의 수정</div>
								<div class="modal_title_right"><button class="modalCloseButton close">X</button></div>							
							</div>
							<div class="modal_inq_hr">
							</div>
							<form class="edit_form" name="inq_update_form" action="product_inq_update.do" method="post">
							<div class="modal_inq_content">
								${productVo.product_name}
								<div class="inq_text_box">
									<textarea class="inq_text" name="product_inq_content" rows="30" cols="10" placeholder="문의 내용을 입력해주세요. (250자 이내)">${productInqList[productInqRows-1].product_inq_content}</textarea>
									<div class="inq_text_count">
									0 / 250
									</div>
								</div>
								<input type="hidden" class="product_inq_content" value="${productInqList[productInqRows-1].product_inq_content}">
								<input type="hidden" class="product_inq_answer" value="${productInqList[productInqRows-1].product_inq_answer}">
								<input type="hidden" name="product_inq_idx" value="${productInqList[productInqRows-1].product_inq_idx}">
								<input type="hidden" name="member_idx" value="${productInqList[productInqRows-1].member_idx}">
								<input type="hidden" name="product_idx" value="${productVo.product_idx}">
								<input type="hidden" name="member_nickname" value="${productInqList[productInqRows-1].member_nickname}">
							</div>
							</form>
							<form class="delete_form" name="inq_delete_form" action="product_inq_delete.do" method="post">
							<input type="hidden" name="product_inq_idx" value="${productInqList[productInqRows-1].product_inq_idx}">
							<input type="hidden" name="product_idx" value="${productVo.product_idx}">
							</form>
							<div class="modal_inq_btn">
							    <button class="modalCloseButton edit_cancelButton">취소</button>
							    <button class="edit_updateButton">
							    수정</button>
							</div>
					    </div>				    
						</div>
		                    
		                </c:forEach>	                    
	                    </c:otherwise>                    
                    </c:choose>                   
                  
                </div>
                <!-- 페이지 네비게이션 -->
                <div class="pageing">
		    		<c:if test="${pviPageNav.pageNum > pviPageNav.pages_per_block}">
				    	<a href="#" onclick="pageNav(${productVo.product_idx},1,1,'empty','empty','empty')">&lt;&lt;</a>&nbsp;
			    		<a href="#"onclick="pageNav(${productVo.product_idx},${(pviPageNav.pageBlock - 2)*pviPageNav.pages_per_block + 1},${pviPageNav.pageBlock-1},'empty','empty','empty')">
			    			&lt;이전페이지
			    		</a>   	
			    	</c:if>
			    	
			    	<c:forEach var="i" begin="${(pviPageNav.pageBlock-1)*pviPageNav.pages_per_block + 1}" end="${pviPageNav.pageBlock*pviPageNav.pages_per_block}">
			    		<c:if test="${i le pviPageNav.totalPageNum}">
			    			<c:choose>
			    				<c:when test = "${pviPageNav.pageNum eq i}">
			    					<a href="#" onclick="pageNav(${productVo.product_idx},${i},${pviPageNav.pageBlock},'empty','empty','empty')">
			    						<span style="color:red">${i}&nbsp;</span>
			    					</a>
			    				</c:when>
			    				<c:otherwise>
			    					<a href="#" onclick="pageNav(${productVo.product_idx},${i},${pviPageNav.pageBlock},'empty','empty','empty')">${i}&nbsp;</a>
			    				</c:otherwise>
			   			</c:choose>
			    		</c:if>
			    	</c:forEach>
			    
			    	<c:if test="${((pviPageNav.rows_per_page*pviPageNav.pages_per_block) lt pviPageNav.totalRows) and (pviPageNav.pageBlock ne pviPageNav.lastPageBlock) }">
			    		<a href="#" onclick="pageNav(${productVo.product_idx},${pviPageNav.pageBlock*pviPageNav.pages_per_block+1},${pviPageNav.pageBlock+1},'empty','empty','empty')">다음페이지&gt;</a>&nbsp;
			    		<a href="#" onclick="pageNav(${productVo.product_idx},${pviPageNav.totalPageNum},${pviPageNav.lastPageBlock},'empty','empty','empty')">&gt;&gt;</a>
			    	</c:if>
                </div>
            </section>
        </div>
    </div>
    
    
    <footer>
		<jsp:include page="../main/footer.jsp"/>		
	</footer>
</body>
</html>