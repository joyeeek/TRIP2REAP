<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!-- jquery -->
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>

    <!-- css -->
    <link rel="stylesheet" href="resources/css/hotel/hotel_list.css">

    <!-- font-awesome -->
    <script src="https://kit.fontawesome.com/09697e2134.js" crossorigin="anonymous"></script>
	<link rel="shortcut icon" href="resources/images/favicon.ico" type="image/x-icon">
    <title>전국방방곡곡 | 호텔</title>

</head>


<body>
	<div>
   	 	<c:import url="../common/menubar.jsp" />
	</div>

    <div id="main-container">
        <div id="title-container">
            <i class="fas fa-hotel" id="hotel-icon"></i>
            <span id="title-name">호텔 예약</span>

        </div>

        <div id="button-container">
            <div id="left_btns_container">
                <ul id="left_btns" class="btn_ul">
                	<!-- 호텔등록은 관리자 회원만 가능하다! / 관리자인지 확인하는 방법을 모색해보자. -->

                    <c:if test="${loginUser.memberId=='admin' }">
                    	<li><button id="insert-hotel" class="btn" onclick="location.href='hotelInsertView.ho'">호텔 등록하기</button></li>
                    </c:if>
                    
                    
                    <%--상세검색 modal을 띄운다--%>
                    <li>
                    	<button id="detail-search" class="btn">상세검색</button>
                    </li>
                </ul>

            </div>

            <div></div>
			
            <div id="right_btns_container">
                <ul id="right_btns" class="btn_ul">
                
                
                    <li>	
               	       	<%--평점순(1)--%>
                    	<button id="popularity" class="btn">평점순</button>                    	 
                    </li>
                
                    
                    
                    
                    <li>
                    	<button  id="price_order_direction_btn" class="btn">가격순</button>
                    	<div id="price_order_direction_container" class="closed">
                    		<ul id="price_order_direction_wrapper">
                    		
                    			<%--가격이 높은순(3) --%>
                   				<li id="price_high">
                    				가격&nbsp;<span style="color:red;">높은순</span>
                    			</li>
                   			
                    			<%--가격낮은순(4) --%>
                   				<li id="price_low">
                    				가격&nbsp;<span style="color: blue;">낮은순</span>
                    			</li>
                   			
                    		</ul>
                    		
                    	</div>
                    </li>
                    
                    <li>
                    	<%--등급순(2) --%>
                   		<button id="rank_high" class="btn">등급순</button>
                    </li>
                </ul>
            </div>
        </div>
		
		
        <div id="hotel-list-container">
			<%--호텔검색결과가 존재하지 않을 때!--%>
			<c:if test="${empty hotelList }">
				<p>호텔이 존재하지 않습니다!</p>
			</c:if>

			<%-- list가 2개이상일때  --%>
			<%--<c:forEach var="hotel" items="${hotelList}" varStatus="status"> --%>
			<c:if test="${!empty hotelList}">
				<c:forEach var="i" begin="0" end="${fn:length(hotelList)-1}" varStatus="status">
					<div class="one-hotel-info-container">
						<%--썸네일 이미지 --%>
						<c:if test="${!empty thumbnailImgList.get(status.index)  }">
							<%--썸네일 이미지가 존재한다면 --%>
							<img class="hotel_thumbnail_img" src="resources/buploadFiles/${thumbnailImgList.get(status.index).changeName}"/>
						</c:if>
						
						<c:if test="${empty thumbnailImgList.get(status.index) }">
							<%--썸네일 이미지가 존재하지 않는다면 --%>
		                	<img class="hotel_thumbnail_img" src="resources/images/sample_hotel.jpg" alt="호텔이미지">
						</c:if>
						
		                <div class="detail-info-container">
		                    <div>
		                        <div class="info-container">
		                            <!-- 호텔이름 -->
		                            <div class="hotel-name-container">
		                            	<%--호텔번호 --%>
		                            	<input class="hotelNO" type="hidden" value="${hotelList.get(status.index).boNo}"/>
	
		                                <h1>${hotelList.get(status.index).boTitle }</h1>
		                                <div class="hotel-rank-wrapper">
	
	    			                    		<small class="hotel-rank">
	    			                    			<c:if test="${hotelList.get(status.index).hotelRank eq 0 }">
	    			                    				등급 없음
	    			                    			</c:if>
	    			                    			<c:if test="${hotelList.get(status.index).hotelRank ne 0 }">
	    			                    				${hotelList.get(status.index).hotelRank } 등급
	    			                    			</c:if>
	    			                    		</small>
	
				                    	</div>
		                            </div>
	
		                            <!-- 좋아요 버튼 -->
		                            <div class="i-like-btn-container">
		                            	<c:if test="${likeHotelList.get(status.index)==0}">
		                                	<i class="fas fa-heart unlike"></i>
		                            	</c:if>
	
		                            	<%--이미 좋아요를 눌렀다면? --%>
		                            	<c:if test="${ likeHotelList.get(status.index)>0}">
		                                	<i class="fas fa-heart like"></i>
		                            	</c:if>
	
	
		                            </div>
		                        </div>
		                        
		                        <div class="hashtag_container">
		                        	<%--해시태그 리스트가 존재한다면 --%>
		                        	<c:if test="${!empty hashTagList.get(status.index) }">
			        					<c:forEach var="hashTag" items="${hashTagList.get(status.index)}">
			        						<span>
			        							<i class="fas fa-hashtag hashtag_icon"></i>
			        							<small class="hashtag_content">${hashTag }</small>
			        						</span>
			        					</c:forEach>
		        					</c:if>
		        					
		                        </div>
	
		                    </div>
	
	
		                    <div class="detail-info-wrapper">
		                        <!-- 호텔주소 -->
		                        <div class="hotel-addr-wrapper">
		                            <small class="hotel_addr">${hotelList.get(status.index).hotelAddr}</small>
		                        </div>
	
	
		                        <div class="hotel-info-wrapper">
		                            <!-- 별점 -->
		                            <div class="hotel-review-container">
		                            
		                                <span class="star-point">
		                                	<c:forEach var="star" begin="${1}" end="${5}">
												<c:if test="${star<=hotelList.get(status.index).hotelReviewScore }">
													<i class="fas fa-star"></i>
												</c:if>
												<c:if test="${star>hotelList.get(status.index).hotelReviewScore }">
													<c:if test="${star-0.5<=hotelList.get(status.index).hotelReviewScore }">
														<i class="fas fa-star-half-alt"></i>
													</c:if>
													
													<c:if test="${star-0.5>hotelList.get(status.index).hotelReviewScore }">
														<i class="far fa-star"></i>
													</c:if>
												</c:if>
											</c:forEach>
		                                
		                                    <%-- <i class="fas fa-star"></i> --%>
		                                </span>
		                                <%-- <span> ${hotelList.get(status.index).hotelReviewScore}</span>/5.0 --%>
		                            </div>
	
	
		                            <!-- 1박 가격 -->
		                            <div class="hotel-per-day-price-container info-container">
		                                <p>
		                                    <small>1박</small>&nbsp;&nbsp;
		                                    <b class="min_room_price">
		                                    	<fmt:formatNumber value="${minRoomPricePerDayList.get(status.current)}" type="number"/>
		                                    </b>
		                                    원&nbsp;~&nbsp;
		                                    <b class="max_room_price">
		                                    	<fmt:formatNumber value="${maxRoomPricePerDayList.get(status.current) }" type="number"/>
		                                    </b>원
		                                </p>
		                            </div>
		                        </div>
		                    </div>
							<div class="hotel_reserve_button_wrapper">
		                    	<button class="hotel-reserve-btn">예약하기</button>
		                    </div>
		                </div>
		            </div>
				</c:forEach>
			</c:if>
        </div>
        <!--호텔리스트 끝  -->

        <!-- 호텔페이지네이션 시작 -->
        <div id="pagination-container">
        	<nav>
                <ul id="pagination-ul">


					<!-- [1] 이전페이지 -->
					<%--현재페이지가 맨 앞페이지라면 --%>
					<c:if test="${pi.currentPage<=1 }">
						<a><li>&lt;&lt;</li></a>
						<a><li>&lt;</li></a>
					</c:if>

					<%--현재페이지가 맨앞페이지가 아니라면 --%>
					<c:if test="${pi.currentPage>1 }">
						<c:url var="firstPage" value="hotelList.ho">
							<c:param name="page" value="${pi.startPage }"/>
							<c:param name="searchTypeDetail" value="${ searchTypeDetail }"/>
                    		<c:param name="searchHotelRank" value="${ searchHotelRank }"/>
                    		<c:param name="searchHotelLocalCode" value="${ searchHotelLocalCode}"/>
                    		<c:param name="searchHotelPricePerDayType" value="${ searchHotelPricePerDayType}"/>
                    		<c:param name="searchHotelName" value="${searchHotelName }"/>
						</c:url>
						
						<a href="${firstPage }">
						<li style="cursor:pointer;">&lt;&lt;</li>
						</a>


						<c:url var="before" value="hotelList.ho">
							<c:param name="page" value="${pi.currentPage-1 }"/>
							<c:param name="searchTypeDetail" value="${ searchTypeDetail }"/>
                    		<c:param name="searchHotelRank" value="${ searchHotelRank }"/>
                    		<c:param name="searchHotelLocalCode" value="${ searchHotelLocalCode}"/>
                    		<c:param name="searchHotelPricePerDayType" value="${ searchHotelPricePerDayType}"/>
                    		<c:param name="searchHotelName" value="${searchHotelName }"/>
						</c:url>
						
						<a href="${before }">
							<li style="cursor:pointer;">&lt;</li>
						</a>

					</c:if>


                    <!-- [2]페이지번호 -->
                    <c:forEach var="p" begin="${pi.startPage }" end="${pi.endPage }">
                    	<%-- p가 현재페이지와 같다면 --%>
                    	<c:if test="${p eq pi.currentPage }">
                    		<a style="font-weight:bold; ">
                    		<li  style="background-color: var(--mid-green);color:#fff;">${p}</li>
                    		</a>
                    	</c:if>

                    	<%--p가 현재페이지와 다르다면.. --%>
                    	<c:if test="${p ne pi.currentPage }">
                    		<c:url var="pagination" value="hotelList.ho">
                    			<c:param name="page" value="${p }"/>
                    			<c:param name="searchTypeDetail" value="${ searchTypeDetail }"/>
	                    		<c:param name="searchHotelRank" value="${ searchHotelRank }"/>
	                    		<c:param name="searchHotelLocalCode" value="${ searchHotelLocalCode}"/>
	                    		<c:param name="searchHotelPricePerDayType" value="${ searchHotelPricePerDayType}"/>
	                    		<c:param name="searchHotelName" value="${searchHotelName }"/>
                    		</c:url>

							<a href="${pagination }">
	                    		<li style="cursor:pointer;">
	                    			${p }
	                    		</li>
                    		</a>
                    	</c:if>
                    </c:forEach>


                    <!-- [3]이후페이지 -->
                    <%--
                    <li><a href="">&gt;</a></li>
                     --%>
                    <%--현재페이지가 maxPage보다 더 크면..(다음페이지가 존재하지 않음) --%>
                    <c:if test="${pi.currentPage>=pi.maxPage }">
                    	<a><li>&gt;</li></a>
                    	<a><li>&gt;&gt;</li></a>
                    </c:if>

                    <%--현재페이지가 maxPage보다 작으면.. (다음페이지가 존재)--%>
                    <c:if test="${pi.currentPage< pi.maxPage }">

                    	<!-- 다음페이지 -->
                    	<c:url var="after" value="hotelList.ho">
                    		<c:param name="page" value="${pi.currentPage+1 }"/>
                    		<c:param name="searchTypeDetail" value="${ searchTypeDetail }"/>
                    		<c:param name="searchHotelRank" value="${ searchHotelRank }"/>
                    		<c:param name="searchHotelLocalCode" value="${ searchHotelLocalCode}"/>
                    		<c:param name="searchHotelPricePerDayType" value="${ searchHotelPricePerDayType}"/>
                    		<c:param name="searchHotelName" value="${searchHotelName }"/>
                    	</c:url>
                    	<a href="${after }"><li style="cursor:pointer;">&gt;</li></a>

                    	<!-- 마지막 페이지 -->
                    	<c:url var="lastPage" value="hotelList.ho">
	                    	<c:param name="page" value="${pi.endPage }"/>
	                    	<c:param name="searchTypeDetail" value="${ searchTypeDetail }"/>
                    		<c:param name="searchHotelRank" value="${ searchHotelRank }"/>
                    		<c:param name="searchHotelLocalCode" value="${ searchHotelLocalCode}"/>
                    		<c:param name="searchHotelPricePerDayType" value="${ searchHotelPricePerDayType}"/>
                    		<c:param name="searchHotelName" value="${searchHotelName }"/>
	                    </c:url>
	                    <a href="${lastPage }"><li style="cursor:pointer;">&gt;&gt;</li></a>
                    </c:if>

                </ul>
            </nav>
        </div>
        <!-- 호텔페이지네이션 끝 -->
    </div>


    <!-- modal-->
    <div id="modal-container">
        <div id="modal-background" class="modal-background">
            <div class="modal">

                <div class="close-modal-container">
                    <div></div>
                    <div>
                        <i id="close_btn" class="fas fa-times"></i>
                    </div>
                </div>

                <div class="modal-title-container">
                    <h2>상세검색</h2>
                </div>

                <div class="modal-body-container">
                    <table >
                        <tr colspan=3>
                            <td>
                                <h5>지역검색</h5>
                            </td>
                            <td>
                                <select class="detail-search-option" name="place" id="place">
                                    <option value="0" selected>지역선택</option>
                                    <option value="1">강원도</option>
                                    <option value="2">경기도</option>
                                    <option value="3">경상남도</option>
                                    <option value="4">경상북도</option>
                                    <option value="5">광주광역시</option>
                                    <option value="6">대구광역시</option>
                                    <option value="7">대전광역시</option>
                                    <option value="8">부산광역시</option>
                                    <option value="9">서울특별시</option>
                                    <option value="10">세종특별자치시</option>
                                    <option value="11">인천광역시</option>
                                    <option value="12">울산광역시</option>
                                    <option value="13">전라남도</option>
                                    <option value="14">전라북도</option>
                                    <option value="15">제주특별자치도</option>
                                    <option value="16">충청남도</option>
                                    <option value="17">충청북도</option>
                                </select>
                            </td>
                        </tr>

                        <tr>
                            <td>
                                <h5>호텔등급</h5>
                            </td>
                            <td>
                                <select class="detail-search-option" name="rank" id="rank">
                                    <option value="0" selected>등급 선택</option>
                                    <option value="1">1</option>
                                    <option value="2">2</option>
                                    <option value="3">3</option>
                                    <option value="4">4</option>
                                    <option value="5">5</option>
                                </select>
                            </td>

                        </tr>
                        <tr>
                            <td>
                                <h5>가격대 </h5>
                            </td>
                            <td>
                                <select class="detail-search-option" name="price-per-day" id="price-per-day" >
                                    <option value="0" selected>가격 선택</option>
                                    <option value="1">5만원 미만</option>
                                    <option value="2">5만원 이상 ~ 10만원 미만</option>
                                    <option value="3">10만원 이상 ~ 15만원 미만</option>
                                    <option value="4">15만원 이상 ~ 20만원 미만</option>
                                    <option value="5">20만원 이상</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <h5>호텔이름</h5>
                            </td>
                            <td>
                                <input class="detail-search-option" name="hotel-name" id="hotel-name" type="text" autocomplete="off" placeholder="호텔이름">
                            </td>
                        </tr>
                    </table>
                </div>

                <div class="modal-btn-container">
                    <button id="detail-hotel-search">호텔 검색</button>
                </div>

            </div>
        </div>
    </div>
    <!-- modal끝 -->
    
    
    
 <c:import url="../common/footer.jsp" />
