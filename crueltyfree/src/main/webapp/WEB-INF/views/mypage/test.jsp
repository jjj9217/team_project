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

 
</style>
</head>

<body>
test시작

<form name="fileForm" action="mypage_review_write_process.do" method="post" enctype="multipart/form-data">
        <input multiple="multiple" type="file" name="file" />
        <input type="hidden" name="member_idx" value="1">
        <input type="hidden" name="product_idx" value="1">
        <input type="hidden" name="review_score" value="1">
        <input type="hidden" name="member_nickname" value="k">                
        <input type="text" name="review_content">        
        <button>전송</button>        
    </form>



</body>
</html>
