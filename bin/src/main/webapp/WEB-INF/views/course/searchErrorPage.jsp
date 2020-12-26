<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="resources/css/course/searchErrorPage.css"/>
</head>
<body>
	<section>
	<header>
   	 <c:import url="../common/menubar.jsp" />
	</header>
	<div id="all_div">
		<div id="menu_div">
			<div id="menu_left_div">
				<img src="resources/images/courseIcon.png" id="menu_img"/>
				<span id="menu">여행 코스</span>
			</div>
			<div id="menu_right_div">
				<input type="text" id="input_search"/>
				<input type="button" value="검색" id="button_search" onclick="errorView();"/>
			</div>
		</div>
		
		<div id="error_div">
			<i class="far fa-times-circle" id="x_circle"></i>
			<div id="no_result">검색 결과가 없습니다!</div>
			<div id="please_ment">올바른 검색어를 입력해주세요.</div>
			<div id="button_div">
				<button id="button_list" onclick="listView();">목록보기</button>
			</div>
		</div>
	</div>
	
	<script>
		function listView(){
			location.href = "<%= request.getContextPath() %>/courseList.co";
		}

		function errorView(){
			location.href="<%= request.getContextPath() %>/searchError.co";
		}
	</script>
	</section>
</body>
</html>