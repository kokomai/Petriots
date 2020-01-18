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

<title>Petriots! | 지식검사 탈락</title>
<link href="vendor_mypage/bootstrap/css/bootstrap.css" rel="stylesheet">
<link href="css/mainpage.css" rel="stylesheet">
<!-- Bootstrap core JavaScript -->
<script src="vendor_mypage/jquery/jquery.min.js"></script>
<script src="vendor_mypage/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  
<style type="text/css">
@import url(https://fonts.googleapis.com/css?family=Raleway:300,700);

</style>


</head>
<body>

<header style="padding-left: 60px;">
<!-- Navigation -->

<jsp:include page="/WEB-INF/views/navigationBar.jsp"/>

<!-- //Navigation -->

</header>
<jsp:include page="/WEB-INF/views/mypageSideMenu.jsp"/>

<!-- 메인 콘텐츠 -->
<div class="container">

	<div class="row" style="display:flex; flex-direction: column;">

		<!-- 위탁 중인 항목.. -->
		<div class="col-lg-12" align="center" style=" background-color:rgba(108, 201, 251,0.3);">
			<div style="height:30px;"><span style="font-size: 15pt; font-weight: bold;">지식검사 탈락</span></div>
				<div style="height:800px; background:url('https://www.catster.com/wp-content/uploads/2018/05/A-gray-cat-crying-looking-upset.jpg');
					background-size:100%; background-repeat:no-repeat; ">
				 <div style="height:800px;background-color: rgba( 255, 255, 255, 0.7 ); padding-top: 300px;">
					<h1>아쉽네요...</h1>
					<h3>지식검사에 탈락하였습니다.</h3>
					<h3>바로 재시험을 보시려면 재시험 버튼을,</h3>
					<h3>다음에 보시려면 홈으로 버튼을 클릭해 주세요</h3>
					<br><br>
					<button type="button" class="btn btn-primary" onclick="">재시험</button>
					<button type="button" class="btn btn-secondary" onclick="">홈으로</button>
				 </div>
				</div>

				
			</div>

 	</div>
</div>
<!-- /.container -->
<!-- // 메인 콘텐츠 -->

<br>

<!-- Footer -->
<jsp:include page="footer.jsp"></jsp:include>
<!-- /Footer -->

</body>
</html>