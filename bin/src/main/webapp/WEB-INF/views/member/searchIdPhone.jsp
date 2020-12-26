<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기</title>
   <!--  searchId.css -->
      <link rel="stylesheet" href="resources/css/member/searchIdPhone.css">  
</head>
<body>
    <header>
    <%@ include file="../common/menubar.jsp" %>
    </header>    
    
    <section>
    <div id="board_list">
        <!-- 인증방법 설명란  -->
        <div id="space_1"></div>
        <div id="space_2">
            <div id="info1"></div>
            <div id="info2">아이디 조회</div>
            <div id="info3"></div>
            <div id="info4"></div>
            <div id="info5">회원님의 정보와 일치하는 아이디입니다!</div>
        </div>
        
        <!-- 테이블 상단바  -->
        <div id="space_3"></div>
        <div id="space_4"></div>
        <div id="loginBox">
        
        <!-- 아이디가 존재하지 않으면  -->
       <c:if test="${ empty user }">
           <div id="noIdSpace1"></div>
           <div id="noId">입력하신 정보와 일치하는 아이디가 없습니다.</div>
           <div id="noIdSpace2"></div>
           <div id="noIdDiv">
               <button id="noIdJoin" onclick="join();">회원가입</button>
               <div id="noIdSpace3"></div>
               <button id="noIdSearch" onclick="searchId()">아이디 찾기</button>
           </div>
       </c:if>
    
       <!-- 아이디가 존재하면  -->
       <c:if test="${ !empty user }">          
           <div id="searchIdSpace1"></div>
           <div id="searchIdInfo">
              <div id="searchId">${user.memberName}</div>
              <div id="searchId2">님의 전국방방곡곡 아이디는</div>
              <div id="searchId">${user.memberId}</div>
              <div id="searchId2">입니다.</div>
           </div>
           <div id="searchIdSpace2"></div>
           <div id="searchIdDiv">
               <button id="searchIdPwd" onclick="searchPwd();">비밀번호 찾기</button>
               <div id="searchIdSpace3"></div>
               <button id="searchIdMain" onclick="main();">메인으로</button>
           </div>
       </c:if>
        </div>  
    </div>
    
    <div style="height: 500px;"></div>
    </section>	        
</body>
</html>