<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
   <!--  searchId.css -->
      <link rel="stylesheet" href="resources/css/member/searchPwd.css">  
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
                <li id="id" class="tab-link" >아이디 찾기</li>
                <li id="pwd" class="tab-link current">비밀번호 찾기</li>
            </ul>
        
        <!-- 아이디 찾기  -->  
        <div id="searchId">
            <div id="searchId_2"></div>
	        <input type="radio" id="checkPhone_1" name="idPhoneEmail">
	        <label id="checkPhone_2">휴대전화로 찾기</label>
	        <input type="radio" id="checkEmail_1" name="idPhoneEmail">
	        <label id="checkEmail_2">이메일로 찾기</label>
	    </div>  
	    
	    <!-- 비밀번호 찾기  -->
	    <div id="searchPwd">
	        <div id="space_5"></div>
	        <input type="radio" id="checkEmail_3" name="idPhoneEmail" checked="checked">
	        <label id="checkEmail_4" >이메일로 찾기</label>
	    </div>
	    
	    <!-- 아이디 찾기 : 내용  -->
	    <div id="space_6"></div>
	    <div id="phone">
	        <div id="space_7"></div>
	        <input type="text" id="nameBox" placeholder="이름" 
	        onfocus="this.placeholder=''" onblur="this.placeholder='이름'" autocomplete="off">
	        <div id="space_8"></div>	
	        <div id="space_7"></div>	        
	        <input type="text" id="phoneBox" placeholder="휴대전화 -없이 입력"
	        onfocus="this.placeholder=''" onblur="this.placeholder='휴대전화 -없이 입력'" autocomplete="off">
	        <div id="space_9"></div>
	        <div id="space_7"></div>
	        <button id="idBtn">아이디 확인</button>
	    </div>
	    <div id="email">
	    <div id="space_7"></div>
	        <input type="text" id="idBox" placeholder="아이디" 
	        onfocus="this.placeholder=''" onblur="this.placeholder='아이디'" autocomplete="off">
	        <div id="space_8"></div>	
	        <div id="space_7"></div>	        
	        <input type="text" id="emailBox" placeholder="이메일"
	        onfocus="this.placeholder=''" onblur="this.placeholder='이메일'" autocomplete="off">
	        <div id="space_8"></div>	
	        <div id="space_7"></div>	        
	        <input type="text" id="numberBox" placeholder="인증번호 10분이내 입력"
	        onfocus="this.placeholder=''" onblur="this.placeholder='인증번호 10분이내 입력'" autocomplete="off">	        	        
	        <div id="space_9"></div>
	        <div id="space_7"></div>
	        <button id="idBtn2">아이디 확인</button>
	    </div>
	    
	    <!-- 비밀번호 찾기 : 내용  -->
	    <div id="pwdEmail">
	    <div id="space_7"></div>
	        <input type="text" id="idBox2" placeholder="아이디" 
	        onfocus="this.placeholder=''" onblur="this.placeholder='아이디'" autocomplete="off">
	        <div id="space_8"></div>	
	        <div id="space_7"></div>	        
	        <input type="text" id="emailBox2" placeholder="이메일"
	        onfocus="this.placeholder=''" onblur="this.placeholder='이메일'" autocomplete="off">
	        <div id="space_8"></div>	
	        <div id="space_7"></div>	        
	        <input type="text" id="numberBox2" placeholder="인증번호 10분이내 입력"
	        onfocus="this.placeholder=''" onblur="this.placeholder='인증번호 10분이내 입력'" autocomplete="off">	        	        
	        <div id="space_9"></div>
	        <div id="space_7"></div>
	        <button id="idBtn3">비밀번호 확인</button>
	    </div>
	    </div>	          
       
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
         	   });
        	   
        	   $('input:radio[name=idPhoneEmail]').click(function(){
        		  if($('input:radio[id=checkPhone_1]').is(':checked')){
        			  $('#phone').show();
        			  $('#email').hide();
        			  $('#pwdEmail').hide();
        		  } else if($('input:radio[id=checkEmail_1]').is(':checked')) {
        			  $('#email').show();
        			  $('#phone').hide();
        			  $('#pwdEmail').hide();
        		  } else if($('input:radio[id=checkEmail_3]').is(':checked')){
         			 $('#pwdEmail').show();
       			     $('#email').hide();
       			     $('#phone').hide();
         		  }  			  
         		  });
        	   
           });
       </script>
       
        </div>
    
    </section>
    <div style="height:1000px;"></div>
    
    
</body>
</html>