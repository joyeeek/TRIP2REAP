<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html lang="ko">
<head>
<link rel="stylesheet" href=" ${pageContext.request.contextPath}/resources/css/travel/travelList.css"/>
<meta charset="UTF-8">
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
				<input type="text" id="input_search" />
				
				<button id="button_search" onclick="goSearchError()">검색</button>
			</div>
		</div>
		
		<!-- 해쉬태그 카테고리 -->
		<div id="hashtag_div">
			<ul id="hashtag_ul">
				<li>
					<a href=" ${pageContext.request.contextPath}/tList.tv">#전체</a>&nbsp;&nbsp; <!-- 해당 해쉬태그 검색페이지로 이동하게 수정 -->
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
		
		
		<!-- 지역/테마 카테고리 -->
		<div id="cate_table_div">
			<span id="cate_name">&nbsp;지역</span>
				<span id="cate_icon"><!-- <i class="fas fa-leaf" style="height:13px;, width:13px; color:#a7e1af;"></i> -->🚕</span>
				<table id="local_table">
					<tr>
						<td>전체</td>
						<td>서울</td>
						<td>인천</td>
						<td>대전</td>
						<td>대구</td>
						<td>광주</td>
						<td>부산</td>
						<td>울산</td>
						<td>세종</td>
					</tr>
					<tr>
						<td>경기</td>
						<td>강원</td>
						<td>충북</td>
						<td>충남</td>
						<td>경북</td>
						<td>경남</td>
						<td>전북</td>
						<td>전남</td>
						<td>제주</td>
					</tr>
				</table>
			
			<span id="cate_name">&nbsp;테마</span>
				<span id="cate_icon"><!-- <i class="fas fa-leaf" style="height:13px;, width:13px; color:#a7e1af;"></i> -->🚗</span>
				<table id="theme_table">
					<tr>
						<td>전체</td>
						<td>관광지</td>
						<td>음식점</td>
						<td>명소</td>
						<td>축제</td>
					</tr>
				</table>
			</div>
		
		
		
		<div id="list_all_div">
			<div id="list_count_div">
				총<span id="list_count">${ pi.listCount }</span>건
			</div>
			
			<!-- 여행지 div -->
			<c:forEach var="t" items="${ list }">
			<div id="list_travel_div">
				<div id="travel_img_div">
					<img src="resources/images/송도.JPG" id="travel_img"/>
				</div>
				
				<div id="travel_name_writer_div">
					<div id="travel_no">${ t.boNo }</div>
					<div id="travel_name">${ t.boTitle }</div>
					<div id="travel_theme">${ t.trTheme }</div>
					<div id="travel_writer">${ t.trAddr }</div>
					<div id="travel_tag">${ t.boTag }</div>
				</div>
				<div id="list_etc"><a href="#modal">…</a></div>
			</div>
			</c:forEach>
		</div>	
			
			
		
		
		
		
		<!-- 등록하기 버튼 (관리자만 보이게)-->
			<c:if test="${ loginUser.memberId == 'admin' }"> 
				<div id="button_write_div">
				<button id="button_write" onclick="location.href='tInsertView.tv';">등록하기</button>
				</div>
			</c:if>	
			
			
		<!-- 페이징 버튼 -->	
				<div id="paging_div">
					<button id="before">&lt;</button>
					<button id="current">1</button>
					<button class="num">2</button>
					<button class="num">3</button>
					<button id="after">&gt;</button>
				</div>
		
		
		
	</div><!-- 전체 div끝 -->
	
	
	
	
	
	   <!-- modal 시작  -->
		<div id="modal" class="modal">
		    <div id="share_div">
		    	<i class="fas fa-share-alt"></i><span id="mo_share">공유하기</span>
		    	<button class="url_btn" id="sh-link">URL복사</button>
		    </div>
		    <hr id="mo_hr">
		    <div id="contain_div">
		    	<i class="fas fa-download" ></i><span id="mo_contain">여행지 담기</span>
		    	<button class="url_btn" onclick="containTravel()">추가하기</button>
		    	<div id="contain_info">[마이페이지]-[담은 여행지]에서 확인할 수 있습니다.</div>
		    </div>
		</div>
   
   	 <!-- modal끝 -->
   	 
   	 
	<script>
		function detailView(){
 		   location.href="<%= request.getContextPath() %>/tDetail.tv";
 	   }
		
		
		
		
		function goSearchError(){
			location.href="<%= request.getContextPath() %>/tSearchError.tv";
		}
		
		
		
		$('a[href="#modal"]').click(function(event) {
			event.preventDefault();

			$(this).modal({
				fadeDuration : 250
			});
		});
		
		function containTravel(){
			swal("여행지를 담았습니다","마이페이지에서 확인하세요","success");//이미 담은 여행지이거나 로그인하지않은경우 담기지 않아야함.(추후수정필요) 
		}
		
		
		//url복사하기
		$(document).on("click", "#sh-link", function(e) { // 링크복사 시 화면 크기 고정 
			$('html').find('meta[name=viewport]').attr('content', 'width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no'); 
			var html = "<input id='clip_target' type='text' value='' style='position:absolute;top:-9999em;'/>"; 
			$(this).append(html); 
			
			var input_clip = document.getElementById("clip_target"); 
				//현재 url 가져오기 -> 해당 여행지 url 가져오기로 어떻게 값을 가져올지 고민중
				var _url = $(location).attr('href'); 
			$("#clip_target").val(_url); 
				
			if (navigator.userAgent.match(/(iPod|iPhone|iPad)/)) { 
				var editable = input_clip.contentEditable; 
				var readOnly = input_clip.readOnly; 
				
				input_clip.contentEditable = true; 
				input_clip.readOnly = false; 
				
				var range = document.createRange(); 
				range.selectNodeContents(input_clip); 
				
				var selection = window.getSelection(); 
				selection.removeAllRanges(); 
				selection.addRange(range); 
				input_clip.setSelectionRange(0, 999999); 
				
				input_clip.contentEditable = editable; 
				input_clip.readOnly = readOnly; 
			} else { 
				input_clip.select(); 
			} 
			
			try { 
				var successful = document.execCommand('copy'); 
				input_clip.blur(); 
				if (successful) { 
				/* 	alert("URL이 복사 되었습니다. 원하시는 곳에 붙여넣기 해 주세요.");  */
					swal("URL이 복사 되었습니다.", "원하시는 곳에 붙여넣기 해 주세요!", "success");
					// 링크복사 시 화면 크기 고정 
					$('html').find('meta[name=viewport]').attr('content', 'width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=yes'); 
				} else { 
					/* alert('이 브라우저는 지원하지 않습니다.'); */
					swal("URL이 복사에 실패했습니다.", "이 브라우저는 지원하지 않습니다.", "error");
					} 
				} catch (err) { 
					swal("URL이 복사에 실패했습니다.", "이 브라우저는 지원하지 않습니다.", "error");
					} 
				}); //클립보드 복사

		
			/* 	
			$(function(){
				&('#travel_name').click(function(){
					var boNo = $(this).children('div').eq(0).text();
					location.href="tDetail.tv?boNo=" + boNo + "&page=" + ${pi.currentPage};
				});
			}); */
	</script>
	
</section>
</body>
</html>