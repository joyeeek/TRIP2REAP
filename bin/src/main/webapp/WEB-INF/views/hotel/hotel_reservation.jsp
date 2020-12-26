<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
   
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">


<%-- jquery ui (datepicker) --%>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

<%--css --%>
<link rel="stylesheet" type="text/css" href="resources/css/hotel/hotel_reservation.css">
<title>전국방방곡곡:: 호텔 예약페이지 </title>
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
				<h1 id="hotel_name">호텔 신라 {호텔이름}</h1>
				<%--BO_NO (방번호) --%>
			</div>
			
			<div class="room-name-wrapper">
				<h2 id="room_name">더블 디럭스룸 - 산전망 {방이름} </h2>
				<%--ROOM_NO(방이름) --%>
			</div>
			
			<div class="room-per-day-price-wrapper">
				<%--1박 이용가격  (span-id:room_price_per_day) 에 넣는다. --%>
				<h4 class="room-per-day-price-title">1박<span id="room_price_per_day">22145</span>원 </h4>
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
					<div class="calendar_icon_wrapper">
						<i class="far fa-calendar-alt calendar_icon"></i>
					</div>
					<div class="calendar_content_wrapper">
						<input type="text" class="date" id="checkInDatePicker" placeholder="체크인 날짜" size="20" autocomplete="off">
					</div>
				</div>
				
				
				<%-- check out --%>
				<div class="calendar_wrapper">
					<div class="calendar_icon_wrapper">
						<i class="far fa-calendar-alt calendar_icon"></i>
					</div>
					<div class="calendar_content_wrapper">
						<input type="text" class="date" id="checkOutDatePicker" placeholder="체크아웃 날짜" size="20" autocomplete="off">
					</div>
				</div><%-- calendar_wrapper --%>
			</div><%-- calendar_container--%>
			
			
			<%--올바르게 체크인/ 체크아웃 날짜가 잡히면 생기는 컨테이너. --%>
			<div id="hotel_using_container">
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
		
		
		<%--import : jquery ui (datepicker) --%>
		<script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
		<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
		<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
		<script>
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
						
					}else{
						//console.log('체크인 날짜: '+checkInDate);
						checkStatusMap.set('checkInYear', checkInDate.getFullYear());
						checkStatusMap.set('checkInMonth', checkInDate.getMonth()+1);
						checkStatusMap.set('checkInDay', checkInDate.getDate());
						
						//console.log('체크아웃 날짜: '+ checkOutDate);
						checkStatusMap.set('checkOutnYear', checkOutDate.getFullYear());
						checkStatusMap.set('checkOutMonth', checkOutDate.getMonth()+1);
						checkStatusMap.set('checkOutDay', checkOutDate.getDate());
						
						//console.log(checkStatusMap);
						
						
						$hotelReserveContainer.css('display','flex');
						
						// 차이 (단위: 일 ) => hotelAccomodateDays 에 대입 
						let $diffDays=(checkOutDate-checkInDate)/(24*60*60*1000);
						//console.log($diffDays);
						
						let $hotelAccomodateDays= $('#using_accomodate_days'); //숙박기간(단위: 일 )
						let $hotelTotalUsingDays= $('#using_total_days'); //전체 이용기간(단위: 일)
						
						$hotelAccomodateDays.text($diffDays);
						$hotelTotalUsingDays.text($diffDays+1);
						
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
			
		</script>
		
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
		$(function(){
			//방개수 
			//1개이면 - 버튼을 누르지 못하게 해야한다.
			let $roomCntVal= Number($('#room_count').text());
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
			});
			
		});
		
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
					<div class="hotel-check-content-wrapper" id="reserve_hotel_name"> 신라호텔 {호텔이름 }</div>
				</div>
			
				<%--2. 예약 객실  이름  / 예약 객실 개수 --%>
				<div class="hotel-reserve-check-common-container">
					<div class="hotel-check-label-wrapper">예약 객실</div>
					
					<div class="hotel-check-content-wrapper">
						<%--방종류 --%>
						<div class="hotel-sub-check-container">
							<div class="hotel-sub-check-label-wrapper"> 객실 종류</div>
							<div class="hotel-sub-check-content-wrapper" id="reserve_room_kind">{객실 종류 }</div>
						</div>
						
						<%--방이름  --%>
						<div class="hotel-sub-check-container">
							<div class="hotel-sub-check-label-wrapper">객실 이름</div>
							<div class="hotel-sub-check-content-wrapper" id="reserve_room_name">{객실 이름}</div>
						</div>
						
						<%--방개수 --%>
						<div class="hotel-sub-check-container">
							<div class="hotel-sub-check-label-wrapper">예약 객실 수 </div>
							<div class="hotel-sub-check-content-wrapper"><span id="reserve_room_cnt">{예약 객실 수 }</span>개</div>
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
							<div class="hotel-sub-check-content-wrapper"><span id="reserve_adult_cnt">{성인 인원수 }</span>명</div>
						</div>
						
						<%-- 어린이 --%>
						<div class="hotel-sub-check-container">
							<div class="hotel-sub-check-label-wrapper">어린이 </div>
							<div class="hotel-sub-check-content-wrapper"><span id="reserve_child_cnt">{어린이 인원수 }</span>명</div>
						</div>
						
						<%-- 총 인원수  --%>
						<div class="hotel-sub-check-container">
							<div class="hotel-sub-check-label-wrapper">총</div>
							<div class="hotel-sub-check-content-wrapper"><span id="reserve_total_person_cnt">{총 인원수 }</span>명</div>
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
							<div class="hotel-sub-check-content-wrapper" id="reserve_checkin_date">{체크인 날짜 } </div>
						</div>
						
						<%--체크아웃 날짜  --%>
						<div class="hotel-sub-check-container">
							<div class="hotel-sub-check-label-wrapper">체크아웃 날짜 </div>
							<div class="hotel-sub-check-content-wrapper" id="reserve_checkout_date">{체크아웃 날짜  } </div>
						</div>
						
						<%--이용 날짜 (박/ 일)  --%>
						<div class="hotel-sub-check-container">
							<span id="reserve_accomodate_day">{박 }</span>박 <span id="reserve_total_day">{일 }</span>일 
						</div>
					</div>
				</div>
				
				<%--5. 총 금액 --%>
				<div class="hotel-reserve-check-common-container">
					<div class="hotel-check-label-wrapper">총 금액</div>
					<div class="hotel-check-content-wrapper"><span id="reserve_total_prices">{총금액 }</span> 원 </div>
				</div>
			
			</div><%--hotel-reserve-check-total-container  --%>
		</div> <%--hotel-reservation-content-container --%>
	</div>
	<script>
	$(function(){
		//버튼클릭을하면 값이 변하는 부분: 예약객실수/ 성인수/ 어린이수
		
			//예약객실수:
			$('#reserve_room_cnt').text(Number($('#room_count').text()));
		
		
		//예약호텔이름
		$('#reserve_hotel_name')
		
		//객실종류
		$('#reserve_room_kind')
		
		//객실이름
		$('#reserve_room_name')
		
		
		
		
		
		
		//예약 성인 인원수
		$('#reserve_adult_cnt').text(Number($('#adult_count').text()));
		
		//예약 어린이 인원수:
		$('#reserve_child_cnt').text(Number($('#child_count').text()));
		
		//총 예약 인원수:
		$('#reserve_total_person_cnt')
		
			
		//체크인날짜
		$('#reserve_checkin_date')
		
		//체크아웃날짜
		$('#reserve_checkout_date')
		
		//숙박일(박)
		$('span#reserve_accomodate_day').text();
		
		//호텔총 이용일
		$('span#reserve_total_day').text();
		
		//총금액 
		$('span#reserve_total_prices').text();
	});
	
	</script>
	
	
	<!--6. 결제 수단 선택   -->
	<div class="hotel_reservation_common_container">
		<div class="subtitle-container">
			<h1>결제 수단 선택</h1>
		</div>
		
		<div class="hotel-reservation-content-container">
			<ul>
				<li> 결제 api 구현후에 ui만들겠습니다.</li>
				<li> 신용카드 </li>
				<li> 휴대폰 </li>
				<li> 계좌이체 </li>
				<li> Kakao Pay</li>
				<li> Toss pay</li>
			</ul>
		</div>
		
		<div class="hotel-reservation-content-container">
			<button id="go_payment">결제하기 </button> <%-- 체크한 부분에서 결제 api로 이동  --%>
		</div>
	</div>
</div>

</body>
</html>