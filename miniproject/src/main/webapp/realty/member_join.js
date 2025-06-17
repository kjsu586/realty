function btn(){
if(f.e_mail.value == ""){
	alert("이메일을 입력해주세요");
}
else if(f.e_pw.value == ""){
	alert("비밀번호를 입력해주세요");
}
else if(f.e_pw.value.length < 10 || f.e_pw.value.length > 16){
	alert("비밀번호는 10~16자 사이로 입력해주세요");
}
else if(f.e_pwck.value == ""){
	alert("비밀번호 확인 부분을 입력해주세요");
}
else if(f.e_name.value == ""){
	alert("이름을 입력해주세요");
}
else if(f.e_number.value == ""){
	alert("휴대폰 번호를 입력해주세요");
}
else if(f.e_pw.value != f.e_pwck.value){
	alert("비밀번호가 일치하지 않습니다.");
}
else if(!f.e_ck1.checked || !f.e_ck2.checked || !f.e_ck3.checked){
	alert("필수 항목을 모두 체크하셔야 합니다.");
}
else{
	//정규식 코드 사용 (연락처 확인)
		var ck = /^\d{2,3}\d{3,4}\d{4}$/;	//숫자 외에 다른 문자일 경우 false 
		var ck2 = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
		if(ck.test(f.e_number.value) == false){
			alert("전화번호를 정상적으로 입력하세요");
		}
    	else if(ck2.test(f.e_mail.value) == false){
			alert("이메일을 정상적으로 입력하세요");
		} 
		else{		
		f.submit();
		}	
}
}

function ck() {
    var email = document.getElementById("e_mail_display").value;

    if (email == "") {
        alert("이메일을 입력해주세요.");
        return;
    }

    // 두 폼에 있는 hidden input에 값 복사
    document.getElementById("e_mail_hidden").value = email;
    document.getElementById("main_email_final").value = email;

	var w = 600;
    var h = 200;
    var left = (window.screen.width - w) / 2;
    

    window.open("", "emailCheckPopup", `width=${w},height=${h},left=${left}`)
    f2.submit();
}


