<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="resources/css/review/reviewList.css"/>
 <script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>  
 
 <script>
 $(document).ready(function(){
	 
	 var size = $(".hashTag").length
	 
	 for(var i=0; i<size; i++){
		 var hashTagName = document.getElementById(("hashTag"+$('#hashTagVal'+i).val())).innerHTML
		, hashTagNameSplit = hashTagName.split("#")
		 $("#hashTag"+$('#hashTagVal'+i).val()).html("")
			$(hashTagNameSplit).each (function(index, item){
				if(index == 0){
					
				}else {
					var SpanId = ($('#hashTagVal'+i).val()+index)
					
					 $("#hashTag"+$('#hashTagVal'+i).val()).append("<span class='hashTagSpan' id="+SpanId+">#"+item+"</span>&nbsp;&nbsp;")
			//	$('#cate_btn').append("<div>"+'hashParam'+"</div>" + "&nbsp;&nbsp;");
				}
				})

		 
	 }
	 
	 $(".hashTagSpan").click(function(){
			var hashParam = document.getElementById($(this).attr('id')).innerHTML
			hashParam = hashParam.split("#")
			hashParam = hashParam[1]
			
			location.href = "reviewList.bo?hashTag="+hashParam;
		//	alert(hashParam);
			
		

			
		})
		
	$(".search").click(function(){
		
		var search = $("select[name=search]").val()
		if($('#search').val()== ""){
			search = ""
		} else{
			
		if(search == "작성자") {
			search = "writer=" + $('#search').val()
		}
		if(search == "제목") {
			search = "title=" + $('#search').val()
			
		}

		if(search == "해쉬태그") {
			search = "hashTag=" + $('#search').val()
			
		}

		}
		
		location.href = "reviewList.bo?"+search;
		
	})
		
	$(".hashTag").css("display", "");
	
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
		
		
		location.href = "reviewList.bo?"+cate;
		
	})
	
	
	
	
	
      $("#search").bind('keydown', function(key) {
               if (key.keyCode == 13) {
            		$(".search").trigger('click')
            		$("#search").unbind()

             }
      })
  
		
             
 });
 
 var message = '${msg}'; 
 if(message!=""){
	   swal(message);
 }

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
				<div id="menu_left_div" >
					<i class="fas fa-camera-retro" id="menuIcon3"></i> <span id="menu">여행후기</span>
				</div>
	
				<div id="cate_btn" style="display: inline-block;">
					<span id="cate_btn1" class="cate_btn"><b>전체보기</b></span> 
					<span id="cate_btn2" class="cate_btn"> <b>여행지</b></span> 
					<span id="cate_btn3" class="cate_btn"><b>맛집</b></span>
				</div>
	

				<div id="bo_btn" style="display: inline-block;">
					<button id="bo_btn1" class="bo_btn"
						onclick="location.href='reviewPhotoList.bo';">
						<i class="fas fa-th-large"></i>
					</button>
					<button id="bo_btn2" class="bo_btn">
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
		<table id="board_table">
		<tr class="board_list" align="center" bgcolor="#efefef">
			<th class="board_list" id="photozone"></th>
			<th class="board_list" id="botitle">제목</th>
			<th class="board_list" id="writer">작성자</th>
			<th class="board_list" id="date">날짜</th>
			<th class="board_list" id="count">조회수</th>
			<th class="board_list" id="like">좋아요</th>
		</tr>
		
		<c:forEach var="b" begin="0" varStatus="tag" items="${list}">
		<tr align="center" class="board_list">
			<td class="board_list">
				<c:if test="${b.changeName != null }">
					<img id="review_img" class="center-block" src="resources/buploadFiles/${b.changeName}">
						
				</c:if> 
								
				<c:if test="${b.changeName == null }">
					<img id="Not_img" class="center-block" src="resources/images/emoticon.png">
				</c:if>
			</td>
			
			
			
			
			<td align="left" class="board_list">
				
					<c:url var="reviewDetail" value="reviewDetail.bo">
						<c:param name="boNo" value="${ b.boNo }"/>
						<c:param name="page" value="${ pi.currentPage }"/>
					</c:url>
					<a href="${ reviewDetail}"><b>| ${b.caName} |</b></a><br><br>
					<a href="${ reviewDetail}" >${ b.boTitle }</a><br><br>
					<p class="hashTag" id="hashTag${b.boNo }" style="display:none">${b.boTag }</p><br>
					<input type="hidden" value=${b.boNo } id="hashTagVal${tag.index }" />
			
				
			
			</td>
			<td class="board_list">${b.nickName }</td>
			<td class="board_list">${b.regDate }</td>
			<td class="board_list">${b.boCount }</td>
			<td class="board_list">${b.likeCnt }</td>

		
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
					<a href="reviewList.bo?${loc }${ pi.startPage }"><button class="page_btn">&lt;&lt;</button></a>
					
<%-- 					<c:url var="before" value="reviewList.bo"> --%>
<%-- 						<c:param name="page" value="${ pi.currentPage-1 }"/> --%>
<%-- 					</c:url> --%>
					<a href="reviewList.bo?${loc }${ pi.currentPage-1 }"><button class="page_btn">&lt;</button></a>
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
						
						<a href="reviewList.bo?${loc }${p }">
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
					<a href="reviewList.bo?${loc }${ pi.currentPage + 1 }"><button class="page_btn">&gt;</button></a>
					
<%-- 					<c:url var="lastPage" value="reviewList.bo"> --%>
<%-- 						<c:param name="page" value="${ pi.endPage }"/> --%>
<%-- 					</c:url> --%>
					<a href="reviewList.bo?${loc }${ pi.endPage }"><button class="page_btn">&gt;&gt;</button></a>
				</c:if>
				
				
			</td>
			<td style="text-align: right;">

								<button id="write_btn"
									onclick="location.href='reviewInsert.bo';">글쓰기</button>

							</td>
			
		</tr>
		
		
		</table>
	</div>

		
	</section>
	<div id="footerSpaces"></div>
        <footer>
              <c:import url="../common/footer.jsp" />
       </footer>
	
	
	

</body>
</html>