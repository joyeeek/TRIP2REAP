<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전국방방곡곡 | 여행코스</title>
    <!--  courseTitleInsert.css -->
    <link rel="stylesheet" type="text/css" href="resources/css/course/courseTitleInsert.css"/>
    <link rel="shortcut icon" href="resources/images/favicon.ico" type="image/x-icon">
</head>
<body>	
	<header>
    <%@ include file="../common/menubar.jsp" %>
    </header>
	
	<section>
	<div id="all_div">
		<!-- 메뉴 이름 div -->
		<div id="menu_div">
			<div id="coMenu">
				<i class="fas fa-map-signs" id="menuIcon2"></i>
				<span id="coMenuLabel">여행코스 만들기</span>
			</div>
		</div>
		
		<!-- 표지  -->
		<div id="tiSpace1"></div>
		<div id="tiSpace2"></div>
		<div id="titleImgDiv">
		    <img src="resources/images/메인배너1.png" id="titleImg">
		    <i class="far fa-images" id="titleIcon"></i>		    
		    <label id="titleLabel">표지 이미지 변경</label>		    
		</div>
         
    
        <!-- 코스정보  -->
        <div id="tiSpace1"></div>
        <div id="tiSpace2"></div>
        <div id="cotitle">
            <label id="starLabel">*</label>
            <label id="coTitleLabel">여행제목</label>
            <input type="text" value="${ loginUser.nickName }님의 여행코스" id="titleText" maxlength="14">
        </div> 
        <div id="tiSpace1"></div>           
        
        
        <div id="tiSpace2"></div>
        <div id="cotitle">
            <label id="starLabel">*</label>
            <label id="coTitleLabel2">테마</label>
            <select id="coTheme" name="theme">
                <option value = "가족">가족 코스</option>
                <option value = "나홀로">나홀로 코스</option>
				<option value = "커플">커플 코스</option>
				<option value = "우정">우정 코스</option>
				<option value = "캠핑">캠핑 코스</option>
				<option value = "액티비티">액티비티</option>
            </select>
        </div>   
    
    
        <div id="tiSpace5"></div>
        <div id="cotitle">
            <label id="starLabel">*</label>
            <label id="coTitleLabel2">메모</label>
            <input type="text" value="" id="memoText">
        </div>                      
        
        <!-- 카카오 지도  -->
        <div id="tiSpace1"></div>
        <div id="tiSpace2"></div>
        <div id="mainCourse0">
           <div id="tiSpace1"></div>
           <div id="tiSpace4"></div>
           <div id="mapDiv1">                     
                 <div class="map_wrap">
                     <div id="map"></div>
                     <div id="map2"></div>
                     <div id="menu_wrap" class="bg_white">
                           <div class="option">
                                <div>
                                    <form onsubmit="searchPlaces(); return false;">
                                                                                           키워드 : <input type="text" value="제주 애월카페" id="keyword" size="15"> 
                                        <button type="submit">검색하기</button> 
                                    </form>
                               </div>
                          </div>
                          <hr>
                          <ul id="placesList"></ul>
                          <div id="pagination"></div>
                     </div>
                </div>
		   </div>          
		   
		   <!-- 받아야 할 정보  -->
		   <form name="signform" id="courseInsertForm" method="POST" ENCTYPE="multipart/form-data" action="userCourseInsert.co">
            <input type="file" id="file" name="file" accept="image/*">
            <input type="hidden" name = "target_url">
            
            <input type="hidden" name="courseTitle" class="courseTitle" value="">
            <input type="hidden" id="courseWriter" name="courseWriter" value="${ loginUser.memberId }"> 
            <input type="hidden" name="courseTheme" class="courseTheme" value="">
            <input type="hidden" name="memo" class="courseMemo" value="">
            <input type="hidden" name="distance" class="distance" value="0">
           
           <!-- 코스1일차  -->
           <div id="tiSpace6"></div>
           <div id="tiSpace7"></div>
           <div id="day1">
               <label id="dayLabel">★</label>
           </div>
           <label id="dayLabel2">여행 코스</label>
           
           <div id="tiSpace9"></div>
           <div id="tiSpace8"></div>
           <div id="courseAll">
               <div id="course0">
                    <input type="text" id="noCourse" readonly="readonly" value="왼쪽 검색창을 통해 여행코스를 추가해주세요.">
                    <input type="text" id="yesCourse" name="placeNameList[0]" readonly="readonly">
                    <input type="hidden" class="hiddenCoX" name="placeXList[0]" value="">
                    <input type="hidden" class="hiddenCoY" name="placeYList[0]" value="">
                    <input type="hidden" class="hiddenCoDay" name="dayList[0]" value="0">
               </div>
           </div>
           <input type="hidden" id="allDistance" value="">
           </form>
        </div>
        
        
        <!-- 버튼  -->
        <div id="courseSpace3"></div>
        <div id="courseSpace4"></div>
        <input type="button" id="courseBtn1" value="취소" onclick="courseCancel();">
        <div id="courseSpace5"></div>
        <input type="button" id="courseBtn2" value="등록하기">
    </div>   
    </section>
    <div id="footerSpaces"></div>
    <footer>
   	        <c:import url="../common/footer.jsp" />
	</footer>

    <script>
    $('#titleImgDiv').click(function (e) {
    	    // 현재 이미지 소스
            document.signform.target_url.value = document.getElementById('titleImg').src;           
             e.preventDefault();
              $('#file').click();
    }); 
    
    var imgFile = document.querySelector("#file");
    
    imgFile.onchange = function(){
    	var fileList = file.files;
    	
    	// 읽기
    	var reader = new FileReader();
    	reader.readAsDataURL(fileList[0]);
    	
    	// 로드 후
    	reader.onload = function(){
    		document.querySelector('#titleImg').src = reader.result;
    	}
    }
    
    function courseCancel(){
        location.href="<%= request.getContextPath() %>/courseList.co";
    }
    
    $('#courseBtn2').click(function(){  	
    	var title = $('#titleText').val();
    	var writer = $('#courseWriter').val();
    	var theme = $("select[name=theme]").val();
    	var memo = $("#memoText").val();
    	var courseFirst = $('#yesCourse').val();
    	
    	$('.courseTitle').val(title);
    	$('.courseTheme').val(theme);
    	$('.courseMemo').val(memo);
    	$('.courseMemo').val(memo);
    	
    	if(title==""){
    		swal("여행제목을 입력해주세요");
    		$("#titleText").focus();
    	} else if(writer == ""){
    		swal("로그인 후 이용해주세요");
    	} else if(courseFirst == ""){
    		swal("하나 이상의 여행코스를 추가해주세요");
    		$("#day1").focus();
    	} else {
    		$('#courseInsertForm').submit();
    	}   	
    });
    
    </script>
    
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=[JavaScript REST API KEY]&libraries=services,clusterer,drawing"></script>
	<script>
	var markers = [];
	var markers2 = [];
	
	var mapContainer1 = document.getElementById('map'); // 지도를 표시할 div
    var mapContainer = document.getElementById('map2'); // 지도를 표시할 div 
    
    mapOption = { 
        center: new kakao.maps.LatLng(33.507089803070606, 126.49277539839063), // 지도의 중심좌표
        level: 9 // 지도의 확대 레벨
    };  
	
	mapOption1 = { 
	        center: new kakao.maps.LatLng(33.507089803070606, 126.49277539839063), // 지도의 중심좌표
	        level: 9 // 지도의 확대 레벨
	};

    var map = new kakao.maps.Map(mapContainer1, mapOption1); // 지도를 생성합니다
    var map2 = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
    
    // 장소 검색 객체를 생성합니다
    var ps = new kakao.maps.services.Places();  

    // 검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
    var infowindow = new kakao.maps.InfoWindow({zIndex:1});

    // 키워드로 장소를 검색합니다
    searchPlaces();

    // 키워드 검색을 요청하는 함수입니다
    function searchPlaces() {

        var keyword = document.getElementById('keyword').value;

        if (!keyword.replace(/^\s+|\s+$/g, '')) {
            alert('키워드를 입력해주세요!');
            return false;
        }

        // 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
        ps.keywordSearch( keyword, placesSearchCB); 
    }

    // 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
    function placesSearchCB(data, status, pagination) {
        if (status === kakao.maps.services.Status.OK) {

            // 정상적으로 검색이 완료됐으면
            // 검색 목록과 마커를 표출합니다
            displayPlaces(data);

            // 페이지 번호를 표출합니다
            displayPagination(pagination);

        } else if (status === kakao.maps.services.Status.ZERO_RESULT) {

            alert('검색 결과가 존재하지 않습니다.');
            return;

        } else if (status === kakao.maps.services.Status.ERROR) {

            alert('검색 결과 중 오류가 발생했습니다.');
            return;

        }
    }

    
    // 검색 결과 목록과 마커를 표출하는 함수입니다
    function displayPlaces(places) {

        var listEl = document.getElementById('placesList'), 
        menuEl = document.getElementById('menu_wrap'),
        fragment = document.createDocumentFragment(), 
        bounds = new kakao.maps.LatLngBounds(), 
        listStr = '';
        
        // 검색 결과 목록에 추가된 항목들을 제거합니다
        removeAllChildNods(listEl);

        // 지도에 표시되고 있는 마커를 제거합니다
        removeMarker();
        
        for ( var i=0; i<places.length; i++ ) {

            // 마커를 생성하고 지도에 표시합니다
            var placePosition = new kakao.maps.LatLng(places[i].y, places[i].x);
            var marker = addMarker(placePosition, i);
            var itemEl = getListItem(i, places[i]); // 검색 결과 항목 Element를 생성합니다

            // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
            // LatLngBounds 객체에 좌표를 추가합니다
            bounds.extend(placePosition);

            // 마커와 검색결과 항목에 mouseover 했을때
            // 해당 장소에 인포윈도우에 장소명을 표시합니다
            // mouseout 했을 때는 인포윈도우를 닫습니다
            (function(marker, title) {
                kakao.maps.event.addListener(marker, 'mouseover', function() {
                    displayInfowindow(marker, title);
                });

                kakao.maps.event.addListener(marker, 'mouseout', function() {
                    infowindow.close();
                });

                itemEl.onmouseover =  function () {
                    displayInfowindow(marker, title);
                };

                itemEl.onmouseout =  function () {
                    infowindow.close();
                };
            })(marker, places[i].place_name);

            fragment.appendChild(itemEl);
        }

        // 검색결과 항목들을 검색결과 목록 Elemnet에 추가합니다
        listEl.appendChild(fragment);
        menuEl.scrollTop = 0;

        // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
        map2.setBounds(bounds);
    }

    // 검색결과 항목을 Element로 반환하는 함수입니다
    function getListItem(index, places) {
    	
        var el = document.createElement('li'),
        itemStr = '<span class="markerbg marker_' + (index+1) + '"></span>' +
                    '<div class="info">' +
                    '   <h5>' + places.place_name + '</h5>';

        if (places.road_address_name) {
            itemStr += '    <span>' + places.road_address_name + '</span>' +
                        '   <span class="jibun gray">' +  places.address_name  + '</span>';
        } else {
            itemStr += '    <span>' +  places.address_name  + '</span>'; 
        }
                     
          itemStr += '  <span class="tel">' + places.phone  + '</span>' +
                     '  <button id="courseOkBtn">여행코스 추가</button>  ' +
                     '  <input type="hidden" class="courseX" value=' + places.x +' > ' +
                     '  <input type="hidden" class="courseY" value=' + places.y +' > '
                     '</div>';           

        el.innerHTML = itemStr;
        el.className = 'item';

        return el;
    }

    // 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
    function addMarker(position, idx, title) {
        var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
            imageSize = new kakao.maps.Size(36, 37),  // 마커 이미지의 크기
            imgOptions =  {
                spriteSize : new kakao.maps.Size(36, 691), // 스프라이트 이미지의 크기
                spriteOrigin : new kakao.maps.Point(0, (idx*46)+10), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
                offset: new kakao.maps.Point(13, 37) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
            },
            markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imgOptions),
                marker = new kakao.maps.Marker({
                position: position, // 마커의 위치
                image: markerImage 
            });       

        marker.setMap(map2); // 지도 위에 마커를 표출합니다
        markers.push(marker);  // 배열에 생성된 마커를 추가합니다

        return marker;
    }

    // 지도 위에 표시되고 있는 마커를 모두 제거합니다
    function removeMarker() {
        for ( var i = 0; i < markers.length; i++ ) {
            markers[i].setMap(null);
        }   
        markers = [];
    }

    // 검색결과 목록 하단에 페이지번호를 표시는 함수입니다
    function displayPagination(pagination) {
        var paginationEl = document.getElementById('pagination'),
            fragment = document.createDocumentFragment(),
            i; 

        // 기존에 추가된 페이지번호를 삭제합니다
        while (paginationEl.hasChildNodes()) {
            paginationEl.removeChild (paginationEl.lastChild);
        }

        for (i=1; i<=pagination.last; i++) {
            var el = document.createElement('a');
            el.href = "#";
            el.innerHTML = i;

            if (i===pagination.current) {
                el.className = 'on';
            } else {
                el.onclick = (function(i) {
                    return function() {
                        pagination.gotoPage(i);
                    }
                })(i);
            }

            fragment.appendChild(el);
        }
        paginationEl.appendChild(fragment);
    }

    // 검색결과 목록 또는 마커를 클릭했을 때 호출되는 함수입니다
    // 인포윈도우에 장소명을 표시합니다
    function displayInfowindow(marker, title) {
        var content = '<div style="padding:5px;z-index:1;">' + title + '</div>';

        infowindow.setContent(content);
        infowindow.open(map2, marker);
    }

     // 검색결과 목록의 자식 Element를 제거하는 함수입니다
    function removeAllChildNods(el) {   
        while (el.hasChildNodes()) {
            el.removeChild (el.lastChild);
        }
    }
      
    
    function changeLocation(){
    	var selectLocation = document.getElementById("coLocation").value;
    }
    
    var linePath = [];
    var distancePath = [];
    var count = 1;
    var beforeX;
    var beforeY;
    var allDistance = 0;
    
    $(document).on("click","#courseOkBtn",function(){   
    	
    	var searchName = $(this).parent().find('h5').html();
    	var searchX = $(this).parent().find($('.courseX')).val();
    	var searchY = $(this).parent().find($('.courseY')).val();
    	
    	// noCourse가 있으면 지우고 div 만들기
    	if(document.getElementById("noCourse")){
            $("#noCourse").remove();
            $("#yesCourse").val(searchName);
    		$("#yesCourse").css('display', 'inline-block');
    		
    		$(".hiddenCoX").val(searchX);
    		$(".hiddenCoY").val(searchY);
    		
    		var moveLating = new kakao.maps.LatLng(searchY, searchX);
    		
    		var content = '<div class ="label"><span class="left"></span><span class="center">' 
    		               + '1' + '</span><span class="right"></span></div>';
            
    		var customOverlay = new kakao.maps.CustomOverlay({
    			position : moveLating,
    			content : content
    		});    		
    		
    		customOverlay.setMap(map); // 오버레이 표시
 		    map.panTo(moveLating);     // 중심위치 옮기기
    		
        } else{        	   
    	    	distancePath = [];
    	        
    	    	var distanceLating = new kakao.maps.LatLng(searchY,searchX);
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
    	    allDistance += courseDistanceNum;
    	    // 총거리   
    	    $('#allDistance').val(allDistance.toFixed(1));
    	    var aa = $('#allDistance').val();
    	    $('.distance').val(aa);
        	
            // 새로운 div 만들기
            var newDiv = '<div id="courseSpace1"></div><div id="courseSpace2"></div>'
                         + '<input type="text" class="courseDistance" id="courseDistance" value="' 
                         + courseDistanceInfo + '" readonly="readonly"><div id="courseSpace1"></div>'
                         + '<div id="course0"><input type="text" class="yesCourses" name="placeNameList['+count+']" readonly="readonly" value="' 
                         + searchName +'"><input type="hidden" class="courseX" name="placeXList['+count+']" value="' + searchX 
                         + '"><input type="hidden" class="courseY" name="placeYList['+count+']" value="' + searchY 
                         + '"><input type="hidden" class="courseDay" name="dayList['+count+']" value="0">';
            $('#courseAll').append(newDiv);  
            count++;
            
            moveLating = new kakao.maps.LatLng(searchY, searchX);
            var content = '<div class ="label"><span class="left"></span><span class="center">' 
	               + count + '</span><span class="right"></span></div>';
 
	        var customOverlay = new kakao.maps.CustomOverlay({
		        position : moveLating,
		        content : content
	        });    		
	
	        customOverlay.setMap(map); // 오버레이 표시
            map.panTo(moveLating);     // 중심위치 옮기기
        }   	   
         
    	    // 선표시하기
    	    var lating = new kakao.maps.LatLng(searchY, searchX);
            linePath.push(lating);

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
    	    
    	    beforeX = searchX;
    	    beforeY = searchY;

    	// 1. 삭제 시 배열지우기, div 지우기 
    });    	
</script>

</body>
</html>