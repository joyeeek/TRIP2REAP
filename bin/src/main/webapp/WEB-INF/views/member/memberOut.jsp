<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원탈퇴</title>
      <!--  memberOut.css -->
      <link rel="stylesheet" href="resources/css/member/memberOut.css">  
</head>
<body>
    <header>
    <%@ include file="../member/myPage.jsp" %>
    </header>
    
    <section>
		<div id="board_list">

			<!-- 회원탈퇴  -->
			<div id="infor1"></div>
			<div id="infor2"></div>
			<div id="infor3">회원탈퇴</div>
			<div></div>
			<div id="infor2"></div>
			<div id="infor4">회원탈퇴[이용약관 동의 철회]시 아래 내용을 확인해주세요!</div>	
		
		    <!-- 회원탈퇴 form  -->
		    <div></div>
		    <div id="infor5"></div>
		    <div id="deleteDiv">
		    <br>&nbsp;
		         그동안 저희 전국방방곡곡을 이용해 주셔서 진심으로 감사합니다.<br>&nbsp;
		         이용 중 불편하셨던 사항을 말씀해주시면, 적극 반영하여 더욱 편안한 서비스를 제공하기 위해 노력하겠습니다.<br><br>&nbsp;
		    **회원 탈퇴 시<br>&nbsp;
		         - 전국방방곡곡 이용약관 동의 철회 시 고객님의 계정은 휴먼 상태가 됩니다. <br>&nbsp;
		         - 전국방방곡곡 이용약관 동의를 철회한 후에라도  1년 이내에 고객센터에 문의 시 서비스를 이용하실 수 있습니다. <br>&nbsp;
		         - 진행중인 전자상거래 이용내역(결제/환불)이 있을 경우, 결제에 관하여 철회하실 수 없습니다. <br>&nbsp;
		         - 고객님의 계정이 휴먼상태가 된 지 1년이 지나면 계정은 자동 파기되며,<br>&nbsp;
		          고객님께서 보유하셨던 혜택 및 정보는 모두 삭제되며, 재가입 시 복원이 불가능합니다. <br><br>&nbsp;
		          회원탈퇴 시 서비스 이용이 불가능해지므로, 다시 한번 신중하게 생각해주세요.<br>&nbsp;
		          감사합니다.<br><br>
		    </div>
		    
		    <div></div>
		    
		    
		    <!-- 버튼  -->
            <div id="space2"></div>
            <div id="space3"></div>
            <div id="delCheck">전국방방곡곡 회원탈퇴[이용약관 동의 철회]를 하시겠습니까?</div>
            <div></div>
            <div id="space4"></div>
            <div id="space5"></div>
            <input type="button" id="applyBtn1" value="취소" onclick="cancel();">
            <div id="space6"></div>
            <input type="button" id="applyBtn2" value="확인" onclick="ok();">




		</div>
    </section>
    <div style="height: 1000px;"></div>
    
</body>
</html>