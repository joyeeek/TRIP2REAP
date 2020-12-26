<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<!DOCTYPE html>
<html>
<head>
	<title>전국방방곡곡</title>
	
	<!--  home.css -->
    <link rel="stylesheet" href="resources/css/common/home.css">

</head>
<body>

	<div class="total_container">
		<!-- 메뉴바 -->

    	<c:import url="WEB-INF/views/common/menubar.jsp" />
  
    
    	<!--  메인배너 -->
	    <section>
	    	<div id="section_div">
	    	<!-- 각자 구현할 부분  -->
	    	<img src="resources/images/메인배너2.JPG" id="mainBanner">
	    	<div style="height: 1000px;"></div>
	    	</div>
	    </section>
	    
	    
	    <!-- footer -->
	    <footer></footer>
    </div>
</body>
</html>	    	
	    