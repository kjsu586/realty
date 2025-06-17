<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>추천분양 정보 게시판</title>
<link rel="stylesheet" type="text/css" href="./css/index.css?v=1">
<link rel="stylesheet" type="text/css" href="./css/md_board.css?v=5">
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
<c:if test="${not empty msg}">
<script>
	alert("${msg}");
</script>
</c:if>
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
        <p>추천분양 정보 게시판</p>
        <div class="boards">이번주 신규 매물정보를 한눈에 확인하실 수 있습니다.</div>
        <div class="info_board">
          <ul>
            <li>NO</li>
            <li>제목</li>
            <li>글쓴이</li>
            <li>조회수</li>
            <li>등록일</li>
          </ul>
          
          <c:if test="${empty list}">
          <ul style="display: none;"><li class="nodata">등록된 게시물이 없습니다.</li></ul>
          </c:if>
          
          <c:forEach var="dto" items="${list}" varStatus="status">
          <ul class="data_view">
            <li>${total - ((currentPage - 1) * pageSize) - status.index}</li>
            <li style="text-align: left;">
            <a href="/realty/md_board_view?ridx=${dto.ridx}">
          	${dto.rtitle}
          	</a>
        	</li>
            <li>${dto.rwriter}</li>
            <li>${dto.rcnt}</li>
            <li>
            <fmt:parseDate value="${dto.rdate}" pattern="yyyy-MM-dd HH:mm:ss" var="rdateObj"/>
			<fmt:formatDate value="${rdateObj}" pattern="yyyy-MM-dd" />
            </li>
          </ul>
          </c:forEach>
        </div>
        <div class="info_pageing">
          <ol>
            <c:forEach var="p" begin="1" end="${totalPages}">
    		<a href="/realty/md_board?page=${p}&search=${search}" style="${p == currentPage ? 'font-weight:bold;' : ''}">${p}</a>
  			</c:forEach>
          </ol>
        </div>
        <div class="info_search">
        <form method="get" action="/realty/md_board">
          <input type="text" name="search" class="search_text" placeholder="검색어를 입력하세요">
          <input type="submit" value="검색" class="search_btn">
        </form>
        
        
        </div>
    </section>
</main>
<!-- 카피라이터 -->
 <footer>
  <%@include file="./copyright.jsp" %>
 </footer>
</body>
</html>