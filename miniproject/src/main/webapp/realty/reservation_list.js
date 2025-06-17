function cancel(btn) {
    if (confirm("방문예약을 취소하시겠습니까?")) {
        const aptName = btn.previousElementSibling.value;

        alert("예약이 취소되었습니다.");
        location.href = "/realty/reservation_cancel?apt_name=" + encodeURIComponent(aptName);
    }
}