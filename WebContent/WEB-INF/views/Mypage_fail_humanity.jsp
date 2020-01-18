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

<title>Petriots! | 인성검사 탈락</title>
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

<jsp:include page="navigationBar.jsp"/>

<!-- //Navigation -->


</header>
<jsp:include page="/WEB-INF/views/mypageSideMenu.jsp"/>

<!-- 메인 콘텐츠 -->
<div class="container">

	<div class="row" style="display:flex; flex-direction: column;">

		<!-- 위탁 중인 항목.. -->
		<div class="col-lg-12" align="center" style=" background-color:rgba(108, 201, 251,0.3);">
			<div style="height:30px;"><span style="font-size: 15pt; font-weight: bold;">인성검사 탈락</span></div>
				<div style="height:800px; background:url('https://images.unsplash.com/photo-1453227588063-bb302b62f50b?ixlib=rb-1.2.1&w=1000&q=80');
					background-size:100%; background-repeat:no-repeat; ">
				 <div style="height:800px;background-color: rgba( 255, 255, 255, 0.5 ); padding-top: 300px;">
					<h1>아쉽네요...</h1>
					<h3>인성검사에 탈락하였습니다.</h3>
					<h3>돌아가기를 클릭하여 메인으로 돌아가시거나</h3>
					<h3>피치못할 사정으로 탈락하신 경우, 재시험 버튼을 클릭해주세요.</h3>
					
					<button type="button" class="btn btn-primary" onclick="location.href='mainpage.action'">홈으로</button>
					<button type="button" class="btn btn-danger" onclick="location.href='ruleForPetsitter.action'">재시험</button>
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