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

<title>Insert title here</title>
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.4.1/css/swiper.min.css"
	rel="stylesheet">


<!-- <script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script> -->

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.4.1/js/swiper.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/gsap/2.0.2/TweenMax.min.js"></script>

<style type="text/css">
* {
	box-sizing: border-box;
	margin: 0;
	padding: 0;
}

.project-title {
	color: #ff686b;
	font-size: 50px;
	margin: 40px 0;
	text-align: center;
	text-transform: uppercase;
}

.slider {
	background: #000;
	height: 400px;
	position: relative;
	text-align: center;
	width: 100%;
	
}

.arrow {
	background: rgba(108, 201, 251,0.3);
	border: none;
	border-radius: 10%;
	color: white;
	cursor: pointer;
	display: none;
	opacity: .4;
	padding: 10px;
	position: absolute;
	text-transform: uppercase;
	-webkit-transition: .2s;
	top: 50%;
	transition: .2s;
}

.arrow:hover {
	opacity: .8;
}

.arrow.next {
	right: 2%
}

.arrow.prev {
	left: 2%;
}

.slide {
	background-repeat: no-repeat;
	background-size: cover;
	color: #fff;
	height: 100%;
	padding: 90px 0 0;
	position: absolute;
	width: 100%;
}

.slide-title {
	font-size: 40px;
	font-weight: bold;
	margin: 0 auto;
	padding: 15px 0;
	text-transform: uppercase;
}

.slide-desc {
	font-size: 20px;
	margin: 40px auto 0;
	width: 65%;
}

.slide-image, .slide-image img {
	height: 100%;
	width: 100%;

}

.slide:first-of-type {
	background-image: url("https://images.unsplash.com/photo-1508675801627-066ac4346a61?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1345&q=80");
	background-position: 50% 50%;

}

.slide:nth-of-type(2) {
	background-image:
		url("https://images.unsplash.com/photo-1461730117549-4b30953f78a6?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1350&q=80");
	background-position: 50% 30%;
}

.slide:last-of-type {
	background-image:
		url("https://images.unsplash.com/photo-1496284427489-f59461d8a8e6?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1350&q=80");
	background-position: 50% 40%;
}

.active {
	display: block;
}

.slide-nav {
	bottom: 30px;
	position: absolute;
	width: 100%;
}

.nav-item2 {
	background: rgba(108, 201, 251,0.3);
	border: 2px solid rgba(108, 201, 251,0.3);
	cursor: pointer;
	display: inline-block;
	margin-right: 20px;
	transition: background .4s;
}

.nav-item2:last-of-type {
	margin-right: 0;
}

.nav-item2:hover {
	transform: scale(1.3);
}

.item-active {
	background: rgba(108, 201, 251,0.7);
	transform: scale(1.3);
}

.dot {
	border-radius: 50%;
}

.dot, .square {
	height: 15px;
	width: 15px;
}

.rectangle {
	height: 15px;
	width: 30px;
}
</style>

<script type="text/javascript">
	$(function()
	{
		// Slider configuration
		var config =
		{
			speed : 6000,
			auto : true, // true or false
			arrows : true, // true or false
			nav2 : true, // true or false
			navStyle : 'default' // square,rectangle, default
		};

		// Slider core
		var slides = $('.slide');
		var totalSlides = slides.length;
		var currentIndex = 0;

		function setSlides()
		{
			var currentSlide = slides.eq(currentIndex);
			slides.hide();
			currentSlide.fadeIn(1500);
		}
		;
		setSlides();

		// autoplay
		if (config.auto)
		{
			var autoSlide = setInterval(function()
			{
				currentIndex += 1;
				if (currentIndex > totalSlides - 1)
				{
					currentIndex = 0;
				}
				setSlides();
				navigation();
			}, config.speed);
		}
		;

		// navigation arrows
		if (config.arrows)
		{
			$('.arrow').addClass('active');
			$('.prev').click(function()
			{
				clearInterval(autoSlide);
				currentIndex -= 1;
				if (currentIndex < 0)
				{
					currentIndex = totalSlides - 1;
				}
				navigation();
				setSlides();
			});
			$('.next').click(function()
			{
				clearInterval(autoSlide);
				currentIndex += 1;
				if (currentIndex > totalSlides - 1)
				{
					currentIndex = 0;
				}
				navigation();
				setSlides();
			});
		}
		;

		// navigation
		if (config.nav2)
		{
			for (i = 0; i < slides.length; i += 1)
			{
				$('<li/>').attr(
				{
					'class' : 'nav-item2',
					'id' : i
				}).appendTo('.slide-nav');
			}
			;
			$('.nav-item2').first().addClass('item-active');
			switch (config.navStyle)
			{ // navigation style
			case 'square':
				$('.nav-item2').addClass('square');
				break;
			case 'rectangle':
				$('.nav-item2').addClass('rectangle');
				break;
			default:
				$('.nav-item2').addClass('dot');
			}
			;
			function navigation()
			{
				$('.nav-item2').removeClass('item-active');
				$('.nav-item2').eq(currentIndex).addClass('item-active');
			}
			;
			$('.nav-item2').click(function()
			{
				clearInterval(autoSlide);
				var navNumb = $(this).attr('id');
				currentIndex = navNumb;
				navigation();
				setSlides();
			});
		}
		;

	});
</script>

</head>
<body>

	<div class="slider">
		<div class="slide">
			<h2 class="slide-title">우리 동네 펫시터 찾기</h2>
			<p class="slide-desc">이제 가까운 곳에 있는 펫시터를 찾아보세요!</p>
		</div>
		<div class="slide">
			<h2 class="slide-title">신뢰감 넘치는 페트리어츠!</h2>
			<p class="slide-desc">페트리어트의 펫시터들은 엄선된 시험 절차를 거쳐서 선정됩니다!</p>
		</div>
		<div class="slide">
			<h2 class="slide-title">반려인들에게 물어보세요!</h2>
			<p class="slide-desc">반려인들의 꿀팁! QnA게시판에서 확인해보세요!</p>
		</div>
		<button class="arrow prev"><</button>
		<button class="arrow next">></button>
		<ul class="slide-nav"></ul>
	</div>




</body>
</html>