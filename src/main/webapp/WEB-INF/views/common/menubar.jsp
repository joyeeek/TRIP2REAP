<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전국방방곡곡</title>

<!--  menubar.css -->
<link rel="stylesheet" href="resources/css/common/menubar.css">
<!-- swal코드 -->
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<!-- <i>태그 사용 코드 -->
<script src="https://use.fontawesome.com/releases/v5.9.0/js/all.js"></script>
<!-- css -->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.1/css/all.css" integrity="sha384-vp86vTRFVJgpjF9jiIGPEEqYqlDwgyBgEF109VFjmqGmIY/Y4HV4d3Gp2irVfcrp" crossorigin="anonymous">
<!-- jQuery코드 -->
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<!-- Modal코드  -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />
<!-- 카카오코드  -->
<script type="text/javascript" src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
<!-- 파비콘  -->
<link rel="shortcut icon" href="resources/images/favicon.ico" type="image/x-icon">


</head>
<body>
	<!-- 메뉴바는 어느 페이지든 포함하고 있을 테니 여기서 contextPath 변수 값 만들기  -->
	<c:set var="contextPath"
		value="${ pageContext.servletContext.contextPath }"
		scope="application" />
	<header>	
		<!-- 상단바  -->
	<div id="all_rootBar">
		<div id="rootBar">
			<c:if test="${ empty sessionScope.loginUser}">
				<div class="root">
					<ul>
						<!-- 로그아웃 상태 -->
						<li class="topBar">
						<a class="btn" href="#ex7" onMouseOver="this.style.color='#F2CA5E';"
							onMouseOut="this.style.color=''">로그인</a></li>
						<li class="topBar" onclick="join();"
							onMouseOver="this.style.color='#F2CA5E';"
							onMouseOut="this.style.color=''">회원가입</li>
					</ul>
				</div>
			</c:if>
			<c:if test="${ !empty sessionScope.loginUser }">
				<div class="root">
					<ul>
						<!-- 로그인 상태  -->
						<li class="topBar2_1"><b><c:out
									value="${ loginUser.nickName }님 환영합니다!" /></b></li>
						<li class="topBar2_2" onclick="logout();"
							onMouseOver="this.style.color='#F2CA5E';"
							onMouseOut="this.style.color=''">로그아웃</li>
						<li class="topBar2_2" id="myPageBtn" onMouseOver="this.style.color='#F2CA5E';"
							onMouseOut="this.style.color=''">마이페이지</li>
					</ul>
				</div>
			</c:if>
		</div>
		
		<!-- 메뉴(여행지, 여행코스, 여행후기, 호텔) -->
		<div id="menu_1">
		    <div id="menu_4"></div>
			<div id="menu_2">
				<img src="resources/images/로고로고.png" id="mainLogo" onclick="main();">
			</div>
			<div id="menu_3">
				<span id="menu_travel" class="menus">
					<i class="fas fa-suitcase-rolling" id="menuIcon1"></i>
					<span class="menu_name">여행지</span>					
				</span>
				<span id="menu_line">|</span>
				<span id="menu_course" class="menus">
					<i class="fas fa-map-signs" id="menuIcon2"></i>
					<span class="menu_name">여행 코스</span>
				</span>
				<span id="menu_line">|</span>
				<span id="menu_review" class="menus">
					<i class="fas fa-camera-retro" id="menuIcon3"></i>
					<span class="menu_name">여행 후기</span>
				</span>
				<span id="menu_line">|</span>
				<span id="menu_hotel" class="menus">
					<i class="fas fa-hotel" id="menuIcon4"></i>
					<span class="menu_name">호텔</span>
				</span>
			</div>
			<div id="menu_4"></div>
		</div>
	</div>

        <!-- 로그인 창  -->
		<div id="ex7" class="modal">
		    <div id="login_spaceStart"></div>
			<p id="loginLabel">LOGIN</p>
			<div id="login_space4"></div>
			<div id="loginDiv">
			<div id="idPwdDiv">
			<div id="idIconDiv"><i class="fas fa-user-circle" id="idIcon"></i></div>
	        <input type="text" id="loginInfo_1" class="loginInfo" name="memberId" placeholder="아이디를 입력해주세요"
	         onfocus="this.placeholder=''" onblur="this.placeholder='아이디를 입력해주세요'" autocomplete="off" ></div>	         
	        <div id="login_space1"></div>
	        <div id="idPwdDiv">
	        <div id="pwdIconDiv"><i class="fas fa-lock" id="pwdIcon"></i></div>
	        <input type="password" id="loginInfo_2" name="memberPwd" class="loginInfo" placeholder="비밀번호를 입력해주세요"
	         onfocus="this.placeholder=''" onblur="this.placeholder='비밀번호를 입력해주세요'" autocomplete="off"></div>
	         </div>
	    <div id="login_space2"></div>
	    
	    <!-- 아이디 저장  -->
	    <div id="idSave_1">
	        <input type="checkbox" id="idSave_2" name="remember" value="1">
	        <label for="idSave_2" id="idSave_3">아이디 저장</label>
	    </div>
	    <div id="idSave_4"></div>
	    
	    <!-- 버튼  -->
	    <div id="loginDiv">
	        <button id="loginButton">로그인</button>
	        <div id="login_space2"></div>
	        <div id="login_space3">
	            <label class="search" onclick="searchId()" onMouseOver="this.style.color='#77af82';"
							onMouseOut="this.style.color=''">아이디 찾기</label>
	            <label>&nbsp;|&nbsp;</label>
	            <label class="search" onclick="searchId()" onMouseOver="this.style.color='#77af82';"
							onMouseOut="this.style.color=''">비밀번호 찾기</label>
	            <label>&nbsp;|&nbsp;</label>
	            <label class="search" onclick="join();" onMouseOver="this.style.color='#77af82';"
							onMouseOut="this.style.color=''">회원가입</label>
	        </div>
	    </div>   
	    <div>
	        <div id="otherBtn">
	            <div id="otherSpace"></div>
                <div id="otherLogin_space"></div>
                <div id="loginButton2" onclick="location.href='https://kauth.kakao.com/oauth/authorize?client_id=9d8f7f524c07ea08ff127d7591c2fbd5&redirect_uri=http://localhost:13080/reap/kakaoLogin.me&response_type=code'">
                <i class="fas fa-comment" id="btn2_1"></i>
	            <a id="btn2_2">카카오 계정으로 로그인</a>
	            </div>	            
	        
	        <div id="login_space5"></div>

                <div id="loginButton3" onclick="location.href='https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=7SqOY7uotfJIREqGVR6P&redirect_uri=http://localhost:13080/reap/naverLogin.me&state=1162353973'">
                <i class="fab fa-neos" id="btn3_1"></i>
	            <a id="btn3_2">네이버 계정으로 로그인</a>
	            </div>	            
	        </div>
	            
	        <div id="login_spaceFoot"></div>
		</div>
		</div>
		<form action="myPage.me" method="post" id="myReservation">
            <input type="hidden" value="${ loginUser.memberId }" id="hiddenId4" name="hiddenId4"> 
        </form>
        <form action="courseList.co" method="post" id="menuCourseList">
	        <input type="hidden" id="selectCategory" name="selectCategory" value="0">
	    </form>
	    <%@ include file="remote_control.jsp" %>
	</header>

	<script>
    function main(){
  	  location.href="<%= request.getContextPath() %>/home.do";
    }  
    
    function join(){
      location.href="<%= request.getContextPath() %>/join.me";
    }
    
    function logout(){    	
      location.href="<%= request.getContextPath() %>/logout.me";
    }
      
    $("#myPageBtn").click(function(){  	 
     var memberId = $('#hiddenId4').val();
   	 
   	 if(memberId==""){
   		 swal("로그인 후 이용가능합니다🙋");
   	 } else {
   		 $('#myReservation').submit(); 
   	 }    	 	 
    }); 
    
    function searchId(){
  	   location.href="<%= request.getContextPath() %>/searchId.me";
    }
    
    
    $("#loginInfo_1").focusin(function(){
    	$("#loginInfo_1").css({'color':'black','font-weight':'bold'});
    });
    
    $("#loginInfo_1").blur(function(){
    	$("#loginInfo_1").css('font-weight','500');
    });
    
    $("#loginInfo_2").focusin(function(){
    	$("#loginInfo_2").css({'color':'black','font-weight':'bold'});
    });
    
    $("#loginInfo_2").blur(function(){
    	$("#loginInfo_2").css('font-weight','500');
    });
  
     
    $('#loginButton').click(function(){
    	var userId = $('#loginInfo_1').val();
    	var userPwd = $('#loginInfo_2').val();
    	
    	if(userId == ""){
    		swal("아이디를 입력해주세요🙋");
  	    } else if(userId.search(/\s/) != -1){
  		    swal("아이디는 공백없이 입력해주세요🙋");
  		} else if(userPwd == ""){
    		swal("비밀번호를 입력해주세요🙋");
  	    } else if(userPwd.search(/\s/) != -1){
  		    swal("비밀번호는 공백없이 입력해주세요🙋");
  		} else {
  			$.ajax({
  	   			 url : 'loginCheck.me',
  	   			 type : 'post',
  	   			 data : {userId:userId,userPwd:userPwd},
  	   			 success : function(data){
  	   				 if(data == "N"){
  	   				    swal("아이디 또는 비밀번호를 잘못 입력하셨습니다🙋");
  	   				 } else if(data == "Y") {
  	   				    location.href="<%= request.getContextPath() %>/home.do";
  	   				 } 
  	   			 },
  	   			 error : function(data){
  	   				 console.log("서버 실패");
  	   			 }
  	   		  });
  			}
  		});
    
    $('#menu_travel').click(function(){
    	location.href="<%= request.getContextPath() %>/tList.tv";
    });
    
    $('#menu_course').click(function(){
    	$('#menuCourseList').submit();
    });
    
    $('#menu_review').click(function(){
    	location.href="<%= request.getContextPath() %>/reviewList.bo";
    });
    
    $('#menu_hotel').click(function(){
    	location.href="<%= request.getContextPath() %>/hotelList.ho";
    });
    
    $('a[href="#ex7"]').click(function(event) {
		event.preventDefault();
		$(this).modal({
			fadeDuration : 250
		});
		
		$(document).ready(function(){
			// 저장된 쿠키값. 쿠키값이 존재하지 않으면 공백이 들어간다.
			var userId = getCookie("cookieUserId");
			$("input[name='memberId']").val(userId);
			
			// 아이디가 불러와졌으면 체크표시
			if($("input[name='memberId']").val() != ""){
				$("input[name='remember']").attr("checked",true);
			}
			
			 $("#loginButton").click(function(){
				// 아이디저장 체크 시 쿠키에 저장
				if($("input[name='remember']").is(":checked")){
					var userId = $("input[name='memberId']").val();
					//7일동안 쿠키 보관
					setCookie("cookieUserId",userId,7); 
				} else {
					deleteCookie("cookieUserId");
					userId = "";
				}
			});
		});
	    
		// 쿠키이름, 값, 쿠키유지시간 으로 쿠키 생성.
		function setCookie(cookieName, value, exdays){
			var exdate = new Date();
			// 현재시간에 설정 일수를 더하여 소멸날짜를 지정해준다.
			exdate.setDate(exdate.getDate()+exdays);
			//escape : 인코딩. value값이 변형되지 않고 그대로 사용할 수 있다.
			var cookieValue = escape(value)+((exdays==null)?"":"; expires="+exdate.toGMTString());
			//document.cookie 객체를 사용하여 쿠키의 이름과 소멸될 날짜를 저장.
			document.cookie = cookieName + "=" + cookieValue;
		}
		
		// 해당 이름의 쿠키를 삭제
		function deleteCookie(cookieName){
			var expireDate = new Date();
			// 어제 날짜를 쿠키 소멸 날짜로 설정.
			expireDate.setDate(expireDate.getDate() - 1);
			document.cookie = cookieName + "= " + "; expires=" + expireDate.toGMTString();
		}
		
		// 해당 이름의 쿠키 확인
		function getCookie(cookieName){
			cookieName = cookieName + '=';
			// document.cookie에 쿠키가 들어있는지 확인.
	        var cookieData = document.cookie;
	        // 만약 쿠키가 들어있다면, 찾고자하는 쿠키가 저장되있는지 확인.
	        var start = cookieData.indexOf(cookieName);
	        var cookieValue = '';
	        // 쿠키를 찾으면 쿠키의 값 반환. 못찾으면 비어있는 문자열 반환.
	        if(start != -1){
	            start += cookieName.length;
	            var end = cookieData.indexOf(';', start);
	            if(end == -1){ 
	            end = cookieData.length;
	            cookieValue = cookieData.substring(start, end);
	            }
	        }
			return unescape(cookieValue);
		}	
		});
    
    //알람이 존재할때, 알람을 클릭하면 => 알람컨테이너가 뜬다.
    $(document).on('click','.alarm-on',  function(){
    	console.log('알람창이 켜졌습니다.')
    	let alarm_container= $('.alarm-on-container');
    	if(alarm_container.hasClass('alarm-closed')){
    		alarm_container.removeClass('alarm-closed');
    		alarm_container.css('display', 'flex');
    	}else{
    		alarm_container.addClass('alarm-closed');
    		alarm_container.css('display', 'none');
    	}
    });
    
    </script>
    
 <script>
 
