<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="cr" uri="http://java.sun.com/jsp/jstl/core" %>
<section>
    <div class="weekdays">
      <p>금주분양 매물정보<br><em>이번주 신규 매물정보!</em></p>
      <div class="week_estates">
        <ul>
            <cr:forEach var="apt" items="${all}">
          <li>
        	<a href="week_tails?aidx=${apt.aidx}">
            <span>${apt.use_status}</span>
            <div>${apt.apt_name}</div>
            <aside>${apt.apt_addr}</aside>
            <span>${apt.apt_type} | ${apt.apt_shape}</span>
            <label>${apt.date_of_sale} | ${apt.date_of_occupancy}</label>
            <div><img src="./room/${apt.apt_img}"></div>
          	</a>
          </li>
            </cr:forEach> 
        </ul>
      </div>
  </section>

