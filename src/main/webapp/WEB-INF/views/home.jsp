<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>전국방방곡곡</title>
	
	<!--  home.css -->
    <link rel="stylesheet" href="resources/css/common/home.css">

</head>
<body>

	<div class="total_container">
		<!-- 메뉴바 -->
    	<header>
    		<c:import url="common/menubar.jsp" />   
    	</header>
    
    	<!--  메인배너 -->
	    <section>
	    	<!-- 각자 구현할 부분  -->
	    	<img src="resources/images/메인배너1.JPG" id="mainBanner">
	    	<div style="height: 1000px;"></div>
	    </section>
	    
	    <!-- footer -->
	    <footer></footer>
    </div>
</body>
</html>
