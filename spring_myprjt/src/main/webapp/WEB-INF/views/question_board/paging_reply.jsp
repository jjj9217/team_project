<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>페이지 네비게이션</title>
<style>
.gray_button{
	width: 40px; height: 40px;
	background-color: rgb(244, 244, 244);
	color: rgb(64, 64, 64);
	border-width: 0;
	font-weight: bold;
	border-radius: 5px;
}
.blue_button{
	width: 40px; height: 40px;
	background-color: rgb(41, 128, 185);
	color: white;
	border-width: 0;
	font-weight: bold;
	border-radius: 5px;
}
</style>
</head>
<body>
	<c:choose>
			<%-- 검색어가 있을때의 페이징 --%>
            <c:when test="${!empty searchWord}">
                <c:if test="${pageNum > pages_per_block}">
                    <a href="view.do?no=${questionBoardVo.board_idx}&searchField=${searchField}&searchWord=${searchWord}&pageNum=1&pageBlock=1">
                    	<input class="gray_button" type="button" value="&lt;&lt;">
                    </a>
                    <a href="view.do?no=${questionBoardVo.board_idx}&searchField=${searchField}&searchWord=${searchWord}&pageNum=${(pageBlock -2)*pages_per_block + 1}&pageBlock=${pageBlock-1}">
                        <input class="gray_button" type="button" value="&lt;">
                    </a>
                </c:if>

                <c:forEach var="i" begin="${(pageBlock - 1)*pages_per_block + 1}" end="${pageBlock*pages_per_block}">
                    <c:if test="${i le totalPageNum}">
                        <c:choose>
                            <c:when test="${pageNum eq i}">
                                <a href="view.do?no=${questionBoardVo.board_idx}&searchField=${searchField}&searchWord=${searchWord}&pageNum=${i}&pageBlock=${pageBlock}">
                                    <input class="blue_button" type="button" value="${i}&nbsp;">                                    
                                </a>
                            </c:when>
                            <c:otherwise>
                                <a href="view.do?no=${questionBoardVo.board_idx}&searchField=${searchField}&searchWord=${searchWord}&pageNum=${i}&pageBlock=${pageBlock}">
                                	<input class="gray_button" type="button" value="${i}&nbsp;">
                                </a>
                            </c:otherwise>
                        </c:choose>
                    </c:if>
                </c:forEach>

                <c:if test="${((rows_per_page*pages_per_block) lt totalRows) and (pageBlock ne lastPageBlock)}">
                    <a href="view.do?no=${questionBoardVo.board_idx}&searchField=${searchField}&searchWord=${searchWord}&pageNum=${pageBlock*pages_per_block+1}&pageBlock=${pageBlock+1}">
                    	<input class="gray_button" type="button" value="&gt;">
                    </a>
                    <a href="view.do?no=${questionBoardVo.board_idx}&searchField=${searchField}&searchWord=${searchWord}&pageNum=${totalPageNum}&pageBlock=${lastPageBlock}">
                    	<input class="gray_button" type="button" value="&gt;&gt;">
                    </a>
                </c:if>
            </c:when>
            <%-- 일반 페이징 --%>
            <c:otherwise>
                <c:if test="${pageNum > pages_per_block}">
                    <a href="view.do?no=${questionBoardVo.board_idx}&pageNum=1&pageBlock=1">
                   		<input class="gray_button" type="button" value="&lt;&lt;">
                    </a>
                    <a href="view.do?no=${questionBoardVo.board_idx}&pageNum=${(pageBlock -2)*pages_per_block + 1}&pageBlock=${pageBlock-1}">
                        <input class="gray_button" type="button" value="&lt;">
                    </a>
                </c:if>

                <c:forEach var="i" begin="${(pageBlock - 1)*pages_per_block + 1}" end="${pageBlock*pages_per_block}">
                    <c:if test="${i le totalPageNum}">
                        <c:choose>
                            <c:when test="${pageNum eq i}">
                                <a href="view.do?no=${questionBoardVo.board_idx}&pageNum=${i}&pageBlock=${pageBlock}">
                                    <input class="blue_button" type="button" value="${i}&nbsp;"> 
                                </a>
                            </c:when>
                            <c:otherwise>
                                <a href="view.do?no=${questionBoardVo.board_idx}&pageNum=${i}&pageBlock=${pageBlock}">
                                	<input class="gray_button" type="button" value="${i}&nbsp;">
                                </a>
                            </c:otherwise>
                        </c:choose>
                    </c:if>
                </c:forEach>

                <c:if test="${((rows_per_page*pages_per_block) lt totalRows) and (pageBlock ne lastPageBlock)}">
                    <a href="view.do?no=${questionBoardVo.board_idx}&pageNum=${pageBlock*pages_per_block+1}&pageBlock=${pageBlock+1}">
                    	<input class="gray_button" type="button" value="&gt;">
                    </a>.do
                    <a href="view.do?no=${questionBoardVo.board_idx}&pageNum=${totalPageNum}&pageBlock=${lastPageBlock}">
                    	<input class="gray_button" type="button" value="&gt;&gt;">
                    </a>
                </c:if>
            </c:otherwise>
        </c:choose>			
</body>
</html>