<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="resources/css/review/reviewDetail.css"/>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
table td {
	
}

#insert_div {
	width: 1000px;
	text-align: center;
}

#insertReview {
	width: 800px;
	padding-left: 100px;
	text-align: center;
}
</style>
</head>
<body>
	<section>
		<header>
			<c:import url="../common/menubar.jsp" />
		</header>
		<!-- 전체 div -->
		<div id="all_div">
			<!-- 메뉴 이름 div -->
			<div id="menu_div">
				<div id="menu_left_div">
						<i class="fas fa-camera-retro" id="menuIcon3"></i>
					 <span id="menu">여행 후기</span>
				</div>
			</div>
			

			<!-- 작성하기 div 시작 -->
			<div id="insert_div">

				<!-- 작성하기 table 시작 -->
				<div id="insertReview">
					<table id="travel_table">

						<tr>
							<td colspan="5">
									
										[여행지] ${review.boTitle}
									
										
							</td>
						</tr>
						<tr>
							<td colspan="5"><span><b>글쓴이 : ${review.memberId }</b></span></td>
						</tr>
						<tr>
							<td>${review.regDate }</td>
							<td colspan="3"></td>
							<td>${review.boTag }</td>
						</tr>

						<tr>
							<td colspan="5">
								<hr>
							</td>
						</tr>
						<tr>
						
							<td colspan="5"><img src="resources/images/reviewIcon.png"
								width="600px;" height="500px;"></td>
							
						</tr>

						<tr>
							<td colspan="5">
								<div>${review.boContent }</div>
							</td>
						</tr>
						<tr>
							<td colspan="5">좋아요<hr></td>
						</tr>
						
						<tr>
							<td colspan="5"><h1>댓글</h1></td>
						</tr>
						<tr>
							<td colspan="5"><b>작성자 : 만수무강</b></td>
						</tr>
						<tr>
							<td colspan="5">감사합니다</td>
						</tr>
						<tr>
							<td colspan="5">2020.11.01. 11:23<hr></td>
						</tr>
					
						<tr>
							<td colspan="5"><b>작성자 : 만수무강</b></td>
						</tr>
						<tr>
							<td colspan="5">감사합니다</td>
						</tr>
						<tr>
							<td colspan="5">2020.11.01. 11:23<hr></td>
						</tr>
					
						<tr>

							<td colspan="5"><textarea rows="10" cols="100"
									placeholder="댓글을 입력해보세요."></textarea></td>

						</tr>
						<tr>
							<td colspan="5"><button>댓글작성</button></td>
						</tr>

					</table>
				</div>
			</div>
			<!-- 전체 div 끝 -->

			<!-- 버튼 div -->
			<div id="button_div">
				<button id="button_write">등록</button>
				<button id="button_write">목록</button>
				<button id="button_write">Top▲</button>
			</div>

		</div>


	</section>
</body>
</html>