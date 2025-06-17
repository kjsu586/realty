<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<link rel="stylesheet" type="text/css" href="./css/index.css?v=1">
<link rel="stylesheet" type="text/css" href="./css/login.css?v=3">
<style>
.box {
   width: 800px;
   height: 300px;
   border: 1px solid black;
   overflow: auto;
}
form {
    display: contents;
}
a {
    text-decoration: none;
    color: inherit !important;
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
	 <form id="frm" name="frm" method="post" action="./login"> 
<main>
<c:if test="${not empty msg}">
    <script>
        alert("${msg}");
    </script>
</c:if>
	<aside class="login_pg">	
		<p>이메일로 시작하기</p>
		<input type="hidden" name="code" value="1">
		<input type="hidden" name="kakao_id" value="">
		<input type="hidden" name="kakao_nicknm" value="">
		<div><input type="text" name="e_mail" placeholder="이메일 주소"></div>
		<div><input type="password" name="e_pw" placeholder="비밀번호"></div>
		<div><input type="button" value="로그인" onclick="logincheck()"></div>
		<div>
		<input type="button" value="카카오로그인" class="kakao_btn" onclick="kakao_login()">
		<p id="token-result"></p>
		</div>
		<div>
			<span><a href="./member_join.jsp">회원가입</a></span>
			<span><a href="./email_search.jsp">이메일 찾기</a></span>
			<span><a href="./passwd_search.jsp">비밀번호 찾기</a></span>
		</div>
	</aside>
</main>
	   </form> 

<!-- 카피라이터 -->
 <footer>
 <%@include file="./copyright.jsp" %>
 </footer>
</body>
<script src="https://t1.kakaocdn.net/kakao_js_sdk/v1/kakao.js"></script>
<script>
  Kakao.init('3dda4b57049ecc49ecd41ca6df342869');	//키발급된 번호
  function kakao_login(){
	  //Kakao.Auth.login : 카카오 회원가입 및 로그인 페이지를 출력하는 함수
	  Kakao.Auth.login({
		  	//성공시 출력되는 형태
		    success:function(response){	//response 결과화면
		    	
				 Kakao.API.request({	//사용자 가입정보를 요청
					 url: '/v2/user/me', // 사용자 정보 가져오기
					 success:function(response){	//API 서버에서 가입정보를 가져옴
						 let id = response["id"];	//고유값
						 //카카오에서 제공하는 별칭
					 	 let nickname = response["kakao_account"]["profile"]["nickname"];
						 frm.code.value = "2";
						 frm.kakao_id.value = id;
						 frm.kakao_nicknm.value = nickname;
						 frm.submit();
					 },
					 fail:function(error){
						 console.log("카카로 API 접속오류!!");		 
					 }
				 });
			},
			//API 키가 맞지 않을 경우 출력되는 함수
			fail:function(error){
				console.log(error);
				console.log("카카로 key 접속 오류 및 환경설정 오류!!");
			} 
	  });
}
</script>  
<script src="./login.js?v=3"></script>
</html>