</body>
<script>

//modal
$(function(){
        var $detailSearchBtn=$('#detail-search'),
        $modalContainer = $('#modal-container'),
        $body = $('body'),
        $content= $('#main-container'),
        $closeBtn= $('#close_btn'),
        $btnId;

        // 상세검색 버튼을 클릭.
        $detailSearchBtn.on('click', function(){
            //버튼아이디를 불러옵니다.
            $btnId= $(this).attr('id'); //detail-search

            //modal-container에 기존 클래스들을 빼놓고, btnId클래스를 적용합니다.
            $modalContainer
                .removeAttr('class')
                .addClass($btnId);

            $content
                .removeAttr('class')
                .addClass('content');

            $body.addClass('modal-active'); //body에 modal-active라는 클래스를 적용.

            $content.addClass($btnId);
        });

        //닫기버튼(x 표시 아이콘) 클릭시
        $closeBtn.on('click', function(){
            $modalContainer.addClass('out');
            $body.removeClass('modal-active'); //modal-active 클래스 해제

            if($modalContainer.hasClass($btnId)){
                $content.addClass('out');
            }
        });
        

}); //modal- wrapper finished


$(function(){
	
	
	$('#price_order_direction_btn').mouseenter(function(){
		let $priceContainer= $('#price_order_direction_container');
		if($priceContainer.hasClass('closed')){
			$priceContainer.removeClass('closed');
			$priceContainer.addClass('opened');
			$priceContainer.css('display', 'flex');
		}else if($priceContainer.hasClass('opened')){
			$priceContainer.removeClass('opened');
			$priceContainer.addClass('closed');
			$priceContainer.css('display', 'none');
		}
	});
	
	
	$('#price_order_direction_container').mouseout(function(){
		if($(this).hasClass('closed')){
			$(this).removeClass('closed');
			$(this).addClass('opened');
			$(this).css('display', 'flex');
		}else if($(this).hasClass('opened')){
			$(this).removeClass('opened');
			$(this).addClass('closed');
			$(this).css('display', 'none');
		}
	});
	

});


