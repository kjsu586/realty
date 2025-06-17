<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	Date date = new Date();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>추천분양 정보 게시판</title>
<link rel="stylesheet" type="text/css" href="./css/index.css?v=1">
<link rel="stylesheet" type="text/css" href="./css/md_board_view.css?v=6">
<script src="./ckeditor/ckeditor.js"></script>
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
<form id="frm" method="post" action="/realty/md_board_write" enctype="multipart/form-data">
<main>
    <section class="sub">
        <p>추천분양 정보 게시판</p>
        <div class="boards">이번주 신규 매물정보를 한눈에 확인하실 수 있습니다.</div>
        <div class="info_board">
          <ul>
            <li>제&nbsp;&nbsp;&nbsp;목</li>
            <li><input type="text" class="board_in2" name="rtitle"></li>
            <li>글쓴이</li>
            <li><input type="text" class="board_in1" name="rwriter" value="관리자" readonly></li>
            <li>썸네일 이미지</li>
            <li><input type="file" name="thumbnail"></li>
            <li class="litext">내&nbsp;&nbsp;&nbsp;용</li>
            <li class="litext">
                <textarea id="board_text" name="rtext">
                    
                </textarea>
            </li>
          </ul>
        </div>
        <div class="board_btn">
            <input type="button" value="등&nbsp;&nbsp;&nbsp;록" class="btns" onclick="md_btn()">
        </div>
    </section>
    <script src="./md_board_write.js?v=<%=date%>"></script>
    <script>
    window.onload = function(){
        CKEDITOR.replace('board_text',{
            height : 360
        });
    };
    </script>
</main>
</form>
<!-- 카피라이터 -->
 <footer>
  <%@include file="./copyright.jsp" %>
 </footer>
</body>
</html>