<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전국방방곡곡 | 마이페이지</title>
      <!--  insert_2.css -->
      <link rel="stylesheet" href="resources/css/member/myPage.css"> 
      <link rel="shortcut icon" href="resources/images/favicon.ico" type="image/x-icon"> 
</head>
<body>
    <section>   
        <!-- 마이페이지  -->
        <div id="space_1">
            <div id="info1"></div>
            <div id="info2"></div>
            <div id="info3">MYPAGE</div>
            <div></div>
            <div id="info4"></div>
            <div id="info5"><i class="far fa-address-card" id="myPageLogo"></i></div>
            <div id="info6">환영합니다 </div>
            <div id="info7">${ loginUser.memberName }</div>
            <div id="info8">고객님</div>
        </div>
        
        <!-- 메뉴  -->
        <div id="menu">
            <div id="menuSpace1"></div>
            <div id="menuSpace2"></div>
            <ul>             
                <li class="m1" id="myHotel" onMouseOver="this.style.color='#123478';" onMouseOut="this.style.color=''">
                <i class="fas fa-hotel" id="me2"></i>호텔 예약 정보</li>
                
                <li class="m1" id="updateMember" onMouseOver="this.style.color='#123478';" onMouseOut="this.style.color=''">
                <i class="fas fa-user-edit" id="me1"></i>개인정보 수정</li>
                
                <li class="m1" id="myTravel" onMouseOver="this.style.color='#123478';" onMouseOut="this.style.color=''">
                <i class="fas fa-suitcase-rolling" id="me1"></i>내가 담은 여행지</li>
                
                <li class="m1" id="myCourse" onMouseOver="this.style.color='#123478';" onMouseOut="this.style.color=''">
                <i class="fas fa-map-signs" id="me1"></i>나만의 여행코스</li>
                
                <li class="m1" onclick="memberOut();" onMouseOver="this.style.color='#123478';" onMouseOut="this.style.color=''">
                <i class="fas fa-user-slash" id="me3"></i>회원 탈퇴</li>
            </ul>
        </div>
        <form action="myPageUpdate.me" method="post" id="updateMemberView">
            <input type="hidden" value="${ loginUser.memberId }" id="hiddenId" name="hiddenId"> 
        </form>
        <form action="myPageTravel.me" method="post" id="myTravelList">
            <input type="hidden" value="${ loginUser.memberId }" id="hiddenId2" name="hiddenId2"> 
        </form>
        <form action="myPageCourse.me" method="post" id="myCourseList">
            <input type="hidden" value="${ loginUser.memberId }" id="hiddenId3" name="hiddenId3"> 
        </form>
        <form action="myPage.me" method="post" id="myHotelList">
            <input type="hidden" value="${ loginUser.memberId }" id="hiddenId4" name="hiddenId4"> 
        </form>
     </section>
     
     <script>     
     $("#myTravel").click(function(){
    	 var memberId = $('#hiddenId2').val();
    	 
    	 if(memberId==""){
    		 swal("로그인 후 이용가능합니다🙋");
    	 } else {
    		 $('#myTravelList').submit();
    	 }    	  	 
     });
     
     $("#myCourse").click(function(){
    	 var memberId = $('#hiddenId3').val();
    	 
    	 if(memberId==""){
    		 swal("로그인 후 이용가능합니다🙋");
    	 } else {
    		 $('#myCourseList').submit();
    	 }    	  	 
     });
     
     $("#updateMember").click(function(){  	 
         var memberId = $('#hiddenId').val();
    	 
    	 if(memberId==""){
    		 swal("로그인 후 이용가능합니다🙋");
    	 } else {
    		 $('#updateMemberView').submit(); 
    	 }    	 	 
     });
     
     $("#myHotel").click(function(){  	 
         var memberId = $('#hiddenId4').val();
    	 
    	 if(memberId==""){
    		 swal("로그인 후 이용가능합니다🙋");
    	 } else {
    		 $('#myHotelList').submit(); 
    	 }    	 	 
     });
     
     function memberOut(){
    	 location.href="<%= request.getContextPath() %>/memberOut.me";
     }
     
     </script>
</body>
</html>