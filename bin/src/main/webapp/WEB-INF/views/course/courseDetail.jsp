<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>여행 코스 상세보기</title>
<link rel="stylesheet" type="text/css" href="resources/css/course/courseDetail.css"/>
</head>
<body>
	<section>
	<header>
   	 <c:import url="../common/menubar.jsp" />
	</header>
	<div id="all_div">
		<div id="menu_div">
			<img src="resources/images/courseIcon.png" id="menu_img"/>
			<span id="menu">여행 코스</span>
		</div>
		
		<div id="course_title_div">
			<div id="course_name">군산맛집여행</div>
			<div id="course_local">전북 군산시</div>
		</div>
		
		<div id="course_cate_div">
			<table id="course_cate_table">
				<tr>
					<td rowspan="2"><i class="fas fa-parachute-box"></i></td>
					<td class="td_cate">테마</td>
					<td rowspan="2" width="50px"></td>
					<td rowspan="2"><i class="far fa-calendar-alt"></i></td>
					<td class="td_cate">일정</td>
				</tr>
				<tr>
					<td class="td_cate_value">나 홀로 여행</td>
					<td class="td_cate_value">2박3일 이상</td>
				</tr>
			</table>
		</div>
		
		<div id="share_div">
<!-- 나중에 추가 예정 -->
<!-- 			<span>조회수 | </span> <span id="count">876</span> -->
			<i class="fas fa-share-alt"></i> <span id="share_span">공유하기</span>
		</div>
		
		<hr>
		
		<div id="course_content">
군산 1박2일 힐링 코스를 만들어보았습니다.<br>
다른 분의 코스 중에서 좋아보이는 부분만 가져왔습니다.<br>
이번 해에는 여행해볼 생각입니다.
		</div>
		
		<div id="map_div">
			<img src="resources/images/map.PNG" id="map_img"/>
		</div>
		
		<div id="travel_first_div">
			<table class="table_travel">
				<tr>
					<td rowspan="3">
						<div class="travel_num">1</div>
					</td>
					<td rowspan="3" align="center">
						<img src="resources/images/travel_img.PNG" class="travel_img">
					</td>
					<td>
						<div class="travel_name">송도 센트럴파크</div>
						<div class="travel_local">인천 송도</div>
						<div class="travel_tag">#레포츠 #가족과함께 #자연</div>
					</td>
				</tr>
			</table>
			<div class="empty_div">
				<i class="fas fa-ellipsis-v" id="dot"></i>
			</div>
		</div>
		<div class="travel_all_div">
			<table class="table_travel">
				<tr>
					<td rowspan="3">
						<div class="travel_num">2</div>
					</td>
					<td rowspan="3" align="center">
						<img src="resources/images/travel_img.PNG" class="travel_img">
					</td>
					<td>
						<div class="travel_name">송도 센트럴파크</div>
						<div class="travel_local">인천 송도</div>
						<div class="travel_tag">#레포츠 #가족과함께 #자연</div>
					</td>
				</tr>
			</table>
			<div class="empty_div">
				<i class="fas fa-ellipsis-v" id="dot"></i>
			</div>
		</div>
		<div id="travel_last_div">
			<table class="table_travel">
				<tr>
					<td rowspan="3">
						<div class="travel_num">3</div>
					</td>
					<td rowspan="3" align="center">
						<img src="resources/images/travel_img.PNG" class="travel_img">
					</td>
					<td>
						<div class="travel_name">송도 센트럴파크</div>
						<div class="travel_local">인천 송도</div>
						<div class="travel_tag">#레포츠 #가족과함께 #자연</div>
					</td>
				</tr>
			</table>
		</div>
		
		<div id="button_div">
			<button id="button_update" onclick="updateView()">수정하기</button>
			<button id="button_delete" onclick="deleteView()">삭제하기</button>
		</div>
	</div>
	
	<script>
		function listView(){
			location.href = "<%= request.getContextPath() %>/courseList.co";
		}
		
		function updateView(){
			location.href = "<%= request.getContextPath() %>/courseUpdate.co";
		}
	</script>
	</section>
</body>
</html>