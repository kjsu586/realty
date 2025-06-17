<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>모댈 하우스 사전 방문예약</title>
<link rel="stylesheet" type="text/css" href="./css/index.css?v=1">
<link rel="stylesheet" type="text/css" href="./css/reservation.css?v=4">
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
<form id="frm" method="post" action="/realty/reservation">
<main>
<section class="sub">
<p>모델 하우스 사전 방문예약</p>
<div>
<span class="list_title">
<span style="color: blue;">분양정보</span>
<span style="color: red;">${apt.apt_name}</span>
<input type="hidden" name="apt_name" value="${apt.apt_name}">
</span>
<ul class="sub_ul">
<li>방문일시</li>    
<li><input type="date" name="visit_date" class="sel_input"></li> 
<li>방문시간</li>    
<li>
<select class="sel_input2" name="visit_time">
    <option value="">방문시간선택</option>
    <option value="09:00">09:00</option>
    <option value="11:00">11:00</option>
    <option value="13:00">13:00</option>
    <option value="15:00">15:00</option>
    <option value="17:00">17:00</option>
</select> * 해당 시간에 맞춰서 방문해 주셔야 합니다.
</li> 
<li>방문자명</li>    
<li><input type="text" class="sel_input" name="e_name" value="${user.e_name}" readonly></li> 
<li>방문인원</li>    
<li>
<label><input type="radio" name="people_cnt" class="sel_check" value="1" checked> 1명</label>
<label><input type="radio" name="people_cnt" class="sel_check" value="2"> 2명</label> ※ 방문인원은 최대 2명까지 입니다.
</li>   
<li>연락처</li>    
<li><input type="text" class="sel_input" name="e_number" value="${user.e_number}" readonly></li>       
</ul>
</div>
<div>
<input type="button" value="방문 예약등록" onclick="btn()">
</div>
</section>
</main>
</form>
<!-- 카피라이터 -->
<footer>
    <%@include file="./copyright.jsp" %>
   </footer>
</body>
<script src="./reservation.js"></script>
</html>