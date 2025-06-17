<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이메일 찾기</title>
<link rel="stylesheet" type="text/css" href="./css/index.css?v=1">
<link rel="stylesheet" type="text/css" href="./css/email_search.css?v=2">
<style>
a {
    text-decoration: none;
    color: inherit !important;
}

</style>
</head>
<body>
<!--최상단-->
	
  <%@include file="./top.jsp" %>
   
    <!--최상단끝-->
   <!--메뉴-->
   <%@include file="./menu.jsp" %>
    <!--메뉴끝-->

<form id="frm" method="post" action="/realty/email_search.do">
<main>
<section class="sub">
<div>
<ul>
<li>이메일 찾기</li>
<li><a href="./passwd_search.jsp">비밀번호 찾기</a></li>
</ul>
</div>
<div class="text1">
<div><input type="text" name="e_name" placeholder="이름을 입력하세요"></div>
<div><input type="text" name="e_number" placeholder="휴대폰 번호는 - 빼고 숫자만 입력하세요" maxlength="11"></div>
</div>
<div><input type="button" value="이메일 찾기" onclick="e_search()"></div>
</section>
</main>
</form>

<!-- 카피라이터 -->
<footer>
    <%@include file="./copyright.jsp" %>
   </footer>
</body>
<script src="./login.js?v=3"></script>
</html>