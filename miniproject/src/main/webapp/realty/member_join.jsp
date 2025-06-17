<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <link rel="stylesheet" type="text/css" href="./css/index.css?v=7">
  <link rel="stylesheet" type="text/css" href="./css/member_join.css?v=3">
<style>
.box {
   width: 800px;
   height: 300px;
   border: 1px solid black;
   overflow: auto;
}
</style>
<title>회원가입</title>
</head>
<body>
 <header>
 <%@include file="./top.jsp" %>
</header>
<%@include file="./menu.jsp" %>
<main>
<%@include file="./member_join_main.jsp" %>
</main>

<!-- 카피라이터 -->
 <footer>
  <%@include file="./copyright.jsp" %>
 </footer>
</body>
</html>