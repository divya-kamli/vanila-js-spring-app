<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Kalkul Technologies</title>
<link href="../resources/css/main.css" rel="stylesheet"/>
<link href="../resources/css/carostyle.css" rel="stylesheet"/>	
	
<script src="../resources/js/home.js"></script>
</head>
<body onload="javascript: onLoadMod();">
<jsp:include page="header.jsp"></jsp:include>
	<div class="container" id="container">
		<div id="news" class="divContent">
			<jsp:include page="news.jsp"></jsp:include>
		</div>
		<div id="home" class="divContent">
			<jsp:include page="k_carousel.jsp"></jsp:include>
		</div>
		<div class="divContent" id="contact">
			<jsp:include page="contact.jsp"></jsp:include>
		</div>
		<div class="divContent" id="about" >
			<h2>About my company</h2>
		</div>
	</div>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>