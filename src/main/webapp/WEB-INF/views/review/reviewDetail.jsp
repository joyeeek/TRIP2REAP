<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css"
	href="resources/css/review/reviewDetail.css" />
<meta charset="UTF-8">

<link rel="shortcut icon" href="resources/images/favicon.ico"
	type="image/x-icon">
<title>전국방방곡곡 | 여행후기</title>

</head>
<body>

	<header>
		<c:import url="../common/menubar.jsp" />
	</header>


	<!-- 전체 div -->
	<div id="all_div">
		<!-- 메뉴 이름 div -->
		<div id="menu_div">
			<div id="menu_left_div">
				<i class="fas fa-camera-retro" id="menuIcon3"></i> <span id="menu">여행후기</span>
			</div>
		</div>

		<div id="detaildiv">
			<!-- 게시판 본내용(전체를 감싼다): 회색영역 -->
			<div id="review_detail_container" class="container">
				<!--head-->
				<div id="review_header_container" class="container">
					<div id="review_title_container" class="container">
						<div id="category_container" class="container">
							<b><small id="category">${review.caName }</small></b>
						</div>

						<div id="title_container" class="container">
							<h1 id="title">${review.boTitle}</h1>
						</div>

						<!-- 작성자 -->
						<div id="author_container" class="container">
							작성자&nbsp; <span id="author">${review.nickName }</span>
						</div>


						<div id="info_and_hashtag_container" class="container">
							<div id="review_info_container" class="container">
								<ul id="review_info_container_ul">
									<li>${review.regDate }</li>

									<li><i class="far fa-eye"></i> <span>${review.boCount }</span>
									</li>
								</ul>
							</div>

							<!-- 해시태그 -->
							<c:if test="${review.boTag !=null }">
								<div id="hashtag_container" class="container">
									${review.boTag }</div>
							</c:if>
						</div>
					</div>

				</div>

				<!--body-->
				<div id="review_body_container" class="container">
					<!--photo_container: 사진-->
					<!-- 썸네일 사진 -->
					<%-- c:if test="${review.changeName!=null }">
						<div id="photo_container" class="container">
							<img src="resources/buploadFiles/${review.changeName}"
								width="800px;" height="500px;">
						</div>
					</c:if> --%>
					<!-- 디테일사진 자리 -->
					<c:if test="${review.changeName!=null }">
						<div id="photo_container" class="container">
							<c:forEach var="detailImg"  items="${detailList}">
								<img src="resources/buploadFiles/${detailImg.changeName}"
									width="800px;" height="500px;">
								<br>
							</c:forEach>
						</div>
					</c:if>

					<!--review_content: 게시글 본내용-->
					<div id="review_content_container" class="container">
						<p id="review_content">${review.boContent }</p>
					</div>
				</div>


				<!--좋아요 -->
				<%--  <div id="like_container">
		                <i id="like_btn" class="fas fa-heart"></i> 
		                <span>${likeCnt}</span>
		            </div> --%>

				<div class="i-like-btn-container">
					<c:if test="${review.likeYn == 0}">
						<i class="fas fa-heart unlike"></i>
					</c:if>
					<%--이미 좋아요를 눌렀다면? --%>
					<c:if test="${review.likeYn > 0}">
						<i class="fas fa-heart like"></i>
					</c:if>
					<span id="countLike">${review.likeCnt}</span>


				</div>


				<!-- 덧글 -->
				<div id="reply_container" class="container">
					<div id="reply_title_container" class="container">
						<h2>
							댓글 <b id="rCount"></b>
						</h2>
					</div>

					<!--save_replies: 댓글을 저장하는곳.-->
					<div id="save_replies" class="container">
						<table id="rtb">
							<thead>
								<tr>
									<td colspan="4"></td>
								</tr>
							</thead>
							<tbody></tbody>
						</table>

					</div>

					<!--write_replies: 댓글을 작성하는 곳-->
					<div id="write_replies" class="container">
						<!--reply_content: 덧글 내용-->
						<textarea id="reply_content" cols="50"></textarea>

						<!--submit_reply: 덧글 작성버튼-->
						<input id="submit_reply_btn" type="button" value="댓글작성">


					</div>
				</div>
				<!--reply_container: 댓글작성란 -->

			</div>
			<!--review_detail_container(회색영역)-->

			<!-- 글작성하기 & 목록 & 맨위로 -->
			<div id="goto_container" class="container">
				<div id="write_review_container" class="container">
					<ul id="write_review_ul">
						<li><c:if test="${loginUser.nickName eq review.nickName }">
								<!--게시글 작성버튼 (회원 누구나)-->

								<input id="write_review_btn" type="button" value="게시글 작성"
									onclick="location.href='reviewInsert.bo'">
							</c:if></li>


						<c:url var="rupView" value="rupView.bo">
							<c:param name="boNo" value="${review.boNo }" />
							<c:param name="page" value="${page }" />
						</c:url>

						<c:url var="rdelete" value="rdelete.bo">
							<c:param name="boNo" value="${review.boNo }" />
						</c:url>

						<c:if test="${loginUser.nickName eq review.nickName }">
							<li>
								<!--게시글 수정버튼 (게시글 작성자만)--> <input id="update_review_btn"
								type="button" value="게시글 수정"
								onclick="location.href='${rupView}'">
							</li>
							<li>
								<!--게시글 삭제버튼 (게시글 작성자만)--> <input id="delete_review_btn"
								type="button" value="게시글 삭제" onclick="del(${review.boNo})">
							</li>
						</c:if>

					</ul>
				</div>
				<div id="goto_wrapper" class="container">
					<ul id="goto_wraper_ul">

						<li><a href="reviewList.bo"><input id="go_top_btn" type="button" value="목록"></a></li>
						<li><a href="#"> <input id="go_review_list_btn" type="button" value="맨위로"></a></li>
					</ul>
				</div>
			</div>

		</div>
		<!--detaildiv(글본론)-->
	</div>


	<script>
	function del(boNo) {
		var chk = confirm("정말 삭제하시겠습니까?");
		if (chk) {
			location.href='rdelete.bo?boNo='+boNo;
			
		}
	}