//정렬
$(function(){
	function orderBy(orderNumber){
		if( orderNumber!=5){
			// 가격순, 평점순, 등급순
			location.href='hotelList.ho?searchTypeDetail='+ orderNumber;
		}else{
			// 상세검색
			//검색조건 출력하기
	       	//호텔검색 지역코드(선택안함: 0)
	       	let $search_hotel_local_code= Number($('#place > option:selected').val());
	       	
	       	//호텔검색 호텔등급(선택안함: 0)
	       	let $search_hotel_rank= Number($('#rank > option:selected').val());
	       	
	       	//호텔검색 1일 이용가격(종류)
	       	//	1일가격 번호		가격범위
	       	//  0				(선택안함)
	       	//	1				5만원 미만
	       	//	2				5만원 이상 ~ 10만원 미만
	       	//	3				10만원 이상 ~ 15만원 미만
	       	//	4				15만원 이상 ~ 20만원 미만
	       	//	5				20만원 초과
	       	let $search_hotel_price_per_day_type= Number($('#price-per-day > option:selected').val());
	       	
	       	//호텔검색 호텔이름 (빈공간제거)
	       	let $search_hotel_name= $('#hotel-name').val().trim();
	       	
	       	//검색조건 내용 출력해보기.
	       	//console.log('호텔지역코드 => ' + $search_hotel_local_code);
	       	//console.log('호텔등급 => ' + $search_hotel_rank);
	       	//console.log('호텔 1일 이용가격 => '+ $search_hotel_price_per_day_type);
	       	//console.log('호텔이름 => '+ $search_hotel_name);
	       	
			if($search_hotel_name!=''){
				location.href='hotelList.ho?searchTypeDetail='+ orderNumber+'&searchHotelRank='+$search_hotel_rank
								+'&searchHotelLocalCode='+$search_hotel_local_code
								+'&searchHotelPricePerDayType='+$search_hotel_price_per_day_type
								+'&searchHotelName='+$search_hotel_name;
			}else{
				location.href='hotelList.ho?searchTypeDetail='+ orderNumber+'&searchHotelRank='+$search_hotel_rank
				+'&searchHotelLocalCode='+$search_hotel_local_code
				+'&searchHotelPricePerDayType='+$search_hotel_price_per_day_type;
			}
			//모달창을 나간다.
    		$modalContainer.addClass('out');
    		$body.removeClass('modal-active');
    		if($modalContainer.hasClass($btnId)){
    			$content.addClass('out');
    		}
		}
	}
	
	//상세검색결과
	$(document).on('click','#detail-hotel-search',function(){
	       	//console.log('어머나~ 호텔상세검색 버튼을 클릭하셨군요?');
	       	
	      	//검색조건에 맞는 호텔 리스트를 구한다.
        	orderBy(5);	       	
	 });
	
	
	//평점순
	$(document).on('click', '#popularity',function(){
		orderBy(1);
	});
	
	//가격순
	//가격높은순(3)
	$(document).on('click','#price_high',function(){
		orderBy(3);
	});
	
	//가격낮은순
	$(document).on('click','#price_low',function(){
		orderBy(4);
	});
	
	//등급순
	$(document).on('click', '#rank_high', function(){
		orderBy(2);
	})
});



