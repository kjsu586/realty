<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<nav>
  <div class="menus">
    <ul class="menus_ul">
      <li><img src="./logo/e_click_logo.png" onclick="location.href='/realty/index'" style="cursor: pointer;"></li>
      <li>일반매물</li>
      <li><a href="/realty/md_board">추천매물</a></li>
      <li>중계의뢰</li>
      <li><a href="/realty/counsel">상담신청</a></li>
      <li>업체의뢰</li>
      <li>의뢰현황</li>
      <li class="logins" onmouseleave="myinfo_menu(2)">
        <span title="회원정보" onclick="myinfo_menu(1)">
        <img src="./ico/login.svg">
        <ul class="login_info" id="login_info" style="display: none;">
        <c:if test="${empty sessionScope.login}">
        <li><span title="로그인"><a href="./login.jsp">로그인</a> /</span><span title="회원가입"><a href="./member_join.jsp"> 회원가입</a><img src="./ico/membership.svg"></li>
        </c:if>
        <c:if test="${not empty sessionScope.login}">
        <li>${sessionScope.login.e_name}님 <a href="/realty/logout">[로그아웃]</a></li>
        </c:if>
        </span>
        </ul>
        </span>
       <span title="모델 하우스 사전예약 리스트" onclick="reserve_page()"><img src="./ico/reserve_list.svg"></span>
      </li>
    </ul>
  </div>
 </nav>
  <script>
   const isLoggedIn = ${not empty sessionScope.login ? 'true' : 'false'};
    //해당 함수는 모델 하우스 사전 방문예약 확인 리스트 페이지로 이동 되도록 합니다.
    function reserve_page() {
    	if (isLoggedIn) {
            location.href = "reservation_list";
        } else {
            location.href = "./login.jsp";
        }
    }
    function myinfo_menu(part){
        var log_menu = document.getElementById("login_info");
        if(part==1){
            if(log_menu.style.display == "none"){
                log_menu.style.display = "block"; 
            }
            else{
                log_menu.style.display = "none"; 
            }
        }
        else{
            log_menu.style.display = "none"; 
        }
    }
 </script>
 <script src="./member_join.js?v=1"></script>