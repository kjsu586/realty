<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
		<form id="f2" method="get" action="/realty/email_check.do" target="emailCheckPopup" style="display:none;">
			 <input type="hidden" name="e_mail" id="e_mail_hidden">
		</form>
    	<form id="f" method="post" action="/realty/email_joinok.do">
		<p>이메일로 회원가입</p>
		<div>
			<a>이메일</a> <input type="text" placeholder=" 이메일 주소를 입력해주세요." autocomplete="none" style="width:400px; float:left;" id="e_mail_display"> 
			<input type="button" value="중복체크" class="mail_btn" onclick="ck()">
		</div>
    	<input type="hidden" name="e_mail" id="main_email_final">
		<div>
			<a>비밀번호</a> <input type="password" placeholder=" 10~16자(영문,숫자,특수 문자 조합)로 입력해주세요." autocomplete="none" name="e_pw">
		</div>
		<div>
			<a>비밀번호 확인</a> <input type="password"  placeholder=" 비밀번호를 다시 한 번 입력해주세요." autocomplete="none" name="e_pwck">
		</div>
		<div>
		    <a>이름</a> <input type="text" placeholder=" 이름을 입력해주세요." autocomplete="none" name="e_name">
		</div>
		<div>
		    <a>휴대폰번호</a> <input type="text" placeholder=" -없이 숫자만 입력해주세요." autocomplete="none" name="e_number">
		</div>
		<div>
		<input type="checkbox" id="all_check"> <span>전체 동의</span> </div>
		
		<div class="line"></div>
		
	<div class="bottom">	
		<div class="box1"><input type="checkbox" name="e_ck1"> <a class="a1">(필수) <span>만 14세 이상입니다.</span></a></div>
		<div class="box2"><input type="checkbox" name="e_ck2"> <a class="a2">(필수) <span><u>이용약관</u>에 동의</span></a></div>
		<div class="box3"><input type="checkbox" name="e_ck3"> <a class="a3">(필수) <span><u>개인정보 수집 및 이용</u>에 동의</span></a></div>
		<section class="text1" id="ag">   </section>
		<div class="box4"><input type="checkbox" name="e_marketing"> <span>(선택) 마케팅 수신에 동의</span></div>
		<section class="text2" id="ag2">   </section>
	</div>
		<div><input type="button" value="가입 하기" onclick="btn()"></div>
		</form>
	<script src="./member_join.js?v=3"></script>
	<script>
	window.onload = function(){
		var http = new XMLHttpRequest; 
		http.open("GET","/realty/agree1.txt",false); 
		http.send();	
		document.getElementById("ag").innerHTML = http.response;
		
		http.open("GET","/realty/agree2.txt",false);
		http.send();
		document.getElementById("ag2").innerHTML = http.response;
		
	    document.getElementById("all_check").addEventListener("change", function () {
	        let isChecked = this.checked;
	        document.querySelectorAll("input[name='e_ck1'], input[name='e_ck2'], input[name='e_ck3'], input[name='e_marketing']")
	            .forEach(checkbox => checkbox.checked = isChecked);
	    });

	    document.querySelectorAll("input[name='e_ck1'], input[name='e_ck2'], input[name='e_ck3'], input[name='e_marketing']")
	        .forEach(checkbox => {
	            checkbox.addEventListener("change", function () {
	                let allChecked = document.querySelectorAll("input[name='e_ck1']:checked, input[name='e_ck2']:checked, input[name='e_ck3']:checked, input[name='e_marketing']:checked").length === 4;
	                document.getElementById("all_check").checked = allChecked;
	            });
	        });
		
	}
	</script>