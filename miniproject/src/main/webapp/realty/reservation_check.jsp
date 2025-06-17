<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>모댈 하우스 사전 방문예약 확인</title>
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
<main>
<section class="sub">
<p>모델 하우스 사전 방문예약 확인</p>
<div>
<span class="list_title">
<span style="color: blue;">분양정보</span>
<span style="color: red;">${reserve.apt_name}</span>
</span>
<ul class="sub_ul">
<li>방문일시</li>    
<li><input type="text" class="sel_input" value="${reserve.visit_date}" disabled></li> 
<li>방문시간</li>    
<li>
<input class="sel_input2" value="${reserve.visit_time}" disabled> * 해당 시간에 맞춰서 방문해 주셔야 합니다.
</li> 
<li>방문자명</li>    
<li><input type="text" class="sel_input" value="${reserve.e_name}" disabled></li> 
<li>방문인원</li>    
<li>${reserve.people_cnt}명 ※ 방문인원은 최대 2명까지 입니다.</li>   
<li>연락처</li>    
<li><input type="text" class="sel_input" value="${reserve.e_number}" disabled></li>       
</ul>
</div>
<div>
<input type="button" value="메인페이지로 이동" onclick="location.href='/realty/index';">
</div>
</section>
</main>
<!-- 카피라이터 -->
<footer>
    <%@include file="./copyright.jsp" %>
   </footer>
</body>
</html>