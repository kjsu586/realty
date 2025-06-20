<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>패스워드 찾기 및 변경</title>
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
<form id="cpw" method="post" action="/realty/pw_update">
<main>
<section class="sub">
<div>
<ul>
<li>회원가입 정보에 따른 패스워드 변경</li>
</ul>
</div>
<div class="text1 repass">
<div><input type="password" name="e_pw" placeholder="최소 10 ~ 16자 (영문,숫자,특수 문자 조합)로 입력해주세요." class="passin" autocomplete="none"></div>
<div><input type="password" name="e_pwck" placeholder="동일한 비밀번호를 입력하세요" class="passin" autocomplete="none"></div>
</div>
<div><input type="button" value="비밀번호 변경" class="search_submit" onclick="pw_change()"></div>
</section>
</main>
</form>
<!-- 카피라이터 -->
<footer>
    <%@include file="./copyright.jsp" %>
   </footer>
</body>
<script src="./search_mypass.js?v=2"></script>
</html>