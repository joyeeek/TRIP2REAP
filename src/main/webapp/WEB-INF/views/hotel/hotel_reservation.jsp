<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">


<%-- jquery ui (datepicker) --%>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

<%--css --%>
<link rel="stylesheet" type="text/css" href="resources/css/hotel/hotel_reservation.css">
<link rel="shortcut icon" href="resources/images/favicon.ico" type="image/x-icon">

<title>전국방방곡곡 | 호텔</title>
</head>

<body>

<c:import url="../common/menubar.jsp" />


<div id="main-container">
	<div id="title-container">
		<i class="fas fa-hotel" id="hotel-icon"></i>
		<span id="title-name">호텔 예약 </span>
	</div>

	<!--1. 예약 호텔/ 방 정보   -->
	<div class="hotel_reservation_common_container" id="reserve_hotel_room_info_container">
		<div class="subtitle-container">
			<div class="hotel-name-wrapper">
				<h1 id="hotel_name">${hotel.boTitle}</h1>
				<input id="hotel_boNo" type="hidden" value="${hotel.boNo }"/>
				<input id="hotel_reserve_memberId" type="hidden" value="${loginUser.memberId }"/>
				<%--BO_NO (방번호) --%>
			</div>

			<div class="room-name-wrapper">
				<h2 id="room_name">${room.roomName }</h2>
				<input id="hotel_roomNo" type="hidden" value="${room.roomNo }"/>
				<%--ROOM_NO(방이름) --%>
			</div>

			<div class="room-per-day-price-wrapper">
				<%--1박 이용가격  (span-id:room_price_per_day) 에 넣는다. --%>
				<h4 class="room-per-day-price-title">1박<span id="room_price_per_day">${room.pricePerDay }</span>원 </h4>
				<input type="hidden" id="_room_price_per_day" value="${room.pricePerDay }"/>
			</div>
		</div>
	</div>

	<!-- 2. 체크인 / 체크아웃 시간 선택  -->
	<div class="hotel_reservation_common_container">
		<div class="subtitle-container">
			<h1>체크인 &amp; 체크아웃 날짜 선택 </h1>
		</div>

		<div class="hotel-reservation-content-container">
			<div class="calendar_container">
				<%-- check in  --%>
				<div class="calendar_wrapper">
					<label for="checkInDatePicker" class="calendar_icon_wrapper">
						<i class="far fa-calendar-alt calendar_icon"></i>
					</label>
					
					<div class="calendar_content_wrapper">
						<input type="text" class="date" id="checkInDatePicker" placeholder="체크인 날짜" size="20" autocomplete="off">
					</div>
				</div>


				<%-- check out --%>
				<div class="calendar_wrapper">
					
					<label for="checkOutDatePicker" class="calendar_icon_wrapper">
						<i class="far fa-calendar-alt calendar_icon"></i>
					</label>
					
					<div class="calendar_content_wrapper">
						<input type="text" class="date" id="checkOutDatePicker" placeholder="체크아웃 날짜" size="20" autocomplete="off">
					</div>
				</div><%-- calendar_wrapper --%>
			</div><%-- calendar_container--%>


			<%--올바르게 체크인/ 체크아웃 날짜가 잡히면 생기는 컨테이너. --%>
			<div id="hotel_using_container">
				<div></div>
				<div id="hotel_using_days_container">
					<%--using_accomodate_days : (박) : 숙박 기간  --%>
					<span class="hotel_using_span" id="using_accomodate_days"></span>
					<span class="info-span">박</span>

					<%--using_total_days : (일) : 체크아웃날짜 포함한 총이용기간. --%>
					<span class="hotel_using_span" id="using_total_days"></span>
					<span class="info-span">일</span>
				</div>

			</div>
		</div><%--hotel-reservation-content-container --%>

	</div><%--hotel_reservation_common_container --%>

	<!--3. 객실 및 인원수 선택   -->
	<div class="hotel_reservation_common_container">
		<div class="subtitle-container">
			<h1>객실이용 인원 수 선택 </h1>
		</div>

		<div class="hotel-reservation-content-container">
			<div class="count_reserve_person_container">
				<%--예약 방 개수 선택 --%>
				<div class="count_container">
					<div class="count_label">예약 객실수</div>
					<div class="count_wrapper">
						<div class="button_wrapper">
							<button class="minus_btn" id="room_minus_btn">-</button>
							<div id="room_count">1</div>
							<button class="plus_btn" id="room_plus_btn">+</button>
						</div>
					</div>
				</div>

				<%--성인인원수 선택  --%>
				<div class="count_container">
					<div class="count_label">성인&nbsp;&nbsp;</div>
					<div class="count_wrapper">
						<div class="button_wrapper">
							<button class="minus_btn" id="adult_minus_btn">-</button>
							<div id="adult_count">2</div>
							<button class="plus_btn" id="adult_plus_btn">+</button>
						</div>
					</div>
				</div>


				<%--어린이 인원수 선택  --%>
				<div class="count_container">
					<div class="count_label">어린이&nbsp;</div>
					<div class="count_wrapper">
						<div class="button_wrapper">
							<button class="minus_btn" id="child_minus_btn">-</button>
							<div id="child_count">0</div>
							<button class="plus_btn" id="child_plus_btn">+</button>
						</div>
					</div>
				</div>

			</div> <%--count_reserve_person_container --%>
		</div> <%--hotel-reservation-content-container --%>

		<script>


		</script>

	</div> <%--hotel_reservation_common_container --%>


	<!--5. 예약내역   -->
	<div class="hotel_reservation_common_container">
		<div class="subtitle-container">
			<h1>예약 내역 </h1>
		</div>

		<div class="hotel-reservation-content-container">

			<div id="hotel-reserve-check-total-container">
				<%--1. 예약호텔 이름  --%>
				<div class="hotel-reserve-check-common-container">
					<div class="hotel-check-label-wrapper">예약 호텔 이름</div>
					<div class="hotel-check-content-wrapper" id="reserve_hotel_name"> ${hotel.boTitle }</div>
				</div>

				<%--2. 예약 객실  이름  / 예약 객실 개수 --%>
				<div class="hotel-reserve-check-common-container">
					<div class="hotel-check-label-wrapper">예약 객실</div>

					<div class="hotel-check-content-wrapper">
						<%--방종류 --%>
						<div class="hotel-sub-check-container">
							<div class="hotel-sub-check-label-wrapper"> 객실 종류</div>
							<div class="hotel-sub-check-content-wrapper" id="reserve_room_kind">${room.roomType }</div>
						</div>

						<%--방이름  --%>
						<div class="hotel-sub-check-container">
							<div class="hotel-sub-check-label-wrapper">객실 이름</div>
							<div class="hotel-sub-check-content-wrapper" id="reserve_room_name">${room.roomName}</div>
						</div>

						<%--방개수 --%>
						<div class="hotel-sub-check-container">
							<div class="hotel-sub-check-label-wrapper">예약 객실 수 </div>
							<div class="hotel-sub-check-content-wrapper"><span id="reserve_room_cnt"></span>개</div>
						</div>
					</div>
				</div>

				<%--3. 예약 인원수  --%>
				<div class="hotel-reserve-check-common-container">
					<div class="hotel-check-label-wrapper">예약 인원</div>
					<div class="hotel-check-content-wrapper">
						<%-- 성인  --%>
						<div class="hotel-sub-check-container">
							<div class="hotel-sub-check-label-wrapper">성인 </div>
							<div class="hotel-sub-check-content-wrapper"><span id="reserve_adult_cnt"></span>명</div>
						</div>

						<%-- 어린이 --%>
						<div class="hotel-sub-check-container">
							<div class="hotel-sub-check-label-wrapper">어린이 </div>
							<div class="hotel-sub-check-content-wrapper"><span id="reserve_child_cnt"></span>명</div>
						</div>

						<%-- 총 인원수  --%>
						<div class="hotel-sub-check-container">
							<div class="hotel-sub-check-label-wrapper">총</div>
							<div class="hotel-sub-check-content-wrapper"><span id="reserve_total_person_cnt"></span>명</div>
						</div>
					</div>
				</div>


				<%--4. 예약 날짜   --%>
				<div class="hotel-reserve-check-common-container">
					<div class="hotel-check-label-wrapper">예약 날짜</div>
					<div class="hotel-check-content-wrapper">
						<%--체크인 날짜  --%>
						<div class="hotel-sub-check-container">
							<div class="hotel-sub-check-label-wrapper">체크인 날짜 </div>
							<div class="hotel-sub-check-content-wrapper" id="reserve_checkin_date"></div>
						</div>

						<%--체크아웃 날짜  --%>
						<div class="hotel-sub-check-container">
							<div class="hotel-sub-check-label-wrapper">체크아웃 날짜 </div>
							<div class="hotel-sub-check-content-wrapper" id="reserve_checkout_date"></div>
						</div>

						<%--이용 날짜 (박/ 일)  --%>
						<div class="hotel-sub-check-container">
							<span id="reserve_accomodate_day">{박 }</span>박 &nbsp;&nbsp;<span id="reserve_total_day"></span>일
						</div>
					</div>
				</div>

				<%--5. 총 금액 --%>
				<div class="hotel-reserve-check-common-container">
					<div class="hotel-check-label-wrapper">총 금액</div>
					<div class="hotel-check-content-wrapper"><span id="reserve_total_prices">{총금액 }</span> 원 </div>
					<input type="hidden" id="_total_price">
				</div>

			</div><%--hotel-reserve-check-total-container  --%>
		</div> <%--hotel-reservation-content-container --%>
	</div>

	<%--import : jquery ui (datepicker) --%>
	<script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script>
	//체크인/체크아웃/ 숙박이용일/ 전체이용일
	//datepicker - api
	$(function(){
		//체크인 날짜 선택
		$('#checkInDatePicker').datepicker({
				changeYear: true,
				changeMonth: true,
				dateFormat: 'yy-mm-dd',
				showMonthAfterYear: true,
				dayNamesMin: ['일', '월', '화', '수', '목', '금', '토' ],
				monthNamesShort : ['1월', '2월','3월','4월','5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월' ],
				yearSuffix: '년',
				minDate:0,
				prevText: '이전 달',
				nextText: '다음 달',

		});


		//체크아웃 날짜 선택
		$('#checkOutDatePicker').datepicker({
			changeYear: true,
			changeMonth: true,
			dateFormat: 'yy-mm-dd',
			showMonthAfterYear: true,
			dayNamesMin: ['일', '월', '화', '수', '목', '금', '토' ],
			monthNamesShort : ['1월', '2월','3월','4월','5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월' ],
			yearSuffix: '년',
			minDate:0,


		});


		// 1박 이용 방 가격
		let roomPricePerDay =$('#room_price_per_day');

		// 체크인 컴포넌트
		let checkInDatePicker =$('#checkInDatePicker');

		// 체크아웃 컴포넌트
		let checkOutDatePicker= $('#checkOutDatePicker');

		// 체크인 날짜
		let checkInDate;

		// 체크아웃 날짜
		let checkOutDate;


		//체크인, 체크아웃 했는지 확인용 맵
		let checkStatusMap=new Map();

		//확인용 맵의 값 초기화
		checkStatusMap.set('checkInStatus', false); //아직 체크인 날짜가 정해지지 않음을 의미함.
		checkStatusMap.set('checkOutStatus', false);//아직 체크아웃 날짜가 정해지지 않음을 의미함.


		//호텔 숙박/이용날짜 알림 컨테이너
		let $hotelReserveContainer= $('#hotel_using_container');

		//예약확인 체크인/체크아웃 날짜
		$('#reserve_checkin_date').text('');
		$('#reserve_checkout_date').text('');

		//호텔숙박일, 호텔총 이용일
		$('span#reserve_accomodate_day').text(''); //호텔숙박일
		$('span#reserve_total_day').text(''); //호텔총 이용일

		$('span#reserve_total_prices').text(Number($('#_room_price_per_day').val()) * Number($('#room_count').text()));

		//가격 표기- 3자리마다 콤마(,) 찍기
		let priceRegularExpression=/\B(?=(\d{3})+(?!\d))/g;
		let oneDayPrice= $('#_room_price_per_day').val();
		let totalPrice=$('span#reserve_total_prices').text();

		$('#room_price_per_day').text(oneDayPrice.replace(priceRegularExpression, ','));
		$('span#reserve_total_prices').text(totalPrice.replace(priceRegularExpression,','));



		//만일 체크인/ 체크아웃날짜가 정해졌을때 실행하는 함수.
		var checkStatusFunc= function(){
			//console.log('체크인/ 체크아웃 날짜 확인함.');
			//console.log(checkStatusMap);

			//체크인 / 체크아웃 날짜가 모두 결졍된다면
			var checkedAll= checkStatusMap.get('checkInStatus') && checkStatusMap.get('checkOutStatus');
			//console.log(checkedAll);
			if(checkedAll){
				//만약에 체크아웃날짜가 체크인날짜보다 같거나 , 이전날로 설정했다면? => 에러 alert를 띄운다.
				if(checkInDate>= checkOutDate){
					if(checkInDate==checkOutDate){
						swal({
							  title: '체크인/체크아웃 날짜 선택 실패',
							  text: '최소 1박은 해야합니다! 체크인/체크아웃 날짜를 다르게 해주세요!',
							  icon: "error",
							  button: "확인",
						});

					}else{
						//checkInDate > checkOutDate
						swal({
							  title: '체크인/체크아웃 날짜 선택 실패',
							  text: '체크아웃 날짜는 체크인 날짜 이후일 때만 가능합니다!',
							  icon: "error",
							  button: "확인",
						});
					}

					checkStatusMap.set('checkOutStatus', false);
					checkStatusMap.set('checkInStatus', false);
					checkInDatePicker.val('');
					checkOutDatePicker.val('');

					// 체크인날짜 & 체크아웃날짜 (년/월/일) 를 -1로 초기화
					checkStatusMap.set('checkInYear', -1);
					checkStatusMap.set('checkInMonth', -1);
					checkStatusMap.set('checkInDay', -1);

					checkStatusMap.set('checkOutnYear', -1);
					checkStatusMap.set('checkOutMonth', -1);
					checkStatusMap.set('checkOutDay', -1);
					$hotelReserveContainer.css('display','none');

					//예약확인 체크인/체크아웃날짜 다시 초기화.
					$('#reserve_checkin_date').text('');
					$('#reserve_checkout_date').text('');

					$('span#reserve_accomodate_day').text(''); //호텔숙박일
					$('span#reserve_total_day').text(''); //호텔총 이용일

				}else{
					//console.log('체크인 날짜: '+checkInDate);
					checkStatusMap.set('checkInYear', checkInDate.getFullYear());
					checkStatusMap.set('checkInMonth', checkInDate.getMonth()+1);
					checkStatusMap.set('checkInDay', checkInDate.getDate());

					let checkInDateStr=checkStatusMap.get('checkInYear')+'년 '+checkStatusMap.get('checkInMonth')+'월'+checkStatusMap.get('checkInDay')+'일';
					$('#reserve_checkin_date').text(checkInDateStr);

					//console.log('체크아웃 날짜: '+ checkOutDate);
					checkStatusMap.set('checkOutYear', checkOutDate.getFullYear());
					checkStatusMap.set('checkOutMonth', checkOutDate.getMonth()+1);
					checkStatusMap.set('checkOutDay', checkOutDate.getDate());

					//console.log(checkStatusMap);
					let checkOutDateStr=checkStatusMap.get('checkOutYear')+'년 '+checkStatusMap.get('checkOutMonth')+'월'+checkStatusMap.get('checkOutDay')+'일';
					$('#reserve_checkout_date').text(checkOutDateStr);

					$hotelReserveContainer.css('display','flex');

					// 차이 (단위: 일 ) => hotelAccomodateDays 에 대입
					let $diffDays=(checkOutDate-checkInDate)/(24*60*60*1000);
					//console.log($diffDays);
					
					$('#_total_price').val( Number($('#_room_price_per_day').val())*$diffDays );

					let $hotelAccomodateDays= $('#using_accomodate_days'); //숙박기간(단위: 일 )
					let $hotelTotalUsingDays= $('#using_total_days'); //전체 이용기간(단위: 일)

					$hotelAccomodateDays.text($diffDays);
					$hotelTotalUsingDays.text($diffDays+1);

					//예약확인 숙박이용일/ 호텔전체이용일
					$('span#reserve_accomodate_day').text($diffDays);
					$('span#reserve_total_day').text($diffDays+1);


					//총금액
					$('span#reserve_total_prices').text($diffDays*Number($('#_room_price_per_day').val()) * Number($('#room_count').text()));
					$('span#reserve_total_prices').text($('span#reserve_total_prices').text().replace(priceRegularExpression,','));
				}
			}
		};



		checkInDatePicker.on('change', function(){
			checkInDate=$(this).val();
			//console.log('체크인 날짜: '+checkInDate);

			let checkInDateAddr= checkInDate.split('-');
			//console.log('checkInDateAddr: '+ checkInDateAddr);

			//체크인 날짜
			checkInDate= new Date(checkInDateAddr[0], checkInDateAddr[1]-1 , checkInDateAddr[2]);
			//console.log(checkInDate);
			checkStatusMap.set('checkInStatus', true); //아직 체크인 날짜가 정해지지 않음을 의미함.

			checkStatusFunc();

		});


		checkOutDatePicker.on('change', function(){
			checkOutDate=$(this).val();
			//console.log('체크아웃 날짜: '+checkOutDate);

			let checkOutDateAddr= checkOutDate.split('-');

			//체크아웃 날짜
			checkOutDate=new Date(checkOutDateAddr[0], checkOutDateAddr[1]-1 , checkOutDateAddr[2]);
			//console.log(checkOutDate);
			checkStatusMap.set('checkOutStatus', true);//아직 체크아웃 날짜가 정해지지 않음을 의미함.

			checkStatusFunc();

		});

	});


	// 예약방개수/ 성인수/ 어린이수/ 총인원수
	$(function(){
		let priceRegularExpression=/\B(?=(\d{3})+(?!\d))/g;
		//방개수
		//1개이면 - 버튼을 누르지 못하게 해야한다.
		let $roomCntVal= Number($('#room_count').text());

		$('#reserve_room_cnt').text($('#room_count').text());//예약방개수 초기화
		$('#reserve_adult_cnt').text($('#adult_count').text());//예약성인수 초기화
		$('#reserve_child_cnt').text($('#child_count').text());//예약어린이수 초기화
		$('#reserve_total_person_cnt').text(Number($('#adult_count').text())+Number($('#child_count').text()))//예약 총인원수 초기화

		if($roomCntVal==1){
			$('#room_minus_btn').attr('disabled', true);
			$('#room_minus_btn').css('cursor', 'none' );
		}

		//성인
		//1명이면 -버튼을 누르지 못하게 해야한다. (최소 성인 1명!)
		let $adultCntVal= Number($('#adult_count').text());
		if($adultCntVal==1){
			$('#adult_minus_btn').attr('disabled', true);
			$('#adult_minus_btn').css('cursor', 'none' );
		}

		//어린이
		let $childCntVal=Number($('#child_count').text());
		if($childCntVal==0){
			$('#child_minus_btn').attr('disabled', true);
			$('#child_minus_btn').css('cursor', 'none');
		}

		// 방 개수 버튼 선택
		//방개수 증가 버튼 선택함수
		$('#room_plus_btn').click( function(){
			let $nowVal= Number($('#room_count').text());

			$nowVal+=1;
			$roomCntVal=$nowVal;
			if($roomCntVal>1){
				$('#room_minus_btn').attr('disabled', false);
				$('#room_minus_btn').css('cursor', 'pointer');
			}

			$('#room_count').text($nowVal);
			$('#reserve_room_cnt').text($('#room_count').text());//예약방개수

			//총이용금액
			if($('span#reserve_accomodate_day').text()==''){
				$('span#reserve_total_prices').text(Number($('#_room_price_per_day').val()) * Number($('#room_count').text()));
			}else{
				$('span#reserve_total_prices').text(Number($('span#reserve_accomodate_day').text())*Number($('#_room_price_per_day').val()) * Number($('#room_count').text()));
			}
			$('span#reserve_total_prices').text($('span#reserve_total_prices').text().replace(priceRegularExpression,','));
		});

		// 방개수  감소 버튼 선택 함수
		$('#room_minus_btn').click(function(){
			let $nowVal= Number($('#room_count').text());
			$nowVal-=1;
			$roomCntVal=$nowVal;
			if($roomCntVal<=1){
				$('#room_minus_btn').attr('disabled', true);
				$('#room_minus_btn').css('cursor', 'none');
				$('#room_count').text(1);
			}else{
				$('#room_count').text($nowVal);
				$('#room_minus_btn').css('cursor', 'pointer');
			}
			$('#reserve_room_cnt').text($('#room_count').text()); //예약방개수

			//총이용금액
			if($('span#reserve_accomodate_day').text()==''){
				$('span#reserve_total_prices').text(Number($('#_room_price_per_day').val()) * Number($('#room_count').text()));
			}else{
				$('span#reserve_total_prices').text( Number($('span#reserve_accomodate_day').text())*Number($('#_room_price_per_day').val()) * Number($('#room_count').text()));
			}
			$('span#reserve_total_prices').text($('span#reserve_total_prices').text().replace(priceRegularExpression,','));

		});


		// 성인 인원수 버튼 선택
		// 성인수 증가 버튼 선택 함수
		$('#adult_plus_btn').click( function(){
			let $nowVal= Number($('#adult_count').text());

			$nowVal+=1;
			$adultCntVal=$nowVal;
			if($adultCntVal>1){
				$('#adult_minus_btn').attr('disabled', false);
				$('#adult_minus_btn').css('cursor', 'pointer');
			}

			$('#adult_count').text($nowVal);

			//예약 성인 인원수
			$('#reserve_adult_cnt').text($('#adult_count').text());
			$('#reserve_total_person_cnt').text(Number($('#adult_count').text())+Number($('#child_count').text()))//예약 총인원수
		});

		// 성인수 감소 버튼 선택 함수
		$('#adult_minus_btn').click(function(){
			let $nowVal= Number($('#adult_count').text());
			$nowVal-=1;
			$adultCntVal=$nowVal;
			if($adultCntVal<=1){
				$('#adult_minus_btn').attr('disabled', true);
				$('#adult_minus_btn').css('cursor', 'none');
				$('#adult_count').text(1);
			}else{
				$('#adult_count').text($nowVal);
				$('#adult_minus_btn').css('cursor', 'pointer');
			}

			//예약 성인 인원수
			$('#reserve_adult_cnt').text($('#adult_count').text());
			$('#reserve_total_person_cnt').text(Number($('#adult_count').text())+Number($('#child_count').text()))//예약 총인원수
		});

		// 어린이 인원수 버튼 선택
		// 어린이수 증가 버튼 선택함수
		$('#child_plus_btn').click(function(){
			let $nowCVal= Number($('#child_count').text());
			$nowCVal+=1;
			$childCntVal=$nowCVal;
			if($childCntVal>0){
				$('#child_minus_btn').attr('disabled', false);
				$('#child_minus_btn').css('cursor', 'pointer');
			}
			$('#child_count').text($nowCVal);
			$('#reserve_child_cnt').text($('#child_count').text());//예약어린이수
			$('#reserve_total_person_cnt').text(Number($('#adult_count').text())+Number($('#child_count').text()))//예약 총인원수

		});

		// 어린이수 감소 버튼 선택함수
		$('#child_minus_btn').click(function(){
			let $nowCVal= Number($('#child_count').text());
			$nowCVal-=1;
			$childCntVal=$nowCVal;
			if($childCntVal<=0){
				$('#child_minus_btn').attr('disabled', true);
				$('#child_minus_btn').css('cursor', 'none');
				$('#child_count').text(0);
			}else{
				$('#child_count').text($nowCVal);
				$('#child_minus_btn').css('cursor', 'pointer');
			}
			$('#reserve_child_cnt').text($('#child_count').text());
			$('#reserve_total_person_cnt').text(Number($('#adult_count').text())+Number($('#child_count').text()))//예약 총인원수
		});

	});

	</script>
	
	<!-- 6. 예약자 정보 입력 -->
	<div class="hotel_reservation_common_container">
		<div class="subtitle-container">
			<h1>예약자 정보 입력</h1>
		</div>
		
		<div class="hotel-reservation-content-container">
		
		
			<%--hotel-reserve-check-total-container 을 참고하였습니다. --%>
			<div id="hotel-reserve-insert-container">
				<%--1. 예약자 이름 --%>
				<div class="hotel-reserve-check-common-container">
					<div class="hotel-check-label-wrapper">예약자 이름</div>
					<div class="hotel-check-content-wrapper reserve_input">
						<c:if test="${loginUser.memberName ==null}">
							<input id="reservation_name" type="text" placeholder="예약자 이름 입력" >
						</c:if>
						<c:if test="${loginUser.memberName !=null}">
							<input id="reservation_name" type="text" placeholder="예약자 이름 입력" value="${loginUser.memberName }">
						</c:if>
					</div>
				</div>
				
				<%--2. 예약자 전화번호 --%>
				<div class="hotel-reserve-check-common-container">
					<div class="hotel-check-label-wrapper">예약자 전화번호</div>
					<div class="hotel-check-content-wrapper reserve_input">
						<c:if test="${loginUser.phone ==null}">
							<input id="reservation_phone" type="tel"  placeholder="예약자 전화번호 입력(-제외)">
						</c:if>
						
						<c:if test="${loginUser.phone !=null }">
							<input id="reservation_phone" type="tel"  placeholder="예약자 전화번호 입력" value="${loginUser.phone }">
						</c:if>
					</div>
					<script>
					$(function(){
						
						
						
						function numberFormatterFunc(number){
							let regNumber=/(^02.{0}|^01.{1}|[0-9]{3})([0-9]+)([0-9]{4})/;
							
							if(number.length>8){
								number=number.replace(regNumber, '$1-$2-$3');
							}else{
								regNumber=/([0-9]{4})([0-9]{4})/;
								number=number.replace(regNumber, '$1-$2');
							}
							$('#reservation_phone').val(number);
						}
						
						//초기에 전화번호가 있는경우에는 자동으로 -을 달아준다.
						if($('#reservation_phone').val().length>0){
							let number=$('#reservation_phone').val();
							numberFormatterFunc(number);
						}
						
						$('#reservation_phone').on({
							'keyup': function(){
								$(this).val($(this).val().replace(/[^0-9]/g,''));
								numberFormatterFunc($(this).val());
							},
							'keydown':function(){
								$(this).val($(this).val().replace(/[^0-9]/g,''));
							},
							'keypress': function(){
								$(this).val($(this).val().replace(/[^0-9]/g,''));
							}
						});
					});
					</script>
				</div>
				
				<%--3. 예약자 이메일주소 --%>
				<div class="hotel-reserve-check-common-container">
					<div class="hotel-check-label-wrapper">예약자 이메일</div>
					<div class="hotel-check-content-wrapper reserve_input">
						<c:if test="${loginUser.email ==null}">
							<input id="reservation_email" type="text"  placeholder="예약자 이메일 입력">
						</c:if>
						
						<c:if test="${loginUser.email !=null }">
							<input id="reservation_email" type="email"  placeholder="예약자 이메일 입력" value="${loginUser.email }">
						</c:if>
					</div>
				</div>

			</div><%-- hotel-reserve-insert-container--%>
			
		
		</div>
	</div>

	<!-- 7. 결제 수단 선택   -->
	<div class="hotel_reservation_common_container">
		<div class="subtitle-container">
			<h1>결제 수단 선택</h1>
		</div>

		<div class="hotel-reservation-content-container">
			<ul class="payment-select-ul">
				<li>
					<input id="payment_credit_danal" type="radio" name="payment_type" class="payment_type" value="신용카드" checked>
					<label for="payment_credit_danal" class="payment_type_label">신용카드</label>
				</li>
				
				
				<li>
					<input id="payment_kakaopay" type="radio"  name="payment_type" class="payment_type" value="카카오페이">
					<label for="payment_kakaopay" class="payment_type_label">카카오페이</label>
				</li>
				
				
				<li>
					<input id="payment_payco" type="radio"  name="payment_type" class="payment_type" value="페이코">
					<label for="payment_payco" class="payment_type_label">페이코</label>
				</li>
				
			</ul>
		</div>

		<div class="hotel-reservation-content-container">
			<button id="go_payment">결제하기 </button> <%-- 체크한 부분에서 결제 api로 이동  --%>
		</div>
	</div>
	    <form action="myPage.me" method="post" id="myHotels">
            <input type="hidden" value="${ loginUser.memberId }" id="hiddenId4" name="hiddenId4"> 
        </form>
