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
<title>펫시터 측면 사이드 메뉴바</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css" />
<!-- <script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script> -->
<!-- <script src="//code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script> -->

<style type="text/css">
.side-menu {
  font-family: 명조체;
  
  position: fixed;
  top: 0;
  left: 0;
  margin: 0;
  padding: 0;
  height: 100%;
  width: 60px;
  list-style-type: none;
  background: rgba(108, 201, 251,0.3);
  overflow: hidden;
  transition: width .5s;
  z-index: 99;
}

.side-menu:hover {
  width: 250px;
}

.side-menu li {
  width: 300px;
}

.side-menu li span {
  font-size: 20px;
  margin: 20px 30px 0 22px;
}

.side-menu li a {
  display: block;
  font-size: 20px;
  text-decoration: none;
  color: #fff;
  height: 60px;
}

.side-menu li a:hover
{
  background: #fff;
  color: #6cc9fb;
  display: block;
}
.side-menu li:first-child a
{
  background: #6cc9fb;
  display: block;
   font-size: 20px;
  text-decoration: none;
  color: #fff;
  height: 70px;
}


</style>

<script type="text/javascript">



</script>

</head>

<div>
	<ul class="side-menu">
	<li><a href="#"><span class="fa square"></span>Petriots!</a></li>
	<li><a href="petsittermain.action"><span class="fa fa-square"></span>펫시터 마이 페이지</a></li>
	<li><a href="petsitterprofilemodifyform.action"><span class="fa fa-square"></span>내 프로필 수정</a></li>
	<li><a href="petsitterreservationnow.action"><span class="fa fa-square"></span>위탁 중 / 예약 중</a></li>
	<li><a href="petsitterreservationrequest.action"><span class="fa fa-square"></span>예약 요청 확인</a></li>
	<li><a href="petsitterreservationlist.action"><span class="fa fa-square"></span>지난 위탁 조회</a></li>
	<li><a href="petsitterquestlist.action"><span class="fa fa-square"></span>내 업적</a></li>
	<li><a href="petsitterlikelist.action"><span class="fa fa-square"></span>나를 찜한 사람</a></li>
	<li><a href="petsitterblacklist.action"><span class="fa fa-square"></span>블랙리스트</a></li>
	
	</ul>
</div>
<!-- 
fa fa-cog"></span>내정보수정</a><
fa fa-font"></span></a></li>
fa fa-caret-square-o-right">
fa fa-check-square"></span><
fa  fa-square"></span></a></
fa fa-bars"></span></a></li>
 -->
 
 

</html>