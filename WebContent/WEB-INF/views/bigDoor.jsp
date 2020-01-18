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
<title>Petriots!</title>
<head>
		<title>Road Trip by TEMPLATED</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<link rel="stylesheet" href="css/main.css" />
	</head>
	<body>

		<!-- Header -->
			<header id="header">
				<!-- <div class="logo"><a href="index.html">Petriots! <span>by 3rdjo</span></a></div> -->

			</header>


		<!-- Banner -->
		<!--
			Note: To show a background image, set the "data-bg" attribute below
			to the full filename of your image. This is used in each section to set
			the background image.
		-->
			<section id="banner" class="bg-img" data-bg="banner.png">
				<div class="inner">
					<header>
						<h1><a href="mainpage.action" >Petriots!</a></h1>
					</header>
				</div>
				<a href="#one" class="more"></a>
			</section>

		<!-- One -->
			<section id="one" class="wrapper post bg-img" data-bg="banner2.jpg">
				<div class="inner">
					<article class="box">
						<header>
							<h2>Petriots란?</h2>
							<p>------------</p>
						</header>
						<div class="content">
							<p>누구나 쉽고, 안심할 수 있게 이용할 수 있는 펫시팅 서비스 입니다.</p>
						</div>
					</article>
				</div>
				<a href="#two" class="more">Learn More</a>
			</section>

		<!-- Two -->
			<section id="two" class="wrapper post bg-img" data-bg="banner5.jpg">
				<div class="inner">
					<article class="box">
						<header>
							<h2>우리 동네 펫시터 찾기 서비스</h2>
							<p></p>
						</header>
						<div class="content">
							<p>이제 우리 동네에 있는 펫시터들을 찾아보세요! 언제든지 쉽고 빠르게 예약할 수 있습니다!</p>
						</div>

					</article>
				</div>
				<a href="#three" class="more">Learn More</a>
			</section>

		<!-- Three -->
			<section id="three" class="wrapper post bg-img" data-bg="banner4.jpg">
				<div class="inner">
					<article class="box">
						<header>
							<h2>페트리어츠는 믿을 수 있습니다!</h2>
							<p></p>
						</header>
						<div class="content">
							<p>페트리어츠는 인성검사, 지식검사를 통해 펫시터로 등록할 수 있습니다.</p>
						</div>

					</article>
				</div>
				<a href="#four" class="more">Learn More</a>
			</section>

		<!-- Four -->
			<section id="four" class="wrapper post bg-img" data-bg="banner3.jpg">
				<div class="inner">
					<article class="box">
						<header>
							<h2>이제 시작해 볼까요?</h2>
							<p></p>
						</header>
						<div class="content">
							<p></p>
						</div>
						<footer>
							<a href="mainpage.action" class="button alt">메인 페이지로</a>
						</footer>
					</article>
				</div>
			</section>


			


		<!-- Scripts -->
			<script src="BigDoorjs/jquery.min.js"></script>
			<script src="BigDoorjs/jquery.scrolly.min.js"></script>
			<script src="BigDoorjs/jquery.scrollex.min.js"></script>
			<script src="BigDoorjs/skel.min.js"></script>
			<script src="BigDoorjs/bigDoorutil.js"></script>
			<script src="BigDoorjs/main.js"></script>

	</body>
</html>