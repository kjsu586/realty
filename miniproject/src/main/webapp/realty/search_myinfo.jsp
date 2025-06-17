<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이메일 찾기</title>
<link rel="stylesheet" type="text/css" href="./css/index.css?v=1">
<link rel="stylesheet" type="text/css" href="./css/search_myinfo.css?v=2">
</head>
<body>
<!--최상단-->
<header>
    <%@include file="./top.jsp" %>
   </header>
    <!--최상단끝-->
   <!--메뉴-->
   <%@include file="./menu.jsp" %>
    <!--메뉴끝-->
<form id="frm" method="post" action="./login.jsp">
<main>
<section class="sub">
<div>
<ul>
<li>회원가입된 이메일 확인</li>
</ul>
</div>
<div class="text1">
<div>가입하신 이메일 정보 : ${msg} </div>
</div>
<div><input type="button" value="정보확인" class="search_submit" onclick="btn()"></div>
</section>
</main>
</form>
<!-- 카피라이터 -->
<footer>
   <%@include file="./copyright.jsp" %>
   </footer>
</body>
<script>
function btn(){	
	frm.submit();
}
</script>
</html>