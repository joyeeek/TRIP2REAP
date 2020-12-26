<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="resources/css/common/remote_control.css">

<body>
	<div class="total_remote">
	
		<div class="remote_container" id="hotel_remote_control">
			<div class="remote_banner_container">
				<i class="fas fa-hotel remote_icon" id="remoteHotelIcon"></i>&nbsp; 내가 본 호텔
			</div>
			<ul class="remote_ul" id="hotel_remote_ul">
			</ul>
		</div>

		
		<div class="remote_container"  id="course_remote_control">
			<div class="remote_banner_container">
				<i class="fas fa-map-signs remote_icon" id="remoteCourseIcon"></i>&nbsp; 내가 본 코스
			</div>
			<ul class="remote_ul" id="course_remote_ul">
			</ul>
		</div>
    </div>

	<div id="remote_kakao_div">
		<div id="kakao-talk-channel-button"></div>
	</div>	 
	
	<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
    <script type='text/javascript'>
        Kakao.init('[JavaScript REST API KEY]');

        Kakao.Channel.createChatButton({
            container: '#kakao-talk-channel-button',
            channelPublicId: '_KTXxaK'
        });
	</script>
	
</body>
</html>