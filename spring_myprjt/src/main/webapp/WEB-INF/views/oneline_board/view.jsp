<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="vo.AllBoardVo, dao.AllBoardDao" %>
<%@ page import="java.util.List, java.util.HashMap, java.util.Map" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SkyBox - "${onelineBoardVo.title}" - 한줄평</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
$(function(){
	$("#login_btn").click(function checkInput(){   	
	    if(loginfrm.member_id.value.length==0){
	        alert("아이디가 입력되지 않았습니다.");
	        loginfrm.member_id.focus();
	        return false;
	    }else if(loginfrm.member_pw.value.length==0){
	        alert("비밀번호가 입력되지 않았습니다.");
	        loginfrm.member_pw.focus();
	        return false;
	    }
	    document.loginfrm.submit();
	    return true;
	});
	
	 $("#search_btn").click(function checkSearch(){  	
		    document.searchfrm.submit();
		    return true;
	 });
	 
	 $("#menu").click(function(){
	 	$("#sitemap").css("display","block");
	 });
	 $("#sitemap").click(function(){
	 	$("#sitemap").css("display","none");
	 });
	 
	 $(".outer-menu-item").mouseover(function(){
	     $(this).find(".inner-menu").css("display", "block");
	 });
	
	 $(".outer-menu-item").mouseout(function(){
	     $(this).find(".inner-menu").css("display", "none");
	 });
	
	 $(".inner-menu").mouseover(function(){
	     $(this).css("display", "block");
	 });
	
	 $(".inner-menu").mouseout(function(){
	     $(this).css("display", "none");
	 });
	 
	 $("#reply_submit").click(function validateForm(){
	  	if(replyfrm.content.value.length==0){
			alert("내용을 입력하세요");
			replyfrm.content.focus();
			return false;
		}
		document.replyfrm.submit();
		return true;
	 });
	 
	 let del_or_not = $("#del_or_not");
     let star_notice_big = $("#star_notice_big");
     let img_star = $(".img_star");
	 
	 let isClick = false;
	 
	 for(let i=0; i<10; i++){
		 img_star.eq(i).mouseover(function(){
			isClick = false;
			 
            if (i == 0) {
                star_notice_big.text("0.5");
            } else if (i == 1) {
                star_notice_big.text("1.0");
            } else if (i == 2) {
                star_notice_big.text("1.5");
            } else if (i == 3) {
                star_notice_big.text("2.0");
            } else if (i == 4) {
                star_notice_big.text("2.5");
            } else if (i == 5) {
                star_notice_big.text("3.0");
            } else if (i == 6) {
                star_notice_big.text("3.5");
            } else if (i == 7) {
                star_notice_big.text("4.0");
            } else if (i == 8) {
                star_notice_big.text("4.5");
            } else if (i == 9) {
                star_notice_big.text("5.0");
            }
                                    
            for(let j=0; j<i+1; j++){
				if((j+1)%2 != 0){
					img_star[j].src = '../resources/img/yellow_star_left.png';	
				}else{
					img_star[j].src = '../resources/img/yellow_star_right.png';
				}
			}	
			for(let j=i+1; j<10; j++){
				if((j+1)%2 != 0){
					img_star[j].src = '../resources/img/gray_star_left.png';	
				}else{
					img_star[j].src = '../resources/img/gray_star_right.png';
				}
			}
		 });
		 
		 img_star.eq(i).mouseout(function(){
			if(!isClick){
				for(let j=0; j<i+1; j++){
					if((j+1)%2 != 0){
						img_star[j].src = '../resources/img/gray_star_left.png';	
					}else{
						img_star[j].src = '../resources/img/gray_star_right.png';
					}
				}
				for(let j=i+1; j<10; j++){
					if((j+1)%2 != 0){
						img_star[j].src = '../resources/img/gray_star_left.png';	
					}else{
						img_star[j].src = '../resources/img/gray_star_right.png';
					}
				}
				star_notice_big.text("");
			}			
		 });
		 
		 img_star.eq(i).click(function(){
			isClick = true;
			
			for(let j=0; j<i+1; j++){
				if((j+1)%2 != 0){
					img_star[j].src = '../resources/img/yellow_star_left.png';	
				}else{
					img_star[j].src = '../resources/img/yellow_star_right.png';
				}
			}
			for(let j=i+1; j<10; j++){
				if((j+1)%2 != 0){
					img_star[j].src = '../resources/img/gray_star_left.png';	
				}else{
					img_star[j].src = '../resources/img/gray_star_right.png';
				}
			}
			del_or_not.val(i);
		 });
	 }
	 
	 let content_edit = $(".content_edit");
	 let reply_edit_button = $(".reply_edit_button");
	 let reply_delete_button = $(".reply_delete_button");
	 let reply_edit_cancle_btn = $(".reply_edit_cancle_btn");
	 let reply_edit_submit_btn = $(".reply_edit_submit_btn");
	 
 	 let star_notice_reply = $(".star_notice_reply");
	 let img_star_reply = $(".img_star_reply");
	 let reply_star_score = $(".reply_star_score");
	 
	 for(let i=0; i<content_edit.length; i++){
		 
		 reply_edit_submit_btn.eq(i).click(function(){
			 let form = $(".reply_edit_frm_class").eq(i);
		 	 
             let contentValue = form.find('input[name="content"]').val();
            
             if (contentValue == "") {
                alert("내용을 입력해주세요.");
                return false;
             }
            
             form.attr("method", "post");
             form.attr("action", "reply_edit_process.do");
             form.submit();
            
             return true;
	 	 });
		 
		 reply_delete_button.eq(i).click(function(){
			 let form = $(".reply_edit_frm_class").eq(i);
             let idxValue = form.find('input[name="reply_idx"]').val();
             let temp1 = "reply_delete_process.do?no=";
             let temp2 = idxValue;
             let temp3 = temp1 + temp2;
             let confirmAns = confirm("정말 삭제하시겠습니까?");
            
             if (confirmAns) {
                form.attr("method", "post");
                form.attr("action", temp3);
                form.submit();
             }
			 
		 });
		 
		 reply_edit_button.eq(i).click(function(){			 
	         let index = reply_edit_button.index(this);
	         let originalContent = content_edit.eq(index).val();
	         let originalScore = $("#reply_del_or_not").eq(index).val();
	         reply_star_score.eq(index).val(originalScore);
	         content_edit.eq(index).prop("readonly", false);
	         content_edit.eq(index).css("border", "1px solid black");
	         reply_edit_cancle_btn.eq(index).prop("type", "button");
	         reply_edit_submit_btn.eq(index).prop("type", "button");
	         reply_edit_button.eq(index).prop("type", "hidden");
	         reply_delete_button.eq(index).prop("type", "hidden");		
	         
	         let startIndex = index * 10;
	         let endIndex = startIndex + 10;
	         
	         img_star_reply.slice(startIndex, endIndex).mouseover(function(){
	        	 let j = img_star_reply.index(this);
	             isClick = false;
	             
	             if (!isClick) {
	                 if (j % 10 == 0) {
	                     star_notice_reply.eq(index).text("0.5");
	                 } else if (j % 10 == 1) {
	                     star_notice_reply.eq(index).text("1.0");
	                 } else if (j % 10 == 2) {
	                     star_notice_reply.eq(index).text("1.5");
	                 } else if (j % 10 == 3) {
	                     star_notice_reply.eq(index).text("2.0");
	                 } else if (j % 10 == 4) {
	                     star_notice_reply.eq(index).text("2.5");
	                 } else if (j % 10 == 5) {
	                     star_notice_reply.eq(index).text("3.0");
	                 } else if (j % 10 == 6) {
	                     star_notice_reply.eq(index).text("3.5");
	                 } else if (j % 10 == 7) {
	                     star_notice_reply.eq(index).text("4.0");
	                 } else if (j % 10 == 8) {
	                     star_notice_reply.eq(index).text("4.5");
	                 } else if (j % 10 == 9) {
	                     star_notice_reply.eq(index).text("5.0");
	                 }

	                 for(let k=startIndex; k<j+1; k++){
         				if((k+1)%2 != 0){
         					img_star_reply[k].src = '../resources/img/yellow_star_left.png';
         					img_star_reply[k].style.cursor = "pointer";
         				}else{
         					img_star_reply[k].src = '../resources/img/yellow_star_right.png';
         					img_star_reply[k].style.cursor = "pointer";
         				}
         			}	
         			for(let k=j+1; k<endIndex; k++){
         				if((k+1)%2 != 0){
         					img_star_reply[k].src = '../resources/img/gray_star_left.png';
         					img_star_reply[k].style.cursor = "pointer";
         				}else{
         					img_star_reply[k].src = '../resources/img/gray_star_right.png';
         					img_star_reply[k].style.cursor = "pointer";
         				}
         			}
	             }//end of if
	         });//end of img_star_reply mouseover event
	         
	         img_star_reply.slice(startIndex, endIndex).mouseout(function(){
	        	 let j = img_star_reply.index(this);
	        	 if (!isClick) {
	        		 for(let k=startIndex; k<j+1; k++){
     					if((k+1)%2 != 0){
     						img_star_reply[k].src = '../resources/img/gray_star_left.png';	
     					}else{
     						img_star_reply[k].src = '../resources/img/gray_star_right.png';
     					}
     				 }
     				 for(let k=j+1; k<endIndex; k++){
     					if((k+1)%2 != 0){
     						img_star_reply[k].src = '../resources/img/gray_star_left.png';	
     					}else{
     						img_star_reply[k].src = '../resources/img/gray_star_right.png';
     					}
     				 }
	                 star_notice_reply.eq(index).text("");
	             }//end of if
	         });//end of img_star_reply mouseout event
	         
	         img_star_reply.slice(startIndex, endIndex).click(function(){
	        	 let j = img_star_reply.index(this);
	             isClick = true;
	             for(let k=startIndex; k<j+1; k++){
     				if((k+1)%2 != 0){
     					img_star_reply[k].src = '../resources/img/yellow_star_left.png';	
     				}else{
     					img_star_reply[k].src = '../resources/img/yellow_star_right.png';
     				}
     			 }
     			 for(let k=j+1; k<endIndex; k++){
     				if((k+1)%2 != 0){
     					img_star_reply[k].src = '../resources/img/gray_star_left.png';	
     				}else{
     					img_star_reply[k].src = '../resources/img/gray_star_right.png';
     				}
     			 }
	             reply_star_score.eq(index).val(j % 10);
	         });//end of img_star_reply click event
	         
	         function setStarStyles(startIndex, endIndex, score) {	        	 
        	    for (let k = startIndex; k < endIndex; k++) {
        	        if ((k + 1) % 2 != 0) {
        	            img_star_reply[k].src = '../resources/img/gray_star_left.png';
        	        } else {
        	            img_star_reply[k].src = '../resources/img/gray_star_right.png';
        	        }
        	    }
        	    
        	    if (score === 0) {
        	        return;
        	    }
        	    
        	    let j = startIndex + score;
        	    for (let k = startIndex; k <= j; k++) {
        	        if ((k + 1) % 2 != 0) {
        	            img_star_reply[k].src = '../resources/img/yellow_star_left.png';
        	        } else {
        	            img_star_reply[k].src = '../resources/img/yellow_star_right.png';
        	        }
        	    }
        	    
        	    if (score == 0) {
                     star_notice_reply.eq(index).text("0.5");
                 } else if (score == 1) {
                     star_notice_reply.eq(index).text("1.0");
                 } else if (score == 2) {
                     star_notice_reply.eq(index).text("1.5");
                 } else if (score == 3) {
                     star_notice_reply.eq(index).text("2.0");
                 } else if (score == 4) {
                     star_notice_reply.eq(index).text("2.5");
                 } else if (score == 5) {
                     star_notice_reply.eq(index).text("3.0");
                 } else if (score == 6) {
                     star_notice_reply.eq(index).text("3.5");
                 } else if (score == 7) {
                     star_notice_reply.eq(index).text("4.0");
                 } else if (score == 8) {
                     star_notice_reply.eq(index).text("4.5");
                 } else if (score == 9) {
                     star_notice_reply.eq(index).text("5.0");
                 }
	         }
	         
			 reply_edit_cancle_btn.eq(i).click(function(){				 
				 let index = reply_edit_cancle_btn.index(this);				 
				 content_edit.eq(index).val(originalContent)
				 content_edit.eq(index).prop("readonly", true);
				 content_edit.eq(index).css("border", "0px solid black");
				 reply_edit_cancle_btn.eq(index).prop("type", "hidden");
				 reply_edit_submit_btn.eq(index).prop("type", "hidden");
				 reply_edit_button.eq(index).prop("type", "button");
				 reply_delete_button.eq(index).prop("type", "button");
				 
				 img_star_reply.slice(startIndex, endIndex).off("mouseover");
				 img_star_reply.slice(startIndex, endIndex).off("mouseout");
				 img_star_reply.slice(startIndex, endIndex).off("click");
				 img_star_reply.slice(startIndex, endIndex).css("cursor", "");
				 
				 setStarStyles(startIndex, endIndex, originalScore);
			 });//end of reply_edit_cancle_btn click event
			 
		 });//end of reply_edit_button click event
		 
	 }//end of for
	 
});
</script>
<script>
function deletePost() {
	
    var confirmAns = confirm("정말로 삭제하겠습니까?");
    
    if (confirmAns) {
    	
        frm_view.method = "post";  
        frm_view.action = "delete_process.do?no=${onelineBoardVo.board_idx}";
        frm_view.submit(); 
        
    }
    
}
</script>
<style>
*{margin: 0; padding: 0;}
a{text-decoration: none;}
li{list-style: none;}
.pull-left{float: left; display: block;}
.pull-right{float: right; display: block;}
input[type="button"], input[type="submit"], input[type="reset"], select{cursor: pointer;}
body{
    width: 978px; margin: 0 auto;
    background-color: white;
}
#main-header{		
	width: 938px; height: 115px;
	margin-top:10px;
	margin-left: 20px;
    margin-bottom: 30px;		
}
#titlecontainer{
    margin-left: 20px;
    margin-bottom: 20px;
	width: 938px;
    height: 42px;
}
#title{
	width: 500px
}
#main-navigaion{
    background-color:rgb(150, 222, 224);
    margin-top:10px;
    margin-left: 20px;
    margin-bottom: 10px;
	width: 938px;
    height: 60px;
}
#navleft{
	width: 500px;
}
.outer-menu-item{
	float: left;
	position: relative;
	padding-top: 5px;
}
.menu-title:hover{
	color: rgb(8, 61, 97);		
}
.menu-title{
	color: rgb(41, 128, 185);
	font-weight: bold;
	display: block;
	height: 42px; line-height: 42px;
	text-align: center;
	padding: 5px 20px;
}
.inner-menu{
	display: none;
	position: absolute;
	background-color: rgb(150, 222, 224);
	border-color: rgb(41, 128, 185);
	border-style: solid;
	border-width: 2px;
	top: 50px; left: 0;
	width: 90px; height: 70px;
	z-index: 10;
	text-align: left;
	padding: 20px;
	border-radius: 2px;
}
.inner-menu-item > a{
	display: block;
	padding-top: 10px;
	padding-bottom: 10px;
	color: rgb(41, 128, 185);
}
.inner-menu-item > a:hover{
	color: rgb(8, 61, 97);
	font-weight: bold;
}
.search-bar{
	height: 42px;
	padding: 9px;
}
.input-search{
	display: block;
	float: left;
	background-color: white;
	border-color: rgb(41, 128, 185);
	border-style: solid;
	border-width: 2px;
	width: 240px; height: 42px;
	font-size: 12px;	
	padding: 0 0 0 10px;
}
.input-search:focus{
	border-color:rgb(41, 128, 185);
	outline: 0;
}
.input-search-submit{
	display: block;
	float: left;
	width: 36px; height: 45px;
	margin-left: 4px;
	background-color: rgb(41, 128, 185);
	color: white;
	font-weight: bold;
	border-width: 0;
	border-radius: 2px;
}
#login-container{
	margin-bottom: 10px;
    width: 978px;
    height: 94px;    
}
#ad-space{
    width: 740px; height: 94px; line-height: 94px;
    margin-left: 20px;
    margin-right: 5px;
    background-color: rgb(224, 224, 224);
    text-align: center;
}
#loginbox{
	margin-right: 20px;
	margin-bottom: 20px;
	width: 184px; height: 94px;	    
    background-color: rgb(150, 222, 224);    
}
#member_id, #member_pw{    
    width: 116px;
    height: 27px;
    margin-left: 4px;
    padding: 0 0 0 10px;
    border-width: 0;
}
#member_id:focus{
	outline: 2px;
	outline-color: rgb(41, 128, 185);
}
#member_pw:focus{
	outline: 2px;
	outline-color: rgb(41, 128, 185);
}
#login_btn{
    width: 42px;
    height: 58px;
    line-height: 64px;
    background-color: rgb(41, 128, 185);
    color: white;
    font-weight: bold;
    border-width: 0;
    margin-top: 4px;
    margin-right: 4px;
    margin-left: 2px;
    border-radius: 2px;
}
#id-table{
	padding-top: 3px;
	vertical-align: bottom;
}
#pw-table{
	vertical-align: top;
}
#submit-table{
	vertical-align:top;
}
#link-table{
	padding-left: 4px;
}
#contentcontainer{
    margin-left: 20px;
    margin-bottom: 10px;
	width: 918px;
    padding: 10px;
}
#pagingcontainer{
	background-color: wheat;
    margin-left: 20px;
    margin-bottom: 10px;
	width: 918px;
    height: 40px;
    padding: 10px;    
}
input:focus{outline: 0;} select:focus{outline: 0;} textarea{outline: 0;}
#tb_board, #tb_reply{
	border-collapse: collapse;
}
#td_title{
	width: 650px; height: 42px;
	font-size: 20px;
	color: rgb(41, 128, 185);
	font-weight: bold;
	padding-left: 5px;
}
#td_title_side{
	width: 288px; height: 42px;
	text-align: right;	
	vertical-align: bottom;
}
#td_title_text{
	width: 650px; height: 28px;
	font-weight: bold;
	padding-left: 5px;
	border-top: 5px solid rgb(41, 128, 185);
	border-bottom: 5px solid rgb(41, 128, 185);
}
#td_title_text_side{
	width: 288px; height: 28px;
	font-weight: bold;
	padding-right: 5px;
	text-align: right;
	border-top: 5px solid rgb(41, 128, 185);
	border-bottom: 5px solid rgb(41, 128, 185);
}
#td_content_info{
	width: 650px; height: 28px;
}
#td_count{
	width: 184px; height: 28px;
	text-align: right;
}
#td_date{
	width: 144px; height: 28px;
	padding-right: 5px;
	text-align: right;
}
#td_content{
	width: 938px; height: auto;	
	padding: 10px;
	padding-bottom: 30px;
	font-size: 14px;
}
#td_file{
	width: 938px; height: 35px;
	background-color: rgb(150, 222, 224);
	padding: 5px;
	padding-left: 10px;
}
#td_file a{
	color: black;
}
.td_space{
	width: 938px; height: 5px;
}
#td_reply_count{	
	width: 938px; height: 28px;
	padding-top: 5px;
	padding-left: 5px;
	border-top: 5px solid rgb(41, 128, 185);
}
.reply_title_name{
	width: 780px; height: 28px;
	padding: 5px;
	color: rgb(41, 128, 185);
	font-weight: bold;
	font-size: 14px;
}
.reply_title_date{
	width: 158px; height: 28px;
	padding: 5px;
	text-align: right;
	font-size: 14px;
	vertical-align: bottom;
}
.content{
	width: 780px; height: auto;
	padding: 5px;
	font-size: 14px;
}
.reply_edit{
	width: 158px; height: auto;
	padding: 5px;
	text-align: right;
	vertical-align: top;
}
.reply_color{
	background-color: rgb(150, 222, 224);
}
#td_reply_paging{
	width: 938px; height: 28px;
	text-align: center;
	padding: 10px 0;
}
#td_reply_content{
	width: 938px; height: 70px;
	border: 2px solid rgb(41, 128, 185);
	padding: 10px;
}
#td_reply_submit{
	width: 938px; height: 42px;
	text-align: right;
}
#td_reply_content_donotuse{
	width: 938px; height: 70px;
}
#td_reply_submit_donotuse{
	width: 938px; height: 42px;
}
#content{
	width: 870px; height: 70px;
	background-color: white;
	border-width: 0px;
	font-size: 12px;	
	padding: 10px;
	resize: none;
}
#td_back{
	width: 444px; height: 42px;
}
#td_back_side{
	width: 296px; height: 42px;
	text-align: right;
}
.td_big_space{
	width: 938px; height: 30px;
}
.td_star{
	width: 938px; height: 80px;
	padding: 10px;
}
#file_notice{
	font-size: 12px;
	font-weight: bold;
	color: rgb(127, 127, 127);
}
#list{
	width: 72px; height: 27px;
	background-color: rgb(41, 128, 185);
	color: white;
	border-width: 0;
	font-weight: bold;
}
#cancle_btn{
	width: 72px; height: 27px;
	background-color: rgb(224, 224, 224);
	color: rgb(127, 127, 127);
	border-width: 0;
	font-weight: bold;
}
#delete{
	width: 72px; height: 27px;
	background-color: rgb(224, 224, 224);
	color: rgb(231, 60, 60);
	border-width: 0;
	font-weight: bold;
}
#edit{
	width: 72px; height: 27px;
	background-color: rgb(224, 224, 224);
	color: rgb(52, 152, 219);
	border-width: 0;
	font-weight: bold;
}
.reply_edit_button{
	width: 40px; height: 20px;
	background-color: rgb(224, 224, 224);
	color: rgb(52, 152, 219);
	border-width: 0;
	font-weight: bold;
}
.reply_delete_button{
	width: 40px; height: 20px;
	background-color: rgb(224, 224, 224);
	color: rgb(231, 60, 60);
	border-width: 0;
	font-weight: bold;
}
#reset_btn{
	width: 72px; height: 27px;
	background-color: rgb(224, 224, 224);
	color: rgb(127, 127, 127);
	border-width: 0;
	font-weight: bold;
}
#reply_submit{
	width: 81px; height: 27px;
	background-color: rgb(41, 128, 185);
	color: white;
	border-width: 0;
	font-weight: bold;
}
#name-table{
	padding-left: 5px;
	padding-top: 5px;
}
#user_nickname{
	color: rgb(41, 128, 185);
	font-weight: bold;
	font-size: 15px;
}
#nim{
	font-size: 12px;
}
.link-table{
	padding-left: 10px;
	padding-top: 5px;
}
#reply_count{
	color: rgb(41, 128, 185);
	font-weight: bold;	
}
.content_edit{
	width: 800px; height: auto;
	border: 0 solid black;
	font-size: 12px;	
	padding: 10px;
	margin-top: 5px;
	margin-bottom: 5px;
}
.link-table{
	padding-left: 10px;
	padding-top: 5px;
}
.logout_link {
	font-size: 14px;
    font-weight: bold;
	color: rgb(41, 128, 185);   
}
.login_link {
	font-size: 12px;
    font-weight: bold;
	color: rgb(127, 127, 127);   
}
.reply_edit_cancle_btn{
	width: 40px; height: 20px;
	background-color: rgb(224, 224, 224);
	color: rgb(127, 127, 127);
	border-width: 0;
	font-weight: bold;
}
.reply_edit_submit_btn{
	width: 40px; height: 20px;
	background-color: rgb(224, 224, 224);
	color: rgb(52, 152, 219);
	border-width: 0;
	font-weight: bold;
}
#td_title a{
	color: rgb(41, 128, 185);
}
#td_notice{
	width: 938px; height: 28px;
	text-align: center;
}
.td_recommendation{
	width: 465px; height: 60px;
	text-align: right;	
}
.td_center{
	width: 8px; height: 60px;
	text-align: center;	
}
.td_not_recommendation{
	width: 465px; height: 60px;
	text-align: left;	
}
#rd_up{
	width: 75px; height: 50px;
	background-color: rgb(41, 128, 185);
	color: white;
	border-width: 0;
	font-weight: bold;
	margin-right: 10px;
}
#rd_up_count{
	width: 75px; height: 25px;
	background-color: rgb(41, 128, 185);
	color: white;
	border-width: 0;
	font-weight: bold;
	margin-right: 10px;
}
#rd_down{
	width: 75px; height: 50px;
	background-color: rgb(224, 224, 224);
	color: rgb(127, 127, 127);
	border-width: 0;
	font-weight: bold;
	margin-left: 10px;
}
#rd_down_count{
	width: 75px; height: 25px;
	background-color: rgb(224, 224, 224);
	color: rgb(127, 127, 127);
	border-width: 0;
	font-weight: bold;
	margin-left: 10px;
}
.td_star .img_star{
	cursor: pointer;
}
.img_right{
	margin-right: 10px;	
}
.reply_star{
	margin-left: 10px;
	margin-top: 10px;
}
.star_notice, .star_notice_reply{
	color: rgb(41, 128, 185);
	font-weight: bold;
}
#star_notice_big{
	color: rgb(41, 128, 185);
	font-weight: bold;
	font-size: 30px;
}
#main-footer{
	width: 918px; height: 180px;
	margin-top:60px;
	margin-left: 20px;
	padding-top: 10px;
	padding-left: 20px;
    background-color: rgb(150, 222, 224);	
	color: rgb(127, 127, 127);
	font-size: 12px;
}
</style>
</head>
<body>
	<header id="main-header">
		<jsp:include page="../main/header.jsp"/>
	</header>
	
	<nav id="main-navigaion">
		<div id="navleft" class="pull-left">
			<ul class="outer-menu">
				<li class="outer-menu-item">
					<span class="menu-title">영화감상게시판</span>
					<ul class="inner-menu">
						<li class="inner-menu-item">
							<a href="../oneline_board/list.do">한줄평</a>							
						</li>
						<li class="inner-menu-item">
							<a href="../review_board/list.do">리뷰</a>
						</li>
					</ul>
				</li>
			</ul>
			<ul class="outer-menu">
				<li class="outer-menu-item">
					<span class="menu-title">유저게시판</span>
					<ul class="inner-menu">
						<li class="inner-menu-item">
							<a href="../free_board/list.do">자유게시판</a>							
						</li>
						<li class="inner-menu-item">
							<a href="../question_board/list.do">질문게시판</a>
						</li>
					</ul>
				</li>
			</ul>
		</div>
		<div class="pull-right">
			<div class="search-bar">
				<form action="../main/search_list.do" method="get" name="searchfrm">
					<input type="text" class="input-search" name="searchTotal" id="searchTotal">
					<input type="button" class="input-search-submit" name="search_btn" id="search_btn" value="검색">
				</form>
			</div>
		</div>		
	</nav>
	<div id="login-container">
		<div class="pull-left">
			<div id="ad-space">광고배너자리</div>
		</div>
		<div class="pull-right">
			<aside id="loginbox">
					<form action="../membership/login_process.do" method="post" name="loginfrm">
						<c:choose>							
							<c:when test="${!empty membership}">
								<!-- 회원용 -->
								<table id="tb_login_info">
									<tr>
										<td id="name-table" colspan="2">
										<span id="user_nickname">${membership.member_nickname}</span>
										<span id="nim">님</span>
										</td>
									</tr>
									<tr>
										<td class="link-table">
											<a class="login_link" href="../membership/mypage.do">회원정보보기</a>									
										</td>
										<td class="link-table">
											<a class="login_link" href="../membership/logout.do">로그아웃</a>
											<input type="hidden" id="login_btn" name="login_btn" value="로그인">
										</td>
									</tr>
									<tr>
										<td class="link-table">
											<a class="login_link" href="../membership/mycontent.do">작성글보기</a>									
										</td>
										<td class="link-table">
											<a class="login_link" href="../membership/myreply.do">작성댓글보기</a>
										</td>
									</tr>
								</table>						
							</c:when>
							<c:otherwise>	
								<!-- 일반용 -->
								<table>
									<tr>
										<td id="id-table"><input type="text" id="member_id" name="member_id" placeholder="아 이 디"></td>
										<td id="submit-table"rowspan="2"><input type="button" id="login_btn" name="login_btn" value="로그인"></td>
									</tr>
									<tr>
										<td id="pw-table"><input type="password" id="member_pw" name="member_pw" placeholder="비 밀 번 호"><br></td>
									</tr>
									<tr>
										<td id="link-table" colspan="2">
											<a class="logout_link"  href="../membership/join.do">&nbsp;&nbsp;회원가입&nbsp;</a>
											<a class="logout_link" href="../membership/search_id.do">&nbsp;&nbsp;ID/PW 찾기&nbsp;&nbsp;</a>
										</td>
									</tr>
								</table>
							</c:otherwise>
						</c:choose>				
					</form>
				</aside>
		</div>	
	</div>
	<div id="titlecontainer">
			
	</div>
	<div id="contentcontainer">
		<form name="frm_view">
		<table id="tb_board">			
			<tr>
				<td id="td_title" colspan="3"><a href="../oneline_board/list.do">한줄평</a></td>
				<c:choose>							
					<c:when test="${(membership.grade eq 1) or (!empty membership and (membership.member_idx eq onelineBoardVo.member_idx))}">
						<td id="td_title_side" colspan="2">
							<a href="../oneline_board/edit.do?no=${onelineBoardVo.board_idx}"><input type="button" name="edit" id="edit" value="글수정"></a>
							<input type="button" onclick="deletePost();" name="delete" id="delete" value="글삭제">
							<a href="../oneline_board/list.do"><input type="button" name="list" id="list" value="목록"></a>
						</td>
					</c:when>
					<c:otherwise>
						<td id="td_title_side" colspan="2">
							<a href="../oneline_board/list.do"><input type="button" name="list" id="list" value="목록"></a>
						</td>
					</c:otherwise>
				</c:choose>
			</tr>
			<tr><td class="td_space" colspan="5"></td></tr>
			<tr id="tr_title">
				<td id="td_title_text" colspan="3">
					${onelineBoardVo.title}
				</td>
				<td id="td_title_text_side" colspan="2">
				</td>
			</tr>			
			<tr>
				<td id="td_content_info" colspan="3"></td>
				<td id="td_count">
				</td>
				<fmt:formatDate value="${onelineBoardVo.post_date}" type="date" pattern="yyyy-MM-dd HH:mm" var="formattedDate"/>
				<td id="td_date">${formattedDate}</td>
			</tr>				
			<tr>
				<td id="td_content" colspan="5">					
					<c:if test="${!empty onelineBoardVo.saveFile}">
						<img src="../resources/uploads/${onelineBoardVo.saveFile}" width="340px" height="400px"  alt="이미지가 없는 첨부파일"><br>
					</c:if>
					<br>
					${onelineBoardVo.content}
				</td>
			</tr>
			</table>
			</form>			
						
			
			
			<form name="replyfrm" method="post" action="reply_write_process.do">
			<table id="tb_write">
				<tr>
				<td class="td_big_space" colspan="5">
				</td>
				</tr>
			<c:choose>
				<c:when test="${!empty membership}">
				<tr>
				<td class="td_star" colspan="5">
					<img class ="img_left img_star" id="img_star_1" src="../resources/img/gray_star_left.png" width="36px" height="68px"  alt="이미지가 없는 첨부파일"><img class ="img_right img_star" id="img_star_2" src="../resources/img/gray_star_right.png" width="36px" height="68px"  alt="이미지가 없는 첨부파일"><img class ="img_left img_star" id="img_star_3" src="../resources/img/gray_star_left.png" width="36px" height="68px"  alt="이미지가 없는 첨부파일"><img class ="img_right img_star" id="img_star_4" src="../resources/img/gray_star_right.png" width="36px" height="68px"  alt="이미지가 없는 첨부파일" ><img class ="img_left img_star" id="img_star_5" src="../resources/img/gray_star_left.png" width="36px" height="68px"  alt="이미지가 없는 첨부파일" ><img class ="img_right img_star" id="img_star_6" src="../resources/img/gray_star_right.png" width="36px" height="68px"  alt="이미지가 없는 첨부파일" ><img class ="img_left img_star" id="img_star_7" src="../resources/img/gray_star_left.png" width="36px" height="68px"  alt="이미지가 없는 첨부파일"><img class ="img_right img_star" id="img_star_8" src="../resources/img/gray_star_right.png" width="36px" height="68px"  alt="이미지가 없는 첨부파일"><img class ="img_left img_star" id="img_star_9" src="../resources/img/gray_star_left.png" width="36px" height="68px"  alt="이미지가 없는 첨부파일"><img class ="img_right img_star" id="img_star_10" src="../resources/img/gray_star_right.png" width="36px" height="68px"  alt="이미지가 없는 첨부파일">
					<input type="hidden" name="del_or_not" id="del_or_not" value="">
					&nbsp;<span id="star_notice_big"></span>
				</td>
				</tr>
					<tr>
						<td id="td_reply_content" colspan="5">
							<input type="hidden" name="member_idx" id="member_idx" value="${membership.member_idx}">
							<input type="hidden" name="board_idx" id="board_idx" value="${onelineBoardVo.board_idx}">
							<input type="hidden" name="member_nickname" id="member_nickname" value="${membership.member_nickname}">
							<textarea class="reply_text" name="content" id="content" cols="30" rows="5"></textarea>					
						</td>
					</tr>
					<tr>
						<td id="td_reply_submit" colspan="5">					
							<input type="button" name="reply_submit" id="reply_submit" value="평점 등록">
						</td>
					</tr>
				</c:when>
				<c:otherwise>
					<tr>
					<td class="td_star" colspan="5">
						<input type="hidden" name="del_or_not" id="del_or_not" value="">
						&nbsp;<span id="star_notice_big"></span>
					</td>
					</tr>
					<tr>
						<td id="td_reply_content_donotuse" colspan="5">				
						</td>
					</tr>
					<tr>
						<td id="td_reply_submit_donotuse" colspan="5">					
						</td>
					</tr>
				</c:otherwise>
			</c:choose>
		</table>
		</form>
		
		<table id="tb_reply">
		<tr>
			<td id="td_reply_count" colspan="5">
				<span id="reply_count">${totalRows}</span>&nbsp;개의 평점
			</td>
		</tr>
		<tr><td class="td_big_space" colspan="5"></td></tr>	
		
		<c:choose>
		<c:when test="${empty boardReplyList}">
			<tr>
				<td id="td_notice" colspan="6"> 등록된 평점이 없습니다. </td>
			</tr>
		</c:when>
		<c:otherwise>			
			<c:forEach var="rowNum" begin="${startNum}" end="${endNum}">
			<tr class="reply_color">
				<td class="reply_title_name" colspan="3">
					${boardReplyList[rowNum-1].member_nickname}					
				</td>
				<fmt:formatDate value="${boardReplyList[rowNum-1].post_date}" type="date" pattern="yy-MM-dd HH:mm" var="reply_formattedDate"/>
				<td class="reply_title_date" colspan="2">
					${reply_formattedDate}					
				</td>
			</tr>
			<tr>
				<td class="reply_content" colspan="5">
					<form class="reply_edit_frm_class" name="reply_edit_frm">
						<div class="reply_star">
							<c:choose>							
							<c:when test="${boardReplyList[rowNum-1].del_or_not eq 0}">
								<img class ="img_left img_star_reply" src="../resources/img/yellow_star_left.png" width="10px" height="20px"  alt="이미지가 없는 첨부파일"><img class ="img_right img_star_reply" src="../resources/img/gray_star_right.png" width="10px" height="20px"  alt="이미지가 없는 첨부파일"><img class ="img_left img_star_reply" src="../resources/img/gray_star_left.png" width="10px" height="20px"  alt="이미지가 없는 첨부파일"><img class ="img_right img_star_reply" src="../resources/img/gray_star_right.png" width="10px" height="20px"  alt="이미지가 없는 첨부파일" ><img class ="img_left img_star_reply" src="../resources/img/gray_star_left.png" width="10px" height="20px"  alt="이미지가 없는 첨부파일" ><img class ="img_right img_star_reply" src="../resources/img/gray_star_right.png" width="10px" height="20px"  alt="이미지가 없는 첨부파일" ><img class ="img_left img_star_reply" src="../resources/img/gray_star_left.png" width="10px" height="20px"  alt="이미지가 없는 첨부파일"><img class ="img_right img_star_reply" src="../resources/img/gray_star_right.png" width="10px" height="20px"  alt="이미지가 없는 첨부파일"><img class ="img_left img_star_reply" src="../resources/img/gray_star_left.png" width="10px" height="20px"  alt="이미지가 없는 첨부파일"><img class ="img_right img_star_reply" src="../resources/img/gray_star_right.png" width="10px" height="20px"  alt="이미지가 없는 첨부파일">
								&nbsp;<span class="star_notice_reply">0.5</span>
							</c:when>
							<c:when test="${boardReplyList[rowNum-1].del_or_not eq 1}">
								<img class ="img_left img_star_reply" src="../resources/img/yellow_star_left.png" width="10px" height="20px"  alt="이미지가 없는 첨부파일"><img class ="img_right img_star_reply" src="../resources/img/yellow_star_right.png" width="10px" height="20px"  alt="이미지가 없는 첨부파일"><img class ="img_left img_star_reply" src="../resources/img/gray_star_left.png" width="10px" height="20px"  alt="이미지가 없는 첨부파일"><img class ="img_right img_star_reply" src="../resources/img/gray_star_right.png" width="10px" height="20px"  alt="이미지가 없는 첨부파일" ><img class ="img_left img_star_reply" src="../resources/img/gray_star_left.png" width="10px" height="20px"  alt="이미지가 없는 첨부파일" ><img class ="img_right img_star_reply" src="../resources/img/gray_star_right.png" width="10px" height="20px"  alt="이미지가 없는 첨부파일" ><img class ="img_left img_star_reply" src="../resources/img/gray_star_left.png" width="10px" height="20px"  alt="이미지가 없는 첨부파일"><img class ="img_right img_star_reply" src="../resources/img/gray_star_right.png" width="10px" height="20px"  alt="이미지가 없는 첨부파일"><img class ="img_left img_star_reply" src="../resources/img/gray_star_left.png" width="10px" height="20px"  alt="이미지가 없는 첨부파일"><img class ="img_right img_star_reply" src="../resources/img/gray_star_right.png" width="10px" height="20px"  alt="이미지가 없는 첨부파일">
								&nbsp;<span class="star_notice_reply">1.0</span>
							</c:when>
							<c:when test="${boardReplyList[rowNum-1].del_or_not eq 2}">
								<img class ="img_left img_star_reply" src="../resources/img/yellow_star_left.png" width="10px" height="20px"  alt="이미지가 없는 첨부파일"><img class ="img_right img_star_reply" src="../resources/img/yellow_star_right.png" width="10px" height="20px"  alt="이미지가 없는 첨부파일"><img class ="img_left img_star_reply" src="../resources/img/yellow_star_left.png" width="10px" height="20px"  alt="이미지가 없는 첨부파일"><img class ="img_right img_star_reply" src="../resources/img/gray_star_right.png" width="10px" height="20px"  alt="이미지가 없는 첨부파일" ><img class ="img_left img_star_reply" src="../resources/img/gray_star_left.png" width="10px" height="20px"  alt="이미지가 없는 첨부파일" ><img class ="img_right img_star_reply" src="../resources/img/gray_star_right.png" width="10px" height="20px"  alt="이미지가 없는 첨부파일" ><img class ="img_left img_star_reply" src="../resources/img/gray_star_left.png" width="10px" height="20px"  alt="이미지가 없는 첨부파일"><img class ="img_right img_star_reply" src="../resources/img/gray_star_right.png" width="10px" height="20px"  alt="이미지가 없는 첨부파일"><img class ="img_left img_star_reply" src="../resources/img/gray_star_left.png" width="10px" height="20px"  alt="이미지가 없는 첨부파일"><img class ="img_right img_star_reply" src="../resources/img/gray_star_right.png" width="10px" height="20px"  alt="이미지가 없는 첨부파일">
								&nbsp;<span class="star_notice_reply">1.5</span>
							</c:when>
							<c:when test="${boardReplyList[rowNum-1].del_or_not eq 3}">
								<img class ="img_left img_star_reply" src="../resources/img/yellow_star_left.png" width="10px" height="20px"  alt="이미지가 없는 첨부파일"><img class ="img_right img_star_reply" src="../resources/img/yellow_star_right.png" width="10px" height="20px"  alt="이미지가 없는 첨부파일"><img class ="img_left img_star_reply" src="../resources/img/yellow_star_left.png" width="10px" height="20px"  alt="이미지가 없는 첨부파일"><img class ="img_right img_star_reply" src="../resources/img/yellow_star_right.png" width="10px" height="20px"  alt="이미지가 없는 첨부파일" ><img class ="img_left img_star_reply" src="../resources/img/gray_star_left.png" width="10px" height="20px"  alt="이미지가 없는 첨부파일" ><img class ="img_right img_star_reply" src="../resources/img/gray_star_right.png" width="10px" height="20px"  alt="이미지가 없는 첨부파일" ><img class ="img_left img_star_reply" src="../resources/img/gray_star_left.png" width="10px" height="20px"  alt="이미지가 없는 첨부파일"><img class ="img_right img_star_reply" src="../resources/img/gray_star_right.png" width="10px" height="20px"  alt="이미지가 없는 첨부파일"><img class ="img_left img_star_reply" src="../resources/img/gray_star_left.png" width="10px" height="20px"  alt="이미지가 없는 첨부파일"><img class ="img_right img_star_reply" src="../resources/img/gray_star_right.png" width="10px" height="20px"  alt="이미지가 없는 첨부파일">
								&nbsp;<span class="star_notice_reply">2.0</span>
							</c:when>
							<c:when test="${boardReplyList[rowNum-1].del_or_not eq 4}">
								<img class ="img_left img_star_reply" src="../resources/img/yellow_star_left.png" width="10px" height="20px"  alt="이미지가 없는 첨부파일"><img class ="img_right img_star_reply" src="../resources/img/yellow_star_right.png" width="10px" height="20px"  alt="이미지가 없는 첨부파일"><img class ="img_left img_star_reply" src="../resources/img/yellow_star_left.png" width="10px" height="20px"  alt="이미지가 없는 첨부파일"><img class ="img_right img_star_reply" src="../resources/img/yellow_star_right.png" width="10px" height="20px"  alt="이미지가 없는 첨부파일" ><img class ="img_left img_star_reply" src="../resources/img/yellow_star_left.png" width="10px" height="20px"  alt="이미지가 없는 첨부파일" ><img class ="img_right img_star_reply" src="../resources/img/gray_star_right.png" width="10px" height="20px"  alt="이미지가 없는 첨부파일" ><img class ="img_left img_star_reply" src="../resources/img/gray_star_left.png" width="10px" height="20px"  alt="이미지가 없는 첨부파일"><img class ="img_right img_star_reply" src="../resources/img/gray_star_right.png" width="10px" height="20px"  alt="이미지가 없는 첨부파일"><img class ="img_left img_star_reply" src="../resources/img/gray_star_left.png" width="10px" height="20px"  alt="이미지가 없는 첨부파일"><img class ="img_right img_star_reply" src="../resources/img/gray_star_right.png" width="10px" height="20px"  alt="이미지가 없는 첨부파일">
								&nbsp;<span class="star_notice_reply">2.5</span>
							</c:when>
							<c:when test="${boardReplyList[rowNum-1].del_or_not eq 5}">
								<img class ="img_left img_star_reply" src="../resources/img/yellow_star_left.png" width="10px" height="20px"  alt="이미지가 없는 첨부파일"><img class ="img_right img_star_reply" src="../resources/img/yellow_star_right.png" width="10px" height="20px"  alt="이미지가 없는 첨부파일"><img class ="img_left img_star_reply" src="../resources/img/yellow_star_left.png" width="10px" height="20px"  alt="이미지가 없는 첨부파일"><img class ="img_right img_star_reply" src="../resources/img/yellow_star_right.png" width="10px" height="20px"  alt="이미지가 없는 첨부파일" ><img class ="img_left img_star_reply" src="../resources/img/yellow_star_left.png" width="10px" height="20px"  alt="이미지가 없는 첨부파일" ><img class ="img_right img_star_reply" src="../resources/img/yellow_star_right.png" width="10px" height="20px"  alt="이미지가 없는 첨부파일" ><img class ="img_left img_star_reply" src="../resources/img/gray_star_left.png" width="10px" height="20px"  alt="이미지가 없는 첨부파일"><img class ="img_right img_star_reply" src="../resources/img/gray_star_right.png" width="10px" height="20px"  alt="이미지가 없는 첨부파일"><img class ="img_left img_star_reply" src="../resources/img/gray_star_left.png" width="10px" height="20px"  alt="이미지가 없는 첨부파일"><img class ="img_right img_star_reply" src="../resources/img/gray_star_right.png" width="10px" height="20px"  alt="이미지가 없는 첨부파일">
								&nbsp;<span class="star_notice_reply">3.0</span>
							</c:when>
							<c:when test="${boardReplyList[rowNum-1].del_or_not eq 6}">
								<img class ="img_left img_star_reply" src="../resources/img/yellow_star_left.png" width="10px" height="20px"  alt="이미지가 없는 첨부파일"><img class ="img_right img_star_reply" src="../resources/img/yellow_star_right.png" width="10px" height="20px"  alt="이미지가 없는 첨부파일"><img class ="img_left img_star_reply" src="../resources/img/yellow_star_left.png" width="10px" height="20px"  alt="이미지가 없는 첨부파일"><img class ="img_right img_star_reply" src="../resources/img/yellow_star_right.png" width="10px" height="20px"  alt="이미지가 없는 첨부파일" ><img class ="img_left img_star_reply" src="../resources/img/yellow_star_left.png" width="10px" height="20px"  alt="이미지가 없는 첨부파일" ><img class ="img_right img_star_reply" src="../resources/img/yellow_star_right.png" width="10px" height="20px"  alt="이미지가 없는 첨부파일" ><img class ="img_left img_star_reply" src="../resources/img/yellow_star_left.png" width="10px" height="20px"  alt="이미지가 없는 첨부파일"><img class ="img_right img_star_reply" src="../resources/img/gray_star_right.png" width="10px" height="20px"  alt="이미지가 없는 첨부파일"><img class ="img_left img_star_reply" src="../resources/img/gray_star_left.png" width="10px" height="20px"  alt="이미지가 없는 첨부파일"><img class ="img_right img_star_reply" src="../resources/img/gray_star_right.png" width="10px" height="20px"  alt="이미지가 없는 첨부파일">
								&nbsp;<span class="star_notice_reply">3.5</span>
							</c:when>
							<c:when test="${boardReplyList[rowNum-1].del_or_not eq 7}">								
								<img class ="img_left img_star_reply" src="../resources/img/yellow_star_left.png" width="10px" height="20px"  alt="이미지가 없는 첨부파일"><img class ="img_right img_star_reply" src="../resources/img/yellow_star_right.png" width="10px" height="20px"  alt="이미지가 없는 첨부파일"><img class ="img_left img_star_reply" src="../resources/img/yellow_star_left.png" width="10px" height="20px"  alt="이미지가 없는 첨부파일"><img class ="img_right img_star_reply" src="../resources/img/yellow_star_right.png" width="10px" height="20px"  alt="이미지가 없는 첨부파일" ><img class ="img_left img_star_reply" src="../resources/img/yellow_star_left.png" width="10px" height="20px"  alt="이미지가 없는 첨부파일" ><img class ="img_right img_star_reply" src="../resources/img/yellow_star_right.png" width="10px" height="20px"  alt="이미지가 없는 첨부파일" ><img class ="img_left img_star_reply" src="../resources/img/yellow_star_left.png" width="10px" height="20px"  alt="이미지가 없는 첨부파일"><img class ="img_right img_star_reply" src="../resources/img/yellow_star_right.png" width="10px" height="20px"  alt="이미지가 없는 첨부파일"><img class ="img_left img_star_reply" src="../resources/img/gray_star_left.png" width="10px" height="20px"  alt="이미지가 없는 첨부파일"><img class ="img_right img_star_reply" src="../resources/img/gray_star_right.png" width="10px" height="20px"  alt="이미지가 없는 첨부파일">
								&nbsp;<span class="star_notice_reply">4.0</span>
							</c:when>
							<c:when test="${boardReplyList[rowNum-1].del_or_not eq 8}">
								<img class ="img_left img_star_reply" src="../resources/img/yellow_star_left.png" width="10px" height="20px"  alt="이미지가 없는 첨부파일"><img class ="img_right img_star_reply" src="../resources/img/yellow_star_right.png" width="10px" height="20px"  alt="이미지가 없는 첨부파일"><img class ="img_left img_star_reply" src="../resources/img/yellow_star_left.png" width="10px" height="20px"  alt="이미지가 없는 첨부파일"><img class ="img_right img_star_reply" src="../resources/img/yellow_star_right.png" width="10px" height="20px"  alt="이미지가 없는 첨부파일" ><img class ="img_left img_star_reply" src="../resources/img/yellow_star_left.png" width="10px" height="20px"  alt="이미지가 없는 첨부파일" ><img class ="img_right img_star_reply" src="../resources/img/yellow_star_right.png" width="10px" height="20px"  alt="이미지가 없는 첨부파일" ><img class ="img_left img_star_reply" src="../resources/img/yellow_star_left.png" width="10px" height="20px"  alt="이미지가 없는 첨부파일"><img class ="img_right img_star_reply" src="../resources/img/yellow_star_right.png" width="10px" height="20px"  alt="이미지가 없는 첨부파일"><img class ="img_left img_star_reply" src="../resources/img/yellow_star_left.png" width="10px" height="20px"  alt="이미지가 없는 첨부파일"><img class ="img_right img_star_reply" src="../resources/img/gray_star_right.png" width="10px" height="20px"  alt="이미지가 없는 첨부파일">
								&nbsp;<span class="star_notice_reply">4.5</span>
							</c:when>
							<c:when test="${boardReplyList[rowNum-1].del_or_not eq 9}">
								<img class ="img_left img_star_reply" src="../resources/img/yellow_star_left.png" width="10px" height="20px"  alt="이미지가 없는 첨부파일"><img class ="img_right img_star_reply" src="../resources/img/yellow_star_right.png" width="10px" height="20px"  alt="이미지가 없는 첨부파일"><img class ="img_left img_star_reply" src="../resources/img/yellow_star_left.png" width="10px" height="20px"  alt="이미지가 없는 첨부파일"><img class ="img_right img_star_reply" src="../resources/img/yellow_star_right.png" width="10px" height="20px"  alt="이미지가 없는 첨부파일" ><img class ="img_left img_star_reply" src="../resources/img/yellow_star_left.png" width="10px" height="20px"  alt="이미지가 없는 첨부파일" ><img class ="img_right img_star_reply" src="../resources/img/yellow_star_right.png" width="10px" height="20px"  alt="이미지가 없는 첨부파일" ><img class ="img_left img_star_reply" src="../resources/img/yellow_star_left.png" width="10px" height="20px"  alt="이미지가 없는 첨부파일"><img class ="img_right img_star_reply" src="../resources/img/yellow_star_right.png" width="10px" height="20px"  alt="이미지가 없는 첨부파일"><img class ="img_left img_star_reply" src="../resources/img/yellow_star_left.png" width="10px" height="20px"  alt="이미지가 없는 첨부파일"><img class ="img_right img_star_reply" src="../resources/img/yellow_star_right.png" width="10px" height="20px"  alt="이미지가 없는 첨부파일">
								&nbsp;<span class="star_notice_reply">5.0</span>
							</c:when>							
							</c:choose>							
						</div>
						<input type="text" class="content_edit" id="content_edit" name="content" value="${boardReplyList[rowNum-1].content}" readonly>
						<input type="hidden" class="reply_edit_cancle_btn" name="reply_edit_cancle_btn" value="취소">
						<input type="hidden" class="reply_edit_submit_btn" name="reply_edit_submit_btn" value="수정">
						<input type="hidden" name="board_idx" id="board_idx" value="${onelineBoardVo.board_idx}">
						<input type="hidden" class="member_idx_class" name="member_idx" id="member_idx" value="${membership.member_idx}">
						<input type="hidden" name="reply_idx" id="reply_idx" value="${boardReplyList[rowNum-1].reply_idx}">
						<input type="hidden" name="member_nickname" id="member_nickname" value="${membership.member_nickname}">	
						<input type="hidden" name="del_or_not" class="reply_star_score" id="confirm_del_or_not" value="${boardReplyList[rowNum-1].del_or_not}">
						<input type="hidden" id="reply_del_or_not" value="${boardReplyList[rowNum-1].del_or_not}">
						<input type="hidden" name="replyCnt" id="replyCnt" value="${replyCnt}">
						<c:choose>							
							<c:when test="${(membership.grade eq 1) or (!empty membership and (membership.member_idx eq boardReplyList[rowNum-1].member_idx))}">
								<input type="button" class="reply_edit_button" name="reply_edit" id="reply_edit" value="수정">
								<input type="button" class="reply_delete_button" name="reply_delete" id="reply_delete" value="삭제">				
							</c:when>
							<c:otherwise>
								<input type="hidden" class="reply_edit_button" name="reply_edit" id="reply_edit" value="수정">
								<input type="hidden" class="reply_delete_button" name="reply_delete" id="reply_delete" value="삭제">
							</c:otherwise>
						</c:choose>
					</form>
				</td>
			</tr>				
			<tr><td class="td_big_space" colspan="5"></td></tr>
			</c:forEach>			
		</c:otherwise>			
		</c:choose>
		<tr>
			<td id="td_reply_paging" colspan="5">
				<%@ include file="../oneline_board/paging_reply.jsp" %>	
			</td>
		</tr>
		<tr>
			<td class="td_big_space" colspan="5">
			</td>
		</tr>
		<tr>
			<td id="td_back" colspan="3">
				<input type="button" name="cancle_btn" id="cancle_btn" value="뒤로" onclick="history.back()">
			</td>
			<td id="td_back_side" colspan="2">
			<a href="../oneline_board/list.do"><input type="button" name="list" id="list" value="목록"></a>
			</td>
		</tr>
		</table>
		
		
				
	</div>	
	<footer id="main-footer">
		<jsp:include page="../main/footer.jsp" />
	</footer>
</body>
</html>