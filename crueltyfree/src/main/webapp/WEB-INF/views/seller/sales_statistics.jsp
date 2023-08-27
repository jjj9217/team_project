<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List, java.util.HashMap, java.util.Map" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>매출 통계 | CrueltyFree</title>
<link rel="icon" href="${pageContext.request.contextPath}/resources/img/favicon1.png">

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
		float:left;

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
		width:740px;
		float:right;
		margin-left:10px;
		height:900px;
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
        .reviewModifyup, .reviewModifyup2{
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
    
    #doughnut-chart{
        float:left;
    }
    
    #doughnut-chart2{
        float:right;
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




	
	<div id="content">
        <article class="sub_title">
            <h5>매출 통계</h5>
        </article> 
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>
        <canvas id="mixed-chart" width="720" height="360"></canvas>
        <div id = "doughnut">
        <canvas id="doughnut-chart" width="360" height="240"></canvas>       
        <canvas id="doughnut-chart2" width="360" height="240"></canvas>
        </div>
    </div>
    
    
    
  
	
	
	<div id="tap">
		<ul class="list">
		    <li><a href="sales_statistics.do"  style="background-color: #7d99a4; color:#ffffff; font-weight: bold;">매출 통계</a></li>
			<li><a href="purchase_history.do">구매 내역</a></li>
			<li><a href="confirm_inq.do">문의 확인</a></li>
			<li><a href="check_pro.do">등록 상품 확인</a></li>
		</ul>
		<a href="regi_pro.do"><button class="pro_register">상품 등록하기</button></a>
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
        var index = $(".oneinqModifyup2").index(this);
        
        $(".modal_modify2").eq(index).removeClass("hidden");    
        $(".oneModifyModal2").each(function(){
        	this.reset();
        });
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
        $(".oneModifyModal").each(function(){
        	this.reset();
        });
    });
        
    //수정 띄운 모달의 x버튼 클릭시 모달 닫기    
    $(".close_modalmodify2").click(function(){
        var index2 = $(".close_modalmodify2").index(this);
        
        $(".modal_modify2").eq(index2).addClass("hidden");
    });
});
</script>

<!-- 매출그래프 -->
<script>
new Chart(document.getElementById("mixed-chart"), {
    type: 'bar',
    data: {
      labels: ["1900", "1950", "1999", "2050"],
      datasets: [{
          label: "Europe",
          type: "line",
          borderColor: "#8e5ea2",
          data: [408,547,675,734],
          fill: false
        }, {
          label: "Africa",
          type: "line",
          borderColor: "#3e95cd",
          data: [133,221,783,2478],
          fill: false
        }, {
          label: "Europe",
          type: "bar",
          backgroundColor: "rgba(0,0,0,0.2)",
          data: [408,547,675,734],
        }, {
          label: "Africa",
          type: "bar",
          backgroundColor: "rgba(0,0,0,0.2)",
          backgroundColorHover: "#3e95cd",
          data: [133,221,783,2478]
        }
      ]
    },
    options: {
      responsive: false,
      title: {
        display: true,
        text: 'Population growth (millions): Europe & Africa'
      },
      legend: { display: false }
    }
});
</script>

<!-- 도넛차트 -->
<script>
new Chart(document.getElementById("doughnut-chart"), {
    type: 'doughnut',
    data: {
      labels: ["Africa", "Asia", "Europe", "Latin America", "North America"],
      datasets: [
        {
          label: "Population (millions)",
          backgroundColor: ["#3e95cd", "#8e5ea2","#3cba9f","#e8c3b9","#c45850"],
          data: [2478,5267,734,784,433]
        }
      ]
    },
    options: {
      responsive: false,
      title: {
        display: true,
        text: 'Predicted world population (millions) in 2050'
      }
    }
});

new Chart(document.getElementById("doughnut-chart2"), {
    type: 'doughnut',
    data: {
      labels: ["Africa", "Asia", "Europe", "Latin America", "North America"],
      datasets: [
        {
          label: "Population (millions)",
          backgroundColor: ["#3e95cd", "#8e5ea2","#3cba9f","#e8c3b9","#c45850"],
          data: [2478,5267,734,784,433]
        }
      ]
    },
    options: {
      responsive: false,
      title: {
        display: true,
        text: 'Predicted world population (millions) in 2050'
      }
    }
});
</script>

<footer>
	<jsp:include page="../main/footer.jsp" />
</footer>

</body>
</html>