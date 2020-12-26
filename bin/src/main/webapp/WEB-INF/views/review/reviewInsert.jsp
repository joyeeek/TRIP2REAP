<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="resources/css/review/reviewInsert.css"/>
 <script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>  
<title>Insert title here</title>
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
				<span id="menu">여행 후기 작성</span>
			</div>
		</div>
		
		<form action="reviewInsert.bo" method="post" id="writeReview">
		<!-- 작성하기 div 시작 -->
		<div id="insert_div">
			<div id="info_ment_div">
						<span class="astro_span">*은 필수 입력 사항입니다.</span>
			</div>
			
			
			<!-- 사진첨부 div -->
			<div id="titleImgArea" class="pictureArea">
				<img id="titleImg"/>
			</div>
			<div id="contentImgArea1" class="pictureArea">
				<img id="contentImg1"/>
			</div>
			<div id="contentImgArea2" class="pictureArea">
				<img id="contentImg2"/>
			</div>
			
			<div id="titleImgTxt">
				<div class="pictureName">
					<span class="astro_span">*</span>대표이미지
				</div>
			</div>
			<div id="contentImgTxt">
				<div class="pictureName">내용이미지1</div>
			</div>
			<div id="contentImgTxt">
				<div class="pictureName">내용이미지2</div>
			</div>
			
			
			<!-- 작성하기 table 시작 -->	
			<table id="travel_table">
				<tr>
					<td>
						<span class="astro_span">*</span><span>작성자</span>
					<td>
					<td>
						<input type="text" name="memberId" readonly value="${ loginUser.memberId }" style="background: lightgray;">
					</td>	
				</tr>
				<tr>
					<td>
						<span class="astro_span">*</span><span>카테고리</span>
					</td>
					<td>
						여행지 &nbsp; <input type="radio" value="여행지">
						&nbsp;맛집 &nbsp; <input type="radio"  value="맛집">
					</td>
				</tr>
			
				<tr>
					<td>
						<span class="astro_span">*</span><span>제목</span>
					</td>
					<td colspan="5">
						<input type="text" name="boTitle" id="travel_name"/>
					</td>
				</tr>
				
				
				<tr>
					<td>
						<span class="astro_span">*</span><span>해시태그</span>
					</td>
					<td colspan="2">
						<input type="text" name="boTag" id="input_travel_tag"/>
					</td>
					<td>
						<div class="hashtag">#산책하기좋은</div>
					</td>
					<td>
						<span class="hashtag">#드라이브코스</span>
					</td>
					<td>
						<span class="hashtag">#인천공원추천</span>
					</td>
				</tr>
		
			</table>
			
			 <div id="travel_content_div">
				<textarea rows="20" cols="125" name="boContent" id="travel_content"></textarea>
				  <div id="text_count_div">
					<span>현재 글자 수 </span>
					<span id="text_count">8</span>
					<span>자 / 최대 글자 수 2000자</span>
				 </div>
			</div>
			
			
		</div><!-- 전체 div 끝 -->
		
		
		<div id="fileArea">	<!-- 파일 업로드 부분 -->
	   			<input type="file" id="thumbnailImg1" multiple="multiple" name="thumbnailImg1" onchange="LoadImg(this,1)"/>
	   			<input type="file" id="thumbnailImg2" multiple="multiple" name="thumbnailImg2" onchange="LoadImg(this,2)"/>
	   			<input type="file" id="thumbnailImg3" multiple="multiple" name="thumbnailImg3" onchange="LoadImg(this,3)"/>
	   	</div>	

		
		
		<!-- 버튼 div -->
		<div id="button_div">
			<button id="button_cancel">취소</button>
			<button id="button_write">등록</button>
			<input type="submit" value="등록"/>
		</div>
		</form>
	
	</div>
	
	<script>
	// 사진 업로드 시 자리 지정
   		$(function(){
   			$("#fileArea").hide();
   			
   			$("#titleImgArea").click(function(){
   				$("#thumbnailImg1").click();
   			});
   			$("#contentImgArea1").click(function(){
   				$("#thumbnailImg2").click();
   			});
   			$("#contentImgArea2").click(function(){
   				$("#thumbnailImg3").click();
   			});
   		});
   		
   		// 이미지 업로드 함수
   		function LoadImg(value, num){
   			if(value.files && value.files[0]){
   				var reader = new FileReader();
   				
   				reader.onload = function(e){
   					switch(num){
   					case 1:
   						$('#titleImg').attr("src", e.target.result);
   						break;
   					case 2:
   						$('#contentImg1').attr("src", e.target.result);
   						break;
   					case 3:
   						$('#contentImg2').attr("src", e.target.result);
   						break;
   					}
   				}
   				reader.readAsDataURL(value.files[0]);
   			}	   			
   		}
	</script>
</section>		
</body>
</html>