<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상담신청</title>
<link rel="stylesheet" type="text/css" href="./css/index.css?v=1">
<link rel="stylesheet" type="text/css" href="./css/counsel.css?v=3">
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
<form id="frm" method="post" action="/realty/counsel">
<main>
<section class="sub">
<p>상담신청</p>
<div>
<span class="list_title">◎ <span style="color: blue;">상담자 정보</span></span>
<ul class="sub_ul">
<li>상담자명</li>    
<li><input type="text" class="sel_input" id="e_name" name="e_name" value="${user.e_name}" readonly></li> 
<li>이메일</li>    
<li><input type="text" class="sel_input" id="e_mail" name="e_mail" value="${user.e_mail}" readonly></li> 
<li>연락처</li>    
<li><input type="text" class="sel_input" id="e_number" name="e_number" value="${user.e_number}" readonly></li> 
<li>임대형태</li>    
<li>
<label><input type="checkbox" class="sel_check" name="crent" value="공공임대"> 공공임대</label>
<label><input type="checkbox" class="sel_check" name="crent" value="민간임대"> 민간임대</label>
<label><input type="checkbox" class="sel_check" name="crent" value="민간분양"> 민간분양</label>
<label><input type="checkbox" class="sel_check" name="crent" value="기타"> 기타</label>
</li>   
<li>주거형태</li>    
<li>
<label><input type="checkbox" class="sel_check" name="chouse" value="아파트"> 아파트</label>
<label><input type="checkbox" class="sel_check" name="chouse" value="빌라,단독주택"> 빌라,단독주택</label>
<label><input type="checkbox" class="sel_check" name="chouse" value="사무실.상가.빌딩"> 사무실.상가.빌딩</label>
</li>       
<li>상담일시</li>    
<li>
<input type="date" name="cday" class="sel_input2"> * 해당 일시에 맞춰서 담당자가 연락 드립니다.   
</li>    
<li>상담내용</li>    
<li style="height: 150px !important; line-height: 150px;">
<textarea class="sel_input3" name="ctext" placeholder="구체적인 상담내용을 입력해 주세요"></textarea>
</li>
</ul>
</div>
<div><input type="button" value="상담신청" onclick="btn()"></div>
</section>
</main>
</form>

<!-- 카피라이터 -->
<footer>
  <%@include file="./copyright.jsp" %>
   </footer>
</body>
<script src="./counsel.js"></script>
</html>