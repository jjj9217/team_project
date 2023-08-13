<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List, java.util.HashMap, java.util.Map" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>  
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
        height: auto;
    }

    #list_tit{
        width: 350px;
        height: 40px;
        
    }

    .detailSearch{
        width: 1020px;
        height: 112px;
        
        display: flex;
        justify-content: center;
        align-items: center;
    }

    


    .cate_info_tx {
        margin: 20px 0 20px;
        font-size: 20px;
        color: #222;
        text-align: center;
    
    }

    ul li{      
        list-style:none;
        float: left;
    }   


    .price_input{
        width: 78px;
        height: 26px;
        padding-left: 10px;
        padding-right: 10px;
        border: 1px;
        margin: 0;
    }

    .cate_sort_box{
        width: 1020px;
        height: 49px;
    
    }

    .cate_sort{
        float: left;
        width: 839px;
        height: 35px;
        padding-top: 10px;
    
    }

    .cate_view{
        float: left;
        width: 181px;
        height: 35px;
        padding-top: 10px;  
        
    }

    .cate_view a {
        text-decoration: none;
        color: black;
    }

    .cate_sort_tit{
        float: left;
        width: 595px;
        height: 30px;
        
        padding: 0;
        margin: 0;
    }

    .cate_sort_tit li{
        width: 103px;
        height: 20px;
        padding-left: 1px;
    }




    /* 상품목록복붙 */

    .product_list_background{
        width: 100%;
        height: 301px;
        
    }




    .product_list{
            width: 300px;
            height: 301px;
            
            display: flex;
            justify-content: center;
            align-items: center;
        }
        .prd_info{
            width: 180px;
            height: 290px;
            
        }

    .prd_price{
            width: 180px;
            height: 25px;
            
            text-align: center;
            font-size: 14px;
            line-height: 25px;
    }



    .prd_name{
            width: 180px;
            height: 55px;

    }

    .prd_title{     
            text-align: center;
            font-size: 14px;
            line-height: 55px;
    }


    .goodlist_thumb_background{
            width: 180px;
            height: 180px;
            
        
    }
    
    .goodlist_thumb{
            width: 180px;
            height: 180px;
            
    }




    #imgArea{
            width: 100%;
            height: 80px;
            padding-inline-start: 0px;
            
            display : flex;
            justify-content: center;
            align-items : center;
            text-align: center;
        }

        #imgArea li{
            width: 120px;
            height: 80px;
            float: left;
        }

        .btn_img_add{
            width: 80px;
            height: 80px;
        }

        .rw-photo-list p{
            font-size: 10px;
            text-align: center;
            
        }

        .category_small_img{
            width: 75px;
            height: 75px;
        }


	.paging{
        width:1020px;
        height:150px;
        float:left;
        display: flex;
        justify-content: center;
        align-items: center;
    }

	#td_paging{
        height: 70px;
        font: 20px Arial, Sans-serif;
        text-align: center;
        border-color: white;
        background-color: orange;
        
    }


</style>














































</head>

<body>
<div class="head">
	<header>    
        <jsp:include page="../main/header.jsp"/>    
    </header>
    
<!-- body시작 -->

