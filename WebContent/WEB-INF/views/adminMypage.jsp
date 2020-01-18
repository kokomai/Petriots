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

<title>Admin_mypage.jsp</title>
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

<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
	<script>
		$(document).ready( function() {
			$("#read").text("관리자페이지");
		});
		$(window).load( function() {
			$("#load").text("왼쪽사이드메뉴 이용");
		});
	</script>
	
	<script type="text/javascript">

   $(function()
   {
      $(".btnSubmit").on("click", function()
      {
    	  alert("로그아웃 되었습니다");
         $("#buttonForm").attr("action", "adminlogout.action");
      });
      
   });

</script>

<script type="text/javascript">
	function login()
	{
		alert("${sessionScope.admin_num.getAdmin_num()}");
	}
</script>



</head>
<body>

<header style="padding-left: 60px;">

<!-- banner -->
<jsp:include page="/WEB-INF/views/banner.jsp"/>
<!-- //banner -->
</header>
<jsp:include page="/WEB-INF/views/adminPageSideMenu.jsp"/>

<!-- 메인 콘텐츠 -->
<div class="container">

	
			

	
	<table>
	<tr>
	<td><img alt="" src="https://img1.daumcdn.net/thumb/R720x0.q80/?scode=mtistory2&fname=http%3A%2F%2Fcfile26.uf.tistory.com%2Fimage%2F9991CF3C5C9D203609129F"
			 style="margin: 10px 60px 60px 10px; height: 600px;" onclick="login();">		
	</td>	
	<td><h1><p id="read" align="center" style="margin: 100px;" style="rowspan2">로딩중!</p></h1></td>
	
	
		<td  align="center">
			<form action="adminlogout.action" method="post" role="form" id="buttonForm">
				<button type="submit" class="btn btn-primary btn-sm btnSubmit"   style="margin: 40px 0px 0px 90px; height: 50px; width: 150px;" >로그아웃</button>
			</form>
		</td>
	
	
	</tr>
	
	</table>			
			

</div>

<!-- /.container -->
<!-- // 메인 콘텐츠 -->

<br>

<!-- Footer -->
	<footer class="py-5" style="margin: 163px 0px 0px 60px; width: 1858px; background-color: rgba(108, 201, 251,0.3)">
		<div class="container">
			<p class="m-0 text-center text-white">Copyright &copy; Petriots! 2019</p>
		</div>
		<!-- /.container -->
	</footer>
<!-- /Footer -->

</body>
</html>