</script>


	<script>
	$(function() {
		// 댓글은 계속 갱신되어야 하므로 소스 추가
		getReplyList();
		setInterval(function() {
			getReplyList();
		}, 1000); // 1초에 1번씩 업데이트  
	});
	
	// 덧글등록- #rSubmit / #submit_reply_btn
	// 덧글내용- #reContent / #reply_content
	$('#submit_reply_btn').on('click', function() {
		var reContent = $('#reply_content').val(); //댓글 내용	      
		var boNo = ${review.boNo}; // 댓글이 달린 게시글 번호
		// console.log("댓글 내용 : " + rContent);
		// console.log("게시글 번호 : " + refBid);
	
		$.ajax({
			url : 'addReply.bo',
			data : {reContent : reContent,boNo : boNo},
			success : function(data) {
				if (data == 'success' && $('#reply_content') != null) {
					$('#reply_content').val("");
					
				}
				
				swal({
					  title: "댓글등록 성공",
					  text: "성공적으로 댓글을 등록하였습니다.",
					  icon: "success",
					  button: "확인",
				});
			},
			error : function() {
				console.log("댓글 등록 에러");
				swal({
					  title: "댓글등록 실패",
					  icon: "error",
					  button: "확인",
				});
			}
		});
	});
	
	
	// 덧글등록- #rSubmit / #submit_reply_btn
	// 덧글내용- #reContent / #reply_content
	function bindingDeleteReplyBtn() {
		$('#rtb tbody .deleteReplybtn').on('click', function() {
			var boNo = ${review.boNo}; // 댓글이 달린 게시글 번호
			var reNo = $(this).data("reno"); //댓글의 고유 번호
			

			// console.log("댓글 내용 : " + rContent);
			// console.log("게시글 번호 : " + refBid);
			swal({
			  title: "댓글 삭제 확인",
			  text: "댓글을 삭제하시겠습니까?", 
			  icon: "warning",
			  buttons: {
			  	ok: {
			  		text: "확인",
			  		value: "delete"
			  	},
			  	취소: {
			  		text: "취소",
			  		value: "cancel"
			  	}
			  },
			  dangerMode: true
			})
			.then((willDelete) => {
				  if (willDelete == "delete") {
						$.ajax({
							url : 'deleteReply.bo',
							data : {boNo : boNo,
									reNo : reNo},
							
							success : function(data) {
								if (data == 'success') {
									getReplyList();
									swal({
										  title: "댓글삭제 성공",
										  text: "성공적으로 댓글을 삭제하였습니다.",
										  icon: "success",
										  button: "확인",
									});
								}
							},
							error : function() {
								console.log("댓글 등록 에러");
								swal({
									  title: "댓글삭제 실패",
									  icon: "error",
									  button: "확인",
								});
							}
						});
				  } else {
					  
				  }
			});
		});
	}
	
	function getReplyList() {
		var boNo = ${review.boNo};
		
		$.ajax({
				url : "rList.bo",
				data : {boNo : boNo},
				success : function(data) {
					 //console.log(data);					
					
					$tableBody = $('#rtb tbody');
					$tableBody.html('');
	
					var $tr;
					var $nickName;
					var $reContent;
					var $reDate;
					var $delete
					var loginUser;
					loginUser = "${loginUser.nickName}"
					
	
					$('#rCount').text('(' + data.length + ')');
					$('#checkCount').text(+ data.length);
	
					if (data.length > 0) {
						for ( var i in data) {
							$tr = $('<tr class="review_reply">');
							$nickName = $('<td class="reply_nickname" style="width:100px;">').text(data[i].nickName);
							$reContent = $('<td>').text(data[i].reContent);
							$reDate = $('<td style="width:100px;>').text(data[i].reDate);
							
					
							
	
							//여기 코드 고쳐야될거같아요 규호씨!
							//바로 밑에 줄에 있는 코드는 주석처리했어요!! del(${review.boNo}) 는 "댓글삭제"가 아니라 "게시글 삭제"인거같아요!
						    $delete = $('<td>'+'<input type="button" data-reno="'+data[i].reNo+'" class="deleteReplybtn" value="삭제")" />'+'</td>')
							
							
							$tr.append($nickName);
							$tr.append($reContent);
							$tr.append($reDate);
							
						
							if(loginUser == data[i].nickName){
					    	$tr.append($delete);
							}
					    	
					    	
				
							$tableBody.append($tr);
						}
						bindingDeleteReplyBtn();
					} else {
						$tr = $('<tr>');
						$rContent = $('<td colspan="4">').text('등록된 댓글이 없습니다.');
	
						$tr.append($reContent);
						$tableBody.append($tr);
					}
				}
			});
	}
	
	//heart -btn
	$(function(){
		$(document).on('click', '.fa-heart' , function(e){
			
			
			let targetHeartBtn= $(this);
			let loginUserObj='${loginUser}';
			//alert(targetHeartBtn);
			console.log(targetHeartBtn);
			
			let boNo=${review.boNo};	
			
			console.log('어머 좋아요를 누르셨군요?');

			if(loginUserObj){
				//로그인 상태		
				let tmp=targetHeartBtn.hasClass('unlike');
				console.log(tmp);
				//alert(tmp);
				
				//unlike 라는 이름의 클래스를 가지고있다. : unlike->클릭->like
				if( targetHeartBtn.hasClass('unlike') ){
					$(this).removeClass('unlike');
					$(this).addClass('like');
					//alert(tmp);
					

					$.ajax({
						url:'updateLikeReview.bo',
						data:{
							boNo:boNo
						},
						type:'post',
						dataType:"text",
						success:function(result){
							//좋아요누르면, 해당아이디에 좋아요표시를 한다.
							var likeCnt = result;
							$(this).removeClass('unlike');
							$(this).addClass('like');
							$('#countLike').html(likeCnt);

							//좋아요 반영되었습니다!
							swal({
								  title: "좋아요 반영 성공",
								  text: "성공적으로 좋아요를 반영했습니다.",
								  icon: "success",
								  button: "확인",
							});
						},error:function(){
							swal({
								  title: "좋아요 등록 실패",
								  icon: "error",
								  button: "확인",
							});
						}
					});


				}else if(targetHeartBtn.hasClass('like')){//like->클릭->unlike
					$(this).removeClass('like');
					$(this).addClass('unlike');
					//alert(tmp);

					$.ajax({
						url:'updateCancelLikeReview.bo',
						data:{
							boNo:boNo
						},
						type:'post',
						success:function(result){
							var likeCnt = result;
							//좋아요누르면, 해당아이디에 좋아요표시를 한다.
							$(this).removeClass('unlike');
							$(this).addClass('like');
							$('#countLike').html(likeCnt);

							swal({
								  title: "좋아요 해제 성공!",
								  text: "성공적으로 좋아요 해제를 반영했습니다.",
								  icon: "success",
								  button: "확인",
							});
						},error:function(){
							swal({
								  title: "좋아요 해제 반영 실패",
								  icon: "error",
								  button: "확인",
							});
						}
						
					});


				}


			}else{
				//로그아웃상태
				console.log('로그아웃 상태입니다.');
				swal({
					  title: "좋아요 반영 실패",
					  text: "로그인을 하신 후에 이용해주세요.",
					  icon: "error",
					  button: "확인",
				});
			}

		});
	});
</script>

<div id="footerSpaces"></div>
        <footer>
              <c:import url="../common/footer.jsp" />
       </footer>

</body>
</html>