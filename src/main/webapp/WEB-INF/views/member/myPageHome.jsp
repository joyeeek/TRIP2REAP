<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전국방방곡곡 | 호텔 예약 정보</title>
      <!--  myPageHotel.css -->
      <link rel="stylesheet" href="resources/css/member/myPageHotel.css">
      <link rel="shortcut icon" href="resources/images/favicon.ico" type="image/x-icon">
</head>
<body>
    <header>
    <%@ include file="../common/menubar.jsp" %>
    
    <c:if test="${ loginUser.mCategory eq 'member' }">    
    <%@ include file="../member/myPage.jsp" %>    
    </c:if>
    
    <c:if test="${ loginUser.mCategory ne 'member' }">    
    <%@ include file="../member/myPage_kakao_naver.jsp" %>    
    </c:if>
    </header>
    
    <section>
    <div id="board_list">
    <!-- 호텔 예약 정보 설명란  -->
        <div>
            <div id="infor1"></div>
            <div id="infor2"></div>
            <div id="infor3"><i class="fas fa-hotel" id="myHotelIcon"></i>호텔 예약 정보</div>            
        </div>
     </div>
     
     <div id="list_all_div">		
			<c:if test = "${ empty list }">
			<div id="list_empty_div">
			    <div id="up_space1"></div>
				<div id="emptyHotel">예약한 호텔이 없습니다</div>
				<div id="up_space1"></div>
				<button id="myHotelBtn">호텔 보러가기</button>
				<div id="up_space1"></div>
		    </div>
			</c:if>						
			
			<c:forEach var="t" items="${ list}" varStatus="tIdx">
				
				<div id="list_hotel_div">	
					<input id="reserveNo" type="hidden" value="${t.reserveNo }">		    
					<div id="hotel_img_div">
						<c:if test="${t.imageName != null }"> <!-- insert로 등록한 여행지 -->
						 <img src="resources/buploadFiles/${ t.imageName }" id="hotel_img" /> 
						</c:if>
						
						<c:url var="tdetail" value="hotelDetailView.ho">
							<c:param name="hId" value="${ t.boNo }"/>
							<c:param name="page" value="1"/>
						</c:url>
						<div id="hotel_r1"><a id="hotel_a" href="${ tdetail }">이용후기 작성하기</a></div>
						<div id="hotel_r2">|</div>
						<div id="hotel_r3">예약취소</div>
					</div>
					
					<div id="hotel_name_writer_div">
					    <input type="hidden" id="hId" name="hId" value="${ t.boNo }">	
					    <input type="hidden" id="roomNo" name="roomNo" value="${t.roomNo }">
						<div id="hotel_name">
							<a href="${ tdetail }">${ t.title }</a>	
						</div>
						<div id="hotel_room">[${t.roomName}]</div>	
						<div class="hotelCheck">
							<ul id="hotelCheckUl">
								<li>
									<div class="ck_label1">체크인</div>
									<label id="blueBar">|</label>
									<label id="checkInLabel">${t.checkIn}</label>
								</li>
								<li>
									<div class="ck_label2">체크아웃</div>
									<label id="blueBar">|</label>
									<label id="checkOutLabel">${t.checkOut}</label>
								</li>
							</ul>
							
								<div id="hotel_price">
						    		₩ <fmt:formatNumber value="${t.price}" type="number"/>
							    </div> 							      						    
						</div>
						<button id="detailReservation">자세히 보기</button>

					</div>			
				</div>			
			</c:forEach>	
			<input type="hidden" id="hiddenId" value="${ loginUser.memberId }">
		</div>
     </section>
     <div id="footerSpaces"></div>
     <footer>
   	        <c:import url="../common/footer.jsp" />
	 </footer>
     
     <script>
          
          $(function(){
        	  //예약호텔이 존재하지 않을때
        	  $('#myHotelBtn').click(function(){
        	         location.href="<%= request.getContextPath() %>/hotelList.ho";
               });
        	  
        	  //환불하기
        	  $('#hotel_r3').click(function(){      		  
        		  let reserveNo= Number($('#reserveNo').val());
        		  
        		  swal({
        			  title: "환불 요청",
        			  text: "해당 예약내역이 삭제될 수 있습니다. 환불 하시겠습니까?",
        			  icon: "warning",
        			  buttons: ['취소', '확인'],
        			  dangerMode: true,
        			})
        			.then((willDelete) => {
        			  if (willDelete) {
        			    
        			    
        			    $.ajax({
      			    	  url:'refundReservation.me',
      			    	  type:'post',
      			    	  data:{reserveNo: reserveNo},
      			    	  success:function(response){
      			    		  if(response=='success'){
      			    			swal({
      			    				title: "환불 처리 성공", 
      			    				icon: "success",
      			    				text: '성공적으로 환불처리 되었습니다.',
      			    				button: '확인'
      	        			    });
      			    			
      			    			
      			    			
      			    		  }else{
      			    			swal({
      			    				title: "환불 처리 실패", 
        	        			    icon: "error",
        	        			    text: '환불처리 중 문제가 발생하였습니다.',
        	        			    button: '확인'
        	        			 });
      			    		  }
      			    	  }
      			      	});
      			    
        			    location.reload();
        			  } else {
        			    swal("환불처리를 취소합니다.");
        			  }
        			  
        			});
        	  });
        	  
        	  
        	  //자세히보기
        	  $('#detailReservation').click(function(){
        		  let reserveNo= Number($('#reserveNo').val());
        		  let roomNo=Number($('#roomNo').val());
        		  let boNo=Number($('#hId').val());
        		  location.href="reservationDetailView.me?reserveNo="+reserveNo+"&hId="+boNo+"&roomNo="+roomNo;
        	  });
        	  
          });
     </script>
</body>
</html>