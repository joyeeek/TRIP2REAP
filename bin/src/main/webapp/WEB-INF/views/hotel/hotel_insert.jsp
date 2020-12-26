<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<!-- css -->
<link rel="stylesheet" href="resources/css/hotel/hotel_insert.css">


<title>호텔 등록하기</title>
</head>

<body>


	<c:import url="../common/menubar.jsp" />

	<!--(common all pages related with hotel) main-container -->
	<div id="main-container">

		<!-- (common all pages related with hotel) title-container -->
		<div id="title-container">

			<img id="hotel-icon" src="resources/images/hotelIcon.png"> 
			<span id="title-name">호텔 예약</span>
		</div>

		<div>
			<form action="hotelInsert.ho" method="post"
				enctype="multipart/form-data">
				<div id="sub-title-container">
					<h1>호텔 등록</h1>
				</div>

				<!-- 호텔 이름 입력 1-->
				<div class="insert-common-container">
					<div class="hotel-insert-content-container">
						<p style="color: #913716;">* 는 필수 입력사항 입니다!</p>
					</div>
					<div class="hotel-insert-content-container">
						<input id="hotel_name" name="hotel_name"  autocomplete="off"
							placeholder="* 호텔이름을 입력해주세요" type="text">
					</div>
				</div>

				<!--호텔 메인 썸네일 이미지 등록2 -->
				<div class="insert-common-container">
					<div class="hotel-insert-subtitle-container">
						<h3>* 호텔 메인 이미지 등록</h3>
					</div>
					<div class="hotel-insert-content-container">
						<input type="file" name="thumbnail_img" id="thumbnail_img" accept="image/*" /> 
						<label id="thumbnail_img_label" for="thumbnail_img">썸네일 이미지 찾아보기</label> 
						<span class="img_upload_status_info" id="thumbnail_img_name">썸네일 이미지를 업로드 해주세요!</span>
					</div>
					<script>
						$('#thumbnail_img').on('change',function(){
							let $thumbnailName= $(this).get(0).files;
							$('#thumbnail_img_name').text($thumbnailName[0]['name']);
							$('#thumbnail_img_name').css('color', '#515357');
						});
					</script>

				</div>

				<!-- 호텔 디테일 이미지 등록 3-->
				<div class="insert-common-container">
					<div class="hotel-insert-subtitle-container">
						<h3>&nbsp;&nbsp;호텔 디테일 이미지 등록</h3>
					</div>
					<div class="hotel-insert-content-container">
						<input type="file" name="detail_img" id="detail_img" accept="image/*" multiple /> 
						<label id="detail_img_label" for="detail_img">디테일 이미지 찾아보기</label> 
						
						<span class="img_upload_status_info" id="detail_img_name"> 
							<span id="uploaded_img_cnt">0</span>개의 사진을 업로드 했습니다.
						</span>

						<div id="hotel-detail-images-container">
							<div id="hotel-detail-images-head-container">
								<div id="checkbox-title">선택</div>
								<div id="detail-file-name-title">파일 명</div>
								<div id="detail-control-btns-container">
									<ul id="detail-control-btns-wrapper-ul">
										<li class="detail-control-btn-li">
											<input type="button" class="detail-control-btn" id="select-all-detail-img-btn" value="모두선택"/>
										</li>
										
										<li class="detail-control-btn-li">
											<input type="button" class="detail-control-btn" id="remove-select-detail-img-btn" value="선택한 이미지 삭제"/>
										</li>
									</ul>
								</div>
							</div> <%--hotel-detail-images-head-container --%>
							
							<div id="hotel-detail-images-body-container">
								<ul class="uploaded-img-names-ul">						
								</ul>
							</div> <%--hotel-detail-images-body-container --%>
						</div> <%--hotel-detail-images-container --%>
					</div><%-- hotel-insert-content-container --%>
					
					<script>
					$(function(){
						//디테일이미지 컨테이너
						let detailImgContainer= $('#hotel-detail-images-container');
						
						//전체 업로드된 이미지 리스트 
						let totalUploadImgs=[];
						
						
						// 이미지 아이디 정리
						function reOrderingUploadedImgs(){
							// 업로드한 이미지 정보 갱신하기
							if(totalUploadImgs.length>0){
								// 전체 업로드한 이미지 개수가 최소 1개이상이면
								detailImgContainer.css('display', 'flex');
								
								//비우고 다시 넣는다.
								$('ul.uploaded-img-names-ul').empty();
								
								// 방금 등록한 이미지 개수만큼 ul에 넣는다.
								for(var i=0; i<totalUploadImgs.length; i++){
									let $uploaded_img_info='<li class="upload-img-name-li"><div class="upload-image-checkbox-wrapper">';
									$uploaded_img_info+='<input id="upload_img_'+i+'" class="upload-image-checkbox" type="checkbox" name="select_detail_img"/>';
									$uploaded_img_info+='<label for="upload_img_'+i+'" class="upload-image-label"></label></div>';
									$uploaded_img_info+='<div class="upload-image-filename-wrapper">'+totalUploadImgs[i]['name']+'</div></li>';
									$('ul.uploaded-img-names-ul').append($uploaded_img_info);
								}
							}else{
								detailImgContainer.css('display','none');
							}
							
						}
						
						
						// 디테일 이미지 찾아보기 버튼 클릭했을 때 수행하는 함수.
						$('#detail_img').change(function(){
			
							let nowUploadImgs= $(this).get(0).files;  //현재 업로드한 이미지 파일
							let nowUploadImgCnt=nowUploadImgs.length; //현재 업로드한 이미지 개수
							
							//리스트에 등록한 이미지를 넣는다.
							for(var i=0; i<nowUploadImgCnt; i++){
								totalUploadImgs.push(nowUploadImgs[i]);
							}
							
							//현재 등록된 이미지개수 글자로 나타내기
							$('span#uploaded_img_cnt').text(totalUploadImgs.length);
							reOrderingUploadedImgs();
						});
						
						
						
						//모두 선택을 클릭한다.
						$('#select-all-detail-img-btn').on('click',function(e){
							let checkBoxes=$('input[name="select_detail_img"].upload-image-checkbox');
							
							//모두 체크됨 => isAllSelected=true
							//일부 체크됨 => isAllSelected=false
							//모두 체크안됨 => isAllSelected=false
							let checkedBoxCnt=$('input[name="select_detail_img"].upload-image-checkbox:checked').length;
							
							if(checkBoxes.length == checkedBoxCnt){
								//모두체크됨 => 버튼누른뒤에는 모두 체크해제.
								checkBoxes.each(function(){
									this.checked=false;
								});
							}else{
								//모두 체크상태는 아님.
								checkBoxes.each(function(){
									if(!this.checked){ //체크상태아닌것들은 체크를 한다.
										this.checked=true;
									}
								});
							}
						});
						
						
						//선택된 이미지를 삭제한다.(아직 )
						$('#remove-select-detail-img-btn').click(function(){
							//선택된 체크박스들을 구한다.
							let selectedCheckBoxes= $('input[name="select_detail_img"].upload-image-checkbox:checked');

							//선택된 체크박스가 totalUploadImgs의 몇번째 인덱스에 위치하고있는지를 구한다.
							
							if(selectedCheckBoxes.length>0){
								//삭제 대상이 1개이상이라면 ..
								
								//삭제대상 인덱스를 구한다
								let removeIdxList= [];
								
								//total이미지 안에 있는 selectedCheckBoxes를 삭제한다. => splice를 이용하여 삭제한다.
								selectedCheckBoxes.each(function(e){
									//삭제대상에 해당하는 인덱스번호를 구한다.
									
									//this와 가장 가까운 li.(삭제대상) 을 구한다.
									$removeTargetLi=$(this).closest('li.upload-img-name-li');
									$removeTargetLi.remove();
									
									//this랑 가장가까운 checkbox 인덱스를 구해야한다. -> 마지막 id번호
									$removeTargetFile= $(this).closest('.upload-image-checkbox').prop('id');
									$removeTargetFileSplited= $removeTargetFile.split('_');
									$removeTargetFileIdx= Number($removeTargetFileSplited[2]);
									
									//해당파일 인덱스번호는 removeFileIdxList에 추가한다.
									removeIdxList.push($removeTargetFileIdx);
									
								});
								
								// 삭제파일에 해당하는 인덱스번호를 제외한다.
								let tmp=[];
								
								let flag;
								for(i=0; i<totalUploadImgs.length; i++){
									flag=false;
									for(j=0; j<removeIdxList.length; j++){
										if(i==removeIdxList[j]){
											flag=true;
											break;
										}
									}
									if(!flag){
										tmp.push(totalUploadImgs[i]);
									}
								}
																
								totalUploadImgs=tmp;
								
								
								//삭제가 끝나면, 업로드된 이미지 개수도 다시 정리한다.
								$('#uploaded_img_cnt').text(totalUploadImgs.length);
								
								//각각 삭제가끝나면 다시 id를정리를 해야함.
								reOrderingUploadedImgs();
							}
						});
					});
					
					</script>
				</div>

				<!--호텔 도로명 주소 4 -->
				<div class="insert-common-container">
					<div class="hotel-insert-subtitle-container">
						<h3>* 호텔 도로명 주소</h3>
					</div>
					<div id="search_hotel_addr_container">
						<div class="search_hotel_addr_wrapper">
							<input id="search_hotel_addr_btn" type="button" value="주소 찾기" onclick="exeDaumPostcode()">
							<input type="text" readonly placeholder="호텔 도로명 주소를 입력해주세요!" autocomplete="off"
							name="hotel_address" id="hotel_address">
							
						</div>
						
						<div class="map_wrapper">
							<div id="map" style="width:300px;height:300px; margin-top:10px;display:none"></div>
						</div>
						
						<%--도로명 주소 API --%>
						<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
						<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=38a6847af6f758230564da5fe29aa9fc&libraries=services"></script>
						<script>
							var mapContainer= document.getElementById('map');
							mapOption={
									center: new daum.maps.LatLng(37.537187, 127.005476),
									map: map
							};
							
							// 지도를 미리 생성 
							var map= new daum.maps.Map(mapContainer, mapOption);
							
							//주소-좌표 변환 객체를 생성 
							var geocoder= new daum.maps.services.Geocoder();
							
							//마커를 미리 생성
							var marker= new daum.maps.Marker({
								position: new daum.maps.LatLng(37.537187, 127.005476),
								map: map
							});
							
							
							function exeDaumPostcode(){
								new daum.Postcode({
									oncomplete: function(data){
										var addr= data.address; // 최종 주소 변수
										
										// 주소 정보를 해당 필드에 넣는다
										document.getElementById("hotel_address").value= addr;
										
										// 주소로 상세 정보를 검색
										geocoder.addressSearch(data.address, function(results, status){
											//정상적으로 검색이 완료되면
											if(status===daum.maps.services.Status.OK){
												//첫번째 결과값을 활용.
												var result=results[0];
												
												// 해당 주소에 대한 좌표를 받는다
												var coords= new daum.maps.LatLng(result.y, result.x);
												
												//지도를 보여준다.
												mapContainer.style.display ="block";
												map.relayout();
												
												//지도의 중심을 변경한다.
												map.setCenter(coords);
												
												//마커의 결과값으로 받은 위치로 옮긴다.
												marker.setPosition(coords);
												
											}
										});
									}
									
								}).open();	
							}
						</script>
					</div>
					
				</div>

				<!-- 호텔 객실 정보 입력 5-->
				<div class="insert-common-container">
					<div>
						<h3>* 호텔 객실 정보</h3>
					</div>

					<div class="insert-hotel-info-wrapper" id="insert_hotel_info_list">

						<!-- 호텔객실 정보 입력창 1 (disable delete)-->
						<div class="one-room-info-insert">
							<div class="room_btn_remote_controller_wrapper">
								<div class="insert_room_name">
									<input type="text" class="room_name" placeholder="객실 이름 입력"  autocomplete="off"
										name="room_name">
								</div>

								<div>
									<ul class="room_btn_remote_controller">
										<li class="hotel-info-remove"><i class="fas fa-times"></i></li>
									</ul>
								</div>
							</div>

							<div class="insert_hotel_details">
								<div class="insert_room_kinds">
									<span class="room_kind_label">등록 객실 종류</span> 
									<select>
										<option value="">객실 종류 선택</option>
										<option value="싱글룸">싱글룸</option>
										<option value="더블룸">더블룸</option>
										<option value="트윈룸">트윈룸</option>
										<option value="스탠다드룸">스탠다드룸</option>
										<option value="패밀리룸">패밀리룸</option>
										<option value="디럭스룸">디럭스룸</option>
										<option value="스위트룸">스위트룸</option>
										<option value="스튜디오룸">스튜디오룸</option>
										<option value="트리플룸">트리플룸</option>
										<option value="온돌룸">온돌룸</option>
										<option value="슈페리어룸">슈페리어룸</option>
										<option value="이그제큐티브룸">이그제큐티브룸</option>
										<option value="커넥팅룸">커넥팅룸</option>
										<option value="프리미어룸">프리미어룸</option>
										<option value="이코노미룸">이코노미룸</option>
									</select>
								</div>
								
								
								<div class="insert_room_price_perday">
									<span class="room_price_label">1박 이용 가격</span>
									<input type="text" class="price_perday" placeholder="1박 이용가격(숫자)" name="price_per_day"  autocomplete="off">
								</div>
							</div>
						</div>

					

					</div> <%-- id="insert_hotel_info_list" --%>
					<div class="insert-hotel-btn-container">
							<i class="fas fa-plus" id="add_room_btn"></i>
					</div>
					
					<script>
					$(function(){
						$('#add_room_btn').on('click',function(){
							let $hotelInfoContainer= $('#insert_hotel_info_list');
							let $oneHotelInfo=`<div class="one-room-info-insert">
					<div class="room_btn_remote_controller_wrapper">
						<div class="insert_room_name">
							<input type="text" class="room_name" placeholder="객실 이름 입력" autocomplete="off"
								name="room_name">
						</div>

						<div>
							<ul class="room_btn_remote_controller">
								<li class="hotel-info-remove"><i class="fas fa-times"></i></li>
							</ul>
						</div>
					</div>

					<div class="insert_hotel_details">
						<div class="insert_room_kinds">
							<span class="room_kind_label">등록 객실 종류</span> 
							<select>
								<option value="">객실 종류 선택</option>
								<option value="싱글룸">싱글룸</option>
								<option value="더블룸">더블룸</option>
								<option value="트윈룸">트윈룸</option>
								<option value="스탠다드룸">스탠다드룸</option>
								<option value="패밀리룸">패밀리룸</option>
								<option value="디럭스룸">디럭스룸</option>
								<option value="스위트룸">스위트룸</option>
								<option value="스튜디오룸">스튜디오룸</option>
								<option value="트리플룸">트리플룸</option>
								<option value="온돌룸">온돌룸</option>
								<option value="슈페리어룸">슈페리어룸</option>
								<option value="이그제큐티브룸">이그제큐티브룸</option>
								<option value="커넥팅룸">커넥팅룸</option>
								<option value="프리미어룸">프리미어룸</option>
								<option value="이코노미룸">이코노미룸</option>
							</select>
						</div>
						
						
						<div class="insert_room_price_perday">
							<span class="room_price_label">1박 이용 가격</span>
							<input type="text" class="price_perday" placeholder="1박 이용가격(숫자)" name="price_per_day" autocomplete="off">
						</div>
					</div>
				</div>`;
								
							$hotelInfoContainer.append($oneHotelInfo);
							
						});
						
						

						$(document).on('click', '.hotel-info-remove',function(e){
							//(-)버튼: 호텔 객실정보 삭제 버튼 
							// 클릭한 (-) 버튼에 해당하는 호텔객실 정보 1개를 지운다.
							
							let currentRoomInfo= $(e.currentTarget).closest('.one-room-info-insert');
							console.log(currentRoomInfo);
							
							//삭제 확인창 
							swal({
							  title: "정말로 삭제하시겠습니까?",
							  text: "작성한 내용은 복구할 수 없습니다. 정말로 삭제하시겠습니까?",
							  icon: "warning",
							  buttons: ['취소','삭제'],
							  dangerMode: true,
							})
							.then((willDelete) => {
							  if (willDelete) {
								//삭제버튼에 해당하는 호텔정보를 지운다.
								currentRoomInfo.remove();
							    
							  } else {
								    swal({
								    	text: "삭제를 취소했습니다.",
								    	button:'확인'
								    });
							  }
							});
						});
						
						//객실가격입력 자바스크립트
						/* 
						$('input.price_perday').on({
							'keyup': function(){
								$(this).val($(this).val().replace(/[^0-9]/g,''));
							},
							'keydown':function(){
								$(this).val($(this).val().replace(/[^0-9]/g,''));
							},
							'keypress':function(){
								$(this).val($(this).val().replace(/[^0-9]/g,''));
							}
						});
						 */
						
						$(document).on('keypress','input.price_perday',function(e){
							$(this).val($(this).val().replace(/[^0-9]/g,''));
						});
						
						$(document).on('keyup', 'input.price_perday', function(e){
							$(this).val($(this).val().replace(/[^0-9]/g,''));
						});
						
						$(document).on('keydown', 'input.price_perday', function(e){
							$(this).val($(this).val().replace(/[^0-9]/g,''));
						}); 
						
					});
						
					</script>
				</div>

				<!-- 호텔 전화번호 입력 6-->
				<div class="insert-common-container">
					<div>
						<h3>* 호텔 전화번호</h3>
					</div>
					<div class="insert-hotel-call-number-wrapper">

						<!-- 지역번호 -->
						<div class="phone-call-wrapper">
							<select class="phone-call" name="local_call_number"
								id="local_call_number">
								<option value="">지역번호 선택</option>
								<option value="02">02</option>
								<option value="031">031</option>
								<option value="032">032</option>
								<option value="033">033</option>
								<option value="041">041</option>
								<option value="042">042</option>
								<option value="043">043</option>
								<option value="044">044</option>
								<option value="051">051</option>
								<option value="052">052</option>
								<option value="053">053</option>
								<option value="054">054</option>
								<option value="055">055</option>
								<option value="061">061</option>
								<option value="062">062</option>
								<option value="063">063</option>
								<option value="064">064</option>
								<option value="010">010</option>
							</select>
						</div>

						<!-- 나머지 번호 입력 -->
						<div class="phone-call-wrapper">
							<input class="phone-call" type="tel" name="real_call_number" autocomplete="off"
								id="real_call_number">
						</div>
						<input type="hidden" name="total_phone_number" id="total_phone_number"></input>

						<%--
							<div>
								<small id="phone-call-alert" style="visibility: hidden;">숫자로
									입력해주세요!(alert-message)</small>
							</div> 
						--%>
						<script>
						$(function(){
							// 번호가 아닌 다른 문자를 입력못하게 한다.
							//^ : 문자열의 앞을 구분 
							//$ : 문자열의 뒤를 구분 
							//* : 바로앞의 문자가 0개이상 
							
							// keyup: 키보드에서 손을 뗐을 때 발생하는 이벤트
							// keydown: 키보드를 눌렀을 때 실행. 한개 키를 누를때 실행
							// keypress: 키보드를 누르고있을 때 계속 실행됨.
							
							// 숫자와 백스페이스만 가능.
							let regNumber= /^[0-9]*$/;
							
							//전체전화번호
							let totalPhoneNumber='';
							
							function numberFormatterFunc(localNumber, realNumber){
								//console.log('지역번호: '+localNumber);
								//console.log('실제전화번호: '+ realNumber);
								
								totalPhoneNumber= localNumber+realNumber;
								//console.log('초기 전체전화번호: '+totalPhoneNumber);
								
								if(localNumber.length==2){
									//지역번호가 2자리 (서울 )
									$('#real_call_number').val(realNumber.replace(/(\d{4})(\d{4})/,'$1-$2'));
									
									//전체 전화번호 
									totalPhoneNumber=totalPhoneNumber.replace( /(\d{2})(\d{4})(\d{4})/ , '$1-$2-$3');
									
								}else{ //localNumber.length==3
									
									if(localNumber=='010'){
										// 휴대폰번호 (010)
										$('#real_call_number').val(realNumber.replace(/(\d{4})(\d{4})/,'$1-$2'));
										
										//전체 전화번호 
										totalPhoneNumber=totalPhoneNumber.replace( /(\d{3})(\d{4})(\d{4})/ , '$1-$2-$3');
										
									}else{
										//서울을 제외한 지역번호
										$('#real_call_number').val(realNumber.replace(/(\d{3})(\d{4})/,'$1-$2'));
										
										//전체 전화번호 
										totalPhoneNumber=totalPhoneNumber.replace( /(\d{3})(\d{3})(\d{4})/ , '$1-$2-$3');
									}
								}
								
								console.log('전체전화번호: '+ totalPhoneNumber);
								$('#total_phone_number').val(totalPhoneNumber);
							}
							
							$('#real_call_number').on({
								'keyup':function(){
									// 키보드에서 손을 뗐을 때 
									// 숫자가 아닌값들은 빈값으로 변경한다.
									$(this).val($(this).val().replace(/[^0-9]/g,''));
									
									//정규표현식을 이용하여 숫자를 바꾼다.
									//지역번호를 구한다.
									let localNumber=$('#local_call_number option:selected').text();
									numberFormatterFunc(localNumber, $(this).val());
								},
								'keydown': function(){
									// 키를 누를때마다 한번 발생 
									// 숫자가 아닌값들은 빈값으로 변경한다.
									$(this).val($(this).val().replace(/[^0-9]/g,''));
								},
								'keypress':function(){
									// 숫자가 아닌값들은 빈값으로 변경한다.
									$(this).val($(this).val().replace(/[^0-9]/g,''));
								}
							});
						});
						</script>
					</div>
				</div>

				<!-- 호텔 운영시간 7-->
				<div class="insert-common-container">
					<div>
						<h3>* 호텔 운영시간</h3>
					</div>

					<div class="hotel-operation-time-container">
						<div class="setting-operation-time">
							<span>운영시작 시간</span>

							<!-- 호텔 오픈 시각 선택 -->
							<select name="hotel_open_time" id="hotel_open_time">
								<option value="">운영시작 시간선택</option>
								<option value="0">0</option>
								<option value="1">1</option>
								<option value="2">2</option>
								<option value="3">3</option>
								<option value="4">4</option>
								<option value="5">5</option>
								<option value="6">6</option>
								<option value="7">7</option>
								<option value="8">8</option>
								<option value="9">9</option>
								<option value="10">10</option>
								<option value="11">11</option>
								<option value="12">12</option>
								<option value="13">13</option>
								<option value="14">14</option>
								<option value="15">15</option>
								<option value="16">16</option>
								<option value="17">17</option>
								<option value="18">18</option>
								<option value="19">19</option>
								<option value="20">20</option>
								<option value="21">22</option>
								<option value="23">23</option>
								<option value="24">24</option>
							</select>
						</div>

						<div class="setting-operation-time">
							<span>운영종료 시간</span>

							<!-- 호텔 종료시간 선택 -->
							<select name="hotel_close_time" id="hotel_close_time">
								<option value="">운영종료 시간선택</option>
								<option value="0">0</option>
								<option value="1">1</option>
								<option value="2">2</option>
								<option value="3">3</option>
								<option value="4">4</option>
								<option value="5">5</option>
								<option value="6">6</option>
								<option value="7">7</option>
								<option value="8">8</option>
								<option value="9">9</option>
								<option value="10">10</option>
								<option value="11">11</option>
								<option value="12">12</option>
								<option value="13">13</option>
								<option value="14">14</option>
								<option value="15">15</option>
								<option value="16">16</option>
								<option value="17">17</option>
								<option value="18">18</option>
								<option value="19">19</option>
								<option value="20">20</option>
								<option value="21">22</option>
								<option value="23">23</option>
								<option value="24">24</option>
							</select>
						</div>

					</div>
				</div>

				<!-- 호텔 옵션 선택 8-->
				<div class="insert-common-container">
					<div>
						<h3>* 호텔 옵션 선택</h3>
						<div class="hotel_option_table">
							<!-- 테이블1 -->
							<table>
								<tr>
									<td>선택</td>
									<td class="table_option_name">옵션명</td>
								</tr>

								<tr>
									<td colspan=2>
										<input type="checkbox"  class="option-checkboxes" name="hotel_option" value="와이파이" id="option1"/>
										<label class="fake-checkbox-label" for="option1">와이파이</label>
									</td>
								</tr>

								<tr>
									<td colspan=2>
										<input type="checkbox"  class="option-checkboxes"  name="hotel_option" value="조식" id="option2"/>
										<label class="fake-checkbox-label" for="option2">조식</label>
									</td>
								</tr>

								<tr>
									
									<td colspan=2>
										<input type="checkbox" class="option-checkboxes" name="hotel_option" value="레스토랑" id="option3"/>
										<label class="fake-checkbox-label" for="option3">레스토랑</label>
									</td>
								</tr>

								<tr>
									<td colspan=2>
										<input id="option4" type="checkbox" class="option-checkboxes" name="hotel_option" value="세탁"/>
										<label class="fake-checkbox-label" for="option4">세탁</label>
									</td>
								</tr>

								<tr>
									<td colspan=2>
										<input id="option5" class="option-checkboxes" type="checkbox" name="hotel_option" value="24시간 리셉션" />
										<label class="fake-checkbox-label" for="option5">24시간 리셉션</label>
									</td>
								</tr>

								<tr>
									<td colspan=2>
										<input id="option6" class="option-checkboxes" type="checkbox" name="hotel_option" value="수하물 보관" />
										<label class="fake-checkbox-label" for="option6">수하물 보관</label>
									</td>
								</tr>

								<tr>
									<td colspan=2>
										<input id="option7" class="option-checkboxes" type="checkbox" name="hotel_option" value="수영장" />
										<label class="fake-checkbox-label" for="option7">수영장</label>
									</td>
								</tr>

								<tr>
									<td colspan=2>
										<input id="option8" class="option-checkboxes" type="checkbox" name="hotel_option" value="피트니스" />
										<label class="fake-checkbox-label" for="option8">피트니스</label>	
									</td>
										
								</tr>

								<tr>
									<td colspan=2>
										<input id="option9" class="option-checkboxes" type="checkbox" name="hotel_option" value="스파/사우나" />
										<label class="fake-checkbox-label" for="option9">스파 &amp; 사우나</label>
									</td>
								</tr>

								<tr>
									<td colspan=2>
										<input id="option10" class="option-checkboxes" type="checkbox" name="hotel_option" value="미용실" />
										<label class="fake-checkbox-label" for="option10">미용실</label>
									</td>
								</tr>
							</table>


							<!-- 테이블2 -->
							<table>
								<tr>
									<td>선택</td>
									<td class="table_option_name">옵션명</td>
								</tr>

								<tr>
									<td colspan=2>
										<input id="option11" type="checkbox" class="option-checkboxes" name="hotel_option" value="카페" />
										<label class="fake-checkbox-label" for="option11">카페</label>
									</td>
								</tr>

								<tr>
									<td colspan=2>
										<input id="option12" type="checkbox" class="option-checkboxes" name="hotel_option" value="비즈니스 시설" />
										<label class="fake-checkbox-label" for="option12">비즈니스 시설</label>
									</td>
								</tr>

								<tr>
									<td colspan=2>
										<input id="option13" type="checkbox" class="option-checkboxes" name="hotel_option" value="주차" />
										<label class="fake-checkbox-label" for="option13">주차</label>
									</td>
								</tr>

								<tr>
									<td colspan=2>
										<input id="option14" type="checkbox" class="option-checkboxes" name="hotel_option" value="공항셔틀" />
										<label class="fake-checkbox-label" for="option14">공항셔틀</label>
									</td>
								</tr>

								<tr>
									<td colspan=2>
										<input id="option15" type="checkbox" class="option-checkboxes" name="hotel_option" value="장애인 편의시설" />
										<label class="fake-checkbox-label" for="option15">장애인 편의시설</label>
									</td>
								</tr>

								<tr>
									<td colspan=2>
										<input id="option16" type="checkbox" class="option-checkboxes" name="hotel_option" value="바/라운지" />
										<label class="fake-checkbox-label" for="option16">바 &amp; 라운지</label>	
									</td>
								</tr>


								<tr>
									<td colspan=2>
										<input id="option17" type="checkbox" class="option-checkboxes" name="hotel_option" value="주방" />
										<label class="fake-checkbox-label" for="option17">주방</label>
									</td>
								</tr>

								<tr>
									<td colspan=2>
										<input id="option18" type="checkbox" class="option-checkboxes" name="hotel_option" value="아이돌봄 서비스" />
										<label class="fake-checkbox-label" for="option18">아이돌봄 서비스</label>
									</td>
								</tr>

								<tr>
									<td colspan=2>
										<input id="option19" type="checkbox" class="option-checkboxes" name="hotel_option" value="룸서비스" />
										<label class="fake-checkbox-label" for="option19">룸서비스</label>
									</td>
								</tr>

								<tr>
									<td colspan=2>
										<input id="option20" type="checkbox" class="option-checkboxes" name="hotel_option" value="애완동물 동반" />
										<label class="fake-checkbox-label" for="option20">애완동물 동반</label>
									</td>
								</tr>
							</table>
						</div>
					</div>
				</div>

				<!-- 호텔 사이트 9-->
				<div class="insert-common-container">
					<div>
						<h3>&nbsp;&nbsp;호텔 사이트</h3>
						<input name="hotel_url" id="hotel_url" type="url"  autocomplete="off"
							placeholder="https://">
					</div>
				</div>

				<!-- 호텔 해시태그 입력 10 -->
				<div class="insert-common-container">
					<div class="insert-hashtag-guide-wrapper">
						<h3>&nbsp;&nbsp;해시태그 입력</h3>
						<ul>
							<li><i class="fas fa-hashtag"></i>해시태그 입력
								예시&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								: <b>#호텔</b></li>
							<li><i class="fas fa-hashtag"></i>해시태그 입력 최대글자 수 : <b>10글자</b></li>
							<li><i class="fas fa-hashtag"></i>해시태그 최대
								입력개수&nbsp;&nbsp;&nbsp;&nbsp; : <b>3개</b></li>
						</ul>
					</div>

					<div class="insert-hashtag-wrapper">
						<input type="text" id="input-hashtag" placeholder="해시태그를 입력해주세요." autocomplete="off">
						<input type="button" id="input-hashtag-btn" value="해시태그 등록"/>
					</div>

					<!-- 등록된 해시태그들을 모으는 곳. -->
					<div class="saved-hashtags-wrapper">
						<%--해시태그가 존재하지 않으면 --%>
						<p id="no-hashtag"><small>해시태그가 존재하지 않습니다!</small></p>
						
						<%-- 해시태그가 존재한다면  --%>
						<ul id="saved-hashtags">
						</ul>
					</div>
					<script>
					
						$(function(){
							
							//해시태그가 비어있는지 확인함.
							function isEmptyHashTagsMsg(){
								//해시태그 저장리스트
								let savedHashTags = $('#saved-hashtags');
								
								// 저장된 해시태그들
								let $hashTags= savedHashTags.children('li');	
								
								if($hashTags.length==0){
									// 저장된 해시태그가 존재하지 않는다면 (0개 )
									// 해시태그 존재하지 않는다는 문구를 띄운다.
									$('#no-hashtag').css('display', 'block');
								}else{
									//저장된 해시태그가 존재한다면(1개 이상 )
									// 해시태그가 존재하지 않는다는 문구를 안보이게 한다.
									$('#no-hashtag').css('display', 'none');
								}
							}
							
							// 중복된 해시태그를 찾는다.
							function isDuplicateHashTags(targetHashTag){
								targetHashTag= '#'+targetHashTag;
								let $hashTags= $('#saved-hashtags').children('li').children('.hashtag-content');	
								console.log($hashTags);
								
								//이미 등록된 해시태그 들을 콘솔에 출력한다.
								for(var i=0; i<$hashTags.length; i++){
									let now= $hashTags[i].innerText;
									if(targetHashTag==now)
										return true;
								}
								//이미 등록된 해시태그와 중복된다면  => true를 리턴
								//중복되지 않은 해시태그라면 false를 리턴
								return false;
							}
							
							
							// 해시태그 등록 버튼 클릭시  발생하는 함수- insert hashtag function
							$('#input-hashtag-btn').on('click', function(){
								//해시태그 저장리스트
								let savedHashTags = $('#saved-hashtags');
								
								// 저장된 해시태그들 
								let $hashTags= savedHashTags.children('li');	
								
								//입력받은 해시태그
								let inputHashTag = $('#input-hashtag').val();
								
								//단순 공백문자를 입력할 수 있기 때문에 공백을 제거한다.
								inputHashTag= inputHashTag.trim();
								
								if(inputHashTag.length==0){
									// 입력한 글자수가 0자 
									swal({
										  title: "해시태그 등록 실패",
										  text: '해시태그 내용을 입력해주세요!',
										  icon: 'error',
										  button: "확인",
									});
								}else{
									// 입력한 글자수가 최소 1자 이상
									//입력한 해시태그가 이미 등록한 해시태그와 겹친다면?
									if(isDuplicateHashTags(inputHashTag)){
										swal({
											  title: "해시태그 등록 실패",
											  text: '이미 등록된 해시태그입니다!',
											  icon: 'error',
											  button: "확인",
										});
										
									}else{
										//입력한 해시태그의 글자수가 10자를 넘는지 확인
										if(inputHashTag.length>10){
											swal({
												  title: "해시태그 등록 실패",
												  text: '해시태그 등록 가능한 글자수는 최대 10자입니다!',
												  icon: 'error',
												  button: "확인",
											});
										}else{
											
											if($hashTags.length<3){
												//저장된 해시태그의 개수가 3개미만 => 추가
												$hashtag_content='<li><span class="hashtag-content"> #'+inputHashTag+'</span><span><i class="remove-hashtag-btn fas fa-times"></i></span></li>'
												savedHashTags.append($hashtag_content);
											}else{
												//저장된 해시태그의 개수가 3개 이상이라면=> 경고창 
												swal({
												  title: "해시태그 등록 실패",
												  text: '이미 최대 3개 해시태그를 등록했습니다!',
												  icon: 'error',
												  button: "확인",
												});
											}
										}
									}
								}
								//등록이 성공/실패 여부 상관없이  해시태그 입력값을 일단 비워둔다.
								 $('#input-hashtag').val('');
								isEmptyHashTagsMsg();
							});
							
							
							
							// 해시태그 삭제 버튼을 클릭했을때 실행하는 함수. => 리로드를 함.
							$(document).on('click', '.remove-hashtag-btn' , function(e){
								// 가장 가까운 해시태그를 지운다.
								$(e.currentTarget).closest('#saved-hashtags li').remove();
								
								//해시태그 삭제처리후, 해시태그가 없다는 메시지를 띄워야할지 말아야할지 결정
								isEmptyHashTagsMsg();
							});
							
						});
					</script>
				</div>

				<!-- 호텔 등록하기 버튼 -->
				<div id="btn-container">
					<input type="submit" id="insert-hotel-btn" value="등록 하기" />
				</div>
			</form>
		</div>
	</div>
</body>
</html>