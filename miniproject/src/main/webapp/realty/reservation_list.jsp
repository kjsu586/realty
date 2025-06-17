<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>추천분양 정보 게시판</title>
<link rel="stylesheet" type="text/css" href="./css/index.css?v=1">
<link rel="stylesheet" type="text/css" href="./css/reservation_list.css?v=5">
<style>
.box {
   width: 800px;
   height: 300px;
   border: 1px solid black;
   overflow: auto;
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
<main>
    <section class="sub">
        <p>모델 하우스 방문 예약 리스트</p>
        <div class="boards">모델 하우스 방문 예약한 정보를 한눈에 확인 하실 수 있습니다.</div>
        <div class="info_board">
          <ul>
            <li>NO</li>
            <li>아파트명</li>
            <li>방문일자</li>
            <li>방문시간</li>
            <li>인원수</li>
            <li>취소</li>
          </ul>
         
          <c:if test="${empty reserve}">
          <ul style="display: block;"><li class="nodata">등록된 방문 예약이 없습니다.</li></ul>
          </c:if>	
          
          <c:forEach var="r" items="${reserve}" varStatus="loop">
          <ul class="data_view">
            <li>${loop.index + 1}</li>
            <li style="text-align: left;">${r.apt_name}</li>
            <li>${r.visit_date}</li>
            <li>${r.visit_time}</li>
            <li>${r.people_cnt}명</li>
            <li>
            <input type="hidden" class="apt_name" value="${r.apt_name}">
            <input type="button" value="취소" class="cancel_btn" onclick="cancel(this)">
            </li>
          </ul>
          </c:forEach>
         
        </div>
    </section>
</main>

<!-- 카피라이터 -->
 <footer>
  <%@include file="./copyright.jsp" %>
 </footer>
</body>
<script src="./reservation_list.js"></script>
</html>