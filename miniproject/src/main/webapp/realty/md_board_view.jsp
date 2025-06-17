<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>추천분양 정보 게시판</title>
<link rel="stylesheet" type="text/css" href="./css/index.css?v=1">
<link rel="stylesheet" type="text/css" href="./css/md_board_view.css?v=5">
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
        <p>추천분양 정보 게시판</p>
        <div class="boards">이번주 신규 매물정보를 한눈에 확인하실 수 있습니다.</div>
        <div class="info_board">
          <ul>
            <li>제&nbsp;&nbsp;&nbsp;목</li>
            <li>${dto.rtitle}</li>
            <li>글쓴이</li>
            <li>${dto.rwriter}</li>
            <li>등록일</li>
            <li>${dto.rdate}</li>
            <li>조회수</li>
            <li>${dto.rcnt}</li>
            <li class="litext">내&nbsp;&nbsp;&nbsp;용</li>
            <li class="litext">
                <div class="textarea">
                    ${dto.rtext}
                </div>
            </li>
          </ul>
        </div>
        <div class="board_btn">
     	<form id="f" method="get" action="./md_board">
            <input type="button" value="목&nbsp;&nbsp;&nbsp;록" class="btns" onclick="list_btn()">
        </form>
        </div>
    </section>
</main>

<!-- 카피라이터 -->
 <footer>
  <%@include file="./copyright.jsp" %>
 </footer>
</body>
<script>
function list_btn(){
	f.submit();
}
</script>
</html>