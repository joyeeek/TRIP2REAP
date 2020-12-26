<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전국방방곡곡 | 호텔 예약</title>
	<link rel="stylesheet" href="resources/css/member/reservationDetailView.css">
    <link rel="shortcut icon" href="resources/images/favicon.ico" type="image/x-icon">	
    <!-- 글꼴 -->
    <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600" rel="stylesheet">
</head>

<body>
	<header>
   	 	<%@ include file="../common/menubar.jsp" %>
    </header>

	<section>
	    <div id="hotelPaySpace1"></div>
	    <div class="paypal">
	      <div class="paypal__header">
	        <div class="paypal__logo-wrapper">
	           <img src="resources/images/logo_black.png" class="paypal__logo">
	        </div>
	
	        <div class="paypal__header-info">
	          <span class="paypal__date">
	          	[ 전국방방곡곡  | 호텔 예약 | ${reservation.paymentType} ]
	          </span>
	          
	          <%--호텔예약자 이름--%>
	          <span class="paypal__ref" id="reserveName">예약자명 : ${reservation.reserveName}</span>
	        </div>
	      </div>
	
	      <div class="paypal__subheader-wrapper">
	        <div class="paypal__subheader">
	        
	          <%--예약 호텔 이름 --%>
	          <h1 class="paypal__username">
	          	<c:if test="${hotel.hotelSite !=null}">
	        		<a href="${hotel.hotelSite }" target="_blank">${hotel.boTitle}</a>
	        	</c:if>
	        	<c:if test="${hotel.hotelSite ==null}">
	        		${hotel.boTitle}
	        	</c:if>
	          </h1>
	          
	          <%--예약호텔 주소 --%>
	          <span class="paypal__help-text">${hotel.hotelAddr }</span>
	        </div>
	      </div>
	
	      <div class="paypal__cart">
	      
	      	<%--예약 객실 이름 --%>
	        <h2 class="paypal__cart-title">[${room.roomName }]</h2>

	       	 <ul class="paypal__cart-list">	        
	          <%--예약호텔의 예약객실 --%>
	          <li class="paypal__cart-item">
	            <span class="paypal__item-name">1. 예약 객실수</span>
	            <span class="paypal__item-price">${reservation.reserveRoomCnt } 실</span>
	          </li>
	
			  <%--예약 인원수 --%>
	          <li class="paypal__cart-item">
	            <span class="paypal__item-name">2. 예약 인원수</span>
	            <span class="paypal__item-price">${reservation.reserveTotalPersonCnt} 명</span>
	          </li>
	
			  <%--체크인날짜/ 체크인시각 --%>
	          <li class="paypal__cart-item">
	            <span class="paypal__item-name">3. 체크인</span>
	            <span class="paypal__item-price">${reservation.checkInDate} (${hotel.hotelCheckInTime} 시)</span>
	          </li>
	          
	           <%--체크아웃날짜/ 체크아웃 시각 --%>
	           <li class="paypal__cart-item">
	            <span class="paypal__item-name">4. 체크아웃</span>
	            <span class="paypal__item-price">${reservation.checkOutDate} (${hotel.hotelCheckOutTime} 시)</span>
	          </li>
	
			  <%--예약 이용가격 --%>
	          <li class="paypal__cart-item">
	            <span class="paypal__cart-total" id="usingPrice">* 이용 가격</span>
	            <span class="paypal__item-price2"><fmt:formatNumber value="${reservation.reservePrice }" type="number"/>원</span>
	          </li>
	        </ul>
	      </div>
	
	      <div class="paypal__footer">
	      	 <ul class="paypal__cart-list">
		          <%--예약호텔의 예약객실 --%>
		          <li class="paypal__cart-item" id="hotelInfor">
		            <small class="paypal__item-name">[호텔 전화번호]</small>
		            <small class="paypal__item-price3 detail-info">${hotel.hotelTel}</small>
                    &nbsp;
		            <small class="paypal__item-name">[호텔 운영시간]</small>
		            <small class="paypal__item-price3 detail-info">${hotel.hotelOpenTime}시 ~ ${hotel.hotelCloseTime}시</small>
		          </li>	
	        </ul>	      	
	      </div>
	    </div>	
	    <!-- <div id="hotelPaySpace1"></div> -->
	</section>
	<div id="footerSpaces"></div>
    <footer>
   	        <c:import url="../common/footer.jsp" />
	</footer>

</body>
</html>