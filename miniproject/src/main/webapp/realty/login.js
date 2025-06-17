function logincheck(){
	var frm = document.getElementById("frm");
	
	if(frm.e_mail.value == ""){
		alert("이메일 주소를 입력해주세요");
	}
	else if(frm.e_pw.value == ""){
		alert("비밀번호를 입력해주세요");
	}
	else{		
	frm.submit();
	}	
}

function e_search(){
	frm.submit();
}


