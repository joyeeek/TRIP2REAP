<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전국방방곡곡 | 여행코스</title>
    <!--  courseDetail.css -->
    <link rel="stylesheet" type="text/css" href="resources/css/course/courseDetail.css"/>
    <link rel="shortcut icon" href="resources/images/favicon.ico" type="image/x-icon">
    <!-- 글꼴  -->
    <link href="https://fonts.googleapis.com/css2?family=Sunflower:wght@300&display=swap" rel="stylesheet">
</head>
<body>
	<section>
	<header>
   	 <c:import url="../common/menubar.jsp" />
	</header>
	<div id="all_div">
	    <!-- 메뉴  -->
		<div id="menu_div">
			<div id="coMenu">
				<i class="fas fa-map-signs" id="menuIcon2"></i>
				<span id="coMenuLabel">여행코스</span>
			</div>
			<input type="button" id="goCourseList" value="목록으로">
		</div>
		
		<!-- 표지  -->
		<div id="tiSpace1"></div>
		<div id="tiSpace2"></div>
		<div id="titleImgDiv">
		    <img src="resources/courseFiles/${ course.changeName }" id="titleImg">
		    <label id="titleLabel">${ course.courseTitle }</label>		    
		</div>
		
		
        <!-- 테마정보  -->
        <div id="tiSpace1"></div>
        <div id="tiSpace2"></div>
        <div id="cotitle">
            <label id="starLabel">*</label>
            <label id="coTitleLabel">테마</label>
            <input type="text" value="${ course.theme } 코스" id="titleText" readonly="readonly">
        </div>
        
        
        <!-- 일정정보  -->
        <div id="tiSpace2"></div>
        <div id="cotitle">
            <label id="starLabel">*</label>
            <label id="coTitleLabel">메모</label>
            <input type="text" value="${ course.memo }" id="memoText" readonly="readonly">
        </div>
        
        
        <!-- 카카오 지도  -->
        <div id="tiSpace1"></div>
        <div id="tiSpace2"></div>
        <div id="mainCourse0">
           <div id="tiSpace1"></div>
           <div id="tiSpace3"></div>
           <div id="mapDiv1">                     
                <div id="map"></div>
           </div>
           <c:set var="courseName" value="${ course.courseName }"/>
           <c:set var="nameArr" value="${fn:split(courseName,',')}"/>           
           
           <c:set var="courseX" value="${ course.courseX }"/>
           <c:set var="xArr" value="${fn:split(courseX,',')}"/>           
           <input type="hidden" id="x0" value="${ xArr[0] }">
           
           <c:set var="courseY" value="${ course.courseY }"/>
           <c:set var="yArr" value="${fn:split(courseY,',')}"/>
           <input type="hidden" id="y0" value="${ yArr[0] }">
           
           <input type="hidden" id="size" value="${fn:length(xArr)}"> 
           
           <!-- 첫번째 코스  -->
           <div id="tiSpace6"></div>
           <div id="tiSpace7"></div>
           <div id="day1">
               <label id="dayLabel">★</label>
           </div>
           <label id="dayLabel2">여행 코스</label> 
           <div id="tiSpace1"></div>                    
           <div id="tiSpace8"></div>
           <div id="courseAll">
                               
               <div id="course0">
                    <input type="text" id="yesCourse" class="yesCourses" value="${ nameArr[0] }"  readonly="readonly">
                    <input type="hidden" id="firstX" value="${ xArr[0] }">
                    <input type="hidden" id="" value="${ yArr[0] }">
                    <input type="hidden" class="hiddenCoDay" name="dayList[0]" value="0">
               </div> 
           </div>        
           
           <c:forEach var="i" begin="1" end="${fn:length(xArr)-1}">
                 <input type="hidden" id="x${i}" value="${ xArr[i] }">
                 <input type="hidden" id="y${i}" value="${ yArr[i] }">  
           
           <!-- 코스 상세보기  -->
           <div id="tiSpace8"></div>      
           <div id="courseAll">
           
           <div id="courseSpace1"></div>
           <input type="text" class="courseDistance" id="courseDistance${ i }" value="" readonly="readonly">          
                         
               <div id="course0">
                    <input type="text" id="yesCourse" class="yesCourses" value="${ nameArr[i] }"  readonly="readonly">
                    <input type="hidden" class="hiddenCoX" value="${ xArr[i] }">
                    <input type="hidden" class="hiddenCoY" value="${ yArr[i] }">
                    <input type="hidden" class="hiddenCoDay" name="dayList[0]" value="0">
               </div>
           </div>             
           </c:forEach>
        
        <div id="courseDetailSpace0"></div>   
	    </div>
	    <form action="courseList.co" method="post" id="detailCourseList">
	        <input type="hidden" id="selectCategory" name="selectCategory" value="0">
	    </form>
	</div>
	</section>
	<div id="footerSpaces"></div>
    <footer>
   	        <c:import url="../common/footer.jsp" />
	</footer>
	
	<script>
	// 목록보기
	$('#goCourseList').click(function(){
		$('#detailCourseList').submit();
	});
	</script>
	
	
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=[JavaScript REST API KEY]&libraries=services,clusterer,drawing"></script>	
	<script>
    var mapContainer = document.getElementById('map'); // 지도를 표시할 div 
    var firstX = $('#x0').val();
    var firstY = $('#y0').val();
    
    var mapOption = { 
                     center: new kakao.maps.LatLng(firstY, firstX), // 지도의 중심좌표
                     level: 9 // 지도의 확대 레벨
                    };

    // 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
    var map = new kakao.maps.Map(mapContainer, mapOption); 
    
    var size = $('#size').val();
    
    // 선을 구성하는 좌표 배열입니다. 이 좌표들을 이어서 선을 표시합니다
    var linePath = [];
    for(var i=0; i<size; i++){
    	var x = "x"+i;
    	var y = "y"+i;
    	
    	var lating = new kakao.maps.LatLng(document.getElementById(y).value,document.getElementById(x).value);
        linePath.push(lating);        
    }

    // 지도에 표시할 선을 생성합니다
    var polyline = new kakao.maps.Polyline({
        path: linePath, // 선을 구성하는 좌표배열 입니다
        strokeWeight: 5, // 선의 두께 입니다
        strokeColor: '#FFAE00', // 선의 색깔입니다
        strokeOpacity: 0.7, // 선의 불투명도 입니다 1에서 0 사이의 값이며 0에 가까울수록 투명합니다
        strokeStyle: 'solid' // 선의 스타일입니다
    });

    // 지도에 선을 표시합니다 
    polyline.setMap(map);
    
    // 거리 계산하기
    var beforeY = $('#y0').val();;
    var beforeX = $('#x0').val();;
    var distancePath = []; 
    for(var j=1; j<size; j++){
            var distanceY = "y"+j;
            var distanceX = "x"+j;
            
    	    var distanceLating = new kakao.maps.LatLng(document.getElementById(distanceY).value,document.getElementById(distanceX).value);
    	    
    	    distancePath.push(distanceLating);
    	    distanceLating = new kakao.maps.LatLng(beforeY,beforeX);
    	    distancePath.push(distanceLating);
    	    	
    	    var distance = new kakao.maps.Polyline({
    	    	path : distancePath,
    	    	strokeWeight : 2,
    	    	strokeColor : '#FF00FF',
    	    	strokeOpacity: 0.8,
    	    	strokeStyle: 'dashed'
    	    });
    	    
    	    var courseDistanceNum = (parseFloat(distance.getLength())/1000).toFixed(1);
    	    courseDistanceNum = Number(courseDistanceNum);
    	    
    	    var courseDistanceInfo = (parseFloat(distance.getLength())/1000).toFixed(1) + "km";
    	    $("#courseDistance"+j).val(courseDistanceInfo);
    	    
    	    beforeY = document.getElementById(distanceY).value;
    	    beforeX = document.getElementById(distanceX).value;
    	    distancePath = [];
    }
     
    for(var z=0; z<size; z++){
    	    var x = "x"+z;
    	    var y = "y"+z;
    	
            var moveLating = new kakao.maps.LatLng(document.getElementById(y).value,document.getElementById(x).value);
            var content = '<div class ="label"><span class="left"></span><span class="center">' 
	                        + (z+1) + '</span><span class="right"></span></div>';
 
	        var customOverlay = new kakao.maps.CustomOverlay({
		        position : moveLating,
		        content : content
	        }); 
	        
	        customOverlay.setMap(map); // 오버레이 표시
    }	
	        
    </script>
    
</body>
</html>