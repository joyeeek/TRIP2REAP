<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>전국방방곡곡 | 여행지</title>
<link rel="stylesheet" type="text/css"
	href=" ${pageContext.request.contextPath}/resources/css/travel/travelList.css" />
<!-- 파비콘 -->
<link rel="shortcut icon" href="resources/images/favicon.ico"
	type="image/x-icon">
<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
<script>


</script>
</head>
<body>
	<section>
		<header>
			<c:import url="../common/menubar.jsp" />
		</header>
		<div id="all_div">
			<div id="menubar_div">
				<div id="menu_div">
					<div id="menu_left_div">
						<i class="fas fa-suitcase-rolling" id="menu_img"></i> <span
							id="menu">여행지</span>
					</div>
					<div id="menu_right_div">
						<input type="search" id="input_search" placeholder="검색할 여행지명을 입력하세요!" />

						<button id="button_search" type="reset">검색</button> 
					</div>
				</div>

				<!-- 해쉬태그 카테고리 -->
				<div id="hashtag_div">
					<ul id="hashtag_ul">
						<li><a
							 id="selectTag">#전체</a>&nbsp;&nbsp;
						</li>
						<li>#<a>문화시설</a>&nbsp;&nbsp;
						</li>
						<li>#<a>걷기좋은</a>&nbsp;&nbsp;
						</li>
						<li>#<a>쇼핑</a>&nbsp;&nbsp;
						</li>
						<li>#<a>자연</a>&nbsp;&nbsp;
						</li>
						<li>#<a>맛집</a>&nbsp;&nbsp;
						</li>
					</ul>
				</div>
			</div>

			<!-- 지역/테마 카테고리 -->
			<div id="cate_table_div">
				<span id="cate_name">&nbsp;지역</span> <span id="cate_icon">🚕</span>
				<table id="local_table">
					<tr class="localSelectTr">
						<td class="selectAllTd">전체</td>
						<td id="서울" class="regTd">서울</td>
						<td id="인천"  class="regTd">인천</td>
						<td id="대전"  class="regTd">대전</td>
						<td id="대구"  class="regTd">대구</td>
						<td id="광주"  class="regTd">광주</td>
						<td id="부산"  class="regTd">부산</td>
						<td id="울산"  class="regTd">울산</td>
						<td id="세종"  class="regTd">세종</td>
					</tr>
					<tr class="localSelectTr">
						<td id="경기"  class="regTd">경기</td>
						<td id="강원"  class="regTd">강원</td>
						<td id="충북"  class="regTd">충북</td>
						<td id="충남"  class="regTd">충남</td>
						<td id="경북"  class="regTd">경북</td>
						<td id="경남"  class="regTd">경남</td>
						<td id="전북"  class="regTd">전북</td>
						<td id="전남"  class="regTd">전남</td>
						<td id="제주"  class="regTd">제주</td>
					</tr>
				</table>

				<span id="cate_name">&nbsp;테마</span> <span id="cate_icon">🚗</span>
				<table id="theme_table">
					<tr>
						<td class="selectAllTd">전체</td>
						<td id="관광지" class="tmTd">관광지</td>
						<td id="음식점" class="tmTd">음식점</td>
						<td id="명소" class="tmTd">명소</td>
						<td id="축제" class="tmTd">축제</td>
					</tr>
				</table>
			</div>



			<div id="list_all_div">
				<div id="list_count_div">
					총<span id="list_count">${ pi.listCount }</span>건
				</div>




				<!-- 여행지 div -->
				<c:if test="${ list eq null }">
					<div>조회결과가 없습니다.</div>
				</c:if>
				<c:forEach var="t" items="${ list }" varStatus="s">
				   <c:set var="Img" value="${ t.changeName }"></c:set>
                    <c:set var="ImgAr" value="${fn:split(Img,',')}">
                    </c:set>
					<div id="list_travel_div">
						<div id="travel_img_div">
							<c:if test="${t.changeName != null }">
								<!-- insert로 등록한 여행지 -->
								<img src="resources/travelFiles/${ ImgAr[0] }"
									id="travel_img" />
							
							</c:if>

							<c:if test="${t.changeName == null }">
								<!-- db에 들어가있던 여행지 -->
								<img src="resources/images/송도" id="travel_img" />
							</c:if>
						</div>

						<div id="travel_name_writer_div">
							<div id="travel_no">${ t.boNo }</div>
							<input type="hidden" class="boNo_hidden" value="${ t.boNo }">
							<c:url var="tdetail" value="tDetail.tv">
								<c:param name="boNo" value="${ t.boNo }" />
								<c:param name="page" value="${ pi.currentPage }" />
							</c:url>
							<div id="travel_name">
								<a href="${ tdetail }">${ t.boTitle } <c:if
										test="${ t.boCount > 30 }">
										<!-- 조회수가 30이상인 게시글은 아이콘표시 왜 안되는거지 -->
										<img src="resources/images/promotional.png" width="25px"
											height="25px">
									</c:if>
								</a>
							</div>

							<div id="travel_theme">${ t.trTheme }</div>
							<div id="travel_writer">${ t.trReg }</div>
							<div id="travel_tag">
								<p class="hashTag" id="hashTag${ t.boNo }" style="display: none"></p>
								<br> <input type="hidden" value=${ t.boNo } id="hashTagVal" />
								<script>
						var hashTag = "${ t.boTag }";
						var hash = hashTag.split('#');
						var size = hash.length;
						for(var i=1; i < size; i++){
							$('.hashTag').eq(${s.index}).append("<span class='hashTagSpan'>#"+hash[i]+"</span>&nbsp;&nbsp;")
						}
						$(".hashTag").css("display", "");
					</script>
							</div>
						</div>
						<div id="list_etc" class="dotClass">
							<a href="#modal" id="list_etc_modal">…</a>
						</div>
					</div>

				</c:forEach>


			</div>




			<!--  등록하기 버튼 (관리자만 보이게 ) -->

			<c:if test="${ loginUser.memberId == 'admin' }">
				<div id="button_write_div">
					<button id="button_write" onclick="location.href='tInsertView.tv'">등록하기</button>
				</div>
			</c:if>



			<!-- 페이징 -->
			<div class="paging">
			<c:set var="loc" value="page=" />
			<c:if test='${searchList.title ne "all" && searchList.chkNo eq 1  }'>
			<c:set var="loc" value="title=${searchList.title }&page=" />
			</c:if>
			<c:if test='${searchList.hashTag ne "all" && searchList.chkNo eq 2 }'>
			<c:set var="loc" value="hashTag=${searchList.hashTag }&page=" />
			</c:if>
			<c:if test='${searchList.reg ne "all" && searchList.chkNo eq 3  }'>
			<c:set var="loc" value="reg=${searchList.reg }&page=" />
			</c:if>
			<c:if test='${searchList.tm ne "all" && searchList.chkNo eq 4 }'>
			<c:set var="loc" value="tm=${searchList.tm }&page=" />
			</c:if>
			
				<!-- 이전 페이지 -->
				<c:if test="${ pi.currentPage <= 1 }">이전페이지
				</c:if>
				<c:if test="${ pi.currentPage > 1 }">
					<a href="tList.tv?${loc }${ pi.currentPage-1 }" class="bt" id="beforeBtn">이전페이지</a>
					
				</c:if>


				<!-- 페이지 -->


				<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
					<c:if test="${ p eq pi.currentPage }">
						<a href="${ pagination }" class="num on">${ p }</a> &nbsp;
					</c:if>

					<c:if test="${ p ne pi.currentPage }">
						
						<a href="tList.tv?${loc }${p }">${ p }</a>
						
					</c:if>
				</c:forEach>



				<!-- [다음] -->
				<c:if test="${ pi.currentPage >= pi.maxPage }">
					다음 페이지
				</c:if>
				<c:if test="${ pi.currentPage < pi.maxPage }">
					
					<a href="tList.tv?${loc }${ pi.currentPage + 1 }" class="bt" id="afterBtn">다음 페이지</a>
					
				</c:if>

			</div>
			<!-- 페이징 div끝 -->

			<input type="hidden" id="travelUserInfo"
				value="${ loginUser.memberId }"> <input type="hidden"
				id="travelBoInfo" value="">


		</div>
		<!-- 전체 div끝 -->





		<!-- modal 시작  -->
		<div id="modal" class="modal">
			<div id="share_div">
				<i class="fas fa-share-alt"></i><span id="mo_share">공유하기</span>
				<button class="url_btn" id="sh-link">URL복사</button>
			</div>
			<hr id="mo_hr">
			<div id="contain_div">
				<i class="fas fa-download"></i><span id="mo_contain">여행지 담기</span>
				<button class="url_btn" id="myTravel">추가하기</button>
				<div id="contain_info">[마이페이지]-[담은 여행지]에서 확인할 수 있습니다.</div>
			</div>
		</div>

		<!-- modal끝 -->


		<script>
	
		
		//modal창 -----------------------------------------------------
		//$('a[href="#modal"]').click(function(event) {
		$(document).on("click","#list_etc_modal",function(){
         var current = $(this).parent().parent().find('#travel_no').text();
         $('#travelBoInfo').val(current);
      
         event.preventDefault();

         $(this).modal({
            fadeDuration : 250
         });
      });
		
		
		//function travelContain(){}
		$(document).on("click","#myTravel",function(){
	         var memberId = $('#travelUserInfo').val();
	         var boNo = $('#travelBoInfo').val();
	         
	         if(memberId == ""){
	            swal("로그인 후 이용가능합니다🙋");
	         } else {            
	            $.ajax({
	                   url : 'myTravel.me',
	                  type : 'post',
	                  data : {boNo:boNo,memberId:memberId},
	                  success : function(data){
	                      console.log("data : " + data); 
	                     if(data == "Y"){
	                        swal("여행지 담기에 성공하였습니다.\n마이페이지에서 확인해주세요😊");      
	                     } else if(data == "E") {
	                        swal("이미 담긴 여행지입니다🙋");
	                     } else {
	                        swal("여행지 담기에 실패하였습니다🙋");
	                      } 
	                    },
	                    error : function(data){
	                       console.log("서버 실패");
	                    }
	                 });
	         }                   
	      });   
		
		
		
		//url복사하기
		$(document).on("click", "#sh-link", function(e) { // 링크복사 시 화면 크기 고정 
			$('html').find('meta[name=viewport]').attr('content', 'width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no'); 
			var html = "<input id='clip_target' type='text' value='' style='position:absolute;top:-9999em;'/>"; 
			$(this).append(html); 
			
			var input_clip = document.getElementById("clip_target"); 
				//현재 url 가져오기 -> 해당 여행지 url 가져오기로 수정완 (12/12)
				var _url = $(location).attr("location.href='tDetail.tv?boNo=${t.boNo}&page={pi.currentPage}'"); 
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
						swal("URL이 복사 되었습니다.", "원하시는 곳에 붙여넣기 해 주세요!", "success");
						// 링크복사 시 화면 크기 고정 
						$('html').find('meta[name=viewport]').attr('content', 'width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=yes'); 
					} else { 
						swal("URL이 복사에 실패했습니다.", "이 브라우저는 지원하지 않습니다.", "error");
						} 
					} catch (err) { 
						swal("URL이 복사에 실패했습니다.", "이 브라우저는 지원하지 않습니다.", "error");
						} 
			}); //클립보드 복사 기능 끝
	
		
	</script>
	<script>
	
  	$(function(){
  		console.log("${hashTag}");
  		console.log("${reg}");
  		console.log("${tm}");
 		 if("${hashTag}" == "all"){ //hashtag가 선택되지않았을때 전체에 style추가.
 			 $("#selectTag").css({'font-weight': '800'});
 		 };
 		 var tag = $("#hashtag_div").children().children().children();
 		 $.each(tag, function(index, item){
 			if("${hashTag}" == item.innerHTML){			 
			item.style.fontWeight = "800";
			item.setAttribute("class", "selected");
 			}
 		});
 		 
 		 
 		 $("#hashtag_ul").children().hover(function(){
 			$(this).css('cursor', 'pointer');
		 }, function(){
				$(this).css('cursor', 'none');
 		 });
 		
 		 if("${hashTag}" != "all"){
 			$("hashtag_ul").children().hover(function(){
 	 			$(this).css({'cursor': 'pointer', 'color': '#497f55', 'font-weight': '800','text-decoration': 'underline'});
 				}, function(){
 					$(this).css({'cursor': 'none', 'background':'#eee', 'color':'black'});
 	 		 });
		 };
		 
		  $('.selected').hover(function(){
				$(this).css({'cursor':'pointer', 'font-weight': '800', 'text-decoration': 'underline'});
			}, function(){
				$(this).css({'cursor':'pointer', 'font-weight': '800', 'text-decoration': 'underline'});
			}); 
 	  
		 //---------------------------
		 
	
			
			if("${reg}" == "all"){
					/* $(".selectAllTd").css({'background-color': 'rgb(202,240,170)'}); //전체 버튼에만 style */
			}else{
				var reg = $('.regTd');
				for(var i=0; i<reg.length; i++){
					if("${reg}"==reg[i].innerHTML){
						reg[i].style.background = "rgb(202,240,170)";
					
					}
					
				}
			};

	 		 
	 		 $(".localSelectTr").children().hover(function(){
	 			$(this).css('cursor', 'pointer');
			 }, function(){
					$(this).css('cursor', 'none');
	 		 });
	 		
		 
			 
			 //----------------
			 
			if("${tm}" == "all"){
					/* $(".selectAllTd").css({'background-color': 'rgb(202,240,170)'}); //전체 버튼에만 style */
			}else{
				var tm = $('.tmTd');
				for(var i=0; i<tm.length; i++){
					if("${tm}"==tm[i].innerHTML){
						tm[i].style.background = "rgb(202,240,170)";
					
					}
					
				}
			};
			
			 $("#theme_table").children().children().hover(function(){
		 			$(this).css('cursor', 'pointer');
				 }, function(){
						$(this).css('cursor', 'none');
		 		 });
		 
			 

		
		});
	
	
	
	
	
	
	
	
    //해쉬태그 span을 누르면 해당 해시태그 검색창으로.
	$(document).on("click",".hashTagSpan",function(){
         var hashParam = $(this).text();
         hashParam = hashParam.split("#")
      	hashParam = hashParam[1]
		
    	 location.href = "tList.tv?hashTag="+hashParam;
		});
    $("#hashtag_ul").find("a").click(function(){
    	var hashTag = $(this).text();
    	location.href="tList.tv?hashTag="+hashTag+"&reg="+"${reg}"+"&tm="+"${tm}";
    
   	});
    
	
 	$(document).on("click","#local_table td",function(){
		var reg = $(this).text();
		if(reg == "전체"){
			location.href = "tList.tv";
		}else{
			location.href = "tList.tv?reg="+reg+"&hashTag="+"${hashTag}"+"&tm="+"${tm}";
		}
		
		
	})
	
	$(document).on("click","#theme_table td",function(){
		var tm = $(this).text();
		if(tm == "전체"){
			location.href = "tList.tv";
		}else{
			location.href = "tList.tv?tm="+tm+"&reg="+"${reg}"+"&hashTag="+"${hashTag}";
		}

	}) 
	
	
		
    //검색창
    $("#button_search").click(function(){
		var search = $('#input_search').val();
	
		location.href = "tList.tv?title="+search;
		
	});
	
	
	function detailView(){
		   location.href="<%=request.getContextPath()%>/tDetail.tv";
	    }

	
	
	//등록하기 버튼 누르면 insert로 넘어감.
	$("#button_write").click(function(){
			$('#tList').submit();
	})

	
	$(".selectAllTd").click(function(){
		location.href="<%=request.getContextPath()%>/tList.tv"	
	})
	
	
      

	</script>

	</section>
	 <div id="footerSpaces"></div>
        <footer>
              <c:import url="../common/footer.jsp" />
       </footer>
</body>
</html>