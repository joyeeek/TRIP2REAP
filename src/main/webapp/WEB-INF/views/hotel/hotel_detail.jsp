<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">

	<%--css --%>
	<link rel="stylesheet" type="text/css" href="resources/css/hotel/hotel_detail.css">

	<%-- swipper api cdn 	--%>
	<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.css">
	<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css">
	<script src="https://unpkg.com/swiper/swiper-bundle.js"></script>
	<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
	<link rel="shortcut icon" href="resources/images/favicon.ico" type="image/x-icon">

	<title>전국방방곡곡 | 호텔</title>
</head>


<body>

<c:import url="../common/menubar.jsp" />


<div id="main-container">
	<div id="title-container">
		<!-- <img id="hotel-icon" src="resources/images/hotelIcon.png" /> -->
		<i class="fas fa-hotel" id="hotel-icon"></i>
		<span id="title-name">호텔 예약</span>
	</div>


	<!-- 호텔이름 -->
	<div class="hotel_detail_common_container">

		<div class="subtitle-container">

			<!-- 호텔번호 /호텔이름  -->
			<input id="hotel-number" type="hidden" value="${hotel.boNo }">
			
			<h1 id="hotel-name">${hotel.boTitle} </h1>
			<!--해시태그가 null이 아닌경우에만 보여준다.-->
			<c:if test="${!empty hashTagsList}">
				<div id="hashtag-wrapper">
					<ul id="hash-tags">
						<c:forEach var="hashTag" items="${hashTagsList}">
							<li><i class="fas fa-hashtag"></i><b>${hashTag}</b> </li>
						</c:forEach>
					</ul>
				</div>
			</c:if>
			
		</div>

		<%--(1) hotel-info-container --%>
		<div class="hotel-info-container">

			<!--호텔썸네일 이미지/ 해시태그 기록   -->
			<div id="thumbnail-img-hashtag-container">
				<div id="thumbnail-img-wrapper">
					<%--썸네일 이미지가 존재하면 --%>
					<c:if test="${!empty thumbnailImg }">
						<img id="thumbnail-img" alt="썸네일 이미지" src="resources/buploadFiles/${thumbnailImg.changeName }"/>
					</c:if>
					<%--썸네일 이미지가 존재하지 않으면 --%>
					<c:if test="${empty thumbnailImg }">
						<img id="thumbnail-img" alt="썸네일 이미지" src="resources/images/sinra.jpeg"/>
					</c:if>
				</div>
			</div>



			<!--호텔정보(도로명주소/ 전화번호/ 운영시간/ 링크/ 총리뷰점수  / 좋아요개수 )  -->
			<div id="hotel-info-wrapper">
				<!--호텔정보  -->
				<div id="hotel-detail-info-ul-container">
					<ul id="hotel-detail-info-ul">
						<%--jstl을 사용해서 존재하지 않은 정보는 제외한다. (li단위로 )--%>

						<%--호텔 도로명 주소 --%>
						<li>
							<div class="info-icon-container">
								<i class="fas fa-map-marker-alt"></i>
							</div>

							<span>
								<!--도로명주소   -->
								<%-- href:https://map.naver.com/v5/search/{호텔이름}  --%>
								<b> <a target="_blank" href="https://map.naver.com/v5/search/${hotel.hotelAddr }">${hotel.hotelAddr}</a> </b>
							</span>
						</li>

						<%--호텔전화번호  --%>
						<c:if test="${!empty hotel.hotelTel}">
							<li>
								<div  class="info-icon-container">
									<i class="fas fa-phone"></i>
								</div>

								<span>
									<!-- 전화번호 -->
									<b>${hotel.hotelTel }</b>
								</span>
							</li>
						</c:if>

						<%--호텔오픈/종료 시각 --%>
						<li>
							<div  class="info-icon-container">
								<i class="fas fa-clock"></i>
							</div>

							<span>
								<!-- 운영시간 : 운영오픈시간 & 운영종료시간  -->
								<b>${hotel.hotelOpenTime }</b>시&nbsp;~&nbsp;<b>${hotel.hotelCloseTime }</b>시
							</span>

						</li>

						<%--호텔사이트 --%>
						<c:if test="${!empty hotel.hotelSite }">
							<li>
								<div class="info-icon-container">
									<i class="fas fa-link"></i>
								</div>

								<span>
									<!--링크  -->
									<b><a target="_blank" href="${hotel.hotelSite }">${hotel.boTitle} 홈페이지로 이동</a></b>
								</span>
							</li>
						</c:if>


						<%--호텔 리뷰평점 --%>
						<li>
							<div class="info-icon-container">
								<i class="far fa-thumbs-up"></i>
							</div>
							<span>
								<!--리뷰 평점-->
								<span id="star-score-wrapper">
									<c:forEach var="star" begin="${1}" end="${5}">
										<c:if test="${star<=hotel.hotelReviewScore }">
											<i class="fas fa-star star-point"></i>
										</c:if>
										<c:if test="${star>hotel.hotelReviewScore }">
											<c:if test="${star-0.5<=hotel.hotelReviewScore }">
												<i class="fas fa-star-half-alt"></i>
											</c:if>
											
											<c:if test="${star-0.5>hotel.hotelReviewScore }">
												<i class="far fa-star"></i>
											</c:if>
										</c:if>
									</c:forEach>
								</span>

	                            <!--리뷰 평점(text)-->
	                            <%--
	                        	<span>(${hotel.hotelReviewScore})</span>
	                        	 --%>
							</span>
						</li>


						<%--호텔좋아요 개수 --%>
						<li>
							<div class="info-icon-container">
								<i class="fas fa-hand-holding-heart"></i>
							</div>
							<span>
								<!--좋아요 개수  -->
								${likeCnt }&nbsp;개
							</span>
						</li>
					</ul>
				</div>

				<div id="btn-wrapper">
					<!--버튼  -->
					<%--
					[caution- i want you to understand this caution ^^]
					hotel_reservation이 만들어졌는지 확인하기 위한 테스트용 버튼이라서 링크를 걸어놨습니다.

					(실제) 해당 호텔의 방 에 대한  예약페이지 뷰로 이동한다. (호텔번호/ 방번호  으로 예약하고자하는 호텔과 방을 구분 )
					 --%>
					<c:if test="${loginUser.memberId!='admin' && roomCnt>0 && minPriceRoomId!=-1}">
						<button id="go-reservation-btn">최저가 예약하기</button>
						<input id="min-price-room-id" type="hidden" value="${minPriceRoomId }"/>
						
					</c:if>
					<!--only administrator (관리자)  -->
					<%--
					#edit-hotel-detail-info-page-btn: 호텔수정뷰  페이지로 이동
					#remove-hotel-btn: 호텔게시물 삭제
					 --%>
					 <c:if test="${loginUser.memberId=='admin' }">
					 
					 	<div id="only_admin_btns">
					 
						 	<%--호텔 수정페이지 와 연결하기: hotelEditView.ho url호출을 hotelEditView로 하겟다. --%>
						 	<c:url var="hotelEditView" value="hotelEditView.ho">
						 		<c:param name="hId" value="${hotel.boNo }"/>
						 	</c:url>
						 	
							<button id="edit-hotel-detail-info-page-btn" onclick="location.href='${hotelEditView}'">수정하기</button>
							<button id="remove-hotel-btn">삭제하기 </button>
						
						</div>
						
					 </c:if>
				</div>
			</div>
		</div>
	</div>


	<!--호텔소개 -->
	<div class="hotel_detail_common_container">
		<div class="subtitle-container">
			<h1>호텔 소개 </h1>
		</div>

		<%--(2) --%>
		<div class="hotel-info-container">
			<p id="hotel-introduction">
			${hotel.boContent }
			</p>
		</div>
	</div>

	<!--호텔 이미지 뷰 -->
	<div class="hotel_detail_common_container">
		<div class="subtitle-container">
			<h1>호텔 이미지 뷰 </h1>
		</div>
		<%--(3) --%>
		<div class="hotel-info-container">
			<div class="hotel-image-viewer">
				<%--디테일뷰가 비어있다면 --%>
				<c:if test="${empty detailViewList}">
					<div class="swiper-container gallery-top">
						<div class="swiper-wrapper">
							<div class="swiper-slide" style="background-image:url(resources/images/sample_hotel.jpg)"></div>
				            <div class="swiper-slide" style="background-image:url(resources/images/sinra.jpeg)"></div>
				            <div class="swiper-slide" style="background-image:url(resources/images/trump.jpeg)"></div>
				            <div class="swiper-slide" style="background-image:url(resources/images/sample_hotel.jpg)"></div>
				            <div class="swiper-slide" style="background-image:url(resources/images/sinra.jpeg)"></div>
				            <div class="swiper-slide" style="background-image:url(resources/images/trump.jpeg)"></div>
				            <div class="swiper-slide" style="background-image:url(resources/images/sample_hotel.jpg)"></div>
				            <div class="swiper-slide" style="background-image:url(resources/images/sinra.jpeg)"></div>
				            <div class="swiper-slide" style="background-image:url(resources/images/trump.jpeg)"></div>
				            <div class="swiper-slide" style="background-image:url(resources/images/sample_hotel.jpg)"></div>
						</div>
	
						<div class="swiper-button-next swiper-button-white"></div>
						<div class="swiper-button-prev swiper-button-white"></div>
					</div>
	
					<div class="swiper-container gallery-thumbs">
						<div class="swiper-wrapper">
							<div class="swiper-slide" style="background-image:url(resources/images/sample_hotel.jpg)"></div>
				            <div class="swiper-slide" style="background-image:url(resources/images/sinra.jpeg)"></div>
				            <div class="swiper-slide" style="background-image:url(resources/images/trump.jpeg)"></div>
				            <div class="swiper-slide" style="background-image:url(resources/images/sample_hotel.jpg)"></div>
				            <div class="swiper-slide" style="background-image:url(resources/images/sinra.jpeg)"></div>
				            <div class="swiper-slide" style="background-image:url(resources/images/trump.jpeg)"></div>
				            <div class="swiper-slide" style="background-image:url(resources/images/sample_hotel.jpg)"></div>
				            <div class="swiper-slide" style="background-image:url(resources/images/sinra.jpeg)"></div>
				            <div class="swiper-slide" style="background-image:url(resources/images/trump.jpeg)"></div>
				            <div class="swiper-slide" style="background-image:url(resources/images/sample_hotel.jpg)"></div>
						</div>
					</div>
				</c:if>
				
				
				<%-- 디테일 이미지 뷰가 비어있지 않는다면 --%>
				<c:if test="${!empty detailViewList }">
					<div class="swiper-container gallery-top">
						<div class="swiper-wrapper">
							<c:forEach var="detailImg" items="${detailViewList }">
								<div class="swiper-slide" style="background-image:url(resources/buploadFiles/${detailImg.changeName})"></div>
							</c:forEach> 
						</div>
	
						<div class="swiper-button-next swiper-button-white"></div>
						<div class="swiper-button-prev swiper-button-white"></div>
					</div>
					<div class="swiper-container gallery-thumbs">
						<div class="swiper-wrapper">
							<c:forEach var="detailImg" items="${detailViewList }">
								<div class="swiper-slide" style="background-image:url(resources/buploadFiles/${detailImg.changeName})"></div>
				            </c:forEach>
						</div>
					</div>
					
				</c:if>
			</div> <%--hotel-image-viewer --%>
		</div> <%-- hotel-info-container --%>
	</div>

	<!-- 1박이용 가격비교  -->
	<c:if test="${!empty roomMap }">
		<div class="hotel_detail_common_container">
			<div class="subtitle-container">
				<h1>1박이용 가격비교 </h1>
			</div>
			<%--(4) --%>
			<div class="hotel-info-container">

			<ul class="collapse-list">

					<c:forEach var="roomInfo" items="${roomMap}">
						<%--one accordion(1) --%>
				        <li>
				            <input class="collapse-open" type="checkbox" id="collapse-${roomInfo.key }">
				            <label class="collapse-btn" for="collapse-${roomInfo.key }">${roomInfo.key } </label>
				            <div class="collapse-painel">
				                <div class="collapse-inner">
				                    <ul class="one-room-type-prices-ul">
				                    	<c:forEach var="room" items="${roomInfo.value }">
					                        <li>
						                        <div class="one-room-price-info-container">
						                        	<%--방 이름과 가격  --%>
						                        	<div class="room-name-price-wrapper">
						                        		<div class="room-name-wrapper">
						                        			<input id="room_no" type="hidden" value="${room.roomNo }"/>
						                        			<input type="hidden" value="${room.boNo }"/>
						                        			<%--12.17 --%>
						                        			<input id="page_num" type="hidden" value="${page }"/>
						                        			<h4>${room.roomName }</h4>
						                        		</div>

						                        		 <div class="price-wrapper">
						                        		 	<span class="room_price_per_day">
						                        		 	 <fmt:formatNumber type="number"  maxFractionDigits="3" value="${room.pricePerDay}" var="commaPrice"/>
						                        		 		${commaPrice }
						                        		 	</span>원

						                        		 </div>
						                        	</div>

						                        	<%--예약하기 버튼 --%>
						                        	<div class="room-reservation-btn-container">
						                        		<button class="room-reservation-btn">예약 하기 </button>
						                        	</div>
						                        </div>
					                         </li>
				                         </c:forEach>
				                    </ul>
				                </div>
				            </div>
				        </li>  <%--one-accordion(1) -end --%>
			        </c:forEach>
		    	</ul><%--collapse-list -end --%>
			</div><%-- hotel-info-container(4) --%>
		</div>

	</c:if>


 	<script>
   		$(function(){
   			let hId=$('#hotel-number').val();
   			let minPriceRoomId=$('#min-price-room-id').val();
   			let page=$('#page_num').val();//12.17

   			//예약페이지로 이동하기
   			$('button.room-reservation-btn').click(function(){
	   			let $targetContainer=$(this).closest('.one-room-price-info-container');
	   			let roomId=$targetContainer.find('#room_no').val();
	   			
	   			location.href="hotelReservationView.ho?hId="+hId+"&roomId="+roomId+"&page="+page;
   			});

   			//최저가 예약페이지로 이동하기
   			$("#go-reservation-btn").click(function(){
   				location.href="hotelReservationView.ho?hId="+hId+"&roomId="+minPriceRoomId+"&page="+page;
   			});

   		});
	</script>


	<script>
	// $(function(){
	// 	//let prices=$('span.room_price_per_day');
	//     $('span.room_price_per_day').each(function(){
	//     	let priceTxt=$(this).text();
	//     	$(this).text(priceTxt.replace(/\B(?=(\d{3})+(?!\d))/g,','));
	//     });
	// });
  //
 	</script>


	<!-- 호텔 시설정보 : 호텔옵션이 null이 아니라면! -->
	<c:if test="${!empty hotelOptionsList }">
		<div class="hotel_detail_common_container">
			<div class="subtitle-container">
				<h1>호텔 시설정보 </h1>
			</div>

			<%--(5) --%>
			<div class="hotel-info-container">
				<ul id="hotel-options-ul">
					<c:forEach var="option" items="${hotelOptionsList }">
						<c:if test="${option eq  '와이파이'}">
							<li>
								<span>
									<i class="hotel-option-icon  fas fa-wifi"></i>
								</span>
								<span><b>와이파이</b></span>
							 </li>
						 </c:if>

						<c:if test="${option eq '조식' }">
							<li>
								<span>
									<embed class="hotel-option-icon" src="resources/svgs/breakfast.svg" type="image/svg+xml">
								</span>
								<span><b>조식</b></span>
							</li>
						</c:if>

						<c:if test="${option eq '레스토랑' }">
							<li>
								<span>
									<embed class="hotel-option-icon" src="resources/svgs/restaurant.svg" type="image/svg+xml">
								</span>
								<span><b>레스토랑</b></span>
							</li>
						</c:if>


						<c:if test="${option eq '세탁' }">
							<li>
								<span>
									<embed class="hotel-option-icon" src="resources/svgs/laundry.svg" type="image/svg+xml">
								</span>
								<span><b>세탁 </b></span>
							</li>
						</c:if>

						<c:if test="${option eq '24시간 리셉션' }">
							<li>
								<span>
									<embed class="hotel-option-icon" src="resources/svgs/reception.svg" type="image/svg+xml">
								</span>
								<span><b>24시간 리셉션 </b></span>
							</li>
						</c:if>

						<c:if test="${option eq '수하물 보관' }">
							<li>
								<span>
									<embed class="hotel-option-icon" src="resources/svgs/luggage.svg" type="image/svg+xml">
								</span>
								<span><b>수하물 보관 </b></span>
							</li>
						</c:if>

						<c:if test="${option eq '수영장' }">
							<li>
								<span><i class="hotel-option-icon fas fa-swimming-pool"></i></span>
								<span><b>수영장</b></span>
							</li>
						</c:if>

						<c:if test="${option eq '피트니스' }">
							<li>
								<span><i class="hotel-option-icon  fas fa-dumbbell"></i></span>
								<span><b>피트니스</b></span>
							</li>
						</c:if>

						<c:if test="${option eq '스파/사우나' }">
							<li>
								<span><i class="hotel-option-icon fas fa-hot-tub"></i></span>
								<span><b>스파 &amp; 사우나 </b></span>
							</li>
						</c:if>

						<c:if test="${option eq '미용실' }">
							<li>
								<span>
									<embed class="hotel-option-icon" src="resources/svgs/hairdresser.svg" type="image/svg+xml">
								</span>
								<span><b>미용실 </b></span>
							</li>
						</c:if>

						<c:if test="${option eq '카페' }">
							<li>
								<span><i class="hotel-option-icon fas fa-coffee"></i></span>
								<span><b>카페</b></span>
							</li>
						</c:if>

						<c:if test="${option eq '비즈니스 시설' }">
							<li>
								<span>
									<i class="hotel-option-icon fas fa-user-tie"></i>
								</span>
								<span><b>비즈니스 시설</b></span>
							</li>
						</c:if>


						<c:if test="${option eq '주차' }">
							<li>
								<span>
									<i class="hotel-option-icon fas fa-parking"></i>
								</span>
								<span><b>주차</b></span>
							</li>
						</c:if>

						<c:if test="${option eq '공항셔틀' }">
							<li>
								<span><i class="hotel-option-icon fas fa-bus-alt"></i></span>
								<span><b>공항셔틀</b></span>
							</li>
						</c:if>

						<c:if test="${option eq '장애인 편의시설' }">
							<li>
								<span>
									<i class="fas fa-wheelchair hotel-option-icon"></i>
								</span>
								<span><b>장애인 편의시설</b></span>
							</li>
						</c:if>

						<c:if test="${option eq '바/라운지' }">
							<li>
								<span>
									<i class="fas fa-glass-martini-alt hotel-option-icon"></i>
								</span>
								<span><b>바 &amp; 라운지</b></span>
							</li>
						</c:if>

						<c:if test="${option eq '주방' }">
							<li>
								<span>
									<embed class="hotel-option-icon" src="resources/svgs/kitchen.svg" type="image/svg+xml">
								</span>
								<span><b>주방</b></span>
							</li>
						</c:if>

						<c:if test="${option eq '아이돌봄 서비스' }">
							<li>
								<span>
									<embed class="hotel-option-icon" src="resources/svgs/baby1.svg" type="image/svg+xml">
								</span>
								<span><b>아이돌봄 서비스 </b></span>
							</li>
						</c:if>

						<c:if test="${option eq '룸서비스' }">
							<li>
								<span>
									<embed class="hotel-option-icon" src="resources/svgs/roomservice.svg" type="image/svg+xml">
								</span>
								<span><b>룸서비스</b></span>
							</li>
						</c:if>

						<c:if test="${option eq '애완동물 동반' }">
							<li>
								<span>
									<i class="hotel-option-icon fas fa-paw"></i>
								</span>
								<span><b>애완동물 동반</b></span>
							</li>
						</c:if>
					</c:forEach>
				</ul>
			</div>
		</div>
	</c:if>


	<!--호텔리뷰   -->
	<div class="hotel_detail_common_container">
		<div class="subtitle-container">
			<h1>호텔 리뷰</h1>
		</div>

		<%--(6) --%>
		<div class="hotel-info-container">
			<div id="hotel-review-container">

				<div id="review-introduction-container">
					<div>
						<p>
							즐거운 여행을 하셨나요?<br>
							호텔 이용후기를 작성해주세요.<br>
						</p>
						<button id="insert-review-btn">리뷰 등록 하기</button>
					</div>
				</div>

				<%--리뷰등록 컨테이너  --%>
				<div id="insert-review-container">
					<div>
						<h3>리뷰 등록하기</h3>

						<div class="insert-review-wrapper">
							<table>
								<tr>
									<td class="review_label">리뷰 점수 </td>
									<td class="review_insert_td">
										<select id="review_score">
											<option value="5">5 점 </option>
											<option value="4">4 점 </option>
											<option value="3">3 점 </option>
											<option value="2">2 점 </option>
											<option value="1">1 점 </option>
											<option value="0">0 점 </option>
										</select>
									</td>
								</tr>

								<tr>
									<td class="review_label">리뷰 내용 </td>
									<td class="review_insert_td">
										<textarea id="review_content" placeholder="리뷰내용을 작성해주세요." cols="50" rows="3" ></textarea>
										<div class="review_content_counter_wrapper">
											<span id="review_content_cnt">0</span>/200
										</div>
									</td>
								</tr>
							</table>

							<script>
									$(function(){
										let reviewCnt= $('#review_content_cnt');

										$('#review_content').on({
											'keyup': function(){
												let nowLen= $(this).val().length;

												if(nowLen>200){
													alert('200자를 초과하였습니다!');
													// 최대 200자까지만 제한해둔다.
													$(this).val( $(this).val().substring(0,200) );
													nowLen=$(this).val().length;
												}

												// 현재 글자 수
												reviewCnt.text(nowLen);
											}
										});
									});

									</script>
							<button id="insert-btn">등록</button>
						</div>
					</div>
				</div><%-- 리뷰등록 컨테이너 (insert-review-container)  --%>


				<%-- 등록한 리뷰컨테이너(reviews-container) --%>
				<div id="reviews-container">

					<%-- 호텔 리뷰가 존재하지 않을 때, 나타낸다. --%>
					<c:if test="${empty reviewList || reviewListCount ==0}">
						<span id="emptyReviewMsg">호텔 리뷰가 존재하지 않습니다!</span>
					</c:if>
					
					<%-- 호텔 리뷰가 존재할 때 나타낸다. --%>
					<c:if test="${!empty reviewList }">
						
						<ul id="reviews_wrappers_ul">
							<%--리뷰개수가 5개 미만이라면 => 더보기 없이 리뷰를 나타낸다. --%>
							<c:if test="${ reviewListCount>0 && reviewListCount <5 }">
								<c:forEach var="review" items="${reviewList }" varStatus="reviewVS">
								
									<li class="one_review_container">
										<div class="one_review_wrapper">
			
												<div class="remove_review_wrapper">
													<input class="reviewNumber" type="hidden" value="${ review.reNo}"/>
													<%--리뷰삭제버튼은 관리자/ 리뷰작성자 본인 만 보인다. --%>
													<c:if test="${ loginUser.memberId eq 'admin' || review.memberId eq loginUser.memberId}">
														
														<i class="remove_review fas fa-times"></i> <%--리뷰 삭제버튼 --%>
													</c:if>
												</div>
											
											
											<%--작성자 / 리뷰 내용 관련  --%>
											<div class="review_writer_control_wrapper">
												<div class="review_writer_nickname_wrapper">
														<h3>${reviewNickNameList.get(reviewVS.index) }</h3> <%--리뷰작성자 닉네임  --%>
												</div>
												<%--
												<div class="review_upload_date">
													<small>${review.reDate} </small> 
												</div>
												 --%>
												<div class="review_point">
													<%-- 리뷰 부여 별점.. --%>
													<span class="review_stars">
														<c:forEach var="i" begin="1" end="5" varStatus="starVS">
																<c:if test="${starVS.index <=review.reviewScore}">
																	<i class="fas fa-star"></i>
																</c:if>
																<c:if test="${starVS.index > review.reviewScore }">
																	<i class="far fa-star"></i>
																</c:if>
														</c:forEach>
													</span>
												</div>
			
												<div class="review_content_container">
													<%--리뷰 내용  --%>
													<span class="reivewer_review_content">
													${review.reContent}
													</span>
												</div>
											</div>
										</div>
									</li> <%--리뷰 1개 표본  끝 --%>
									
								</c:forEach>
							</c:if>
							
							
							<%--전체댓글개수가 5개이상일경우 --%>
							<c:if test="${reviewListCount >=5}">
								<%--최근댓글 5개만 올린다. --%>
								<c:forEach var="review" items="${reviewList }" varStatus="reviewVS">
									
									<c:if test="${reviewVS.index <5 }">
								
										<li class="one_review_container">
											<div class="one_review_wrapper">
				
													<div class="remove_review_wrapper">
														<input class="reviewNumber" type="hidden" value="${ review.reNo}"/>
														<%--리뷰삭제버튼은 관리자/ 리뷰작성자 본인 만 보인다. --%>
														<c:if test="${ loginUser.memberId eq 'admin' || review.memberId eq loginUser.memberId}">
															
															<i class="remove_review fas fa-times"></i> <%--리뷰 삭제버튼 --%>
														</c:if>
													</div>
												
												
												<%--작성자 / 리뷰 내용 관련  --%>
												<div class="review_writer_control_wrapper">
													<div class="review_writer_nickname_wrapper">
															<h3>${reviewNickNameList.get(reviewVS.index) }</h3> <%--리뷰작성자 닉네임  --%>
													</div>
													<%-- 
													<div class="review_upload_date">
														<small>${review.reDate} </small> 
													</div>
													--%>
				
													<div class="review_point">
														<%-- 리뷰 부여 별점.. --%>
														<span class="review_stars">
															<c:forEach var="i" begin="1" end="5" varStatus="starVS">
																	<c:if test="${starVS.index <=review.reviewScore}">
																		<i class="fas fa-star"></i>
																	</c:if>
																	<c:if test="${starVS.index > review.reviewScore }">
																		<i class="far fa-star"></i>
																	</c:if>
															</c:forEach>
														</span>
													</div>
				
													<div class="review_content_container">
														<%--리뷰 내용  --%>
														<span class="reivewer_review_content">
														${review.reContent}
														</span>
													</div>
												</div>
											</div>
										</li> <%--리뷰 1개 표본  끝 --%>
									</c:if><%--덧글 인덱스5이하 --%>
									
									<%--덧글 인덱스 5이상 (6번째 덧글부터~) --%>
									<c:if test="${reviewVS.index >=5 }">
										
										<li class="one_review_container after5_review_closed">
											<div class="one_review_wrapper">
				
													<div class="remove_review_wrapper">
														<input class="reviewNumber" type="hidden" value="${ review.reNo}"/>
														<%--리뷰삭제버튼은 관리자/ 리뷰작성자 본인 만 보인다. --%>
														<c:if test="${ loginUser.memberId eq 'admin' || review.memberId eq loginUser.memberId}">
															
															<i class="remove_review fas fa-times"></i> <%--리뷰 삭제버튼 --%>
														</c:if>
													</div>
												
												
												<%--작성자 / 리뷰 내용 관련  --%>
												<div class="review_writer_control_wrapper">
													<div class="review_writer_nickname_wrapper">
															<h3>${reviewNickNameList.get(reviewVS.index) }</h3> <%--리뷰작성자 닉네임  --%>
													</div>
				
													<div class="review_upload_date">
														<small>${review.reDate} </small> <%--리뷰 업로드날짜 --%>
													</div>
				
													<div class="review_point">
														<%-- 리뷰 부여 별점.. --%>
														<span class="review_stars">
															<c:forEach var="i" begin="1" end="5" varStatus="starVS">
																	<c:if test="${starVS.index <=review.reviewScore}">
																		<i class="fas fa-star"></i>
																	</c:if>
																	<c:if test="${starVS.index > review.reviewScore }">
																		<i class="far fa-star"></i>
																	</c:if>
															</c:forEach>
														</span>
													</div>
				
													<div class="review_content_container">
														<%--리뷰 내용  --%>
														<span class="reivewer_review_content">
														${review.reContent}
														</span>
													</div>
												</div>
											</div>
										</li> <%--리뷰 1개 표본  끝 --%>
									
									</c:if><%--6번째덧글 이후--%>
									
										
								</c:forEach>
							</c:if>
							
						</ul>
						<c:if test="${reviewListCount>5 }">
							<%-- 더보기 버튼  --%>
							<div class="review_more_btn_container">
								<button id="review_more_btn" class="review_more_closed">더보기 </button>
							</div>
						</c:if>
					</c:if> <%--호텔리뷰가 존재할때 --%>

				</div><%-- 등록한 리뷰 컨테이너 (reviews-container) --%>
			</div> <%-- 호텔리뷰 컨테이너  --%>

		<%--hotel-review-container에서 발생하는 자바스크립트 함수  --%>
		<script>
		
		
		
		$(function(){
			//리뷰삭제 버튼 클릭
			$('.remove_review').click(function(){
				//호텔번호를 구한다
				let boNo=Number($('#hotel-number').val());
				
				//댓글번호를 구한다
				let reNo=Number( $(this).closest('.remove_review_wrapper').find('.reviewNumber').val() );
				
				swal({
					title:'호텔리뷰를 삭제하시겠습니까?',
					text:'삭제버튼을 누르면 리뷰를 되돌릴 수 없습니다!',
					icon: 'warning',
					buttons: ['삭제취소', '삭제'],
					dangerMode: true,
				})
				.then((willDelete)=>{
					if(willDelete){
						// 리뷰 삭제 처리
						//re_delete_yn을 => 'Y' 로 바꾼다.
						$.ajax({
							url: 'deleteHotelReview.ho',
							type: 'post',
							data: {
									reNo:reNo,
									boNo:boNo
								},
							success:function(response){
								if(response=='success'){
									swal({
										title:'호텔리뷰 삭제 성공!',
										icon:'success',
										text: '호텔리뷰 삭제를 성공하였습니다!',
										buttons: '확인'
									});
									
									//그리고 현재 브라우저 화면을  새로고침 시켜서 다시 랜더링
									location.reload();
								}
							}
						});
						
					}else{
						// 리뷰 삭제 취소
						swal({
							title:'호텔리뷰 삭제를 취소합니다.',
							button:'확인'
						});
					}
				});

			});
		});
		
		$(function(){
			//리뷰개수
			let reviewListCnt= $('.one_review_container').length;
			let reviewContainer= $('#reviews-container');
			if(reviewListCnt>0){
				//리뷰가 존재한다면
				//호텔리뷰 클래스가 없다면
				if(!reviewContainer.hasClass('.reviewObtained')){
					reviewContainer.addClass('reviewObtained');
				}
				
				//덧글이 없었다가 새로 등록해서 생기게되면
				if(reviewContainer.hasClass('.emptyReview')){
					reviewContainer.removeClass('emptyReview');
				}
			}else{
				//리뷰가 존재하지 않는다면
				if(!reviewContainer.hasClass('.emptyReview')){
					reviewContainer.addClass('emptyReview');	
				}
				
				//덧글 삭제후 리뷰가 비어있게된다면
				if(reviewContainer.hasClass('.reviewObtained')){
					reviewContainer.removeClass('reviewObtained');
				}
			}
			
			
		});
		
		$(function(){

			$('#insert-review-btn').click(function(){
				//console.log('어머 리뷰등록버튼을 누르셨군요?');

				let $insertContainer= $('#insert-review-container');

				if( $insertContainer.css('display')=='none'){
					// 리뷰등록창이 원래 닫혀있던 상태  => 연다.
					$insertContainer.css('display', 'block');
					$(this).text('리뷰 등록 닫기');
				}else{
					// 리뷰등록창이 원래  열려있는 상태 => 닫는다.
					$insertContainer.css('display', 'none');
					$(this).text('리뷰 등록 하기');
				}
			});
		});
		
		
		$(function(){
			$('#insert-btn').click(function(){
				//console.log('어머~ 리뷰를 등록해주셨군요! 고마워요~');
				
				//현재 리뷰등록할 호텔 번호구하기
				let hId= Number($('#hotel-number').val());
				
				//로그인한 회원인지 확인하기
				let loginUserObj= '${loginUser}';
				
				
				if(loginUserObj){
					//로그인되어있는 유저라면
					let loginUserId= '${loginUser.memberId}';
					//console.log(loginUserId);
					
					let reviewScore= Number($('#review_score > option:selected').val());
					let reviewContent=$('#review_content').val();
					
					if(reviewContent.length >0){
						//작성한 리뷰내용이 0자보다 크다면
						$.ajax({
							url:'insertHotelReview.ho',
							type:'post',
							data:{
									boNo: hId,
									reviewScore: reviewScore,
									reContent: reviewContent 
								},
							success:function(response){
								//호텔등록이 성공적으로 이뤄지면 success 문자열을 반환한다.
								if(response=="success"){
									
									swal({
										title:'호텔리뷰 등록 성공!',
										icon:'success',
										text:'호텔리뷰 등록을 성공했습니다!',
										button:'확인'
									});
									
									
									//그리고 현재 브라우저 화면을  새로고침 시켜서 다시 랜더링
									location.reload();
								}
								
							}
							
						});
						
					}else{
						//리뷰내용이 0자
						swal({
							title:'호텔리뷰 등록실패',
							icon: 'error',
							text: '호텔리뷰 내용을 입력해주세요!',
							button: '확인'
						});
					}
					
				}else{
					//로그아웃 상태라면
					swal({
						title:'로그인 해주세요!',
						icon: 'error',
						text: '로그인한 계정에서만 호텔리뷰를 등록할 수 있습니다!',
						button: '확인'
					});
				}
			});
		});

		</script>
		</div><%-- hotel-info-container --%>
	</div>


	<%--
		이미지 더보기 버튼(id="photo_viewer_modal)을 누를때
		발생하는 모달.
	 --%>

	 <%--
	<div id="image-viewer-modal-container">
		<div class="modal-background">
			<div class="modal">
				<div id="image-viewer-modal-content-container">
					<div class="modal-close-btn-container">
						<i id="close_modal_btn" class="fas fa-times"></i>
					</div>

					<div id="modal-content-container">
						<div class="swiper-container gallery-top">
							<div class="swiper-wrapper">
								<div class="swiper-slide" style="background-image:url(resources/images/sample_hotel.jpg)"></div>
					            <div class="swiper-slide" style="background-image:url(resources/images/sinra.jpeg)"></div>
					            <div class="swiper-slide" style="background-image:url(resources/images/trump.jpeg)"></div>
					            <div class="swiper-slide" style="background-image:url(resources/images/sample_hotel.jpg)"></div>
					            <div class="swiper-slide" style="background-image:url(resources/images/sinra.jpeg)"></div>
					            <div class="swiper-slide" style="background-image:url(resources/images/trump.jpeg)"></div>
					            <div class="swiper-slide" style="background-image:url(resources/images/sample_hotel.jpg)"></div>
					            <div class="swiper-slide" style="background-image:url(resources/images/sinra.jpeg)"></div>
					            <div class="swiper-slide" style="background-image:url(resources/images/trump.jpeg)"></div>
					            <div class="swiper-slide" style="background-image:url(resources/images/sample_hotel.jpg)"></div>
							</div>

							<div class="swiper-button-next swiper-button-white"></div>
							<div class="swiper-button-prev swiper-button-white"></div>
						</div>

						<div class="swiper-container gallery-thumbs">
							<div class="swiper-wrapper">
								<div class="swiper-slide" style="background-image:url(resources/images/sample_hotel.jpg)"></div>
					            <div class="swiper-slide" style="background-image:url(resources/images/sinra.jpeg)"></div>
					            <div class="swiper-slide" style="background-image:url(resources/images/trump.jpeg)"></div>
					            <div class="swiper-slide" style="background-image:url(resources/images/sample_hotel.jpg)"></div>
					            <div class="swiper-slide" style="background-image:url(resources/images/sinra.jpeg)"></div>
					            <div class="swiper-slide" style="background-image:url(resources/images/trump.jpeg)"></div>
					            <div class="swiper-slide" style="background-image:url(resources/images/sample_hotel.jpg)"></div>
					            <div class="swiper-slide" style="background-image:url(resources/images/sinra.jpeg)"></div>
					            <div class="swiper-slide" style="background-image:url(resources/images/trump.jpeg)"></div>
					            <div class="swiper-slide" style="background-image:url(resources/images/sample_hotel.jpg)"></div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	 --%>

</div>

 <c:import url="../common/footer.jsp" />
</body>


<%--the script for swiper --%>

<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
<script>
	var galleryThumbs= new Swiper('.gallery-thumbs',{
		spaceBetween: 10, // swiper-wrapper안에 있는 swiper-slide의 개수를 의미합니다.
		slidesPerView: 4,  // 슬라이드에서 보여줄수 있는 섬네일개수
		loop: false,
		freeMode: true,
		loopedSlides: 5,
		watchSlidesVisibility: true,
		watchSlidesProgress: true,
	});

	var galleryTop= new Swiper('.gallery-top',{
		spaceBetween: 10,
		loop: false,
		loopedSlides: 5,
		navigation:{
			nextEl:'.swiper-button-next',
			prevEl:'.swiper-button-prev',
		},

		keyboard:{
			enabled: true,
		},

		thumbs:{
			swiper: galleryThumbs,
		}
	});
</script>

<script>
$(function(){
	//게시글 삭제 => board가 삭제되면 나머지도 다 삭제
	$('#remove-hotel-btn').click(function(){
		//삭제 확인 경고창
		swal({
			title:"정말로 삭제하시겠습니까?",
			text: "게시글 삭제하면 관련데이터를 복구를 할 수 없습니다. 정말로 삭제하시겠습니까?",
			icon: "warning",
			buttons: ["삭제 취소", "삭제"],
			dangerMode: true,
		
		})
		.then((willDelete)=>{
			if(willDelete){
				swal({
					title: "호텔 삭제 완료",
					text: "해당 호텔정보를 삭제합니다.",
					icon: "success",
					button: "확인"
				});
				
				//삭제처리
				let hId= $('#hotel-number').val();
				location.href='hotelDelete.ho?hId='+hId;
				
				
			}else{
				swal({
					text: "삭제를 취소합니다.",
					button: '확인'
				});
				
			}
		});
	});
	
	
	$('#review_more_btn').click(function(){
		
		//console.log('더보기 버튼을 클릭하였습니다.');
		//아직 댓글더보기를 수행하기 전
		if($(this).hasClass('review_more_closed')){
			$(this).removeClass('review_more_closed');
			$(this).addClass('review_more_opened'); // 더보기버튼이 보여주지 않게함.
			
			
			$('li.after5_review_closed').each(function(){
				
				$(this).addClass('after5_review_opened'); //6번째 이후 덧글들을 보여준다.
				$(this).removeClass('after5_review_closed');
			})
		}
		
		
	});	
});


</script>

<%-- The script for modal... --%>
<%--
<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
<script>

	$(function(){
		var $button=$('#photo_viewer_modal');
		var $modalContainer= $('#image-viewer-modal-container');
		var $body=$('body');
		var $content=$('.hotel-info-container:nth-child(3)');
		var $btnId;
		var $closeBtn=$('#close_modal_btn');


		// 버튼을 클릭하면 modal이 오픈!
		$button.on('click', function(){
			$btnId= $(this).attr('id');

			// modalContainer에적용된 클래스들을 지우고
			// $btnId에 해당하는 클래스를 추가...
			$modalContainer
				.removeAttr('class')
				.addClass($btnId);

			$content
				.removeAttr('class')
				.addClass('content');

			//body를 modal-active 상태로 한다.
			$body.addClass('modal-active');

			$content.addClass($btnId);

		});


		$button.on('click',function(){
			var galleryThumbs= new Swiper('.gallery-thumbs',{
				spaceBetween: 10, // swiper-wrapper안에 있는 swiper-slide의 개수를 의미합니다.
				slidePerView: 3,  // 슬라이드에서 보여줄수 있는 섬네일개수
				loop: true,
				freeMode: true,
				loopedSlides: 5,
				watchSlidesVisibility: true,
				watchSlidesProgress: true,
			});

			var galleryTop= new Swiper('.gallery-top',{
				spaceBetween: 10,
				loop: true,
				loopedSlides: 5,
				navigation:{
					nextEl:'.swiper-button-next',
					prevEl:'.swiper-button-prev',
				},

				keyboard:{
					enabled: true,
				},

				thumbs:{
					swiper: galleryThumbs,
				}
			});

		});


		//닫기 버튼을 누르면 modal을 닫는다.
		$closeBtn.on('click', function(){
			$modalContainer.addClass('out');
			$body.removeClass('modal-active');
			if( $modalContainer.hasClass($btnId) ){
				$content.addClass('out');
			}

		});

	});
</script>
  --%>




</html>
