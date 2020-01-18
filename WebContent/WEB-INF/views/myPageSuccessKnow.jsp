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

<title>Petriots! | 지식검사 통과</title>
<link href="vendor_mypage/bootstrap/css/bootstrap.css" rel="stylesheet">
<link href="css/mainpage.css" rel="stylesheet">
<!-- Bootstrap core JavaScript -->
<script src="vendor_mypage/jquery/jquery.min.js"></script>
<script src="vendor_mypage/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  
<style type="text/css">
@import url(https://fonts.googleapis.com/css?family=Raleway:300,700);

</style>

<script type="text/javascript">

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
<jsp:include page="/WEB-INF/views/mypageSideMenu.jsp"/>

<!-- 메인 콘텐츠 -->
<div class="container">

	<div class="row" style="display:flex; flex-direction: column;">

		<!-- 위탁 중인 항목.. -->
		<div class="col-lg-12" align="center" style=" background-color:rgba(108, 201, 251,0.3);">
			<div style="height:30px;"><span style="font-size: 15pt; font-weight: bold;"></span></div>
				<div style="height:800px; background:url('https://www.arflife.org/thumbs/750x486/files/farW/happy_goldie_dog_750x486_36385.jpg');
					background-size:100%; background-repeat:no-repeat; ">
				 <div style="height:800px;background-color: rgba( 255, 255, 255, 0.8 ); padding-top: 300px;">
					<h1>축하합니다!</h1>
					<h3>이제 페트리어츠에서 펫시팅 활동을 시작할 수 있습니다!</h3>
					<h3>다음 버튼을 클릭해서 펫시터 프로필을 작성해 주세요!</h3>
					
					<button type="button" class="btn btn-success" onclick="location.href='Mypage_apply_petsitter.jsp'">프로필 작성</button>
					<button type="button" class="btn btn-secondary" onclick="">다음에 작성</button>
				 </div>
				</div>

				
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