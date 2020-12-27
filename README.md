# :world_map: TRIP2REAP (국내 여행정보 웹사이트)
### 20.09.21 ~ 20.12.21

:ok_person: &nbsp; 팀장 : 김기쁨<br>
:family_woman_woman_girl_girl: 팀원 : 김수진, 이규호, 최은강

#

:globe_with_meridians: 개발환경
- Server : Apache Tomcat 9.0
- Database : Oracle 11g
- Development Tool : Eclipse 4.15.0, sqlDeveloper version 19.2.1.247, Apache Maven
- Development Language :  JAVA , HTML5, CSS3, JavaScript, jQuery, SQL, JSP
- Web Framework: spring, Mybatis
- Team Coop : Github, ERDCloud, kakaoOven
- API: Swal, Swipper, kakao map, kakao login, naver login, SMTP, I'mport


#

  :pencil2: 개요                                  
  포스트 코로나시대의 관광개발과 향후 전망 통계에 따르면 앞으로 국내여행자의 규모와 국내 숙소 이용률도 증가할 것이라고 합니다.  
  국내 여행 정보를 제공함과 동시에 숙소 예약 서비스까지 제공할 수 있는 사이트를 만들면 어떨까? 라는 생각으로<br> 
  국내여행사이트 “전국방방곡곡”을 개발하게 되었습니다
  
 
#

:calendar: 일정
- 9/21 ~ 9/25 기획회의 
- 9/26 ~ 10/1  UI설계회의 
- 10/2  ~ 10/5  DB설계회의(테이블 설계, 구축) 
- 10/13 ~ 11/8 UI 구현
- 11/9 ~ 12/15  기능구현
- 12/16  ~ 12/21 통합테스트<br><br>


### :raising_hand: 맡은 파트

:yellow_heart: 기쁨 
 - 로그인(일반 로그인, 카카오 로그인, 네이버 로그인) / 로그아웃 
 - 회원가입 / 아이디 찾기 / 비밀번호 찾기 / 아이디 저장 
 - 마이페이지(호텔예약정보 / 개인정보 수정 / 내가 담은 여행지 / 나만의 여행코스 / 회원탈퇴)
 - 여행코스 게시판 조회 / 등록 / 삭제
 - 메인페이지<br><br>



:purple_heart: 수진
- 여행지 게시판 조회 / 등록 / 수정 / 삭제 
- 카테고리 검색
- 해시태그 등록 / 수정 / 삭제 / 검색<br><br>



:green_heart: 규호
- 여행후기 게시판 조회 / 등록 / 수정 / 삭제
- 카테고리 검색
- 해시태그 검색
- 댓글 등록 / 수정 / 삭제<br><br>

 

:orange_heart: 은강
- 호텔 조회 / 등록 / 삭제
- 리뷰 등록 / 삭제
- 호텔 예약
- 리모컨(조회한 호텔/코스 리스트)<br><br>


#

:star: 설계 주안점
- 카카오톡 로그인, 네이버 로그인 API를 사용하여, 회원가입 없이도 사용자가 서비스를 이용할 수 있도록 하였다(편리성, 접근성 증가)
- 비밀번호 암호화를 통해 보안을 강화시켰다.
- 정규표현식을 사용하여 사용자가 입력한 정보에 대해 정해진 식에 맞춰 입력해야 회원가입이 될 수 있도록 있도록  유효성 검사를 하였다.
- 일부 기능은 비동기방식으로, 화면전환이 아닌 한페이지 내에서 동작할 수 있게 하였다.
- MyBatis 동적SQL문을 이용하여 사용자가 원하는 조건의 호텔 검색이 가능하게 하였다.
- 카카오 맵 API를 이용하여 여행지 게시판의 여행지 위치, 호텔 게시판의 호텔 위치를 시각적으로 자세히 보여준다.
- 호텔 등록 시 정규식, 세부 조건이 일치해야만 호텔 등록이 가능하다.
- swipper API를 활용하여 이미지 슬라이드 형식으로 호텔 사진들을 보여준다. 사용자에게 보기 편안한 UI를 제공한다.
- 오픈소스 결제시스템 API를 이용하여, 편리한 호텔 예약이 가능하다.
- 게시판 수정 시, 기존의 첨부파일을 삭제하고 새로운 첨부파일을 넣을 수 있도록 하였다.
- 회원과 비회원, 관리자를 구분하여 각각의 서비스를 제공한다.
- 해쉬태그와 카테고리를 이용하여 사용자가 쉽게 검색이 가능할 수 있도록 하였다.<br><br>


