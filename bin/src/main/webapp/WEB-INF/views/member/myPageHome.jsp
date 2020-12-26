<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>개인정보 수정</title>
      <!--  updateMember.css -->
      <link rel="stylesheet" href="resources/css/member/updateMember.css">  
</head>
<body>
    <header>
    <%@ include file="../member/myPage.jsp" %>
    </header>
    
    <section>
       <div id="board_list">
       <div>
            <div id="infor1"></div>
            <div id="infor2"></div>
            <div id="infor3">개인정보 수정</div>            
        </div>
        <div id="up_space1"></div>
        
        <!-- 정보입력란 -->
        <div id="infoDiv1"></div>
        <div id="infoDiv2">*</div>
        <div id="infoDiv3">는 필수 입력 항목입니다.</div>
        <div id="up_space2"></div>
        <div id="infoDiv4"></div>
        
        <!-- 아이디  -->
        <div id="id1"><label class="infoLabel">아이디</label></div><div id="id2">
        <input type="text" id="idText" name="idText" value="${ loginUser.memberId }" readonly="readonly"></div>
        <div id="space_5"></div>
        
        <!-- 비밀번호  -->       
        <div id="infoDiv4"></div>
        <div class="infoLeft"><label class="infoLabel">비밀번호</label></div><div id="pwd2" class="infoRight"><label id="commonLabel">*</label>
        <input type="text" id="pwdText" class="infoText" name="pwdText" placeholder="영문+숫자/특수문자 6~12자 조합"
	         onfocus="this.placeholder=''" onblur="this.placeholder='영문+숫자/특수문자 6~12자 조합'" autocomplete="off"></div>
        <div id="space_5"></div>
        
        <!-- 비밀번호 재확인  -->
        <div id="infoDiv4"></div>
        <div class="infoLeft"><label class="infoLabel">비밀번호</label></div><div id="pwd2" class="infoRight"><label id="commonLabel">*</label>
        <input type="text" id="pwdText2" name="pwdText2" placeholder="비밀번호 재확인"
	         onfocus="this.placeholder=''" onblur="this.placeholder='비밀번호 재확인'" autocomplete="off">
	         <div id="pwdMessage"><label id="pwdLabel">비밀번호 변경</label></div></div>
	    <div id="space_5"></div>
	    
	    <div id="up_space1"></div>	    
	    
	    <!-- 이름  -->
        <div id="infoDiv4"></div>
        <div id="name"><label class="infoLabel">이름</label></div><div id="name2"><label id="commonLabel">*</label>
        <input type="text" id="nameText" class="infoText2" name="nameText" placeholder="6~10자"
	         onfocus="this.placeholder=''" onblur="this.placeholder='6~10자'" autocomplete="off" value="${ loginUser.memberName }"></div>
        <div id="space_5"></div>
        
	    
	    <!-- 닉네임  -->
	    <div id="infoDiv4"></div>
        <div class="infoLeft"><label class="infoLabel">닉네임</label></div><div id="nickname" class="infoRight"><label id="commonLabel">*</label>
        <input type="text" id="nicknameText" class="infoText2" name="nicknameText" placeholder="6~10자"
	         onfocus="this.placeholder=''" onblur="this.placeholder='6~10자'" autocomplete="off" value="${ loginUser.nickName }"></div>
        <div id="space_5"></div>
        
        <!-- 이메일  -->
	    <div id="infoDiv4"></div>
        <div class="infoLeft"><label class="infoLabel">이메일</label></div><div id="email" class="infoRight"><label id="commonLabel">*</label>
            <input type="text" id="emailText" name="emailText" placeholder="example@naver.com"
	            onfocus="this.placeholder=''" onblur="this.placeholder='example@naver.com'" autocomplete="off" value="${ loginUser.email }">
	        <div id="sendMessage"><label id="mailLabel">인증메일 전송</label></div>  
	    </div>
        <div id="space_5"></div>
        
        <!-- 인증번호  -->
        <div id="confirmDiv">
	    <div id="infoDiv4"></div>
        <div class="infoLeft"><label class="infoLabel">인증번호</label></div><div id="confirm" class="infoRight"><label id="commonLabel">*</label>
            <input type="text" id="confirmText" name="confirmText">
	        <div id="confirmMessage"><label id="confirmLabel">인증확인</label></div>  
	    </div>
        </div>
        
        <!-- 휴대전화  -->
	    <div id="infoDiv4"></div>
        <div class="infoLeft"><label class="infoLabel">휴대전화</label></div><div id="phone" class="infoRight"><label id="commonLabel">*</label>
        <input type="text" id="phoneText" class="infoText2" name="phoneText" placeholder="-없이 입력"
	         onfocus="this.placeholder=''" onblur="-없이 입력'" autocomplete="off" value="${ loginUser.phone }"></div>
        <div id="space_5"></div>
        
        <!-- 성별  -->
	    <div id="infoDiv4"></div>
        <div class="infoLeft"><label class="infoLabel">성별</label></div><div id="gender" class="infoRight">
           <input type="button" value="남자" id="man" >
           <input type="button" value="여자" id="woman">
        </div>

        <!-- 버튼  -->
        <div id="space_6"></div>
        <div id="space_7"></div>
        <input type="button" id="applyBtn1" value="취소" onclick="cancel();">
        <div id="space_8"></div>
        <input type="button" id="applyBtn2" value="수정하기" onclick="ok();">
	    
    
    </div>
    </section>
    <div style="height : 1000px;"></div>
    
    <script>
       var manClick = false; 
       $(function(){
    	  $("#man").click(function(){
    		   if(manClick){
    			   $(this).css('background-color','white'); 
    			   manClick = false;
    		   } else {
    			   $(this).css('background-color','rgb(226,240,217)');
    			   $("#woman").css('background-color','white');
    			   manClick = true;
    			   womanClick = false;
    		   }
    	  });
    	  
    	  var womanClick = false; 
    	  $("#woman").click(function(){
   		   if(womanClick){
   			   $(this).css('background-color','white'); 
   			   womanClick = false;
   		   } else {
   			   $(this).css('background-color','rgb(226,240,217)');
   			   $("#man").css('background-color','white');
   			   womanClick = true;
   			   manClick = false;
   		   }
   		   });
       });
       
       function cancel(){
       	location.href="<%= request.getContextPath() %>/home.do";
       }
       
    </script>


</body>
</html>