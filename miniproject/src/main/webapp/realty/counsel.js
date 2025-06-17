function btn(){
	const rentChecked = document.querySelectorAll("input[name='crent']:checked");
    const houseChecked = document.querySelectorAll("input[name='chouse']:checked");
    const cday = document.querySelector("[name='cday']").value;
	const ctext = document.querySelector("[name='ctext']").value;

    // 임대형태 체크 여부
    if (rentChecked.length == 0) {
        alert("임대형태를 하나 이상 선택해주세요.");
        return;
    }

    // 주거형태 체크 여부
    if (houseChecked.length == 0) {
        alert("주거형태를 하나 이상 선택해주세요.");
        return;
    }

    // 상담일시
    const selectedDate = new Date(cday);
    const today = new Date();
    today.setHours(0, 0, 0, 0); // 오늘 00시 기준
    const minDate = new Date(today);
    minDate.setDate(minDate.getDate());

    if (cday == "" || selectedDate < minDate) {
        alert("상담일시는 당일과 그 이후 날짜만 선택 가능합니다.");
        return;
    }

    // 상담내용 10자 이상
    if (ctext.trim().length < 10) {
        alert("상담내용은 최소 10자 이상 입력해주세요.");
        return;
    }

    // 모든 조건 통과
    alert("담당자가 확인 후 해당 상담일시에 맞춰서 연락 드립니다.");
    frm.submit();
}