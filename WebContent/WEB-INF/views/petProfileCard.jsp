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
<title>Insert title here</title>

<link href="vendor_mypage/bootstrap/css/bootstrap.css" rel="stylesheet">
<link href='https://fonts.googleapis.com/css?family=Lato:400,300' rel='stylesheet' type='text/css'>
<script src="//code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>

<style type="text/css">
@import url(https://fonts.googleapis.com/css?family=Open+Sans:300,400,600);
@import url(https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css);
.snip1344 {
  font-family: 'Open Sans', Arial, sans-serif;
  position: relative;
  overflow: hidden;
  margin: 10px;
  min-width: 230px;
  max-width: 315px;
  width: 100%;
  color: #ffffff;
  text-align: center;
  line-height: 1.4em;
  background-color: rgba(108, 201, 251,0.3);
  
}
.snip1344 * {
  -webkit-box-sizing: border-box;
  box-sizing: border-box;
  -webkit-transition: all 0.25s ease;
  transition: all 0.25s ease;
  
}
.snip1344 .background {
  width: 100%;
  vertical-align: top;
  opacity: 0.2;
  -webkit-filter: contrast(200%) blur(10px);
  filter: contrast(200%) blur(10px) ;
  -webkit-transition: all 2s ease;
  transition: all 2s ease;
}
.snip1344 figcaption {
  width: 100%;
  padding: 15px 300px;
  position: absolute;
  left: 0;
  top: 10%;
  border-radius: 10%;
}
.snip1344 .profile {
  border-radius: 50%;
  position: absolute;
  bottom: 50%;
  left: 50%;
  max-width: 100px;
  opacity: 1;
  box-shadow: 3px 3px 20px rgba(0, 0, 0, 0.5);
  border: 2px solid rgba(255, 255, 255, 0.5);
  -webkit-transform: translate(-50%, 0%);
  transform: translate(-50%, 0%);
}
.snip1344 h3 {
  margin: 0 0 50px;
  font-weight: 600;
}
.snip1344 h3 span {
  display: block;
  font-size: 15pt;
  color: #6cc9fb;
  opacity: 0.75;
}
.snip1344 i {
  padding: 10px 300px;
  display: inline-block;
  font-size: 32px;
  color: #ffffff;
  text-align: center;
  opacity: 0.65;
}
.snip1344 a {
  text-decoration: none;
}
.snip1344 i:hover {
  opacity: 1;
  -webkit-transition: all 0.35s ease;
  transition: all 0.35s ease;
}
.snip1344:hover .background,
.snip1344.hover .background {
  -webkit-transform: scale(1.3);
  transform: scale(1.3);
}

.btn-my
{
	background-color: rgba(108, 201, 251,0.8);
	color: white;
	border-top: 1px solid white;
	height:60px;
	width: 100%;
	font-size: 20pt;
}
.btn-my:hover
{	
	background-color: rgba(108, 201, 251,0.1);
	color: #6cc9fb;
}

</style>

<script type="text/javascript">
/* Demo purposes only */
	$(function()
	{
		$(".hover").mouseleave(
				  function () {
				    $(this).removeClass("hover");
				  }
				);
	});


</script>

</head>
<body>

<div class="snip1344"><img src="https://t1.daumcdn.net/liveboard/holapet/529ffebe11304d50999a4319dacf3ee0.jpg" class="background"/>
	<img src="https://t1.daumcdn.net/liveboard/holapet/529ffebe11304d50999a4319dacf3ee0.jpg" alt="profile-sample1" class="profile"/>
  <div>
    <h3>랑이<span>네바마스커레이드</span></h3>
    <div class="icons"><a href="#"><button type="button" class="btn btn-my modify">정보 수정</button></a></div>
  </div>
</div>

 
</body>
</html>