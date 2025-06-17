<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
<link rel="stylesheet" type="text/css" href="./css/index.css?v=1">
<link rel="stylesheet" type="text/css" href="./css/passwd_search.css?v=2">
<style>
a {
    text-decoration: none;
    color: inherit !important;
}
</style>
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
<form id="fpw" method="post" action="/realty/search_mypass">
<main>
<section class="sub">
<div>
<ul>
<li><a href="./email_search.jsp">이메일 찾기</a></li>
<li>비밀번호 찾기</li>
</ul>
</div>
<div class="text1">
<div><input type="text" name="e_mail" placeholder="가입하신 이메일을 입력하세요"></div>
<div><input type="text" name="e_number" placeholder="휴대폰 번호는 - 빼고 숫자만 입력하세요"></div>
</div>
<c:if test="${not empty msg}">
    <p style="color:red;">${msg}</p>
</c:if>
<div><input type="button" value="비밀번호 찾기" onclick="passwdck()"></div>
</section>
</main>
</form>
<!-- 카피라이터 -->
<footer>
   <%@include file="./copyright.jsp" %>
   </footer>
</body>
<script src="./passwd_search.js?v=1"></script>
</html>