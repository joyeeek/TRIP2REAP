<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="resources/css/travel/search_errorPage.css"/>
<!-- <script src="https://kit.fontawesome.com/8828f475ef.js" crossorigin="anonymous"></script> -->
</head>
<body>
	<section>
	<header>
   	 <c:import url="../common/menubar.jsp" />
	</header>
	<div id="all_div">
		<div id="menu_div">
			<div id="menu_left_div">
				<i class="fas fa-suitcase-rolling" id="menu_img"></i>
				<span id="menu">여행지</span>
			</div>
			<div id="menu_right_div">
				<input type="text" id="input_search"/>
				<button id="button_search" onclick="goSearchError()">검색</button>
			</div>
		</div>
		
		
		
		<div id="error_div">
			<i class="far fa-times-circle" id="x_circle"></i>
			<div id="no_result">검색 결과가 없습니다!</div>
			<div id="please_ment">올바른 여행지명 혹은 해쉬태그를 입력해주세요.</div>
			<div id="button_div">
				<button id="button_list" onclick="goListView()">목록보기</button>
			</div>
			<div>
				<div id="hashtag_div">
					<ul>
						<li id="li_name">
							추천 해쉬태그 
						</li>
						<li>
							<a href=" ${pageContext.request.contextPath}/tList.tv">#전체</a>&nbsp;&nbsp;
						</li>
						<li>
							<a href=" ${pageContext.request.contextPath}/tList.tv">#문화시설</a>&nbsp;&nbsp;
						</li>
						<li>
							<a href=" ${pageContext.request.contextPath}/tList.tv">#레포츠</a>&nbsp;&nbsp;
						</li>
						<li>
							<a href=" ${pageContext.request.contextPath}/tList.tv">#쇼핑</a>&nbsp;&nbsp;
						</li>
						<li>
							<a href=" ${pageContext.request.contextPath}/tList.tv">#자연</a>&nbsp;&nbsp;
						</li>
						<li>
							<a href=" ${pageContext.request.contextPath}/tList.tv">#축제</a>&nbsp;&nbsp;
						</li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	
	
	<script>
		function goListView(){
			location.href="<%= request.getContextPath() %>/tList.tv";
		}
		
		function goSearchError(){
			location.href="<%= request.getContextPath() %>/tSearchError.tv";
		}
	</script>
	</section>
</body>
</html>