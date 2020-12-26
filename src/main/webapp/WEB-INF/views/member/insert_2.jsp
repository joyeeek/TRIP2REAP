<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전국방방곡곡 | 회원가입</title>
      <!--  insert_2.css -->
      <link rel="stylesheet" href="resources/css/member/insert_2.css">  
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
            <div id="info7">01. 약관동의&nbsp;&nbsp;>&nbsp;&nbsp;</div>
            <div id="info5">02</div>
            <div id="info6">정보입력</div>
            <div id="info7">&nbsp;&nbsp;>&nbsp;&nbsp;03. 가입완료</div>
        </div>
        <div id="space_3"></div>     
        
        <!-- 정보입력란 -->
        <div id="infoDiv1"></div>
        <div id="infoDiv2">*</div>
        <div id="infoDiv3">는 필수 입력 항목입니다.</div>
        <div id="space_4"></div>
        
        <form action="insert3.me" method="post" id="joinForm">
        <div id="infoDiv4"></div>
   
        <!-- 아이디  -->
        <div id="id1"><label class="infoLabel">아이디</label></div><div id="id2"><label id="commonLabel">*</label>
        <input type="text" id="idText" name="memberId" placeholder="5~12자 영문,숫자"
	         onfocus="this.placeholder=''" onblur="this.placeholder='5~12자 영문,숫자'" autocomplete="off">
	    <i class="fas fa-check" id="idCheckIcon"></i>
	    <div id="idInfoBox">필수 입력사항입니다.</div>     
	    </div>
        <div id="space_5"></div>

        
        <!-- 비밀번호  -->       
        <div id="infoDiv4"></div>
        <div id="pwd1_1"><label class="infoLabel">비밀번호</label></div><div id="pwd1_2" class="infoRight"><label id="commonLabel">*</label>
        <input type="password" id="pwdText" name="memberPwd" placeholder="영문+숫자/특수문자 6~12자 조합"
	         onfocus="this.placeholder=''" onblur="this.placeholder='영문+숫자/특수문자 6~12자 조합'" autocomplete="off">
	    <i class="fas fa-lock" id="pwd1CheckIcon"></i>
	    <div id="pwd1InfoBox">필수 입력사항입니다.</div>      
	    </div>
        <div id="space_5"></div>
        
        <!-- 비밀번호 재확인  -->
        <div id="infoDiv4"></div>
        <div id="pwd2_1"><label class="infoLabel">비밀번호</label></div><div id="pwd2_2" class="infoRight"><label id="commonLabel">*</label>
        <input type="password" id="pwdText2" name="memberPwd2" placeholder="비밀번호 재확인"
	         onfocus="this.placeholder=''" onblur="this.placeholder='비밀번호 재확인'" autocomplete="off">
	    <i class="fas fa-key" id="pwd2CheckIcon"></i>
	    <div id="pwd2InfoBox">필수 입력사항입니다.</div>     
	    </div>
	    <div id="space_5"></div>	    
	    <div id="space_3"></div>	    
	         
	    <!-- 이름  -->
        <div id="infoDiv4"></div>
        <div id="name"><label class="infoLabel">이름</label></div><div id="name2"><label id="commonLabel">*</label>
        <input type="text" id="nameText" name="memberName" placeholder="2~10자"
	         onfocus="this.placeholder=''" onblur="this.placeholder='2~10자'" autocomplete="off">
	    <div id="nameInfoBox">필수 입력사항입니다.</div>     
	    </div>
        <div id="space_5"></div>
        
	    
	    <!-- 닉네임  -->
	    <div id="infoDiv4"></div>
        <div id="nickname1"><label class="infoLabel">닉네임</label></div><div id="nickname2"><label id="commonLabel">*</label>
        <input type="text" id="nicknameText" class="infoText" name="nickName" placeholder="2~10자"
	         onfocus="this.placeholder=''" onblur="this.placeholder='2~10자'" autocomplete="off">
	    <div id="nicknameInfoBox">필수 입력사항입니다.</div> 
	    </div>
        <div id="space_5"></div>
        
        <!-- 이메일  -->
	    <div id="infoDiv4"></div>
        <div id="email1"><label class="infoLabel">이메일</label></div><div id="email2"><label id="commonLabel">*</label>
            <input type="text" id="emailText" name="email" placeholder="example@naver.com"
	            onfocus="this.placeholder=''" onblur="this.placeholder='example@naver.com'" autocomplete="off">
	        <div id="sendMessage"><label id="mailLabel">인증메일 전송</label></div>
	        <div id="sendMessage2"></div>
	        <div id="certificationOk">인증완료</div>
	        <div id="emailInfoBox">필수 입력사항입니다.</div>   
	    </div>
        <div id="space_5"></div>
        
        <!-- 인증번호  -->
        <div id="confirmDiv">
	    <div id="infoDiv4"></div>
        <div id="confirm1"><label class="infoLabel">인증번호</label></div><div id="confirm2"><label id="commonLabel">*</label>
            <input type="text" id="confirmText" name="confirmText" placeholder="10분안에 인증번호를 입력해주세요."
	         onfocus="this.placeholder=''" onblur="this.placeholder='10분안에 인증번호를 입력해주세요.'" autocomplete="off">
	        <div id="confirmMessage"><label id="confirmLabel">인증하기</label></div> 
	        <div id="confirmInfoBox">필수 입력사항입니다.</div> 
	    </div>
	    <div id="space_5"></div>
        </div>
        
        <!-- 휴대전화  -->
	    <div id="infoDiv4"></div>
        <div id="phone1"><label class="infoLabel">휴대전화</label></div><div id="phone2"><label id="commonLabel">*</label>
        <input type="text" id="phoneText" class="infoText" name="phone" placeholder="-없이 입력"
	         onfocus="this.placeholder=''" onblur="this.placeholder='-없이 입력'" autocomplete="off">
	    <div id="phoneInfoBox">필수 입력사항입니다.</div>     
	    </div>
        <div id="space_5"></div>
        
        <!-- 성별  -->
	    <div id="infoDiv4"></div>
        <div class="infoLeft"><label class="infoLabel">성별</label></div><div id="gender" class="infoRight">
           <input type="button" value="남자" id="man">
           <input type="button" value="여자" id="woman">
           <input type="text" value="" id="genderValue" name="gender">
        </div>
        </form>

        <!-- 버튼  -->
        <div id="space_6"></div>
        <div id="space_7"></div>
        <input type="button" id="applyBtn1" value="취소" onclick="cancel();">
        <div id="space_8"></div>
        <input type="button" id="applyBtn2" value="회원가입">
    </div>
    </section>
    <div id="footerSpaces"></div>
    <footer>
   	        <c:import url="../common/footer.jsp" />
	</footer>
    
    <script>
       var manClick = false; 
       $(function(){
    	  $("#man").click(function(){
    		   if(manClick){
    			   $(this).css('background-color','white'); 
    			   manClick = false;
    			   $("#genderValue").val('');
    		   } else {
    			   $(this).css('background-color','rgb(226,240,217)');
    			   $("#woman").css('background-color','white');
    			   manClick = true;
    			   womanClick = false;
    			   $("#genderValue").val('남자');
    		   }
    	  });
    	  
    	  var womanClick = false; 
    	  $("#woman").click(function(){
   		   if(womanClick){
   			   $(this).css('background-color','white'); 
   			   womanClick = false;
   			   $("#genderValue").val('');
   		   } else {
   			   $(this).css('background-color','rgb(226,240,217)');
   			   $("#man").css('background-color','white');
   			   womanClick = true;
   			   manClick = false;
   			   $("#genderValue").val('여자');
   		   }
   		   });
       });
       
       $("#idText").focusin(function(){
    	   $("#idText").css({'color':'black','font-weight':'bold'});
       });
       
       $("#idText").blur(function(){  
    	  $("#idText").css('font-weight','normal');
    	  var userId = $("#idText").val();
    	  var regType1 = /^[a-zA-Z0-9]*$/;
    	  if(userId == ""){
    		  $("#id1").css('height','70px');
    		  $("#id2").css('height','70px');
    		  $('#idInfoBox').text("필수 입력항목입니다.");
    		  $('#idInfoBox').css('display', 'block');
    		  $('#idCheckIcon').css({'display':'inline-block','color':'red', 'width':'30px' , 'text-align' : 'left'});
    	  } else if(parseInt(userId.length) < 5 || parseInt(userId.length) >12){
    		  $("#id1").css('height','70px');
    		  $("#id2").css('height','70px');
    		  $('#idInfoBox').text("아이디는 5~12자입니다.");
    		  $('#idInfoBox').css('display', 'block');
    		  $('#idCheckIcon').css({'display':'inline-block','color':'red', 'width':'30px' , 'text-align' : 'left'});
    	  } else if(!regType1.test(userId)){
    		  $("#id1").css('height','70px');
    		  $("#id2").css('height','70px');
    		  $('#idInfoBox').text("아이디는 영문 혹은 숫자를 입력해주세요.");
    		  $('#idInfoBox').css('display', 'block');
    		  $('#idCheckIcon').css({'display':'inline-block','color':'red', 'width':'30px' , 'text-align' : 'left'});
    	  } else {    		  
    		  $.ajax({
    			 url : 'checkId.me',
    			 type : 'post',
    			 data : {userId:userId},
    			 success : function(data){
    				 if(data == "Y"){
    					 $("#id1").css('height','50px');
    		    		 $("#id2").css('height','50px');
    		    		 $('#idInfoBox').css('display', 'none');
    		    		 $('#idCheckIcon').css({'display':'inline-block','color':'rgb(119,175,130)', 'width':'30px' , 'text-align' : 'left'});
    				 } else {
    					 $("#id1").css('height','70px');
    		    		 $("#id2").css('height','70px');
    		    		 $('#idInfoBox').text("중복된 아이디입니다. 다른 아이디를 입력해주세요.");
    		    		 $('#idInfoBox').css('display', 'block');
    		    		 $('#idCheckIcon').css({'display':'inline-block','color':'red', 'width':'30px' , 'text-align' : 'left'});
    		    	  } 
    			 },
    			 error : function(data){
    				 console.log("서버 실패");
    			 }
    		  });   		      		  
    	  }   	  
       });
       
       
       $("#pwdText").focusin(function(){
    	   $("#pwdText").css({'color':'black','font-weight':'bold'});
       });
       
       
       $("#pwdText").blur(function(){  
     	  $("#pwdText").css('font-weight','normal');
     	  var userPwd = $("#pwdText").val();
     	  var check1 = userPwd.search(/[0-9]/g);
     	  var check2 = userPwd.search(/[a-z]/ig);
     	  var check3 = userPwd.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);
     	 if(userPwd == ""){
   		     $("#pwd1_1").css('height','70px');
   		     $("#pwd1_2").css('height','70px');
   		     $('#pwd1InfoBox').text("필수 입력항목입니다.");
   		     $('#pwd1InfoBox').css('display', 'block');
   		     $('#pwd1CheckIcon').css({'display':'inline-block','color':'red', 'width':'30px' , 'text-align' : 'left'});
         } else if(userPwd.search(/\s/) != -1){
    	     $("#pwd1_1").css('height','70px');
  		     $("#pwd1_2").css('height','70px');
  		     $('#pwd1InfoBox').text("비밀번호는 공백 없이 입력해주세요.");
  		     $('#pwd1InfoBox').css('display', 'block');
  		     $('#pwd1CheckIcon').css({'display':'inline-block','color':'red', 'width':'30px' , 'text-align' : 'left'});
         } else if((check1 <0 && check2<0) || (check2 <0 && check3<0) || (check1 <0 && check3<0) ){
   		     $("#pwd1_1").css('height','70px');
   		     $("#pwd1_2").css('height','70px');
   		     $('#pwd1InfoBox').text("영문 + 숫자 + 특수문자  중 두가지 이상의 조합으로 입력해주세요.");
   		     $('#pwd1InfoBox').css('display', 'block');
   		     $('#pwd1CheckIcon').css({'display':'inline-block','color':'red', 'width':'30px' , 'text-align' : 'left'});
   	     } else if(parseInt(userPwd.length) < 6 || parseInt(userPwd.length) >12){
   		     $("#pwd1_1").css('height','70px');
   		     $("#pwd1_2").css('height','70px');
   		     $('#pwd1InfoBox').text("비밀번호는 6~12자입니다.");
   		     $('#pwd1InfoBox').css('display', 'block');
   		     $('#pwd1CheckIcon').css({'display':'inline-block','color':'red', 'width':'30px' , 'text-align' : 'left'});
   	     } else {  
   		     $("#pwd1_1").css('height','50px');
  		     $("#pwd1_2").css('height','50px');
  		     $('#pwd1InfoBox').css('display', 'none');
  		     $('#pwd1CheckIcon').css({'display':'inline-block','color':'rgb(119,175,130)', 'width':'30px' , 'text-align' : 'left'});      		  
   	  }   	  
      });
       
       
       
       $("#pwdText2").focusin(function(){
    	   $("#pwdText2").css({'color':'black','font-weight':'bold'});
       });
       
       
       
       $("#pwdText2").blur(function(){  
      	  $("#pwdText2").css('font-weight','normal');
      	  var userPwd = $("#pwdText").val();
      	  var userPwd2 = $("#pwdText2").val();
      	  if(userPwd != userPwd2){
      		 $("#pwd2_1").css('height','70px');
  		     $("#pwd2_2").css('height','70px');
  		     $('#pwd2InfoBox').text("비밀번호가 일치하지 않습니다.");
  		     $('#pwd2InfoBox').css('display', 'block');
  		     $('#pwd2CheckIcon').css({'display':'inline-block','color':'red', 'width':'30px' , 'text-align' : 'left'});
      	  } else {
      		 $("#pwd2_1").css('height','50px');
 		     $("#pwd2_2").css('height','50px');
 		     $('#pwd2InfoBox').css('display', 'none');
 		     $('#pwd2CheckIcon').css({'display':'inline-block','color':'rgb(119,175,130)', 'width':'30px' , 'text-align' : 'left'});  
      	  }     	  
       });
       
       
       
       $("#nameText").focusin(function(){
    	   $("#nameText").css({'color':'black','font-weight':'bold'});
       });
       
       $("#nameText").blur(function(){  
     	  $("#nameText").css('font-weight','normal');
     	  var name = $("#nameText").val();
     	  var check1 = /^[가-힣]+$/;
     	  var check2 = /^[a-zA-Z]+$/;     	  

     	 if(name == ""){
   		     $("#name").css('height','70px');
   		     $("#name2").css('height','70px');
   		     $('#nameInfoBox').text("필수 입력항목입니다.");
   		     $('#nameInfoBox').css('display', 'block');
   		     $('#nameCheckIcon').css({'display':'inline-block','color':'red', 'width':'30px' , 'text-align' : 'left'});
         } else if(name.search(/\s/) != -1){
        	 $("#name").css('height','70px');
   		     $("#name2").css('height','70px');
   		     $('#nameInfoBox').text("이름은 공백없이 입력해주세요.");
   		     $('#nameInfoBox').css('display', 'block');
   		     $('#nameCheckIcon').css({'display':'inline-block','color':'red', 'width':'30px' , 'text-align' : 'left'});
         } else if( (!check1.test(name) && !check2.test(name)) || (check1.test(name) && check2.test(name))){
        	 $("#name").css('height','70px');
   		     $("#name2").css('height','70px');
   		     $('#nameInfoBox').text("이름은 한글만 입력해주세요. 혹은 영어만 입력해주세요.");
   		     $('#nameInfoBox').css('display', 'block');
   		     $('#nameCheckIcon').css({'display':'inline-block','color':'red', 'width':'30px' , 'text-align' : 'left'});
   	     } else if(parseInt(name.length) < 2 || parseInt(name.length) >10){
   	    	 $("#name").css('height','70px');
  		     $("#name2").css('height','70px');
  		     $('#nameInfoBox').text("이름은 2~10자입니다.");
  		     $('#nameInfoBox').css('display', 'block');
  		     $('#nameCheckIcon').css({'display':'inline-block','color':'red', 'width':'30px' , 'text-align' : 'left'});
   	     } else {  
   		     $("#name").css('height','50px');
  		     $("#name2").css('height','50px');
  		     $('#nameInfoBox').css('display', 'none');     		  
   	  }   	  
      });
       
       
       
       $("#nicknameText").focusin(function(){
    	   $("#nicknameText").css({'color':'black','font-weight':'bold'});
       });
       
       $("#nicknameText").blur(function(){  
    	  $("#nicknameText").css('font-weight','normal');
    	  var nickname = $("#nicknameText").val();
    	  var regType1 = /^[가-힣|a-z|A-Z|0-9|\*]+$/;
     	  
    	  if(nickname == ""){
    		  $("#nickname1").css('height','70px');
    		  $("#nickname2").css('height','70px');
    		  $('#nicknameInfoBox').text("필수 입력항목입니다.");
    		  $('#nicknameInfoBox').css('display', 'block');
    	  } else if(parseInt(nickname.length) < 2 || parseInt(nickname.length) >10){
    		  $("#nickname1").css('height','70px');
    		  $("#nickname2").css('height','70px');
    		  $('#nicknameInfoBox').text("닉네임은 2~10자입니다.");
    		  $('#nicknameInfoBox').css('display', 'block');
    	  } else if(!regType1.test(nickname)){
    		  $("#nickname1").css('height','70px');
    		  $("#nickname2").css('height','70px');
    		  $('#nicknameInfoBox').text("닉네임은 한글,영문,숫자만 입력가능합니다.");
    		  $('#nicknameInfoBox').css('display', 'block');
    	  } else {    		  
    		  $.ajax({
    			 url : 'checkNickname.me',
    			 type : 'post',
    			 data : {nickname:nickname},
    			 success : function(data){
    				 if(data == "Y"){
    					 $("#nickname1").css('height','50px');
    		    		 $("#nickname2").css('height','50px');
    		    		 $('#nicknameInfoBox').css('display', 'none');
    				 } else {
    					 $("#nickname1").css('height','70px');
    		    		 $("#nickname2").css('height','70px');
    		    		 $('#nicknameInfoBox').text("중복된 닉네임입니다. 다른 닉네임을 입력해주세요.");
    		    		 $('#nicknameInfoBox').css('display', 'block');
    		    	  } 
    			 },
    			 error : function(data){
    				 console.log("서버 실패");
    			 }
    		  });   		      		  
    	  }   	  
       });
       
       
       
       $("#emailText").focusin(function(){
    	   $("#emailText").css({'color':'black','font-weight':'bold'});
       });
              
       $("#emailText").blur(function(){  
     	  $("#emailText").css('font-weight','normal');
     	  var email = $("#emailText").val();
     	  var check = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/;
      	  var test = check.test(email);
     	  
     	 if(email == ""){
   		     $("#email1").css('height','70px');
   		     $("#email2").css('height','70px');
   		     $('#emailInfoBox').text("필수 입력항목입니다.");
   		     $('#emailInfoBox').css('display', 'block');
         } else if(email.search(/\s/) != -1){
    	     $("#email1").css('height','70px');
  		     $("#email2").css('height','70px');
  		     $('#emailInfoBox').text("이메일은 공백 없이 입력해주세요.");
  		     $('#emailInfoBox').css('display', 'block');
         } else if(!test){
   		     $("#email1").css('height','70px');
   		     $("#email2").css('height','70px');
   		     $('#emailInfoBox').text("이메일의 형식에 맞게 입력해주세요.");
   		     $('#emailInfoBox').css('display', 'block');
   	     } else {  
   		     $("#email1").css('height','50px');
  		     $("#email2").css('height','50px');
  		     $('#emailInfoBox').css('display', 'none');
   	  }   	  
      });
       
       
       
       $("#sendMessage").click(function(){
    	   var emailResult = "no";
    	   var email = $("#emailText").val();
      	   var check = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/;
      	   var test = check.test(email);
      	   
      	 if(email == ""){
   		     $("#email1").css('height','70px');
   		     $("#email2").css('height','70px');
   		     $('#emailInfoBox').text("필수 입력항목입니다.");
   		     $('#emailInfoBox').css('display', 'block');
   		     $('#confirmDiv').css("display","none");
         } else if(email.search(/\s/) != -1){
    	     $("#email1").css('height','70px');
  		     $("#email2").css('height','70px');
  		     $('#emailInfoBox').text("이메일은 공백 없이 입력해주세요.");
  		     $('#emailInfoBox').css('display', 'block');
  		     $('#confirmDiv').css("display","none");
         } else if(!test){
   		     $("#email1").css('height','70px');
   		     $("#email2").css('height','70px');
   		     $('#emailInfoBox').text("이메일의 형식에 맞게 입력해주세요.");
   		     $('#emailInfoBox').css('display', 'block');
   		     $('#confirmDiv').css("display","none");
   	     } else {  
   		     $("#email1").css('height','50px');
  		     $("#email2").css('height','50px');
  		     $('#emailInfoBox').css('display', 'none');
  		     $('#confirmDiv').css("display","inline-block");
  		   
  		   swal("인증메일이 발송되었습니다!", "입력하신 이메일로 인증메일이 발송되었습니다.\n메일 전송에는 다소 시간이 걸릴 수 있습니다.\n메일함을 확인하여 인증코드를 입력해주세요💌");
  		   
  		   $('#sendMessage').css("display","none");
  		   $('#sendMessage2').css("display","inline-block");
  		   $("#emailText").attr("readonly",true);
  		   
			 // 타이머
			 function countdown(elementName, minutes, seconds){
				 var elementName, endTime, hours, mins, msLeft, time;
				 
				 function twoDigits(n) {
					 return (n <= 9 ? "0" + n : n);
				 }

				 function updateTimer(){
					 msLeft = endTime - (+new Date);
					 if(msLeft < 1000){						 					 
						 if($("#certificationOk").css("display") == "none"){
							 swal("인증번호가 만료되었습니다! \n이메일 인증을 다시 진행해주세요💌 감사합니다.");								 
							 $("" + elementName).css("display","none");
							 $('#confirmDiv').css("display","none");
							 $("#emailText").attr("readonly",false);
							 $('#sendMessage').css("display","inline-block");
						 } else {
							 $("" + elementName).css("display","none");
							 $('#confirmDiv').css("display","none");
							 $("#emailText").attr("readonly",false);
						 }
					 } else {
						 time = new Date(msLeft);
						 hours = time.getUTCHours();
						 mins = time.getUTCMinutes();
						 $(""+elementName).html((hours ? hours + ":" + twoDigits(mins):twoDigits(mins))
						   + ":" + twoDigits(time.getUTCSeconds()));
						 setTimeout(updateTimer,time.getUTCMilliseconds() + 500);
					 }
				 }
				 
				 endTime = (+new Date) + 1000 * (60*minutes + seconds) + 500;
				 updateTimer();
			 }
			 $("<div id='sendMessage2'</div>").insertAfter($("#email"));
			 countdown("#sendMessage2",0,20);
			 
  		   // 인증메일 보내기
  		   $.ajax({
  			 url : 'sendMail.me',
  			data : {email:email},
  			 type : 'post',
  			 success : function(data){
  				 if(data == "N"){
  					swal("메일전송에 실패하였습니다😢");				 			 
  				 } else {					
  					var randomKey = data;
  					
  					$("#confirmMessage").click(function(){
  						var cerNum = $("#confirmText").val();
  						
  						if(cerNum == randomKey){
  							swal("메일 인증이 완료되었습니다😊");	
  							
  							$('#confirmDiv').css("display","none");
  							$("#sendMessage2").css("display","none");
  							$("#certificationOk").css("display","inline-block");
  							$("#emailText").attr("readonly",true);
  						} else {
  							swal("인증번호가 일치하지 않습니다.\n다시 입력해주세요😢");	
  						}
  					});
  		    	  } 
  			 },
  			 error : function(data){
  				 console.log("서버 실패");
  				 swal("메일전송에 실패하였습니다😢");	
  			 }
  		   });
  		  }   	   	
      	});
    	   
       
       
       $("#confirmText").focusin(function(){
    	   $("#confirmText").css({'color':'black','font-weight':'bold'});
       });
       
       $("#confirmText").blur(function(){  
      	  $("#confirmText").css('font-weight','normal');
       });
      	  
       
       
       $("#phoneText").focusin(function(){
    	   $("#phoneText").css({'color':'black','font-weight':'bold'});
       });
              
       $("#phoneText").blur(function(){  
     	  $("#phoneText").css('font-weight','normal');
     	  var phone = $("#phoneText").val();
     	  var check = /^01(?:0|1|[6-9])(?:\d{3}|\d{4})\d{4}$/;

     	 if(phone == ""){
   		     $("#phone1").css('height','70px');
   		     $("#phone2").css('height','70px');
   		     $('#phoneInfoBox').text("필수 입력항목입니다.");
   		     $('#phoneInfoBox').css('display', 'block');
         } else if(phone.search(/\s/) != -1){
    	     $("#phone1").css('height','70px');
  		     $("#phone2").css('height','70px');
  		     $('#phoneInfoBox').text("휴대폰 번호는 공백 없이 입력해주세요.");
  		     $('#phoneInfoBox').css('display', 'block');
         } else if(!check.test(phone)){
   		     $("#phone1").css('height','70px');
   		     $("#phone2").css('height','70px');
   		     $('#phoneInfoBox').text("휴대폰 번호의 형식에 맞게 입력해주세요.");
   		     $('#phoneInfoBox').css('display', 'block');
   	     } else {
   	    	$.ajax({
   			 url : 'phone.me',
   			 type : 'post',
   			 data : {phone:phone},
   			 success : function(data){
   				 if(data == "Y"){
   					$("#phone1").css('height','50px');
   	  		        $("#phone2").css('height','50px');
   	  		        $('#phoneInfoBox').css('display', 'none');
   				 } else {
   					$("#phone1").css('height','70px');
   	   		        $("#phone2").css('height','70px');
   	   		        $('#phoneInfoBox').text("이미 존재하는 휴대폰 번호입니다.");
   	   		        $('#phoneInfoBox').css('display', 'block');
   		    	  } 
   			 },
   			 error : function(data){
   				 console.log("서버 실패");
   			 }
   		  });     
   	  }   	  
      });
       
       
       
       $("#applyBtn2").click(function(){
    	   var idResult = "no";
    	   var userId = $("#idText").val();
    	   if($("#idInfoBox").css("display") == "none"){
    		   idResult = "ok";
    	   } else if($("#idInfoBox").css("display") == "block") {
    		   idResult = "no";
    	   }
    	   
    	   
    	   var pwd1Result = "no";
    	   var userPwd1 = $("#pwdText").val();
    	   if($("#pwd1InfoBox").css("display") == "none"){
    		   pwd1Result = "ok";
    	   } else if($("#pwd1InfoBox").css("display") == "block") {
    		   pwd1Result = "no";
    	   }
    	   
    	   
    	   var pwd2Result = "no";
    	   var userPwd2 = $("#pwdText2").val();
    	   if(userPwd1 == userPwd2){
    		   pwd2Result = "ok";
    	   } else {
    		   pwd2Result = "no";
    	   }
    	   
    	   
    	   var nameResult = "no";
    	   var userName = $("#nameText").val();
    	   if($("#nameInfoBox").css("display") == "none"){
    		   nameResult = "ok";
    	   } else if($("#nameInfoBox").css("display") == "block") {
    		   nameResult = "no";
    	   }
    	   
    	   
    	   var nicknameResult = "no";
    	   var nickName = $("#nicknameText").val();
    	   if($("#nicknameInfoBox").css("display") == "none"){
    		   nicknameResult = "ok";
    	   } else if($("#nicknameInfoBox").css("display") == "block") {
    		   nicknameResult = "no";
    	   }
    	   
    	   
    	   var emailResult = "no";
    	   var email = $("#emailText").val();
    	   if($("#emailInfoBox").css("display") == "none"){
    		   emailResult = "ok";
    	   } else if($("#emailInfoBox").css("display") == "block") {
    		   emailResult = "no";
    	   }
    	   
    	   
    	   var phoneResult = "no";
    	   var phone = $("#phoneText").val();
    	   if($("#phoneInfoBox").css("display") == "none"){
    		   phoneResult = "ok";
    	   } else if($("#phoneInfoBox").css("display") == "block") {
    		   phoneResult = "no";
    	   }
    	   
    	   
    	   var cerResult = "no";
    	   var dis = $("#certificationOk").css("display");
    	   if($("#certificationOk").css("display") == "inline-block"){
    		   cerResult = "ok";
    	   } else {
    		   cerResult = "no";
    	   }
    	   
    	   if(userId == "" || idResult == "no"){
    		   swal("아이디를 확인해주세요🙋");
    		   $("#idText").focus();
    	   } else if(userPwd1 == "" || pwd1Result == "no"){
    		   swal("비밀번호를 확인해주세요🙋");
    		   $("#pwdText").focus();
    	   } else if(userPwd2 == "" || pwd2Result == "no"){
    		   swal("재확인 비밀번호가 일치하지 않습니다🙅");
    		   $("#pwdText2").focus();
    	   } else if(userName == "" || nameResult == "no"){
    		   swal("이름을 확인해주세요🙋");
    		   $("#nameText").focus();
    	   } else if(nickName == "" || nicknameResult == "no"){
    		   swal("닉네임을 확인해주세요🙋");
    		   $("#nicknameText").focus();
    	   } else if(email == "" || emailResult == "no"){
    		   swal("이메일 인증을 해주세요✉");
    		   $("#emailText").focus();
    	   } else if(phone == "" || phoneResult == "no"){
    		   swal("휴대폰 번호를 확인해주세요🙋");
    		   $("#phoneText").focus();
    	   } else if(cerResult == "no"){
    		   swal("이메일 인증을 해주세요✉");
    		   $("#emailText").focus();
    	   } else {
    		   $('#joinForm').submit();
    	   }    	 
       });

       
       function cancel(){
    	   location.href="<%= request.getContextPath() %>/home.do";
       }
   
    </script>
</body>
</html>