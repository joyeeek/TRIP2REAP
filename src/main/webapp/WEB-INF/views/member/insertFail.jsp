<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전국방방곡곡 | 회원가입 실패</title>
      <!--  insertFail.css -->
      <link rel="stylesheet" href="resources/css/member/insertFail.css">  
      <link rel="shortcut icon" href="resources/images/favicon.ico" type="image/x-icon">
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
            <div id="info7">가입실패</div>
        </div>
        <div id="space_3"></div>
        
        <!-- 실패 메시지  -->
        <div id="failDiv1"></div>
        <div id="failDiv2">
            <div id="fail1"></div>
            <div id="fail2"></div>
            <div id="fail3">회원가입에 실패하였습니다!</div>
            <div id="fail4"></div>
            <div id="fail5"><i class="far fa-sad-tear" id="failIcon"></i></div>
            <div id="fail4"></div>
            <div id="space_4"></div>
            <div id="fail6">
               <div id="fail7">회원가입에 실패하였습니다. 다시 시도해주세요. </div>
            </div>
            <div id="space_5"></div>
            <div id="fail8"><input type="button" id=failBtn value="회원가입" onclick="join();"></div>
        </div>
      </div>
      </section>
      <div id="footerSpaces"></div>
      <footer>
   	        <c:import url="../common/footer.jsp" />
	  </footer>
</body>
</html>