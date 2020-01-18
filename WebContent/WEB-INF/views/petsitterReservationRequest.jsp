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
<meta name="description" content="">
<meta name="author" content="">

<title>Petriots! | 예약 요청 확인</title>
<link rel="stylesheet" href="css_mypage/cards_hyunwoo.css" />
<link href="vendor_mypage/bootstrap/css/bootstrap.css" rel="stylesheet">
<link rel="stylesheet" href="//code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" />
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="//code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<link href="css/mainpage.css" rel="stylesheet">
<!-- Bootstrap core JavaScript -->
<script src="vendor_mypage/jquery/jquery.min.js"></script>
<script src="vendor_mypage/bootstrap/js/bootstrap.bundle.min.js"></script>


<style type="text/css">
@import url(https://fonts.googleapis.com/css?family=Raleway:300,700);

</style>

<script type="text/javascript">
	$(function()
		{
			$(".requestdetail").click(function()
			{
				var num = $(this).attr('id');
				
				/* alert(num); */
				 $("#requestdetailForm"+num).submit();
			});
		
		
		});
	
	

</script>

</head>
<body>

<header style="padding-left: 60px;">
<!-- Navigation -->

<jsp:include page="/WEB-INF/views/navigationBar.jsp"/>
<!-- //Navigation -->

<!-- banner -->
<jsp:include page="/WEB-INF/views/banner.jsp"/>
<!-- //banner -->
</header>
<jsp:include page="/WEB-INF/views/petsitterSideMenu.jsp"/>

<!-- 메인 콘텐츠 -->
<div class="container">

	<div class="row" style="display:flex; flex-direction: row;">
		
		<div class="col-lg-12" align="center" style="border: 1px solid silver;">
		<div class="card-header" style="width: 100%; background-color: rgba(108, 201, 251,0.3)">예약 요청 확인</div>
			<c:forEach var="list" items="${reserverequestlist }">
			<form action="petsitterrequestdetail.action" method="GET" id="requestdetailForm${list.r_a_num }" class="requestdetailForm">
			<!-- 요청된 위탁 정보 -->
				<div class="container_card">
				  <div class="card-media">
				    <!-- media container -->
				    <div class="card-media-object-container">
				    	<!-- URL 안에 펫시터 사진.. -->
				      <div class="card-media-object" style="background-image: url(${list.profile_img});"></div>
				      <ul class="card-media-object-social-list">
				        <li>
				         <!-- 맡긴 반려동물 사진 -->
				          <img src="${list.pet_img }" class=""
				          	style="width:100%; position: relative; bottom:10px;">
				        </li>
				      </ul>
				    
				    </div>
				    <!-- body container -->
				    <div class="card-media-body">
				      <div class="card-media-body-top">
				        <span class="subtle">${list.address }</span>
				        <div class="card-media-body-top-icons u-float-right">
				          <a href="#/" class="card-media-body-supporting-bottom-text card-media-link u-float-right"></a>
				        </div>
				      </div>
				      <span class="card-media-body-heading">유저 아이디 : <c:set var="list" value="${list}" scope="request"></c:set><jsp:include page="user_button_L.jsp"></jsp:include></span>
				      <div class="card-media-body-supporting-bottom">
				        <span class="card-media-body-supporting-bottom-text subtle"></span>
				      </div>
				      <div class="card-media-body-supporting-bottom card-media-body-supporting-bottom-reveal">
				        <span class="card-media-body-supporting-bottom-text subtle">맡긴 반려동물 : <span style="font-weight: bold;">${list.pet_name }</span></span>
				        <a href="#" class="card-media-body-supporting-bottom-text card-media-link u-float-right requestdetail" id="${list.r_a_num }">더보기</a>
				        <input type="text" name="r_a_num" value="${list.r_a_num }" hidden="hidden">
				      </div>
				    </div>
				  </div>
				  
				</div>
				</form>
			</c:forEach>
			<!-- // 요청된 위탁 정보 -->
			
			
				<!--  요청된 위탁 정보 없을 때.. -->
				<c:if test="${empty reserverequestlist }">
				<div class="container_card">
				  
				  <div class="card-media">
				    <!-- media container -->
				    <div class="card-media-object-container">
				    	<!-- URL 안에 펫시터 사진.. -->
				      <div class="card-media-object" style="background-color: white;"></div>
				      <ul class="card-media-object-social-list">
				        <li>
				         <!-- 맡긴 반려동물 사진 -->
				          <img src="" class=""
				          	style="width:100%; position: relative; bottom:10px;">
				        </li>
				      </ul>
				    
				    </div>
				    <!-- body container -->
				    <div class="card-media-body">
				      <div class="card-media-body-top">
				        <span class="subtle"></span>
				        <div class="card-media-body-top-icons u-float-right">
				          <a href="#/" class="card-media-body-supporting-bottom-text card-media-link u-float-right"></a>
				        </div>
				      </div>
				      <span class="card-media-body-heading">신청된 예약 정보가 없습니다..</span>
				      <div class="card-media-body-supporting-bottom">
				        <span class="card-media-body-supporting-bottom-text subtle"></span>
				        <span class="card-media-body-supporting-bottom-text subtle u-float-right"><span class="text-warning"></span></span>
				      </div>
				      <div class="card-media-body-supporting-bottom card-media-body-supporting-bottom-reveal">
				        <span class="card-media-body-supporting-bottom-text subtle"> <span style="font-weight: bold;"></span></span>
				        <a href="#/" class="card-media-body-supporting-bottom-text card-media-link u-float-right"></a>
				      </div>
				    </div>
				  </div>
				  
				</div>
				</c:if>
			<!-- // 요청된 위탁 정보 없을때 -->
		</div>

	</div>
</div>
<!-- /.container -->
<!-- // 메인 콘텐츠 -->

<br>

<!-- Footer -->
	<footer class="py-5" style="padding-left: 60px; background-color: rgba(108, 201, 251,0.3)">
		<div class="container">
			<p class="m-0 text-center text-white">Copyright &copy; Petriots! 2019</p>
		</div>
		<!-- /.container -->
	</footer>
<!-- /Footer -->

</body>
</html>