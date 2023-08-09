<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>페이지네비게이션</title>
<style>
	#next{
		background-color:#7d99a4;
		border :0;
		color:white;
		font: bold 15px Arial, Sans-serif;
		border-radius:3px;
		width:50px;
		height:25px;
	}
	#end{
		background-color:rgb(221, 219, 214);
		border :0;
		font: bold 15px Arial, Sans-serif;
		border-radius:3px;
		width:50px;
		height:25px;
	}
</style>
</head>

<body>
    <!-- 검색어가 있는 경우와 없는 경우를 구분해서 페이징 처리함 -->
    <c:choose>
    	<c:when test="${!empty searchWord}"><!-- 검색어가 있는 경우 -->
    		    	<c:if test="${pageNav.pageNum > pageNav.pages_per_block}">
    		<a href="manager_41d1.do?pageNum=1&pageBlock=1&searchField=${searchField}&searchWord=${searchWord}"><input type="button" id="end" value="처음"></a>&nbsp;
    		<a href="manager_41d1.do?pageNum=${(pageNav.pageBlock - 2)*pageNav.pages_per_block + 1}&pageBlock=${pageNav.pageBlock-1}&searchField=${searchField}&searchWord=${searchWord}">
    			<input type="button" id="next" value="이전">
    		</a>   	
    	</c:if>
    	
    	<c:forEach var="i" begin="${(pageNav.pageBlock-1)*pageNav.pages_per_block + 1}" end="${pageNav.pageBlock*pageNav.pages_per_block}">
    		<c:if test="${i le pageNav.totalPageNum}">
    			<c:choose>
    				<c:when test = "${pageNav.pageNum eq i}">
    					<a href="manager_41d1.do?pageNum=${i}&pageBlock=${pageNav.pageBlock}&searchField=${searchField}&searchWord=${searchWord}">
    						<span style="color:red">${i}&nbsp;</span>
    					</a>
    				</c:when>
    				<c:otherwise>
    					<a href="manager_41d1.do?pageNum=${i}&pageBlock=${pageNav.pageBlock}&searchField=${searchField}&searchWord=${searchWord}">${i}&nbsp;</a>
    				</c:otherwise>
   			</c:choose>
    		</c:if>
    	</c:forEach>
    
    	<c:if test="${((pageNav.rows_per_page*pageNav.pages_per_block) lt pageNav.totalRows) and (pageNav.pageBlock ne pageNav.lastPageBlock) }">
    		<a href="manager_41d1.do?pageNum=${pageNav.pageBlock*pageNav.pages_per_block+1}&pageBlock=${pageNav.pageBlock+1}&searchField=${searchField}&searchWord=${searchWord}"><input type="button" id="next" value="다음"></a>&nbsp;
    		<a href="manager_41d1.do?pageNum=${pageNav.totalPageNum}&pageBlock=${pageNav.lastPageBlock}&searchField=${searchField}&searchWord=${searchWord}"><input type="button" id="end" value="마지막"></a>
    	</c:if>
    	</c:when>
    	
    	<c:otherwise><!-- 검색어가 없는 경우 -->
    		<c:if test="${pageNav.pageNum > pageNav.pages_per_block}">
    		<a href="manager_41d1.do?pageNum=1&pageBlock=1"><input type="button" id="end" value="처음"></a>&nbsp;
    		<a href="manager_41d1.do?pageNum=${(pageNav.pageBlock - 2)*pageNav.pages_per_block + 1}&pageBlock=${pageNav.pageBlock-1}">
    			<input type="button" id="next" value="이전">
    		</a>   	
    	</c:if>
    	
    	<c:forEach var="i" begin="${(pageNav.pageBlock-1)*pageNav.pages_per_block + 1}" end="${pageNav.pageBlock*pageNav.pages_per_block}">
    		<c:if test="${i le pageNav.totalPageNum}">
    			<c:choose>
    				<c:when test = "${pageNav.pageNum eq i}">
    					<a href="manager_41d1.do?pageNum=${i}&pageBlock=${pageNav.pageBlock}">
    						<span style="color:red">${i}&nbsp;</span>
    					</a>
    				</c:when>
    				<c:otherwise>
    					<a href="manager_41d1.do?pageNum=${i}&pageBlock=${pageNav.pageBlock}">${i}&nbsp;</a>
    				</c:otherwise>
   			</c:choose>
    		</c:if>
    	</c:forEach>
    
    	<c:if test="${((pageNav.rows_per_page*pageNav.pages_per_block) lt pageNav.totalRows) and (pageNav.pageBlock ne pageNav.lastPageBlock) }">
    		<a href="manager_41d1.do?pageNum=${pageNav.pageBlock*pageNav.pages_per_block+1}&pageBlock=${pageNav.pageBlock+1}"><input type="button" id="next" value="다음"></a>&nbsp;
    		<a href="manager_41d1.do?pageNum=${pageNav.totalPageNum}&pageBlock=${pageNav.lastPageBlock}"><input type="button" id="end" value="마지막"></a>
    	</c:if>
    	</c:otherwise>
    </c:choose>



</body>
</html>