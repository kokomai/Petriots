<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
   request.setCharacterEncoding("UTF-8");
   String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Petriots! | 메인</title>
<link href="css/mainpage.css" rel="stylesheet">
<link
   href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.4.1/css/swiper.min.css"
   rel="stylesheet">
<link href="vendor_mypage/bootstrap/css/bootstrap.css" rel="stylesheet">

<script src="js/bootstrap.min.js"></script>
<script src="vendor_mypage/bootstrap/js/bootstrap.bundle.min.js"></script>

<script
   src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
<script
   src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.4.1/js/swiper.min.js"></script>
<script
   src="https://cdnjs.cloudflare.com/ajax/libs/gsap/2.0.2/TweenMax.min.js"></script>


</head>
<body>
	<div style="width: 100%; height: 60px;">
	<jsp:include page="/WEB-INF/views/navigationBar.jsp"></jsp:include>
	</div>

   <div>
   	<jsp:include page="/WEB-INF/views/banner.jsp"></jsp:include>
   </div>
    
    <div>
    
    <jsp:include page="/WEB-INF/views/searchfilter.jsp"></jsp:include>
    </div>
    
  
<!-- Footer -->
<jsp:include page="footer.jsp"></jsp:include>
<!-- /Footer -->



</body>
</html>