<div id="Container">
	<c:choose>
		<c:when test="">
			<!--     큰 카테고리로 진입시 -->
		    <div id="list_tit">
		        ${untitled}큰카테고리명
		    </div>		
		</c:when>
		<c:when test="">
			<!--     작은 카테고리로 진입시 -->
		    <div id="list_tit">
		        ${untitled}작은카테고리명
		    </div>		
		</c:when>
		<c:otherwise>
		</c:otherwise>
	</c:choose>




   
    <c:choose>
    	<c:when test="">    	
		<!--     스킨 3개 -->
		    <div class="detailSearch">
		        <ul id="imgArea">
		            <li class="imgArea1">
		                <button class="btn_img_add btn-add" data-attr="리뷰작성^사진첨부^이미지클릭^1"><img class="category_small_img" src="category_small_1.png"></button>
		                <form class="frmImg" enctype="multipart/form-data" method="POST">
		                    <input type="file" id="tmpFile1" class="tempFile" name="upload" style="display: none;">
		                </form>
		            </li>
		            <li class="imgArea2">
		                <button class="btn_img_add btn-add" data-attr="리뷰작성^사진첨부^이미지클릭^2"><img class="category_small_img" src="category_small_2.png"></button>
		                <form class="frmImg" enctype="multipart/form-data" method="POST">
		                    <input type="file" id="tmpFile2" class="tempFile" name="upload" style="display: none;">
		                </form>
		            </li>
		            <li class="imgArea3">
		                <button class="btn_img_add btn-add" data-attr="리뷰작성^사진첨부^이미지클릭^3"><img class="category_small_img" src="category_small_3.png"></button>
		                <form class="frmImg" enctype="multipart/form-data" method="POST">
		                    <input type="file" id="tmpFile3" class="tempFile" name="upload" style="display: none;">
		                </form>
		            </li>
		        </ul>
		    </div>
		</c:when>
    	
    	<c:when test="">    		    		   
		<!--     클렌징 2개 -->
		    <div class="detailSearch">
		        <ul id="imgArea">
		            <li class="imgArea1">
		                <button class="btn_img_add btn-add" data-attr="리뷰작성^사진첨부^이미지클릭^1"><img class="category_small_img" src="category_small_1.png"></button>
		                <form class="frmImg" enctype="multipart/form-data" method="POST">
		                    <input type="file" id="tmpFile1" class="tempFile" name="upload" style="display: none;">
		                </form>
		            </li>
		            <li class="imgArea2">
		                <button class="btn_img_add btn-add" data-attr="리뷰작성^사진첨부^이미지클릭^2"><img class="category_small_img" src="category_small_2.png"></button>
		                <form class="frmImg" enctype="multipart/form-data" method="POST">
		                    <input type="file" id="tmpFile2" class="tempFile" name="upload" style="display: none;">
		                </form>
		            </li>
		        </ul>
		    </div>
		</c:when>
    	    
		<c:when test="">    
		<!--     메이크업3개 -->
		    <div class="detailSearch">
		        <ul id="imgArea">
		            <li class="imgArea1">
		                <button class="btn_img_add btn-add" data-attr="리뷰작성^사진첨부^이미지클릭^1"><img class="category_small_img" src="category_small_1.png"></button>
		                <form class="frmImg" enctype="multipart/form-data" method="POST">
		                    <input type="file" id="tmpFile1" class="tempFile" name="upload" style="display: none;">
		                </form>
		            </li>
		            <li class="imgArea2">
		                <button class="btn_img_add btn-add" data-attr="리뷰작성^사진첨부^이미지클릭^2"><img class="category_small_img" src="category_small_2.png"></button>
		                <form class="frmImg" enctype="multipart/form-data" method="POST">
		                    <input type="file" id="tmpFile2" class="tempFile" name="upload" style="display: none;">
		                </form>
		            </li>
		            <li class="imgArea3">
		                <button class="btn_img_add btn-add" data-attr="리뷰작성^사진첨부^이미지클릭^3"><img class="category_small_img" src="category_small_3.png"></button>
		                <form class="frmImg" enctype="multipart/form-data" method="POST">
		                    <input type="file" id="tmpFile3" class="tempFile" name="upload" style="display: none;">
		                </form>
		            </li>
		        </ul>
		    </div>
		</c:when>
    	    
		<c:when test="">    
		<!--     바디케어2개 -->
		    <div class="detailSearch">
		        <ul id="imgArea">
		            <li class="imgArea1">
		                <button class="btn_img_add btn-add" data-attr="리뷰작성^사진첨부^이미지클릭^1"><img class="category_small_img" src="category_small_1.png"></button>
		                <form class="frmImg" enctype="multipart/form-data" method="POST">
		                    <input type="file" id="tmpFile1" class="tempFile" name="upload" style="display: none;">
		                </form>
		            </li>
		            <li class="imgArea2">
		                <button class="btn_img_add btn-add" data-attr="리뷰작성^사진첨부^이미지클릭^2"><img class="category_small_img" src="category_small_2.png"></button>
		                <form class="frmImg" enctype="multipart/form-data" method="POST">
		                    <input type="file" id="tmpFile2" class="tempFile" name="upload" style="display: none;">
		                </form>
		            </li>
		        </ul>
		    </div>
		</c:when>
    	    
		<c:when test="">    
		<!--     헤어케어2개 -->
		    <div class="detailSearch">
		        <ul id="imgArea">
		            <li class="imgArea1">
		                <button class="btn_img_add btn-add" data-attr="리뷰작성^사진첨부^이미지클릭^1"><img class="category_small_img" src="category_small_1.png"></button>
		                <form class="frmImg" enctype="multipart/form-data" method="POST">
		                    <input type="file" id="tmpFile1" class="tempFile" name="upload" style="display: none;">
		                </form>
		            </li>
		            <li class="imgArea2">
		                <button class="btn_img_add btn-add" data-attr="리뷰작성^사진첨부^이미지클릭^2"><img class="category_small_img" src="category_small_2.png"></button>
		                <form class="frmImg" enctype="multipart/form-data" method="POST">
		                    <input type="file" id="tmpFile2" class="tempFile" name="upload" style="display: none;">
		                </form>
		            </li>
		        </ul>
		    </div>
		</c:when>
    	    
		<c:when test="">    
		<!-- 	미용소품0개 -->
		    <div class="detailSearch">
		        <ul id="imgArea">
		            
		        </ul>
		    </div>
    	</c:when>
          
    	<c:otherwise>
    	</c:otherwise>
    </c:choose>
    
    
    
    
    
    
    
    
       
        <p class="cate_info_tx">
            전체<span>${pageNav.totalRows}</span>개의 상품이 등록되어 있습니다.
        </p>
        <div class="cate_sort_box">
            <div class="cate_sort">
                <ul class="cate_sort_tit">
                  <li>                    
                    <form name="sort_salecount" action="product_list_enter_searchword.do" method="get">
                        <input type="hidden" name="sort_salecount" value="1">
                    </form>
                    <a href="#" onclick="ProductDetail('${ExploreVo.searchWord}', '${ExploreVo.category_code}', '${ExploreVo.category_code_small}', '${ExploreVo.product_price_min}', '${ExploreVo.product_price_max}', '1', '${ExploreVo.sort_view}', '${pageNav.pageNum}', '${pageNav.pageBlock}')">판매수량순</a>                
                    </li>
                                        
                    <li>                                       
                    <a href="#" onclick="ProductDetail('${ExploreVo.searchWord}', '${ExploreVo.category_code}', '${ExploreVo.category_code_small}', '${ExploreVo.product_price_min}', '${ExploreVo.product_price_max}', '2', '${ExploreVo.sort_view}', '${pageNav.pageNum}', '${pageNav.pageBlock}')">최근등록순</a>                  
                    </li>                    
                    
                    <li>                                        
                    <a href="#" onclick="ProductDetail('${ExploreVo.searchWord}', '${ExploreVo.category_code}', '${ExploreVo.category_code_small}', '${ExploreVo.product_price_min}', '${ExploreVo.product_price_max}', '3', '${ExploreVo.sort_view}', '${pageNav.pageNum}', '${pageNav.pageBlock}')">평점순</a>                    
                    </li>
                    
                    <li>                                        
                    <a href="#" onclick="ProductDetail('${ExploreVo.searchWord}', '${ExploreVo.category_code}', '${ExploreVo.category_code_small}', '${ExploreVo.product_price_min}', '${ExploreVo.product_price_max}', '4', '${ExploreVo.sort_view}', '${pageNav.pageNum}', '${pageNav.pageBlock}')">높은가격순</a>                    
                    </li>
                    
                    <li>                                        
                    <a href="#" onclick="ProductDetail('${ExploreVo.searchWord}', '${ExploreVo.category_code}', '${ExploreVo.category_code_small}', '${ExploreVo.product_price_min}', '${ExploreVo.product_price_max}', '5', '${ExploreVo.sort_view}', '${pageNav.pageNum}', '${pageNav.pageBlock}')">낮은가격순</a>                   
                    </li>
                    
                </ul>
            </div>
            <div class="cate_view">
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;View&nbsp;
                
                <ul>
	                <li>
	                    <a href="#" onclick="ProductDetail('${ExploreVo.searchWord}', '${ExploreVo.category_code}', '${ExploreVo.category_code_small}', '${ExploreVo.product_price_min}', '${ExploreVo.product_price_max}', '${ExploreVo.sort_salecount}', '15', '${pageNav.pageNum}', '${pageNav.pageBlock}')">15</a>&nbsp;
	                </li>    
	                <li>
	                    <a href="#" onclick="ProductDetail('${ExploreVo.searchWord}', '${ExploreVo.category_code}', '${ExploreVo.category_code_small}', '${ExploreVo.product_price_min}', '${ExploreVo.product_price_max}', '${ExploreVo.sort_salecount}', '30', '${pageNav.pageNum}', '${pageNav.pageBlock}')">30</a>&nbsp;
	                </li>    
	                <li>	                    
	                    <a href="#" onclick="ProductDetail('${ExploreVo.searchWord}', '${ExploreVo.category_code}', '${ExploreVo.category_code_small}', '${ExploreVo.product_price_min}', '${ExploreVo.product_price_max}', '${ExploreVo.sort_salecount}', '45', '${pageNav.pageNum}', '${pageNav.pageBlock}')">45</a>	                    
	                </li>           
                </ul>
                
                
                
                
                
                
                
            </div>
        </div>
        <div class="product_list_background">               
            <ul>                
                <c:forEach var="rowNum" begin="${pageNav.startNum}" end="${pageNav.endNum}">
	               <c:if test="${!empty productList[rowNum-1].product_name}">
		                <li class="product_list">
		                    <div class="prd_info">                    
		                        <div class="goodlist_thumb_background">
		                            <a href="#"><img class="goodlist_thumb" src="${pageContext.request.contextPath}/resources/uploads/${fileList[rowNum-1].saveFile}"></a>
		                        </div>
		                        <div class="prd_name">                        
		                            <a href="#" class="goodlist">
		                                <p class="prd_title">${productList[rowNum-1].product_name}</p>
		                            </a>
		                        </div>
		                        <p class="prd_price">${productList[rowNum-1].product_price}원</p>     
		                   </div>
		                </li>
                   </c:if>		                
                </c:forEach>              
           </ul>
           <div class="paging">
	            <table>
		            <tr>
			            <td id="td_paging" colspan="6">
			            
			            
			            
			            
			            
			            
			            
			            <c:if test="${pageNav.pageNum > pageNav.pages_per_block}">
			<a href="#" onclick="ProductDetail('${ExploreVo.searchWord}', '${ExploreVo.category_code}', '${ExploreVo.category_code_small}', '${ExploreVo.product_price_min}', '${ExploreVo.product_price_max}', '${ExploreVo.sort_salecount}', '${ExploreVo.sort_view}', '1', '1')">			            
    		&lt;&lt;</a>&nbsp;
    		<a href="#" onclick="ProductDetail('${ExploreVo.searchWord}', '${ExploreVo.category_code}', '${ExploreVo.category_code_small}', '${ExploreVo.product_price_min}', '${ExploreVo.product_price_max}', '${ExploreVo.sort_salecount}', '${ExploreVo.sort_view}', '${(pageNav.pageBlock - 2)*pageNav.pages_per_block + 1}', '${pageNav.pageBlock-1}')">
    			&lt;이전페이지
    		</a>   	
    	</c:if>
			            
			            <c:forEach var="i" begin="${(pageNav.pageBlock-1)*pageNav.pages_per_block + 1}" end="${pageNav.pageBlock*pageNav.pages_per_block}">
            <c:if test="${i le pageNav.totalPageNum}">
                <c:choose>
                    <c:when test = "${pageNav.pageNum eq i}">
                        <a href="#" onclick="ProductDetail('${ExploreVo.searchWord}', '${ExploreVo.category_code}', '${ExploreVo.category_code_small}', '${ExploreVo.product_price_min}', '${ExploreVo.product_price_max}', '${ExploreVo.sort_salecount}', '${ExploreVo.sort_view}', '${pageNav.pageNum}', '${pageNav.pageBlock}')">
                            <span style="color:red">${i}&nbsp;</span>
                        </a>
                    </c:when>
                    <c:otherwise>
                        <a href="#" onclick="ProductDetail('${ExploreVo.searchWord}', '${ExploreVo.category_code}', '${ExploreVo.category_code_small}', '${ExploreVo.product_price_min}', '${ExploreVo.product_price_max}', '${ExploreVo.sort_salecount}', '${ExploreVo.sort_view}', '${i}', '${pageNav.pageBlock}')">${i}&nbsp;</a>
                    </c:otherwise>
            </c:choose>
            </c:if>
        </c:forEach>
    
        <c:if test="${((pageNav.rows_per_page*pageNav.pages_per_block) lt pageNav.totalRows) and (pageNav.pageBlock ne pageNav.lastPageBlock) }">
            <a href="#" onclick="ProductDetail('${ExploreVo.searchWord}', '${ExploreVo.category_code}', '${ExploreVo.category_code_small}', '${ExploreVo.product_price_min}', '${ExploreVo.product_price_max}', '${ExploreVo.sort_salecount}', '${ExploreVo.sort_view}', '${pageNav.pageBlock*pageNav.pages_per_block+1}', '${pageNav.pageBlock+1}')">다음페이지&gt;</a>&nbsp;
            <a href="#" onclick="ProductDetail('${ExploreVo.searchWord}', '${ExploreVo.category_code}', '${ExploreVo.category_code_small}', '${ExploreVo.product_price_min}', '${ExploreVo.product_price_max}', '${ExploreVo.sort_salecount}', '${ExploreVo.sort_view}', '${pageNav.totalPageNum}', '${pageNav.lastPageBlock}')">&gt;&gt;</a>
        </c:if>
			            
			            
			            
			            
			            
			            
			            
			            
			            
			            
			            
			            
			            
			            
			            
			            
			            
			            
			            
			            
			                
			                
			                
			                
			                <!-- 페이지 네비게이션 구현 -->
			                <%-- <%@ include file="paging.jsp" %> --%>
			            </td>
		           </tr>
		        </table>   
           </div>           
    </div>
</div>
</div>




<!-- footer -->
<footer>
        <jsp:include page="../main/footer.jsp"/>        
    </footer>
</body>
</body>
</html>