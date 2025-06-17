function pw_change(){
	var cpw = document.getElementById("cpw");
	
	if(cpw.e_pw.value==""){
		alert("비밀번호를 입력해주세요");
	}
	else if(cpw.e_pw.value.length < 9 || cpw.e_pw.value.length > 17){
		alert("최소 10 ~ 16자 (영문,숫자,특수 문자 조합)로 입력해주세요");	
	}
	else if(cpw.e_pwck.value==""){
		alert("비밀번호를 한번 더 입력해주세요");	
	}
	else if(cpw.e_pwck.value.length < 9 || cpw.e_pwck.value.length > 17){
		alert("최소 10 ~ 16자 (영문,숫자,특수 문자 조합)로 입력해주세요");	
	}
	else if(cpw.e_pw.value != cpw.e_pwck.value){
		alert("동일한 비밀번호를 입력해주세요");	
	}
	else{
		cpw.submit();
	}
	
}