//heart -btn
$(function(){
	$(document).on('click', '.fa-heart' , function(e){
		let targetHeartBtn= $(this);
		let loginUserObj='${loginUser}';

		//좋아요 선택한 호텔번호를 구한다.
		let likeHotelNo= Number(targetHeartBtn.closest('div.one-hotel-info-container').find('.hotelNO').val());

		//console.log('어머 좋아요를 누르셨군요?');

		if(loginUserObj){
			//로그인 상태

			let tmp=targetHeartBtn.hasClass('unlike');
			//console.log(tmp);

			//unlike 라는 이름의 클래스를 가지고있다. : unlike->클릭->like
			if( targetHeartBtn.hasClass('unlike') ){
				$(this).removeClass('unlike');
				$(this).addClass('like');

				$.ajax({
					url:'updateLikeHotel.ho',
					data:{
						hId:likeHotelNo
					},
					type:'post',
					success:function(){
						//좋아요누르면, 해당아이디에 좋아요표시를 한다.
						$(this).removeClass('unlike');
						$(this).addClass('like');

						//좋아요 반영되었습니다!
						swal({
							  title: "좋아요 반영 성공",
							  text: "성공적으로 좋아요를 반영했습니다.",
							  icon: "success",
							  button: "확인",
						});
					}
				});


			}else if(targetHeartBtn.hasClass('like')){//like->클릭->unlike
				$(this).removeClass('like');
				$(this).addClass('unlike');

				$.ajax({
					url:'updateCancelLikeHotel.ho',
					data:{
						hId:likeHotelNo
					},
					type:'post',
					success:function(){
						//좋아요누르면, 해당아이디에 좋아요표시를 한다.
						$(this).removeClass('unlike');
						$(this).addClass('like');

						swal({
							  title: "좋아요 해제 성공!",
							  text: "성공적으로 좋아요 해제를 반영했습니다.",
							  icon: "success",
							  button: "확인",
						});
					}
				});


			}


		}else{
			//로그아웃상태
			//console.log('로그아웃 상태입니다.');
			swal({
				  title: "좋아요 반영 실패",
				  text: "로그인을 하신 후에 이용해주세요.",
				  icon: "error",
				  button: "확인",
			});
		}

	}); //smash-heart-btn wrapper finised

	
	//예약하기 버튼 클릭
	//예약하기 버튼을 누르면=> 디테일뷰로 이동.
	$(document).on('click','button.hotel-reserve-btn',function(){
		var hId = $(this).closest('.one-hotel-info-container').find('.hotelNO').val();
		//console.log(bId);
		//디테일뷰로 들어간다.
		location.href="hotelDetailView.ho?hId="+hId+ "&page="+${pi.currentPage};
	});

});



</script>
</html>