## :desktop_computer: 화면 일부<br><br>
 - 메인화면<br>

![](./images/main.JPG)
<br>
*메인화면은 자동으로 슬라이드 되면서 넘어가고, 버튼을 통해 수동으로 넘길수도 있습니다. <br>
화면 우측에는 최근에 본 호텔과 코스를 볼 수 있고, 카카오톡 고객센터 기능을 사용할 수 있습니다. <br> 
고객센터는 카카오톡 플러스 친구 TRIP2REAP과 연동되어 사용이 가능합니다. <br>
화면 상단에는 로그인과 회원가입 버튼이 있고, 사용자는 로그인을 통해 보다 다양한 서비스를 이용할 수 있습니다.* 

<br><br>

 - 로그인<br>

![](./images/login.JPG)
<br>
*① Modal을 이용하여, 모든 페이지 내에서 로그인창을 띄울 수 있도록 하였습니다. <br>
② 기본로그인, 카카오 로그인, 네이버 로그인이 가능하여 사용저의 편리성과 접근성을 증가시켰습니다. <br>
또한, 카카오 로그인과 네이버 로그인은 별도의 회원가입 없이 이용이 가능합니다.<br>
③ 아이디 저장 시 쿠키에 아이디를 저장하여, 다음 로그인 시 자동으로 아이디를 출력합니다.<br>
④ 휴대전화 또는 이메일을 통해 아이디를 찾을 수 있고, 아이디와 이메일을 통해 비밀번호를 변경할 수 있습니다.*


<br><br>

 - 회원가입<br>

![](./images/join.JPG)
<br>
각 항목마다 규칙에 어긋난 값을 입력할 경우 이렇게 빨간색 글씨로 알림메시지를 띄워줍니다. 
또 회원가입을 위해서는 반드시 이메일 인증을 해야하는데요~ 10분 안에 메일 인증을 완료해야 합니다. 시간이 초과되면 alert창이 뜨고, 다시 인증버튼이 생성됩니다. 

<br><br>

 - 마이페이지 일부<br>

![](./images/myPage.JPG)

<br><br>

 - 여행코스 리스트<br>

![](./images/courseList.JPG)
<br>
사용자가 만든 코스가 출력된다. 코스제목, 작성자, 여행코스, 총거리, 표지이미지를 볼 수 있다.
또한 사용자는 각 테마를 선택하여, 다양한 코스를 볼 수 있다.


<br><br>

 - 여행코스 조회<br>

![](./images/courseDetail.JPG)


<br><br>

 - 여행코스 등록<br>

![](./images/insertCourse1.JPG)
![](./images/insertCourse2.JPG) 
<br>
①사용자는 표지 이미지를 선택할 수 있습니다. 자바 스크립트를 사용하여, 사용자가 첨부한 이미지는 즉시 화면에 출력됩니다.
②사용자는 코스로 짜고싶은 장소를 키워드를 통해 검색할 수 있고, 여행코스로 추가할 수 있습니다. 사용자가 여행코스를 추가하면, 해당 장소의 이름, 위도, 경도 데이터를 파싱해옵니다. 파싱한 위도 경도를 활용하여 두 장소간의 거리를 계산하고, 오른쪽 화면에 여행지 이름과 두 장소간의 거리가 출력됩니다.
③지도에는 여행코스가 보기 쉽게 선 형태로 나타납니다. 저는 사용자가 동선을 생각하면서 효율적으로 코스를 짤 수 있도록 기능을 구현해 보았습니다.
*각 장소마다의 이름, 경도, 위도를, 또 다음 장소의 이름, 경도 위도를 모두 저장해야 하기에, 데이터 관리의 문제가 발생하였습니다. 이를 해결하고자 데이터 베이스 등록시 하나의 문자열로 묶었고 쉼표로 구분해 주었습니다.최종적으로 데이터베이스에는 String 타입으로 들어갑니다. 그리고 쉼표로 구성된 문자열을, 뷰로 그대로 가져와 jstl의 split 함수를 활용하여 배열로 변경해주었습니다. 최종적으로 배열을 가지고 여행코스 리스트를 출력합니다.


<br><br>
