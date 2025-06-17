<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="cr" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>금주 분양 매물 정보</title>
<link rel="stylesheet" type="text/css" href="./css/index.css?v=1">
<link rel="stylesheet" type="text/css" href="./css/week_tails.css?v=1">
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
	<div class="weektails">
		<p>분양정보</p>
		<div id="weektails">
		 <cr:if test="${not empty apt}">
		 <input type="hidden" id="aidx" value="${apt.aidx}">
			<p>${apt.apt_name}</p>
            <ul>
                <li>종류</li>
                <li>${apt.apt_type} | ${apt.apt_shape} </li>
                <li>주소</li>
				<li>${apt.apt_addr}</li>
                <li>규모</li>
				<li>${apt.household_count} | ${apt.building_count}</li>
                <li>시기</li>
				<li>${apt.date_of_sale} | ${apt.date_of_occupancy}</li>
                <li>난방구조</li>
				<li>${apt.heating_structure}</li>
                <li>건설사</li>
				<li>${apt.construction_company}</li>
                <li>사진정보</li>
				<li><img src="./room/${apt.apt_img}"></li>
				</cr:if>
            </ul>
             <cr:if test="${empty apt}">
                    <p>해당 매물을 찾을 수 없습니다.</p>
                </cr:if>
		</div>
      <cr:if test="${not empty sessionScope.login}">
    	<cr:choose>
  <cr:when test="${reserve > 0}">
    <div><button class="btn_close">방문예약완료</button></div>
  </cr:when>
  <cr:otherwise>
    <div><button class="btn_css">방문예약</button></div>
  </cr:otherwise>
</cr:choose>
	  </cr:if>
	</div>
</main>
<script src="./week_tails.js"></script>
<!-- 카피라이터 -->
<footer>
    <%@include file="./copyright.jsp" %>
</footer>
</body>
</html>