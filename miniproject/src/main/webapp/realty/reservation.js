function btn(){
	const visit_date = document.querySelector("[name='visit_date']").value;
	const visit_time = document.querySelector("[name='visit_time']").value;
	
	 // 방문예약일
    const selectedDate = new Date(visit_date);
    const today = new Date();
    today.setHours(0, 0, 0, 0); // 오늘 00시 기준
    const minDate = new Date(today);
    minDate.setDate(minDate.getDate());

    if (visit_date == "" || selectedDate < minDate) {
        alert("방문예약일은 당일과 그 이후 날짜만 선택 가능합니다.");
        return;
    }

	if(visit_time == ""){
		alert("방문시간을 선택해주세요")
		return;
	}
	
	alert("방문 예약이 완료 되었습니다.");
	frm.submit();	
}