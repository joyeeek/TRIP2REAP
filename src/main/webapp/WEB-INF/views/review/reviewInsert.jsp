<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css"
	href="resources/css/review/reviewInsert.css" />
<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
<link rel="shortcut icon" href="resources/images/favicon.ico" type="image/x-icon">
<title>전국방방곡곡 | 여행후기</title>
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
					<i class="fas fa-camera-retro" id="menuIcon3"></i> <span id="menu">여행
						후기 작성</span>
				</div>
			</div>

			<form method="post" onsubmit="false;" action="rInsert.bo"  enctype="Multipart/form-data">
				<div id="wrapperForm">
					<br> <br>
					<div id="cate">

						 <select id="select_search" name="caCode" required="required">
							<option>카테고리를 선택해주세요</option>
							
							<option value="3">여행지</option>
							<option value="4">맛집</option>
		
						</select> 
				

					</div>
					
					<br>
					<br>

					<div class="writeForm" id="writer">

						<input type="file" id="photo_btn" name="uploadFile"> 
						
						<input type="file" id="detail_img_btn" name="detailFile" multiple="multiple"> 
						
						<input type="hidden" name="memberId" value="${loginUser.memberId }">
					</div>
					
					<br>
					
					<div class="writeForm" id="title">
						<textarea name="boTitle" placeholder="제목을 입력해 주세요."
							class="textarea_input" style="height: 40px;" required="required"></textarea>
					</div>
					<br> <br>

					<div id="content">
								<br>

						<textarea id="contentForm" placeholder="내용을 입력해주세요" name="boContent" rows="40" cols="130" required="required"></textarea>
							<p>*태그는 최대 3개까지 등록가능합니다.</p>
							<div class="hashTag">
								
								
								<div  id="hashtag">
								
								<input type="text" id="tag" placeholder="태그를 입력해 주세요" />
								<input type="hidden" name="boTag" id="hashtagInput" />
								
							</div>
									
						
						</div>


						<br>
						
					</div>

					<br>
						<input type="submit" id="submit" value="등록"
						style="width: 50px; height: 30px;">
				</div>


			</form>

		</div>
		
		<br><br><br><br><br><br><br><br>
		
	<script>
     //모든 페이지가 요청이 되었을 때
     $(document).ready(function() {
//     	 var hashTagNo = 0
         // ID를 alpreah_input로 가지는 곳에서 키를 누를 경우
         $("#tag").keydown(function(key) {
             //키의 코드가 13번일 경우 (13번은 엔터키)
             var tag = $("#tag").val();
             if (key.keyCode == 13) {
            	 $('#hashtag').append("<div class='hashtag'>" + "#" + tag +"</div>" + "&nbsp;&nbsp;");
//             	 alert("작동")
// 				alert(hashTagNo)
//             	 alert($('#hashtagInput'+hashTagNo).val())
//             	 hashTagNo++
//          		alert(hashTagNo)
			//	alert($('#hashtagInput').val())
            	 $('#tag').val("")
            	 $('#hashtagInput').val($('#hashtagInput').val()+"#"+tag)
            	 
//          		var nanum = $('#hashtagInput').val().split("#")
//         		$(nanum).each (function(index, item){
//         			alert(item)
        			
//         		})


             } 
         });
     });


		// 엔터시 전송되는거 막는 코드
		document.addEventListener('keydown', function(event) {
			  if (event.keyCode === 13) {
			    event.preventDefault();
			  };
			}, true);
		
		
		//클릭시 배경 색 변환
		$(function(){	
			//$('#tag').click(function(){$(this).css("background","")})
			/*
			$('#submit').click(function(){
				let detailFiles= $('#detail_img_btn').get(0).files;
				if(detailFiles.length==0){
					swal({
						  title: "등록 실패",
						  text:"썸네일 사진이 없습니다!",
						  icon: "error",
						  button: "확인",
						});
					location.href='rInsert.bo';
				}else{
					
				}
			});
			*/
		})
		
	
		
	</script>
<footer>
              <c:import url="../common/footer.jsp" />
       </footer>
		

</section>
</body>
</html>
