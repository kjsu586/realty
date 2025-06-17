function passwdck(){
	var fpw = document.getElementById("fpw");
	
	if(fpw.e_mail.value==""){
		alert("이메일 주소를 입력해주세요");
	}
	else if(fpw.e_number.value == ""){
		alert("휴대폰 번호를 입력해주세요");
	}
	else{		
	fpw.submit();
	}	
	
}