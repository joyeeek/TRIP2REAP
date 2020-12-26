<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전국방방곡곡 | 여행코스</title>
    <!--  courseList.css -->
    <link rel="stylesheet" type="text/css" href="resources/css/course/courseList.css"/>
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=East+Sea+Dokdo&display=swap" rel="stylesheet">
    <link rel="shortcut icon" href="resources/images/favicon.ico" type="image/x-icon">
</head>
<body>	
	<header>
   	 <c:import url="../common/menubar.jsp" />
	</header>
	
	<section>
	    <div id="coSpace1"></div>
		<div id="coMain">
		     <div>
		         <div id="coSpace2"></div>
		         <div id="coSpace3"></div>
		         <label id="coLabel1">여행만렙! 사용자가 직접 만든</label>
		         <label id="coLabel2">여행코스</label>
		         <div id="makeCourse" onclick="insertView();">
		            <label id="makeLabel1">나만의 여행코스 만들기</label>
		            <label id="makeLabel2">></label>
		         </div>
		     </div>
		     
		     <div>		     		          
		          <div id="coSpace4"></div>
		          <div id="coSpace3"></div>
		          <div class="coSelect" id="coSelect0">
		              <div id="coSpace8"></div>
		              <i class="fas fa-map-marked-alt" id="coIcon0"></i>
		              <div id="coSpace8"></div>
		              <label class="commonLabel">전체</label>
		          </div>
		          <div id="coSpace5"></div>
		          
		          <div class="coSelect" id="coSelect1">
		              <div><img src="resources/images/family.png" id="coIcon1"></div>    
		              <label class="commonLabel">가족 코스</label>
		          </div>
		          <div id="coSpace5"></div>
		          
		          <div class="coSelect" id="coSelect2">
		              <div id="coSpace8"></div>
		              <i class="fas fa-walking" id="coIcon2"></i>
		              <div id="coSpace8"></div>
		              <label class="commonLabel">나홀로 코스</label>
		          </div>
		          <div id="coSpace5"></div>
		          
		          <div class="coSelect" id="coSelect3">
		              <div id="coSpace6"></div>
		              <i class="fas fa-heart" id="coIcon3"></i>
		              <div id="coSpace8"></div>
		              <label class="commonLabel">커플 코스</label>
		          </div>
		          <div id="coSpace5"></div>
		          
		          <div class="coSelect" id="coSelect4">
		              <div id="coSpace6"></div>
		              <i class="fas fa-child" id="coIcon4"></i>
		              <i class="fas fa-child" id="coIcon4"></i>
		              <div id="coSpace7"></div>
		              <label class="commonLabel">우정 코스</label>
		          </div>
		          <div id="coSpace5"></div>		          		        
		          
		          <div class="coSelect" id="coSelect5">
		              <div id="coSpace6"></div>
		              <i class="fas fa-biking" id="coIcon5"></i>
		              <div id="coSpace7"></div>
		              <label class="commonLabel">액티비티</label>
		          </div>
		     </div>
		
		</div>
		<div id="coMenu">
		    <div id="coSpace8"></div></div>
		
		<div id="all_div">
	         <div style="height: 20px;"></div>
	        
	        <c:if test = "${ empty list }">
				<div>조회결과가 없습니다.</div>
			</c:if>
			<c:forEach var="list" items="${ list }">
			    <div id="listDiv">
			         <div id="listDiv2">
			             <img src="resources/courseFiles/${ list.changeName }" id="listImg" />
			             <label id="listTitle">${ list.courseTitle }</label> 
			             <label id="listId">@${ list.courseWriter }</label>
			             <label id="listDistance">총 거리 : ${ list.distance }km</label>
			             <input type="hidden" id="courseNo" value="${ list.courseNo }">
			             <c:url var="cdetail" value="courseDetail.co">
								<c:param name="coNo" value="${ list.courseNo }" />
								<c:param name="page" value="${ pi.currentPage }" />
						</c:url>
			         </div>
			         
			         <div id="day1">
                          <label id="dayLabel">★</label>                         
                     </div>
                     <label id="dayLabel2">여행 코스</label>
                     <input type="hidden" id="nameHidden" value="${ list.courseName }">
                     <div id="nameDiv">
                     <c:set var="name" value="${ list.courseName }"/>
                     <c:set var="nameArr" value="${fn:split(name,',')}"/>
                     
                     <c:forEach var="i" begin="0" end="${fn:length(nameArr)-1}">
                         <div id="nameLabel">
                              <label id="dayLabel3">${ i+1 }</label>
                         </div>
                         <div id="nameLabel2">${ nameArr[i] }</div>
                         <div></div>
                     </c:forEach>
                     <div id="detailBtn" onClick="location.href ='${ cdetail }'"><a id="detailLabel" href="${ cdetail }">자세히보기</a></div>                    
                     </div>                  
			     </div>
			</c:forEach>
			
			<div class="paging">
				<c:if test="${ pi.currentPage <= 1 }"></c:if>
				<c:if test="${ pi.currentPage > 1 }">
					<c:url var="before" value="courseList.co">
						<c:param name="page" value="${ pi.currentPage - 1 }"/>
						<c:param name="selectCategory" value="${ selectCategory }" />
					</c:url>	
				    <a href="${ before }" class="bt" id="beforeBtn">&lt;</a>
			    </c:if>

				<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
					<c:if test="${ p eq pi.currentPage }">
						<a href="${ pagination }" class="num on">${ p }</a> 
					</c:if>
					
					<c:if test="${ p ne pi.currentPage }">
						<c:url var="pagination" value="courseList.co">
							<c:param name="page" value="${ p }"/>
							<c:param name="selectCategory" value="${ selectCategory }" />
						</c:url>
						<a href="${ pagination }" class="num">${ p }</a>
					</c:if>
				</c:forEach>				
			
				<c:if test="${ pi.currentPage >= pi.maxPage }"></c:if>
				<c:if test="${ pi.currentPage < pi.maxPage }">
					<c:url var="after" value="courseList.co">
						<c:param name="page" value="${ pi.currentPage + 1 }"/>
						<c:param name="selectCategory" value="${ selectCategory }" />
					</c:url> 
					<a href="${ after }" class="bt" id="afterBtn">&gt;</a>
				</c:if>
			</div>
	
	    </div>
	    <form action="courseList.co" method="post" id="courseLists">
	        <input type="hidden" name="selectCategory" value="0">
	    </form>
	    <form action="courseList.co" method="post" id="courseLists1">
	        <input type="hidden" name="selectCategory" value="1">
	    </form>
	    <form action="courseList.co" method="post" id="courseLists2">
	        <input type="hidden" name="selectCategory" value="2">
	    </form>
	    <form action="courseList.co" method="post" id="courseLists3">
	        <input type="hidden" name="selectCategory" value="3">
	    </form>
	    <form action="courseList.co" method="post" id="courseLists4">
	        <input type="hidden" name="selectCategory" value="4">
	    </form>
	    <form action="courseList.co" method="post" id="courseLists5">
	        <input type="hidden" name="selectCategory" value="5">
	    </form>
	    <input type="hidden" id="selectCategory" name="selectCategory" value="0">
	    </section>
	    <div id="footerSpaces"></div>
        <footer>
   	        <c:import url="../common/footer.jsp" />
	    </footer>
	
	<script>
	   var message = '${msg}'; 
	   if(message!=""){
		   swal(message);
	   }
	   
	   var category = '${selectCategory}';
	   if(category == 0){
		   $('#coSelect0').css('background','rgb(234,234,234)');
	   } else if(category == 1){
		   $('#coSelect1').css('background','rgb(234,234,234)');
	   } else if(category == 2){
		   $('#coSelect2').css('background','rgb(234,234,234)');
	   } else if(category == 3){
		   $('#coSelect3').css('background','rgb(234,234,234)');
	   } else if(category == 4){
		   $('#coSelect4').css('background','rgb(234,234,234)');
	   } else if(category == 5){
		   $('#coSelect5').css('background','rgb(234,234,234)');
	   }
	
		function detailView(){
			location.href="<%= request.getContextPath() %>/courseDetail.co";
		} 
		
		function insertView(){
			location.href="<%= request.getContextPath() %>/courseTitle.co";
		}
		
		function errorView(){
			location.href="<%= request.getContextPath() %>/searchError.co";
		}
		
		$('#coSelect0').click(function(){
			$('#selectCategory').val("0");
			$('#courseLists').submit();
		});
		
		$('#coSelect1').click(function(){
			$('#selectCategory').val("1");
			$('#courseLists1').submit();
		});
		
		$('#coSelect2').click(function(){
			$('#selectCategory').val("2");
			$('#courseLists2').submit();
		});
		
		$('#coSelect3').click(function(){
			$('#selectCategory').val("3");
			$('#courseLists3').submit();
		});
		
		$('#coSelect4').click(function(){
			$('#selectCategory').val("4");			
			$('#courseLists4').submit();
		});
		
		$('#coSelect5').click(function(){
			$('#selectCategory').val("5");			
			$('#courseLists5').submit();
		});

	</script>	
</body>
</html>