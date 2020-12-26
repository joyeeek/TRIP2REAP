<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 성공</title>
      <!--  insert_3.css -->
      <link rel="stylesheet" href="resources/css/member/insert_3.css">  
</head>
<body>
    <header>
    <%@ include file="../common/menubar.jsp" %>
    </header>
    
    <section>
    <div id="board_list">
    <!-- 회원가입 설명란  -->
        <div id="space_1"></div>
        <div id="space_2">
            <div id="info1"></div>
            <div id="info2">회원가입</div>
            <div id="info3"></div>
            <div id="info4"></div>
            <div id="info5">01. 약관동의&nbsp;&nbsp;>&nbsp;&nbsp;</div>
            <div id="info5">02. 정보입력&nbsp;&nbsp;>&nbsp;&nbsp;</div>
            <div id="info6">03</div>
            <div id="info7">가입완료</div>
        </div>
        <div id="space_3"></div>
        
        <!-- 성공 메시지  -->
        <div id="successDiv1"></div>
        <div id="successDiv2">
            <div id="success1"></div>
            <div id="success2"></div>
            <div id="success3">회원가입을 축하합니다!</div>
            <div id="success4"></div>
            <div id="success5"><i class="fas fa-gift" id="successIcon"></i></div>
            <div id="success4"></div>
            <div id="space_4"></div>
            <div id="success6">
               <div id="success7">${ memberName } </div>
               <div id="success8"> 님의 전국방방곡곡 아이디는&nbsp;</div>
               <div id="success7">${ memberId }</div>
               <div id="success8">&nbsp;입니다.</div>
            </div>
            <div id="space_5"></div>
            <div id="success9"><input type="button" id=successBtn value="메인으로" onclick="main();"></div>
        </div>
        <div style="height : 500px;"></div>

      </div>
      </section>

</body>
</html>