</div>
        


<%--아임포트 라이브러리 --%>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script>

$(function(){
	$('#go_payment').click(function(){
		let reserveMap=new Map();

		//초기화 - 자동입력되어있는 항목
		reserveMap.set('boNo', Number($('#hotel_boNo').val()) )//호텔번호
		reserveMap.set('hotel_name', $('#reserve_hotel_name').text().trim() ) //호텔이름
		reserveMap.set('roomNo', Number($('#hotel_roomNo').val()) )//객실번호
		reserveMap.set('room_name', $('#room_name').text().trim() )//객실이름
		reserveMap.set('reserveRoomCnt', Number($('#reserve_room_cnt').text().trim()) )//예약 객실수
		reserveMap.set('reservePersonAdultCnt', Number($('#reserve_adult_cnt').text().trim()) )//예약 성인수
		reserveMap.set('reservePersonChildCnt', Number($('#reserve_child_cnt').text().trim()) )//예약 어린이수
		reserveMap.set('reserveTotalPersonCnt', Number($('#reserve_total_person_cnt').text().trim()) )//예약 총인원수
		reserveMap.set('oneDayPrice', Number($('#_room_price_per_day').val()) ); // 1일 이용가격

		
		//console.log(reserveMap.get('boNo'), reserveMap.get('roomNo'));
		
		//초기화 - 사용자가 직접입력해야되는 항목
		//1. 체크인날짜
		if($('#checkInSatePicker').val()!=''){
			//체크인 날짜가 존재하면
			reserveMap.set('checkInDateStr', $('#checkInDatePicker').val() );
		}else{
			//체크인날짜가 존재하지 않음.
			reserveMap.set('checkInDateStr', '') 
		}
		
		//2. 체크아웃날짜
		if($('#checkOutDatePicker').val()!=''){
			reserveMap.set('checkOutDateStr', $('#checkOutDatePicker').val() );
			
		}else{
			//체크아웃 날짜가 존재하지 않는다면
			reserveMap.set('checkOutDateStr', '');
		}
		
		//실제가격
		let hotelUsingPrice= Number( $('#_total_price').val()*reserveMap.get('reserveRoomCnt'));
		//console.log('호텔 이용가격=> '+ hotelUsingPrice);
		reserveMap.set('hotelUsingPrice', hotelUsingPrice); //호텔실제 이용가격
		
		
		reserveMap.set('reserveTotalPrice', 100); //호텔이 너무 비싸서,,, 가격100 원으로 함. - 임시가격

		reserveMap.set('memberId', $('#hotel_reserve_memberId').val().trim() ); //예약자 아이디
		
		
		//예약자 이름을 잘 넣었는지확인
		let inputName=$('#reservation_name').val();
		if(inputName.length>=2){
			reserveMap.set('reserveName',  $('#reservation_name').val() )//예약자이름
		}else{
			reserveMap.set('reserveName', '')//예약자이름
		}
		
		//예약자 전화번호를 잘넣었는지 확인
		let inputPhoneNum= $('#reservation_phone').val();
		let phoneValidReg=/^\d{3}-\d{3,4}-\d{4}/;
		if(phoneValidReg.test(inputPhoneNum)==true){
			reserveMap.set('reservePhone', $('#reservation_phone').val() )//예약자 전화번호
		}else{
			reserveMap.set('reservePhone', '' )//예약자 전화번호
		}
		
		//예약자 이메일 양식을 지켰는지 확인
		let inputEmail= $('#reservation_email').val();
		let emailValidReg= /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
		if(emailValidReg.test(inputEmail)==false){
			reserveMap.set('reserveEmail', '')//예약자 이메일
		}else{
			reserveMap.set('reserveEmail', $('#reservation_email').val() )//예약자 이메일
		}
		
		
		//체크인날짜, 체크아웃 날짜
		//예약자이름, 전화번호, 이메일이 공백이 아닌지 확인.
		let keyList=[ 'checkInDateStr', 'checkOutDateStr','reserveName', 'reservePhone', 'reserveEmail'];
		let keyMap=new Map([
			['reserveName', '이름'],
			['reservePhone', '전화번호'],
			['reserveEmail', '이메일'],
			['checkInDateStr', '체크인 날짜'],
			['checkOutDateStr', '체크아웃 날짜']
		]);

		let isAllWrite=true; //모두 작성됐는지 확인
		let errorKey='';
		for(var i=0; i<keyList.length; i++){
			let key=keyList[i];
			if(reserveMap.get(key)==''){
				isAllWrite=false;
				errorKey=key;
				break;
			}
		}
		
		if(!isAllWrite){
			//입력사항 하나라도 누락했을때
			//체크인/ 체크아웃 입력문제
			if(errorKey=='checkOutDateStr' || errorKey=='checkInDateStr'){
				swal({
					title: '예약 실패',
					icon: 'error',
					button: '확인',
					text: keyMap.get(errorKey)+'를 선택해주세요!'
				});
			}else{
				//정보입력 문제
				swal({
					title: '예약 실패',
					icon: 'error',
					button: '확인',
					text: keyMap.get(errorKey)+'을(를) 입력해주세요!'
					
				});
			}
		}else{
			
			//정보입력 모두 했을때
			//결제수단 선택
			let select_payment_type=$('.payment_type:checked').val();
			console.log('결제수단 :'+select_payment_type);
			console.log(reserveMap.get('checkInDateStr'));
			console.log(reserveMap.get('checkOutDateStr'));
		
			
			
			if(select_payment_type=='신용카드'){
				//신용카드
				var IMP=window.IMP;	
				IMP.init('imp35513917'); //가맹점키
				IMP.request_pay({
					pg: 'html5_inicis', //pg구분자
					pay_method: 'card', //결제수단- 신용카드
					merchant_uid: 'trip2reap_credit_'+new Date().getTime(), //주문번호
					name: 'TRIP2REAP 호텔예약', //주문명
					amount: reserveMap.get('reserveTotalPrice'), //판매가격
					buyer_name: reserveMap.get('reserveName'), //구매자 이름
					buyer_email: reserveMap.get('reserveEmail'), //구매자 email
					buyer_tel: reserveMap.get('reservePhone') //구매자 전화번호
					
				},function(rsp){
					if(rsp.success){
						//결제성공
						
						
						//예약을 요청한다.
						$.ajax({
							url:'hotelReservation.ho',
							type:'post',
							data:{
								boNo: reserveMap.get('boNo'),
								roomNo: reserveMap.get('roomNo'),
								reservePrice: reserveMap.get('hotelUsingPrice'),
								reserveRoomCnt: reserveMap.get('reserveRoomCnt'),
								reserveTotalPersonCnt: reserveMap.get('reserveTotalPersonCnt'),
								reservePersonAdultCnt: reserveMap.get('reservePersonAdultCnt'),
								reservePersonChildCnt: reserveMap.get('reservePersonChildCnt'),
								
								reserveName: reserveMap.get('reserveName'),
								reservePhone: reserveMap.get('reservePhone'),
								reserveEmail: reserveMap.get('reserveEmail'),
								paymentUID: rsp.imp_uid,
								merchantUID: rsp.merchant_uid,
								paymentType: select_payment_type,
								
								checkInDateStr:  reserveMap.get('checkInDateStr'),
								checkOutDateStr: reserveMap.get('checkOutDateStr'),
							},
							success:function(response){
								if(response=='success'){
									swal({
										icon:'success',
										title:'호텔 예약 성공',
										text: '호텔 예약을 성공하였습니다!',
										button:'확인'
										
									});
									
									//결제성공하면 마이페이지 호텔예약정보로 리다이렉트
									$('#myHotels').submit();
									
								}else{
									swal({
										icon:'error',
										title: '호텔 예약 실패',
										text:'호텔 예약을 실패하였습니다.',
										button: '확인'
									});
									
									location.href="hotelDetailView.ho?hId="+ reserveMap.get('boNo') +"&page=${page}"
								}
							}
						});//ajax코드 끝.
						
						
					}else{
						//결제실패
						swal({
							icon:'error',
							title: '결제 실패',
							text:'결제를 실패하였습니다.',
							button: '확인'
						});
						
						location.href="hotelDetailView.ho?hId="+ reserveMap.get('boNo') +"&page=${page}"
					}
						
				});
					
				
				
			}else if(select_payment_type=='카카오페이'){
				//카카오페이
				//카카오페이선택
				var IMP=window.IMP;	
				IMP.init('imp35513917'); //가맹점키
				IMP.request_pay({
					pg: 'kakaopay', //pg구분자
					pay_method: 'card', //결제수단- 신용카드
					merchant_uid: 'trip2reap_kakao_'+new Date().getTime(), //주문번호
					name: 'TRIP2REAP 호텔예약', //주문명
					amount: reserveMap.get('reserveTotalPrice'), //판매가격
					buyer_name: reserveMap.get('name'), //구매자 이름
					buyer_email: reserveMap.get('email'), //구매자 email
					buyer_tel: reserveMap.get('phone') //구매자 전화번호
					
				},function(rsp){
					if(rsp.success){
						//결제를 성공하면
						//예약을 요청한다.
						$.ajax({
							url:'hotelReservation.ho',
							type:'post',
							data:{
								boNo: reserveMap.get('boNo'),
								roomNo: reserveMap.get('roomNo'),
								reservePrice: reserveMap.get('hotelUsingPrice'),
								reserveRoomCnt: reserveMap.get('reserveRoomCnt'),
								reserveTotalPersonCnt: reserveMap.get('reserveTotalPersonCnt'),
								reservePersonAdultCnt: reserveMap.get('reservePersonAdultCnt'),
								reservePersonChildCnt: reserveMap.get('reservePersonChildCnt'),
								
								reserveName: reserveMap.get('reserveName'),
								reservePhone: reserveMap.get('reservePhone'),
								reserveEmail: reserveMap.get('reserveEmail'),
								paymentUID: rsp.imp_uid,
								merchantUID: rsp.merchant_uid,
								paymentType: select_payment_type,
								
								checkInDateStr:  reserveMap.get('checkInDateStr'),
								checkOutDateStr: reserveMap.get('checkOutDateStr'),
							},
							success:function(response){
								if(response=='success'){
									swal({
										icon:'success',
										title:'호텔 예약 성공',
										text: '호텔 예약을 성공하였습니다!',
										button:'확인'
										
									});
									
									//결제성공하면 마이페이지 호텔예약정보로 리다이렉트
									$('#myHotels').submit();
									
								}else{
									swal({
										icon:'error',
										title: '호텔 예약 실패',
										text:'호텔 예약을 실패하였습니다.',
										button: '확인'
									});
									//예약실패 - 호텔 상세페이지로 이동
									location.href="hotelDetailView.ho?hId="+ reserveMap.get('boNo') +"&page=${page}"
								}
							}
						});//ajax코드 끝.
					}else{
						//결제실패
						swal({
							icon:'error',
							title: '결제 실패',
							text:'결제를 실패하였습니다.',
							button: '확인'
						});
						
						location.href="hotelDetailView.ho?hId="+ reserveMap.get('boNo') +"&page=${page}"
					}
				});
				
				
			}else{
				//페이코
				var IMP=window.IMP;	
				IMP.init('imp35513917'); //가맹점키
				IMP.request_pay({
					pg: 'payco.AUTOPAY', //pg구분자
					pay_method: 'card', //결제수단- 신용카드
					merchant_uid: 'trip2reap_payco_'+new Date().getTime(), //주문번호
					name: 'TRIP2REAP 호텔예약', //주문명
					amount: reserveMap.get('reserveTotalPrice'), //판매가격
					buyer_name: reserveMap.get('name'), //구매자 이름
					buyer_email: reserveMap.get('email'), //구매자 email
					buyer_tel: reserveMap.get('phone') //구매자 전화번호
					
				},function(rsp){
					if(rsp.success){
						//결제를 성공하면
						//예약을 요청한다.
						$.ajax({
							url:'hotelReservation.ho',
							type:'post',
							data:{
								boNo: reserveMap.get('boNo'),
								roomNo: reserveMap.get('roomNo'),
								reservePrice: reserveMap.get('hotelUsingPrice'),
								reserveRoomCnt: reserveMap.get('reserveRoomCnt'),
								reserveTotalPersonCnt: reserveMap.get('reserveTotalPersonCnt'),
								reservePersonAdultCnt: reserveMap.get('reservePersonAdultCnt'),
								reservePersonChildCnt: reserveMap.get('reservePersonChildCnt'),
								
								reserveName: reserveMap.get('reserveName'),
								reservePhone: reserveMap.get('reservePhone'),
								reserveEmail: reserveMap.get('reserveEmail'),
								paymentUID: rsp.imp_uid,
								merchantUID: rsp.merchant_uid,
								paymentType: select_payment_type,
								
								checkInDateStr:  reserveMap.get('checkInDateStr'),
								checkOutDateStr: reserveMap.get('checkOutDateStr'),
							},
							success:function(response){
								if(response=='success'){
									swal({
										icon:'success',
										title:'호텔 예약 성공',
										text: '호텔 예약을 성공하였습니다!',
										button:'확인'
										
									});
									
									//결제성공하면 마이페이지 호텔예약정보로 리다이렉트
									$('#myHotels').submit();
								}else{
									swal({
										icon:'error',
										title: '호텔 예약 실패',
										text:'호텔 예약을 실패하였습니다.',
										button: '확인'
									});
									
									//결제 실패시 호텔상세페이지로 리다이렉트
									location.href="hotelDetailView.ho?hId="+ reserveMap.get('boNo') +"&page=${page}";
								}
							}
						});//ajax코드 끝.
					}else{
						//결제실패
						swal({
							icon:'error',
							title: '결제 실패',
							text:'결제를 실패하였습니다.',
							button: '확인'
						});
						
						location.href="hotelDetailView.ho?hId="+ reserveMap.get('boNo') +"&page=${page}"
					}
				});
			}//페이코끝
		}//결제과정 모두끝.
		
	}); //버튼선택끝
});



</script>

 <c:import url="../common/footer.jsp" />

</body>
</html>
