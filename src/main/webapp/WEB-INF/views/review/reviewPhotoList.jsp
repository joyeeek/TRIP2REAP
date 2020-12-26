<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css"
	href="resources/css/review/reviewPhotoList.css" />
<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
<script>
 $(document).ready(function(){
	 
// 	 alert(document.getElementById("hashTag57").innerHTML)
// 	 alert($(".hashTag").length)
// 	 alert("hashTag"+$('#hashTagVal0').val())
// 	 var size = $(".hashTag").length
// 	 alert(size)
	 
// 	 for(var i=0; i<size; i++){
// 		 var hashTagName = document.getElementById(("hashTag"+$('#hashTagVal'+i).val())).innerHTML
// 		, hashTagNameSplit = hashTagName.split("#")
// 		 $("#hashTag"+$('#hashTagVal'+i).val()).html("")
// 			$(hashTagNameSplit).each (function(index, item){
// 				if(index == 0){
					
// 				}else {
// 					var SpanId = ($('#hashTagVal'+i).val()+index)
					
// 					 $("#hashTag"+$('#hashTagVal'+i).val()).append("<span class='hashTagSpan' id="+SpanId+">#"+item+"</span>&nbsp;&nbsp;")
// 				}
// 				})

		 
// 	 }

	$(".cate_btn").click(function(){
		var cate = $(this).attr('id')
		
		if(cate == "cate_btn1") {
			cate = ""
		}
		if(cate == "cate_btn2") {
			cate = "cate=code3"
			
		}
		if(cate == "cate_btn3") {
			cate = "cate=code4"
			
		}
		
		
		location.href = "reviewPhotoList.bo?"+cate;
		
	})


	$(".hashTag").css("display", "");
	
	$(".hashTagSpan").click(function(){
		var hashParam = document.getElementById($(this).attr('id')).innerHTML
		hashParam = hashParam.split("#")
		hashParam = hashParam[1]
		
		location.href = "reviewPhotoList.bo?hashTag="+hashParam;
		
	})
	
	$(".search").click(function(){
		
		var search = $("select[name=search]").val()
// 		alert(search)
		if(search == "작성자") {
			search = "writer=" + $('#search').val()
		}
		if(search == "제목") {
			search = "title=" + $('#search').val()
			
		}

		if(search == "해쉬태그") {
			search = "hashTag=" + $('#search').val()
			
		}

// 		alert(search)
		
		location.href = "reviewPhotoList.bo?"+search;
		
	})
	
      $("#search").bind('keydown', function(key) {
               if (key.keyCode == 13) {
            		$(".search").trigger('click')
            		$("#search").unbind()

             }
      })

             
 });

 </script>
 
  <style type="text/css">
 
 
 .cate_btn {
 	padding-right:15px;
 	border-radius:5px;
    text-align:center;
 	position: relative;
 }
 .cate_btn:hover {
 	background-color:#eee;
 	text-decoration: underline;
 	font-weight: bolder;
 	cursor: pointer;
 
 }
 
 .hashTagSpan:hover {
 
 	text-decoration: underline;
 	font-weight: bolder;
 	cursor: pointer;
 
 }
 
 </style>

