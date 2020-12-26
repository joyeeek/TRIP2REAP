<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="resources/css/review/reviewList.css"/>
 <script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>  

		

<title>Insert title here</title>
</head>
<body>
		<header>
		<c:import url="../common/menubar.jsp" />
		</header>
		
		<section>
		<div id="all_div">
			<div id="menu_div">
				<div id="menu_left_div">
					<i class="fas fa-camera-retro" id="menuIcon3"></i>
					<span id="menu" >여행 후기</span>
			</div>
		
		</div>
		</div>
		<!-- text-align뿐만 아니라 대부분 div안에서 작동한다. -->
		<div id="cate_btn" style="display: inline-block; width: 770px">
			<button id="cate_btn1" class="cate_btn">전체보기</button>
			<button id="cate_btn2" class="cate_btn">여행지</button>
			<button id="cate_btn3" class="cate_btn">맛집</button>
			</div>
			<div id="bo_btn" style="display: inline-block;">
			<button id="bo_btn1" class="bo_btn"  onclick="location.href='reviewPhotoList.bo';">사진형</button>
			<button id="bo_btn2" class="bo_btn">게시판형</button>
		</div>	
		
	
	    <div id="board">
		<table id="board_table">
		<tr class="board_list" align="center" bgcolor="#efefef">
			<th class="board_list">번호</th>
			<th class="board_list">제목</th>
			<th class="board_list">작성자</th>
			<th class="board_list">날짜</th>
			<th class="board_list">조회수</th>
			<th class="board_list">좋아요</th>
		</tr>
		
		<c:forEach var="b" items="${list}">
		<tr align="center" class="board_list">
			<td class="board_list">${b.boNo}</td>
			<td class="board_list">
				<c:if test="${ !empty loginUser }">
					<c:url var="reviewDetail" value="reviewDetail.bo">
						<c:param name="boNo" value="${ b.boNo }"/>
						<c:param name="page" value="${ pi.currentPage }"/>
					</c:url>
					<a href="${ reviewDetail}">${ b.boTitle }${b.boTag }</a>
				</c:if>
				<c:if test="${ empty loginUser }">
					${ b.boTitle }${b.boTag }		
				</c:if>
			
			</td>
			<td class="board_list">${b.memberId }</td>
			<td class="board_list">${b.regDate }</td>
			<td class="board_list">${b.boCount }</td>
			<td class="board_list">like</td>

		
		</tr>
		</c:forEach>
		</table>
		</div>
		<br>
		
		
		<div id="paging_table_div">
			<table id="paging_table">
		
		<!-- 페이징 처리 -->
		<tr align="center" height="20">
			<td></td>
			<td >
			
				<!-- [이전] -->
				<c:if test="${ pi.currentPage <= 1 }">
					<button class="page_btn"><</button> &nbsp;
				</c:if>
				<c:if test="${ pi.currentPage > 1 }">
					<c:url var="before" value="reviewList.bo">
						<c:param name="page" value="${ pi.currentPage - 1 }"/>
					</c:url>
					<a href="${ before }"><button class="page_btn"><</button></a>
				</c:if>
				
				<!-- 페이지 -->
				
				<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
					<c:if test="${ p eq pi.currentPage }">
					<button class="page_btn"><b style=background-color:#eee;>${ p }</b></button>
					</c:if>
					
					<c:if test="${ p ne pi.currentPage }">
						<c:url var="pagination" value="reviewList.bo">
							<c:param name="page" value="${ p }"/>
						</c:url>
						<a href="${ pagination }"><button class="page_btn">${ p }</button></a>
					</c:if>
				</c:forEach>
				
				<!-- [다음] -->
				<c:if test="${ pi.currentPage >= pi.maxPage }">
					<button class="page_btn">></button> &nbsp;
				</c:if>
				<c:if test="${ pi.currentPage < pi.maxPage }">
					<c:url var="after" value="reviewList.bo">
						<c:param name="page" value="${ pi.currentPage + 1 }"/>
					</c:url> 
					<a href="${ after }"><button class="page_btn">></button></a>
				</c:if>
			</td>
			<td style="text-align: right;">
				
					<button id="write_btn" onclick="location.href='reviewInsert.bo';">글쓰기</button>
			
			</td>
		</tr>
		
		<tr>
			
				<td colspan="3">
					<form id="content" style="text-align: center;">
					 <select id="select_search" name="search">
    					 <option value="작성자">작성자</option>
    					 <option value="제목">제목</option>
   						 <option value="내용">내용</option>
   						 <option value="해쉬태그">해쉬태그</option>
					</select>
					
						
   						   
    					  <input type="search" id="search" placeholder="Search..." />
 					
  						<button id="search_btn" type="reset" class="search" id="search-btn">
  							<span class="icon"><i class="fa fa-search"></i></span>
  						</button>
					</form>
				</td>
			
			</tr>
		</table>
	</div>

		
	</section>
	
	

</body>
</html>