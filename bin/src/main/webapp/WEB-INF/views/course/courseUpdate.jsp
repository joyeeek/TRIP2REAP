<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>여행 코스 수정하기</title>
<link rel="stylesheet" type="text/css" href="resources/css/course/courseUpdate.css"/>
</head>
<body>
	<section>
	<header>
   	 <c:import url="../common/menubar.jsp" />
	</header>
	<div id="all_div">
		<div id="menu_div">
			<img src="resources/images/courseIcon.png" id="menu_img"/>
			<span id="menu">여행 코스 수정</span>
		</div>
		
		<div id="insert_ment_div">
			<table id="course_info_table">
				<tr id="ment_tr">
					<td colspan="6">
						<b style="color: #666666;">코스에 담긴 여행지의 오른쪽 상단 메뉴 클릭 시, 순서 변경 및 삭제 가능합니다.</b>
						<br>
						<span class="required_fields">*은 필수 입력 사항입니다.</span>
					</td>
				</tr>
				<tr>
					<td>
						<span class="required_fields">*</span><span>코스명</span>
					</td>
					<td colspan="5">
						<input type="text" id="input_course_name"/>
					</td>
				</tr>
				<tr>
					<td>
						<span class="required_fields">*</span><span>테마</span>
					</td>
					<td>
						<select id="select_course_theme">
							<option>가족 여행</option>
							<option>나 홀로 여행</option>
							<option>커플 여행</option>
							<option>친구와 함께</option>
							<option>뚜벅이 코스</option>
							<option>캠핑</option>
						</select>
					</td>
					<td>
						<span class="required_fields">*</span><span>일정</span>
					</td>
					<td colspan="3">
						<select id="select_course_calendar">
							<option>당일 여행</option>
							<option>1박 2일</option>
							<option>2박 3일 이상</option>
						</select>
					</td>
				</tr>
				<tr>
					<td>
						<span class="required_fields">*</span><span>해시태그</span>
					</td>
					<td colspan="2">
						<input type="text" id="input_course_tag"/>
						<i class="fas fa-plus-square" id="button_tag_plus"></i>
					</td>
					<td>
						<div class="hashtag">#인천여행코스</div>
					</td>
					<td>
						<span class="hashtag">#드라이브코스</span>
					</td>
					<td>
						<span class="hashtag">#여섯글자태그</span>
					</td>
				</tr>
			</table>
		</div>
		
		<div id="list_travel_div">
			<div id="travel_img_div">
				<img src="resources/images/travel_img.PNG" id="travel_img"/>
			</div>
			<div id="travel_info_div">
				<div id="travel_name">여행지 이름</div>
				<div id="travel_cate">관광지</div>
				<br>
				<div id="travel_local">경남 사천시</div>
				<div id="travel_tag">#가족들과함께 #기차여행좋다 #즐거운나들이</div>
			</div>
			<div id="travel_menu_div">
				<span id="list_etc">…</span>
			</div>
		</div>
		
		<div id="list_travel_div">
			<div id="travel_img_div">
				<img src="resources/images/travel_img.PNG" id="travel_img"/>
			</div>
			<div id="travel_info_div">
				<div id="travel_name">여행지 이름</div>
				<div id="travel_cate">관광지</div>
				<br>
				<div id="travel_local">경남 사천시</div>
				<div id="travel_tag">#가족들과함께 #기차여행좋다 #즐거운나들이</div>
			</div>
			<div id="travel_menu_div">
				<span id="list_etc">…</span>
			</div>
		</div>
		
		<div id="course_content_div">
			<textarea rows="20" cols="125" id="course_content"></textarea>
			<div id="text_count_div">
				<span>현재 글자 수 </span>
				<span id="text_count">8</span>
				<span>자 / 최대 글자 수 2000자</span>
			</div>
		</div>
		
		<div id="button_div">
			<button id="button_cancel">취소</button>
			<button id="button_update">수정</button>
		</div>
	</div>
	
	<script>
	</script>
	</section>
</body>
</html>