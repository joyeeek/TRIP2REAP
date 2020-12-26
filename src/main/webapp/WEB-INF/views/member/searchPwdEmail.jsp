<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전국방방곡곡 | 비밀번호 변경</title>
      <!--  searchId.css -->
      <link rel="stylesheet" href="resources/css/member/searchPwdEmail.css">
      <link rel="shortcut icon" href="resources/images/favicon.ico" type="image/x-icon">  
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
            <div id="info2">비밀번호 변경</div>
            <div id="info3"></div>
            <div id="info4"></div>
            <div id="info5">안전한 비밀번호로 변경해 주세요!</div>
        </div>
        
        <!-- 테이블 상단바  -->
        <div id="space_3"></div>
        <div id="space_4"></div>
        <div id="loginBox">
        
        <!-- 아이디가 존재하지 않으면  -->
       <c:if test="${ empty user }">
           <div id="noIdSpace1"></div>
           <div id="noId">입력하신 정보와 일치하는 계정이 없습니다.</div>
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
              <div id="searchId2">전국방방곡곡 아이디 : </div>
              <div id="searchId">${user.memberId}</div>
              <div id="searchIdSpace4"></div>
           </div>     
           <div id="searchIdSpace3"></div>  
           <div id="textBox"><input type="password" id="changePwd" name="pwd" placeholder="새 비밀번호를 입력하세요" 
	        onfocus="this.placeholder=''" onblur="this.placeholder='새 비밀번호를 입력하세요'" autocomplete="off"></div>
	       <div id="pwdCheck">필수 입력항목입니다.</div>
	       <div id="searchIdSpace2"></div>
	       <div id="searchIdSpace3"></div>
           <div id="textBox2"><input type="password" id="changePwd2" name="pwd2" placeholder="새 비밀번호 확인" 
	        onfocus="this.placeholder=''" onblur="this.placeholder='새 비밀번호 확인'" autocomplete="off"></div>
           <div id="pwdCheck2">비밀번호가 일치하지 않습니다.</div>
           <div id="searchIdSpace4"></div>
           <div id="searchIdDiv">
               <button id="searchPwdBtn">비밀번호 변경</button>
               <div id="searchIdSpace5"></div>
               <button id="searchIdMain" onclick="main();">메인으로</button>
           </div>           
       </c:if>
        </div>  
    </div>
    </section>	
    <div id="footerSpaces"></div>
    <footer>
   	        <c:import url="../common/footer.jsp" />
	</footer>        
    
    <script>
        $("#changePwd").blur(function(){
        	var pwd = $("#changePwd").val();
     	
        	var check1 = pwd.search(/[0-9]/g);
       	    var check2 = pwd.search(/[a-z]/ig);
       	    var check3 = pwd.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);
        	
       	 if(pwd == ""){
   		     $('#pwdCheck').text("필수 입력항목입니다.");
   		     $('#pwdCheck').css('display', 'inline-block');
         } else if(pwd.search(/\s/) != -1){
  		     $('#pwdCheck').text("비밀번호는 공백 없이 입력해주세요.");
 		     $('#pwdCheck').css('display', 'inline-block');
         } else if((check1 <0 && check2<0) || (check2 <0 && check3<0) || (check1 <0 && check3<0) ){
   		     $('#pwdCheck').text("[영문,숫자,특수문자] 2개 이상 조합");
		     $('#pwdCheck').css('display', 'inline-block');
   	     } else if(parseInt(pwd.length) < 6 || parseInt(pwd.length) >12){
   		     $('#pwdCheck').text("비밀번호는 6~12자입니다.");
		     $('#pwdCheck').css('display', 'inline-block');
   	     } else {  
  		     $('#pwdCheck').css('display', 'none');  		  
  		 }   	     	
        });
        
        
        $("#changePwd2").blur(function(){
        	var pwd = $("#changePwd").val();
        	var pwd2 = $("#changePwd2").val();
        	
        	if(pwd != pwd2){
        		$('#pwdCheck2').text("비밀번호가 일치하지 않습니다.");
   		        $('#pwdCheck2').css('display', 'inline-block');
        	} else {
        		$('#pwdCheck2').css('display', 'none');
        	}
        });
        
        
        $("#searchPwdBtn").click(function(){
           var userId = $("#searchId").text();
           
           var pwd1Result = "no";
     	   var userPwd1 = $("#changePwd").val();
     	   
     	   if($("#pwdCheck").css("display") == "none"){
     		   pwd1Result = "ok";
     	   } else if($("#pwdCheck").css("display") == "inline-block") {
     		   pwd1Result = "no";
     	   }
     	     	   
     	   var pwd2Result = "no";
    	   var userPwd2 = $("#changePwd2").val();
    	   
    	   if($("#pwdCheck2").css("display") == "none"){
    		   pwd2Result = "ok";
    	   } else if($("#pwdCheck").css("display") == "inline-block") {
    		   pwd2Result = "no";
    	   }

     	   if(userPwd1 == "" || pwd1Result == "no"){
     		   swal("비밀번호를 확인해주세요🙋");
     	   } else if(userPwd2 == "" || pwd2Result == "no"){
     		   swal("재확인 비밀번호가 일치하지 않습니다🙅");
     	   } else {
     		  $.ajax({
        			 url : 'changePwd.me',
        			 type : 'post',
        			 data : {userId:userId,userPwd1:userPwd1},
        			 success : function(data){
        				 if(data == "Y"){     										
        					swal("비밀번호가 변경되었습니다.");
        					$(".swal-button").click(function(){
        						location.href="<%= request.getContextPath() %>/home.do";
        					});
        					
        					$(".swal-overlay").click(function(){
        						location.href="<%= request.getContextPath() %>/home.do";
        					});
        				 } else {
        					swal("비밀번호 변경이 실패하였습니다.");
        		    	 } 
        			 },
        			 error : function(data){
        				 swal("비밀번호 변경이 실패하였습니다.");
        			 }
        		  });
       		   }  	
     	   });
    
    </script>
</body>
</html>