<link rel="shortcut icon" href="resources/images/favicon.ico" type="image/x-icon">
<title>전국방방곡곡 | 여행후기</title>
</head>
<body>

	<header>
		<c:import url="../common/menubar.jsp" />
	</header>
	
	<section>
	
		<div id="all_div">
			<div id="menu_div">
				<div id="menu_left_div">
					<i class="fas fa-camera-retro" id="menuIcon3"></i> <span id="menu">여행후기</span>
				</div>
				<div id="cate_btn" style="display: inline-block;">
					<span id="cate_btn1" class="cate_btn"><b>전체보기</b></span> 
					<span id="cate_btn2" class="cate_btn"> <b>여행지</b></span> 
					<span id="cate_btn3" class="cate_btn"><b>맛집</b></span>
				</div>
	

				<div id="bo_btn" style="display: inline-block;">
					<button id="bo_btn2" class="bo_btn">
						<i class="fas fa-th-large"></i>
					</button>
					<button id="bo_btn1" class="bo_btn" onclick="location.href='reviewList.bo';">
						<i class="fas fa-grip-lines"></i>
					</button>
				</div>

			</div>
		</div>
		<!-- text-align뿐만 아니라 대부분 div안에서 작동한다. -->
		
		
		<div class="searchbar">
					<table>
						<tr>

							<td colspan="3" style="text-align: center;"><select
								id="select_search" name="search">
									<option value="작성자">작성자</option>
									<option value="제목">제목</option>
									<option value="해쉬태그">해쉬태그</option>
							</select> <input type="search" id="search" placeholder="Search..." />

								<button id="search_btn" type="reset" class="search"
									id="search-btn">
									<span class="icon"><i class="fa fa-search"></i></span>
								</button></td>

							

						</tr>
					</table>
				</div>

		
		<div id="board">
						


			<c:forEach var="b" items="${list}">

				<div class="divcontent">
					<table id="board_table">
						<tr>
							
							<td id="img_td">
							
							<div class="gallerylist">
										
								<ul>
								
									<li>
									<c:url var="reviewDetail" value="reviewDetail.bo">
											<c:param name="boNo" value="${ b.boNo }" />
											<c:param name="page" value="${ pi.currentPage }" />
									</c:url>
									
									<a id ="detailGo" href="${reviewDetail}">
									
									<div class="screen">
									
									<div class="top">
									
									
									
									<c:url var="reviewDetail" value="reviewDetail.bo">
									<c:param name="boNo" value="${ b.boNo }"/>
									<c:param name="page" value="${ pi.currentPage }"/>
									</c:url>
									
						       
						       		
											${ b.boTitle }<br>
										
				
									
									</div>
									
									<div class="bottom">
									<p class="hashTag" id="hashTag${b.boNo }" style="display:none">${b.boTag }</p><br>
										<input type="hidden" value=${b.boNo } id="hashTagVal${tag.index }" />
										
									<i class="fas fa-eye"></i>&nbsp;${b.boCount}&nbsp;
									<i class="fas fa-thumbs-up"></i>&nbsp;22&nbsp;
									<i class="fas fa-comment-dots"></i>&nbsp;<b id="checkCount"></b>
									
									</div>
									
									<c:if test="${b.changeName != null }">
										<img id="review_img" class="center-block" src="resources/buploadFiles/${b.changeName}">
										
									</c:if> 
								
									<c:if test="${b.changeName == null }">
										
										
										<img id="Not_img" class="center-block" src="resources/images/emoticon.png">
										
										
									</c:if>
									
									</div>
									</a>
						
  							
								</li>
								
								</ul>	
								</div>

  							
								</td>
						</tr>
						
					</table>
								
				</div>

			</c:forEach>
		</div>





		<div id="paging_table_div">
			<table id="paging_table">

				<!-- 페이징 처리 -->
				<tr align="center" height="20">
					<td></td>
					<td>
						<!-- [이전] --> 
							<c:set var="loc" value="page=" />
			
			<c:if test='${searchList.writer ne "all" && searchList.chkNo eq 1  }'>
			<c:set var="loc" value="writer=${searchList.writer }&page=" />
			</c:if>
			<c:if test='${searchList.title ne "all" && searchList.chkNo eq 2 }'>
			<c:set var="loc" value="title=${searchList.title }&page=" />
			</c:if>
			<c:if test='${searchList.hashTag ne "all" && searchList.chkNo eq 3  }'>
			<c:set var="loc" value="hashTag=${searchList.hashTag }&page=" />
			</c:if>
			<c:if test='${searchList.cate ne "all" && searchList.chkNo eq 4 }'>
			<c:set var="loc" value="cate=${searchList.cate }&page=" />
			</c:if>
				<!-- [이전] -->
				<c:if test="${ pi.currentPage <= 1 }">
				
				</c:if>
				
				<c:if test="${ pi.currentPage > 1 }">
<%-- 					<c:url var="firstPage" value="reviewList.bo"> --%>
<%-- 						<c:param name="page" value="${ pi.startPage }"/> --%>
<%-- 					</c:url> --%>
					<a href="reviewPhotoList.bo?${loc }${ pi.startPage }"><button class="page_btn">&lt;&lt;</button></a>
					
<%-- 					<c:url var="before" value="reviewList.bo"> --%>
<%-- 						<c:param name="page" value="${ pi.currentPage-1 }"/> --%>
<%-- 					</c:url> --%>
					<a href="reviewPhotoList.bo?${loc }${ pi.currentPage-1 }"><button class="page_btn">&lt;</button></a>
				</c:if>
				
				
				<!-- 페이지 -->
				
				<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
				
					<c:if test="${ p eq pi.currentPage }">
					<button class="page_btn"><b style=background-color:#eee;>${p}</b></button>
					</c:if>
					
					<c:if test="${ p ne pi.currentPage }">
<%-- 						<c:url var="pagination" value="reviewList.bo"> --%>
<%-- 							<c:param name="page" value="${ p }"/> --%>
<%-- 						</c:url> --%>
						
						<a href="reviewPhotoList.bo?${loc }${p }">
						<button class="page_btn">${ p}</button>
						</a>
					
					</c:if>
				</c:forEach>
				
				<!-- [다음] -->
				<c:if test="${ pi.currentPage >= pi.maxPage }">
					
				</c:if>
				<c:if test="${ pi.currentPage < pi.maxPage }">
<%-- 					<c:url var="after" value="reviewList.bo"> --%>
<%-- 						<c:param name="page" value="${ pi.currentPage + 1 }"/> --%>
<%-- 					</c:url>  --%>
					<a href="reviewPhotoList.bo?${loc }${ pi.currentPage + 1 }"><button class="page_btn">&gt;</button></a>
					
<%-- 					<c:url var="lastPage" value="reviewList.bo"> --%>
<%-- 						<c:param name="page" value="${ pi.endPage }"/> --%>
<%-- 					</c:url> --%>
					<a href="reviewPhotoList.bo?${loc }${ pi.endPage }"><button class="page_btn">&gt;&gt;</button></a>
				</c:if>
					</td>
					
					<td style="text-align: right;">

						<button id="write_btn" onclick="location.href='reviewInsert.bo';">글쓰기</button>

					</td>
				</tr>

				
			</table>



		</div>
		
		<div id="footerSpaces"></div>
        
		

	</section>
	<footer>
              <c:import url="../common/footer.jsp" />
       </footer>
		


</body>
</html>