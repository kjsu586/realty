function md_btn(){
	if(frm.rtitle.value === ""){
		alert("제목을 입력해주세요.");
		return;
	}
	
	if(frm.thumbnail.value == ""){
		alert("이미지는 반드시 첨부해야 합니다.");
		return;
	}
	
	frm.submit();
}