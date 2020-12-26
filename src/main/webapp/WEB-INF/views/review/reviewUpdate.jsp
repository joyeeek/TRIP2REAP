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
						후기 수정</span>
				</div>
			</div>

			<form id="create_form" method="post" onsubmit="false;" action="rupdate.bo"  enctype="Multipart/form-data">
			<input type="hidden" name="page" value="${ page }">
			<input type="hidden" name="boNo" value="${ review.boNo }">
			<input type="hidden" name="changeName" value="${ review.changeName }">
				<div id="wrapperForm">
					<div id="cate">
					<br><hr><br>
						<p><b>*카테고리*</b></p>
						
						<select id="select_search" name="caCode">
							<option>카테고리를 선택해주세요</option>				
							<option <c:if test="${review.caCode == 3}">selected</c:if> 
								value="3" >여행지</option>
							<option <c:if test="${review.caCode == 4}">selected</c:if>
								value="4">맛집</option>
						</select>

					</div>
					<br><hr><br>
		
				<div id="wrapImg">
					<%-- <div id="titleImgDiv" class="titleImgDiv">
		   				 <img src="resources/buploadFiles/${ review.changeName }" id="titleImg" class="titleImg">
		   				
		   				 <i class="far fa-images" id="titleIcon"></i>		    
		    			<label id="titleLabel">썸네일 이미지 변경</label>	     
		    			<input type="hidden" name = "target_url"><br>
					    <input type="file" id="file" name="reloadFile" accept="image/*">
					</div> --%>
					<p><b>*이미지 업로드 수정*</b></p>
					<c:forEach var="detailImg"  items="${detailList}">
            				 <div id="titleImgDiv">
								<img src="resources/buploadFiles/${detailImg.changeName}" id="titleImg" class="titleImg">
							<i class="far fa-images" id="titleIcon"></i>		    
		    				<label id="titleLabel">이미지 변경</label>	
		    				<input type="hidden" name = "target_url"><br>
					  		<input type="file" id="file" name="reloadFile" accept="image/*">
		    				
							</div>
				    </c:forEach>
            		
            		
            		 
				</div>

<br><hr><br>

					<div class="writeForm" id="writer">
						

						<input type="hidden" name="memberId" value="${loginUser.memberId }">
					</div>
					
					
					<p><b>*제목 수정*</b></p>
					<div class="writeForm" id="title">
						<textarea name="boTitle" 
							class="textarea_input" style="height: 40px;">${review.boTitle}</textarea>
					</div>
					<br><hr><br>

					<div id="content">
								<br>
						<p><b>*내용 수정*</b></p>
						<textarea id="contentForm" name="boContent" rows="40" cols="130">${review.boContent}</textarea>
							
							<div class="hashTag">
								
								
								<div  id="hashtag">
						
								
								<input type="text" class="tag" id="tag" value="" placeholder="해쉬태그를 입력해주세요."/>
								<input type="hidden" class="hashtagInput"  name="boTag" value=${b.boNo } id="hashTagVal${tag.index }" />
							</div>
									
						</div>


						
						
					</div>
						<input type="submit" id="submit" value="수정"
						style="width: 50px; height: 30px;">

					
				</div>


			</form>

		</div>
		
		<br><br><br><br><br><br><br><br>
		
		<div id="footerSpaces"></div>
        <footer>
              <c:import url="../common/footer.jsp" />
       </footer>
		
	<script>
	
    $('#titleImgDiv').click(function (e) {
    	    // 현재 이미지 소스
            document.signform.target_url.value = document.getElementById('#titleImg').src;           
             e.preventDefault();
              $('#file').click();
    }); 
    
    var imgFile = document.querySelector("#file");
   
    
    imgFile.onchange = function(){
    	var fileList = file.files;
    	
    	// 읽기
    	var reader = new FileReader();
    	reader.readAsDataURL(fileList[0]);
    	
    	// 로드 후
    	reader.onload = function(){
    		document.querySelector('#titleImg').src = reader.result;
    	}
    }	
 
	
	
	//모든 페이지가 요청이 되었을 때
    $(document).ready(function() {
    	//해쉬태그 초기화
    	initHashTag();
    	
//    	 var hashTagNo = 0
        // ID를 alpreah_input로 가지는 곳에서 키를 누를 경우
        $(".tag").keydown(function(key) {
            //키의 코드가 13번일 경우 (13번은 엔터키)
            var tag = $(".tag").val();
            if (key.keyCode == 13) {
           	 $('#hashtag').append("<div class='hashtag'>" + "#" + tag +"</div>" + "<input class='deleteHash' onclick='deleteHash(this)' type='button' value='X'/>");
           	 
           	 
//            	 alert("작동")
//				alert(hashTagNo)
//            	 alert($('#hashtagInput'+hashTagNo).val())
//            	 hashTagNo++
//         		alert(hashTagNo)
			//	alert($('#hashtagInput').val())
           	 $('.tag').val("")
           	 $('.hashtagInput').val($('.hashtagInput').val()+"#"+tag);
           	 
//         		var nanum = $('#hashtagInput').val().split("#")
//        		$(nanum).each (function(index, item){
//        			alert(item)
       			
//        		})


            } 
        });
        
        
        
       

    
/* 	var size=$('.tag').length;
    var hashtag = $('.tag').val();
    alert(hashtag);
    alert(size);
    
    hashtag = hashtag.split("#");
    
    console.log(hashtag[1]); // 결과값 : 11
    console.log(hashtag[2]); // 결과값 : 01
    console.log(hashtag[3]); // 결과값 : 01
     */
    
	


    });
	
	function initHashTag(){
		var tmpHashTag = "${review.boTag }";
		var splitHashTagArray = tmpHashTag.split("#");
		
		splitHashTagArray.forEach(function(i, s){
			var $this = i.toString();
			if( $this != "" ){
				$('#hashtag').append("<div class='hashtag'>" + "#" + $this +"</div>" + " <input class='deleteHash' onclick='deleteHash(this)' type='button' value='X'/>");		
			}
	
		});
		
      	$('.hashtagInput').val(tmpHashTag);
	}
	
    function deleteHash(obj) {
    	var $this = obj;

		var delHashTag = $($this).prev().text();
		var hashtagInput = $('.hashtagInput').val();
		
		hashtagInput = hashtagInput.replace(delHashTag, "");
		$('.hashtagInput').val(hashtagInput);
		
		$($this).prev().remove();
		$($this).remove();
	}
	

	// 엔터시 전송되는거 막는 코드
	document.addEventListener('keydown', function(event) {
		  if (event.keyCode === 13) {
		    event.preventDefault();
		  };
		}, true);
	
	
	//클릭시 배경 색 변환
	$(function(){	
		$('#tag').click(function(){$(this).css("background","")})

		
	})
	
	// text라는 id를 가진 요소의 값
	var text = $(".textarea_input").val();
		
	  // 미입력 또는 공백 입력 방지
	  if (text.replace(/\s|　/gi, "").length == 0) {
	    alert("내용을 입력해주세요.");
	    $(".textarea_input").focus();
	  }
	
		

		
	</script>

</section>
<footer>
              <c:import url="../common/footer.jsp" />
       </footer>
		

</body>
</html>