$(function(){
	// 호텔 리모컨 코드 //
	$.ajax({
		url:'hotelCookies.ho',
		type:'post',
		success:function(response){
			/* console.log(response); */
			let rHotel_Container= $('#hotel_remote_control');
			let rHotel_ul= $('#hotel_remote_ul');
			
			rHotel_ul.html(''); //초기화 싹다 비워줌.
			
			if(response!=null){
				rHotel_Container.css('display', 'flex');
				let li_code='';
				li_code+='<li class="remote_li">'
				li_code+='<a href="hotelDetailView.ho?hId='+response.boNo+'&page=1" target="_blank">'
				li_code+='<span>'
				li_code+='<img src="resources/buploadFiles/'+response.hotelThumbnailImg+'" class="remoteImg" /> '
				li_code+='</span>'
				li_code+='<span class="remoteName">'+response.boTitle+'</span>'
				li_code+='</a>'
				li_code+='</li>'
				rHotel_ul.append(li_code);
			}
		}
	});
	 //호텔 리모컨 코드 끝//
	 
	 //코스 리모컨 코드 시작//
	 $.ajax({
		url:'courseCookies.co',
		type:'post',
		success:function(response){
			console.log(response);
			let rCourse_Container= $('#course_remote_control');
			let rCourse_ul= $('#course_remote_ul');
			
			rCourse_ul.html(''); //초기화 싹다 비워줌.
			
			if(response!=null){
				let li_code='';
				li_code+='<li class="remote_li">'
				li_code+='<a href="courseDetail.co?coNo='+response.courseNo+'&page=1" target="_blank">'
				li_code+='<span>'
				li_code+='<img src="resources/courseFiles/'+response.changeName+'" class="remoteImg" /> '
				li_code+='</span>'
				li_code+='<span class="remoteName">'+response.courseTitle+'</span>'
				li_code+='</a>'
				li_code+='</li>'
				rCourse_ul.append(li_code);
			}
		}
	 });
	 //코스 리모컨 코드 끝 //
	 
	 
	 //여행지 리모컨 코드시작//
	 
	 //여행지 리모컨 코드끝//
});

</script>
    
</body>
</html>