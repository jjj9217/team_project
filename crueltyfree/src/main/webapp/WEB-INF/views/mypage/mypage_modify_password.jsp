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
    }
    
    #mypage{
        margin-top:30px;
        width: 199px;
        height:500px;
        float:left;     
    }

    #mypage-conts{
        
        width:810px;
        height: 950px;      
        float:left;
    }

    #mylink{
        color: black;
        font-size: 30px;
        text-decoration: none;
    }

    .mypagetable{
        font-size: 20px;
        font-family:'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif;
        font-weight: bold;      
    }

    #blank{
        width:100%;
        height: 35px;
        
    }

    
    
    

    .mypage-step li em {
    top: 25px;
    color: #888;
    font-style: normal;
    font-size: 40px;
    line-height: 50px;
    font-weight: 500;
    }

    .mypage-step li em, .mypage-step li span {
    display: block;
    position: absolute;
    left: 0;
    width: 100%;
    text-align: center; 
    }

    

    .mypage-step li span {
    top: 70px;
    color: #666;
    font-size: 16px;
    line-height: 22px;
    }

    

    





    
    
    ul li{      
        list-style:none;
    
    }   

    .buy_list_txt{
        width: 100%;
        height: 250px;
        
        line-height: 50px;

    }
    
    .span_txt{
        padding-left: 20px;
        float: left;
        font-size: 12px;
        height: 35px;
    }

    #member_info_update{
        float: right;
        margin-top: 5px;
        margin-right: 30px;
    }
    
    #password_update{
        float: right;
        margin-top: 5px;
        margin-right: 30px;
    }

    
    #member_password{
        line-height: 50px;
    }

    #bef_pwd{
        width: 230px;
    }

    .password_btn{
        width: 100%;
        height: 80px;
    
        display : flex;
        justify-content: center;
        align-items : center;
    }

    #do-search-period{
        width: 200px;
        height: 50px;
        
        color: black;
        margin-left: 20px;                  
    }
   #hr{margin-top:10px; height:3px; background-color:#7d99a4; border:0;}

</style>
<script>
function test() {
    var p1 = document.getElementById('password1').value;
    var p2 = document.getElementById('password2').value;
    var pwd = document.caq.pwd.value;
    var pwd2=<c:out value='${MemberVo.member_pw}'/>;                    
    if(p1.length < 8) {
        alert('입력한 글자가 8글자 이상이어야 합니다.');
        document.caq.password1.focus();
        return false;
    } 
    if(p2==""){
        alert("새 비밀번호 확인을 입력해주세요");
        document.caq.password2.focus();
        return false;
    }        
    if(pwd!=pwd2){
        alert("현재 비밀번호를 입력해주세요");
        document.caq.pwd.focus();
        return false;
    }
    if( p1 != p2 ) {
        alert("비밀번호가 일치 하지 않습니다");
        return false;
      } else{
        alert("비밀번호가 변경되었습니다.");
		document.caq.submit();
        return true;
      }
    
    
    
    /* document.getElementById('qw').submit(); */
   
  }

</script>
</head>

<body>
	<header>	
		<jsp:include page="../main/header.jsp"/>	
	</header>

<!-- body시작 -->

<div id="Container">
    <div id="mypage">       
        <table>
            <th><h3><a href="#" id="mylink">마이페이지</a></h3></th>         
            <tr><td class="mypagetable">마이 쇼핑</td></tr>
            <tr><td>주문/배송조회</td></tr>
            <tr><td>취소/반품내역</td></tr>
            <tr><td><hr width=100%></td></tr>
            <tr><td>장바구니</td></tr>
            <tr><td>좋아요</td></tr>
            <tr><td>쿠폰</td></tr>
            <tr><td><hr width=100%></td></tr>
            <tr><td class="mypagetable">마이활동</td></tr>
            <tr><td>1:1문의내역</td></tr>
            <tr><td>리뷰</td></tr>
            <tr><td>상품문의내역</td></tr>
            <tr><td><hr width=100%></td></tr>
            <tr><td class="mypagetable">마이 정보</td></tr>
            <tr><td>회원정보 수정</td></tr>
            <tr><td>배송지/환불계좌</td></tr>
        </table>        
    </div>
    
    <div id="mypage-conts">
        <div id="blank">            
        </div>
        <div class="tit_area">          
            <h2 class="tit">비밀번호 수정</h2>
            <hr id="hr" width=100%;>
            <div class="buy_list_txt">  
<form name="caq" id="qw" action="${pageContext.request.contextPath}/mypage/mypage_modify_changepassword_process.do" method="post">
                <table>
                    <colgroup>
                        <col style="width:200px;">
                        <col style="width:367px;">
                    </colgroup>
                <tbody>
                    <tr class="input">
                        <th>현재 비밀번호</th>
                        <td>
                            <div class="input_group">
                                <span class="input_txt"><input type="password" id="pwd" name="member_pw" class="text" placeholder="비밀번호를 입력해주세요."></span>
                            </div>
                        </td>
                    </tr>
                    <tr class="input">
                        <th>새 비밀번호</th>
                        <td>
                            <div class="input_group">
                                <span class="input_txt"><input type="password" id="password1" name="bef_pwd" class="text" placeholder="새 비밀번호를 입력해주세요."></span>
                            </div>
                        </td>
                    </tr>
                    <tr class="input">
                        <th>새 비밀번호 확인</th>
                        <td>
                            <div class="input_group">
                                <span class="input_txt"><input type="password" id="password2" name="member_pw_change" class="text" placeholder="새 비밀번호를 재입력해주세요."></span>
                            </div>
                        </td>
                    </tr>
                </tbody>
                </table>                
                <div class="password_btn">
                    <button type="button" class="btnLookup" id="do-search-period">나중에</button>                                      
                    <button type="button" class="btnLookup" id="do-search-period" onclick="test();">비밀번호 변경</button>
                </div>
</form>                
            </div>
        </div>
        <hr width=100%;>
        
        

        
        
        



        
        
    </div>
</div>

    <footer>
		<jsp:include page="../main/footer.jsp"/>		
	</footer>
</body>
</html>
