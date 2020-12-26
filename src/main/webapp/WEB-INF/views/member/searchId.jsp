<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전국방방곡곡 | 아이디 찾기</title>
      <!--  searchId.css -->
      <link rel="stylesheet" href="resources/css/member/searchId.css">  
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
            <div id="info2">아이디/비밀번호 찾기</div>
            <div id="info3"></div>
            <div id="info4"></div>
            <div id="info5">원하는 인증방법을 선택해 아이디/비밀번호를 확인할 수 있어요!</div>
        </div>
        
        <!-- 테이블 상단바  -->
        <div id="space_3"></div>
        <div id="space_4"></div>
        <div id="loginBox" class="tab">
            <ul id="tab">
                <li id="id" class="tab-link current" >아이디 찾기</li>
                <li id="pwd" class="tab-link">비밀번호 찾기</li>
            </ul>
        
        <!-- 아이디 찾기  -->          
        <div id="searchId">
            <div id="searchId_2"></div>
	        <input type="radio" id="checkPhone_1" name="idPhoneEmail" checked="checked">
	        <label id="checkPhone_2">휴대전화로 찾기</label>
	        <input type="radio" id="checkEmail_1" name="idPhoneEmail">
	        <label id="checkEmail_2">이메일로 찾기</label>
	    </div>  
	    
	    <!-- 비밀번호 찾기  -->
	    <div id="searchPwd">
	        <div id="space_5"></div>
	        <input type="radio" id="checkEmail_3" name="idPhoneEmail">
	        <label id="checkEmail_4" >이메일로 찾기</label>
	    </div>
	    
	    <!-- 아이디 찾기 : 내용  -->
	    <div id="space_6"></div>
	    <div id="phone">
	        <form action="searchIdPhone.me" method="post" id="searchIdPhone">
	        <div id="space_7"></div>        
	        <input type="text" id="nameBox" name="pName" placeholder="이름을 입력하세요" 
	        onfocus="this.placeholder=''" onblur="this.placeholder='이름을 입력하세요'" autocomplete="off">
	        <div id="space_8"></div>	
	        <div id="space_7"></div>	        
	        <input type="text" id="phoneBox" name="pPhone" placeholder="휴대전화 -없이 입력하세요"
	        onfocus="this.placeholder=''" onblur="this.placeholder='휴대전화 -없이 입력하세요'" autocomplete="off">
	        </form>
	        <div id="space_9"></div>
	        <div id="space_7"></div>
	        <button id="idBtn">아이디 확인</button>
	    </div>
	    <div id="email">
	    <form action="searchIdEmail.me" method="post" id="searchIdEmail">
	    <div id="space_7"></div>    
	        <input type="text" id="nameBox2" name="eName" placeholder="이름을 입력하세요" 
	        onfocus="this.placeholder=''" onblur="this.placeholder='이름을 입력하세요'" autocomplete="off">
	        <div id="space_8"></div>	
	        <div id="space_7"></div>	
	        <div id="emailBox">        
	        <input type="text" id="emailText" name="eEmail" placeholder="이메일 주소를 입력하세요"
	        onfocus="this.placeholder=''" onblur="this.placeholder='이메일 주소를 입력하세요'" autocomplete="off">
	        <div id="sendMessage"><label id="mailLabel">인증메일 전송</label></div>
	        <div id="sendMessage2"></div>
	        <div id="certificationOk">인증완료</div>
	        </div>	 
	        <div id="space_8"></div>  
	        <div id="space_7"></div>    
	        <div id="emailConfirmBox">   	        	        
	        <input type="text" id="numberBox" placeholder="인증번호 10분이내 입력"
	        onfocus="this.placeholder=''" onblur="this.placeholder='인증번호 10분이내 입력'" autocomplete="off">	        	        	        	        
	        <div id="confirmMessage"><label id="confirmLabel">인증하기</label></div> 
	        </div>
	        </form>
	        <div id="space_10"></div>
	        <div id="space_7"></div>
	        <button id="idBtn2">아이디 확인</button>
	    </div>
	    
	    <!-- 비밀번호 찾기 : 내용  -->
	    <div id="pwdEmail">
	    <form action="searchPwdEmail.me" method="post" id="searchPwdEmail">
	    <div id="space_7"></div>	       
	        <input type="text" id="idBoxPwd" name="pwdId" placeholder="아이디를 입력하세요" 
	        onfocus="this.placeholder=''" onblur="this.placeholder='아이디를 입력하세요'" autocomplete="off">
	        <div id="space_8"></div>	
	        <div id="space_7"></div>	
	        <div id="emailBoxPwd">        
	        <input type="text" id="emailTextPwd" name="pwdEmail" placeholder="이메일 주소를 입력하세요"
	        onfocus="this.placeholder=''" onblur="this.placeholder='이메일 주소를 입력하세요'" autocomplete="off">
	        <div id="sendMessagePwd"><label id="mailLabelPwd">인증메일 전송</label></div>
	        <div id="sendMessagePwd2"></div>
	        <div id="certificationOkPwd">인증완료</div>
	        </div>	 
	        <div id="space_8"></div>  
	        <div id="space_7"></div>    
	        <div id="emailConfirmBoxPwd">   	        	        
	        <input type="text" id="numberBoxPwd" placeholder="인증번호 10분이내 입력"
	        onfocus="this.placeholder=''" onblur="this.placeholder='인증번호 10분이내 입력'" autocomplete="off">	        	        	        	        
	        <div id="confirmMessagePwd"><label id="confirmLabelPwd">인증하기</label></div> 
	        </div>
	        </form>
	        <div id="space_10"></div>
	        <div id="space_7"></div>
	        <button id="idBtn3">비밀번호 확인</button>
	    </div>
	    </div>	  	    
	    </div>
	    </section>
	    <div id="footerSpaces"></div>
        <footer>
   	        <c:import url="../common/footer.jsp" />
	    </footer>        
       
       <script>
           $(function(){
        	   $('#id').on('click',function(){
        		  $('#searchId').css('display','inline-block');
        		  $('#searchPwd').css('display','none');
        		  $('.tab li').css({'background' : 'rgb(246, 246, 246)', 'border-bottom-color' : 'rgb(213,213,213)'});        		
          		  $(this).css({'border-bottom-color' : 'white', 'background' : 'white'});   
          		  $('input:radio[id=checkPhone_1]').prop('checked','true');
          		  $('#phone').show();
  			      $('#email').hide();
  			      $('#pwdEmail').hide();
  			      
  			      $('#emailConfirmBox').css("display","none");
  			      $("#sendMessage2").remove();
				  $("#sendMessage").css("display","inline-block");
				  $("#certificationOk").css("display","none");
				  $("#emailText").attr("readonly",false);
				  
				  $('#emailConfirmBoxPwd').css("display","none");
    			  $("#sendMessagePwd2").remove();
				  $("#sendMessagePwd").css("display","inline-block");
				  $("#certificationOkPwd").css("display","none");
				  $("#emailTextPwd").attr("readonly",false);
				  
				  $("#nameBox2").val("");
				  $("#emailText").val("");
				  $("#nameBox").val("");
				  $("#phoneBox").val("");
				  $("#idBoxPwd").val("");
				  $("#emailTextPwd").val("");
				  $("#numberBox").val("");
				  $("#numberBoxPwd").val("");
        	   });
        	   
        	   $('#pwd').on('click',function(){
         		  $('#searchId').css('display','none');
         		  $('#searchPwd').css('display','inline-block');
         		  $('.tab li').css({'background' : 'rgb(246, 246, 246)', 'border-bottom-color' : 'rgb(213,213,213)'});        		
         		  $(this).css({'border-bottom-color' : 'white', 'background' : 'white'});
         		  $('input:radio[id=checkEmail_3]').prop('checked','true');
         		  $('#pwdEmail').show();
   			      $('#email').hide();
   			      $('#phone').hide();
   			      
   			      $('#emailConfirmBox').css("display","none");
			      $("#sendMessage2").remove();
				  $("#sendMessage").css("display","inline-block");
				  $("#certificationOk").css("display","none");
				  $("#emailText").attr("readonly",false);
				  
   			      $('#emailConfirmBoxPwd').css("display","none");
 			      $("#sendMessagePwd2").remove();
				  $("#sendMessagePwd").css("display","inline-block");
				  $("#certificationOkPwd").css("display","none");
				  $("#emailTextPwd").attr("readonly",false);
			     
			      $("#nameBox2").val("");
				  $("#emailText").val("");
				  $("#nameBox").val("");
				  $("#phoneBox").val("");
				  $("#idBoxPwd").val("");
				  $("#emailTextPwd").val("");
				  $("#numberBox").val("");
				  $("#numberBoxPwd").val("");
         	   });
        	   
        	   $('input:radio[name=idPhoneEmail]').click(function(){
        		  if($('input:radio[id=checkPhone_1]').is(':checked')){
        			  $('#phone').show();
        			  $('#email').hide();
        			  $('#pwdEmail').hide();
        			  $('#emailConfirmBox').css("display","none");
        			  $("#sendMessage2").remove();
					  $("#sendMessage").css("display","inline-block");
					  
					  $('#emailConfirmBox').css("display","none");
	  			      $("#sendMessage2").remove();
					  $("#sendMessage").css("display","inline-block");
					  $("#certificationOk").css("display","none");
					  $("#emailText").attr("readonly",false);
					  
					  $('#emailConfirmBoxPwd').css("display","none");
        			  $("#sendMessagePwd2").remove();
					  $("#sendMessagePwd").css("display","inline-block");
					  $("#certificationOkPwd").css("display","none");
					  $("#emailTextPwd").attr("readonly",false);
					  
					  $("#nameBox2").val("");
					  $("#emailText").val("");
					  $("#nameBox").val("");
					  $("#phoneBox").val("");
					  $("#idBoxPwd").val("");
					  $("#emailTextPwd").val("");
					  $("#numberBox").val("");
					  $("#numberBoxPwd").val("");
        		  } else if($('input:radio[id=checkEmail_1]').is(':checked')) {
        			  $('#email').show();
        			  $('#phone').hide();
        			  $('#pwdEmail').hide();
        			  
        			  $('#emailConfirmBox').css("display","none");
      			      $("#sendMessage2").remove();
    				  $("#sendMessage").css("display","inline-block");
    				  $("#certificationOk").css("display","none");
    				  $("#emailText").attr("readonly",false);
    				  
        			  $('#emailConfirmBoxPwd').css("display","none");
        			  $("#sendMessagePwd2").remove();
					  $("#sendMessagePwd").css("display","inline-block");
					  
					  $('#emailConfirmBoxPwd').css("display","none");
        			  $("#sendMessagePwd2").remove();
					  $("#sendMessagePwd").css("display","inline-block");
					  $("#certificationOkPwd").css("display","none");
					  $("#emailTextPwd").attr("readonly",false);
					  
					  $("#nameBox2").val("");
					  $("#emailText").val("");
					  $("#nameBox").val("");
					  $("#phoneBox").val("");
					  $("#idBoxPwd").val("");
					  $("#emailTextPwd").val("");
					  $("#numberBox").val("");
					  $("#numberBoxPwd").val("");
        		  } else if($('input:radio[id=checkEmail_3]').is(':checked')){
         			 $('#pwdEmail').show();
       			     $('#email').hide();
       			     $('#phone').hide();
       			     
       			     $('#emailConfirmBox').css("display","none");
  			         $("#sendMessage2").remove();
				     $("#sendMessage").css("display","inline-block");
				     $("#certificationOk").css("display","none");
				     $("#emailText").attr("readonly",false);
				  
       			     $('#emailConfirmBoxPwd').css("display","none");
    			     $("#sendMessagePwd2").remove();
				     $("#sendMessagePwd").css("display","inline-block");
				     $("#certificationOkPwd").css("display","none");
				     $("#emailTextPwd").attr("readonly",false);
				     
				     $("#nameBox2").val("");
					 $("#emailText").val("");
					 $("#nameBox").val("");
					 $("#phoneBox").val("");
					 $("#idBoxPwd").val("");
					 $("#emailTextPwd").val("");
					 $("#numberBox").val("");
					 $("#numberBoxPwd").val("");
         		  }  			  
         		  });
        	   
           });
           
           
           // 아이디 찾기 (휴대폰번호)
           $('#idBtn').on('click',function(){
        	   var name= $("#nameBox").val();
        	   var phone= $("#phoneBox").val();
        	   
        	   if(name == ""){
        		   swal("이름을 입력해주세요.");
        	   } else if(name.search(/\s/) != -1){
        		   swal("이름은 공백없이 입력해주세요.");
        	   } else if(phone == ""){
        		   swal("휴대폰 번호를 입력해주세요.");
        	   } else if(phone.search(/\s/) != -1){
        		   swal("휴대폰 번호는 공백없이 입력해주세요.");
        	   } else {
        		   $('#searchIdPhone').submit(); 
        	   }   
           });
           
        
           // 메일인증
           $("#sendMessage").click(function(){
        	   var email = $("#emailText").val();
          	   var check = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/;
          	   var test = check.test(email);
          	   
          	 if(email == ""){
       		     swal("이메일을 입력해주세요.");
             } else if(email.search(/\s/) != -1){
            	 swal("이메일은 공백없이 입력해주세요.");
             } else if(!test){
            	 swal("이메일의 형식에 맞게 입력해주세요.\n\n ** 예시 : example@naver.com **");
       	     } else {
       	       $('#numberBox2').css("display","inline-block");
       	    	
      		   swal("인증메일이 발송되었습니다!", "입력하신 이메일로 인증메일이 발송되었습니다.\n메일 전송에는 다소 시간이 걸릴 수 있습니다.\n메일함을 확인하여 인증코드를 입력해주세요💌");
      		   
      		   $('#sendMessage').css("display","none");
      		   $('#emailConfirmBox').css("display","inline-block");
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
    						 swal("인증번호가 만료되었습니다!", "이메일 인증을 다시 진행해주세요. 감사합니다.");								 
    						 $("" + elementName).remove();
    						 $('#emailConfirmBox').css("display","none");
    						 $("#emailText").attr("readonly",false);
    						 $('#sendMessage').css("display","inline-block");
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
    			 countdown("#sendMessage2",10,0);
    			 
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
      						var cerNum = $("#numberBox").val();
      						
      						if(cerNum == randomKey){
      							swal("메일 인증이 완료되었습니다😊");	
      							
      							$('#emailConfirmBox').css("display","none");
      							$("#sendMessage2").remove();
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
           
           
           // 아이디찾기(이메일)
           $('#idBtn2').on('click',function(){
        	   var emailResult = "no";
        	   var email = $("#emailText").val();
        	   var name = $("#nameBox2").val();
        	   
        	   if($("#certificationOk").css("display") == "none"){
        		   emailResult = "no";
        	   } else if($("#certificationOk").css("display") == "inline-block") {
        		   emailResult = "ok";
        	   }
        	   
        	   if(name == ""){
         		  swal("이름을 입력해주세요.");
               } else if(name.search(/\s/) != -1){
              	  swal("이름은 공백없이 입력해주세요.");
               } else if(emailResult == "no"){
            	  swal("이메일 인증을 해주세요.");
               } else {
            	   $('#searchIdEmail').submit();
               }
            });
           
           
        // 메일인증
           $("#sendMessagePwd").click(function(){
        	   var email = $("#emailTextPwd").val();
          	   var check = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/;
          	   var test = check.test(email);
          	   
          	 if(email == ""){
       		     swal("이메일을 입력해주세요.");
             } else if(email.search(/\s/) != -1){
            	 swal("이메일은 공백없이 입력해주세요.");
             } else if(!test){
            	 swal("이메일의 형식에 맞게 입력해주세요.\n\n ** 예시 : example@naver.com **");
       	     } else {
       	       $('#numberBoxPwd').css("display","inline-block");
       	    	
      		   swal("인증메일이 발송되었습니다!", "입력하신 이메일로 인증메일이 발송되었습니다.\n메일 전송에는 다소 시간이 걸릴 수 있습니다.\n메일함을 확인하여 인증코드를 입력해주세요💌");
      		   
      		   $('#sendMessagePwd').css("display","none");
      		   $('#emailConfirmBoxPwd').css("display","inline-block");
      		   $('#sendMessagePwd2').css("display","inline-block");
      		   $("#emailTextPwd").attr("readonly",true);
      		   
    			 // 타이머
    			 function countdown(elementName, minutes, seconds){
    				 var elementName, endTime, hours, mins, msLeft, time;
    				 
    				 function twoDigits(n) {
    					 return (n <= 9 ? "0" + n : n);
    				 }
    				 
    				 function updateTimer(){
    					 msLeft = endTime - (+new Date);
    					 if(msLeft < 1000){
    						 swal("인증번호가 만료되었습니다!", "이메일 인증을 다시 진행해주세요. 감사합니다.");								 
    						 $("" + elementName).remove();
    						 $('#emailConfirmBoxPwd').css("display","none");
    						 $("#emailTextPwd").attr("readonly",false);
    						 $('#sendMessagePwd').css("display","inline-block");
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
    			 countdown("#sendMessage2",10,0);
    			 
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
      					
      					$("#confirmMessagePwd").click(function(){
      						var cerNum = $("#numberBoxPwd").val();
      						
      						if(cerNum == randomKey){
      							swal("메일 인증이 완료되었습니다😊");	
      							
      							$('#emailConfirmBoxPwd').css("display","none");
      							$("#sendMessagePwd2").remove();
      							$("#certificationOkPwd").css("display","inline-block");
      							$("#emailTextPwd").attr("readonly",true);
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
           
           
        // 비밀번호찾기(이메일)
           $('#idBtn3').on('click',function(){
        	   var emailResult = "no";
        	   var email = $("#emailTextPwd").val();
        	   var id = $("#idBoxPwd").val();
        	   
        	   if($("#certificationOkPwd").css("display") == "none"){
        		   emailResult = "no";
        	   } else if($("#certificationOkPwd").css("display") == "inline-block") {
        		   emailResult = "ok";
        	   }
        	   
        	   if(id == ""){
         		  swal("아이디를 입력해주세요.");
               } else if(id.search(/\s/) != -1){
              	  swal("아이디는 공백없이 입력해주세요.");
               } else if(emailResult == "no"){
            	  swal("이메일 인증을 해주세요.");
               } else {
            	   $('#searchPwdEmail').submit();
               }
            });
           
       </script>                 
    
</body>
</html>