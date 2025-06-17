document.addEventListener("DOMContentLoaded", function () {
  // 방문예약
  const reserve = document.querySelector(".btn_css");
  if (reserve) {
    reserve.addEventListener("click", function () {
      const aidx = document.getElementById("aidx").value;
      location.href = "/realty/reserve_form?aidx=" + aidx;
    });
  }

  // 방문예약완료
  const reserveCheck = document.querySelector(".btn_close");
  if (reserveCheck) {
    reserveCheck.addEventListener("click", function () {
      const aidx = document.getElementById("aidx").value;
      location.href = "/realty/reserve_check?aidx=" + aidx;
    });
  }
});