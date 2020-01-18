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

<title>Petriots! | 마이페이지</title>
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
		$(".nowdetail").click(function()
		{
			var num = $(this).attr('id');

			$("#nowdetailForm" + num).submit();
		});

		$(".reservedetail").click(function()
		{
			var num = $(this).attr('id');

			$("#reservedetailForm" + num).submit();
		});

		$(".user_modify").click(function()
		{
			$("#user_form").submit();
		});

		$(".pet_modify").click(function()
		{
			$("#pet_form").submit();
		});
	});
</script>

</head>
<body>

<header style="padding-left: 60px;">
<!-- Navigation -->
<div class="container">
<jsp:include page="navigationBar.jsp"/>
</div>
<!-- //Navigation -->


</header>
<jsp:include page="/WEB-INF/views/mypageSideMenu.jsp"/>

<!-- 메인 콘텐츠 -->
<div class="container">

   <div class="row" style="display:flex; flex-direction: row;">
      <!-- 유저 프로필 -->
      <c:forEach var="data" items="${mydata }">
      <div class="col-lg-5" style="height:450px;">
      <form action="mypageusermodify.action" id="user_form">
         <div class="wrapper">
           <div class="card">
           <!-- 배경사진  -->
             <div class="card__header" style="background-image: url('https://upload.wikimedia.org/wikipedia/commons/0/04/Kamee01_edit.jpg')"></div>
             <!-- 유저 사진 -->
             <div class="card__image card__image-geoff" style="background-image: url('${data.profile_img}')"></div>
             <div class="card__info">
               <div class="details">
                 <span class="details__text-header" style="font-size: 18pt;">${data.nickName }</span>
                 <span class="details__text-subheader" style="font-size: 15pt;">이용 횟수 : ${mycount }회</span>
                 
               </div>
               <div class="card__info__section-3" style="width:99.5%;">
                 <div class="details-bottom">
                   <div class="icons"><button type="button" class="btn-my user_modify btn" style=" font-size: 15pt; font-weight: bold; height: 30px;">내 정보 수정</button></div>
                   <span class="details__text"></span>
                 </div>
               </div>
             </div>
           </div>
         </div>
      </form>
      </div>
      </c:forEach>
      <!--// 유저 프로필 -->
      <c:if test="${!empty mypetdata }">
      <div class="col-lg-2" style="height:200px;" align="center">
         <span style="font-size:80pt; color:rgba(108, 201, 251,0.3);">♥</span>
      </div>
      </c:if>
      <!-- 펫 프로필 -->
      <c:forEach var="data" items="${mypetdata }">
      <div class="col-lg-5" style="height:450px;"align="center">
      <form action="mypagepetlist.action" id="pet_form">
         <div class="snip1344"><img src="${data.pet_img }" class="background" style="height: 200px;"/>
            <img src="${data.pet_img }" class="profile"/>
              <div>
                   <h3>${data.name }<span>${data.speices }</span></h3>
                 <div class="icons"><button type="button" class="btn-my pet_modify btn"
                  style=" font-size: 15pt; font-weight: bold;" onclick="href.location='mypagepetmodify.action'">내 반려동물 리스트</button></div>
              </div>
         </div>
      </form>
      </div>
      </c:forEach>
      
      
      <!--// 펫 프로필 -->
      <br>
      <hr>
      <br>
      
      <!-- 위탁 중인 항목.. -->
      <div class="col-lg-12" align="center" style=" background-color:rgba(108, 201, 251,0.3);">
         <div style="height:30px;"><span style="font-size: 15pt; font-weight: bold;">위탁 중인 정보</span></div>
         
         <!-- 위탁중인 정보 -->
            <c:forEach var="list" items="${reservenowlist }">
            <form action="userreservationnowdetail.action" method="GET" id="nowdetailForm${list.r_a_num }" class="nowdetailForm">
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
                  <span class="card-media-body-heading">펫시터 아이디 : <c:set var="list" value="${list }" scope="request"></c:set><jsp:include page="user_button_L.jsp"></jsp:include></span>
                  <div class="card-media-body-supporting-bottom">
                    <span class="card-media-body-supporting-bottom-text subtle"></span>
                    <span class="card-media-body-supporting-bottom-text subtle u-float-right"><span class="text-warning">★★★★★</span> 5.0</span>
                  </div>
                  <div class="card-media-body-supporting-bottom card-media-body-supporting-bottom-reveal">
                    <span class="card-media-body-supporting-bottom-text subtle">맡긴 반려동물 : <span style="font-weight: bold;">${list.name }</span></span>
                    <a href="#" class="card-media-body-supporting-bottom-text card-media-link u-float-right nowdetail" id="${list.r_a_num }">더보기</a>
				        <input type="text" name="r_a_num" value="${list.r_a_num }" hidden="hidden">
                  </div>
                </div>
              </div>
              
            </div>
            </form>
            </c:forEach>
            
         <!-- // 위탁중인 정보 없을 때.. -->
         <c:if test="${empty reservenowlist }">
            <div class="container_card">
              <div class="card-media" style="background-color: #ffffff; ">
                  <span>위탁중인 정보가 없습니다..</span>
                  
              </div>
              
            </div>
         </c:if>
         <!-- // 위탁중인 정보 없을때 -->
      
      </div>
      <!-- // 위탁 중 항목 -->
      
      <br><br><br>
      <div class="col-lg-12" align="center" style="height: 100px;">
      </div>
      
      <div class="col-lg-12" align="center" style="border: 1px solid silver;">
         <div class="icons"><button type="button" class="btn-my modify btn"
             style=" font-size: 15pt; font-weight: bold; width:100%;" >현재 예약 정보
             <p style="color:white; font-size: 15pt; font-weight: bold;">(클릭시 더보기)</p></button></div>
         
         <!-- 요청 예약 정보 -->
         <c:forEach var="list" items="${reserverequestlist }">
         <form action="userrequestdetail.action" method="GET" id="reservedetailForm${list.r_a_num }" class="reservedetailForm">
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
                      <a href="#/" class="card-media-body-supporting-bottom-text card-media-link u-float-right">♡</a>
                    </div>
                  </div>
                  <span class="card-media-body-heading">펫시터 아이디 : <c:set var="list" value="${list}" scope="request"></c:set><jsp:include page="user_button_L.jsp"></jsp:include></span>
                  <div class="card-media-body-supporting-bottom">
                    <span class="card-media-body-supporting-bottom-text subtle"></span>
                    <span class="card-media-body-supporting-bottom-text subtle u-float-right"><span class="text-warning">★★★★★</span> 5.0</span>
                  </div>
                  <div class="card-media-body-supporting-bottom card-media-body-supporting-bottom-reveal">
                    <span class="card-media-body-supporting-bottom-text subtle">맡긴 반려동물 : <span style="font-weight: bold;">${list.name }</span></span>
                    <a href="#" class="card-media-body-supporting-bottom-text card-media-link u-float-right reservedetail" id="${list.r_a_num }">더보기</a>
				        <input type="text" name="r_a_num" value="${list.r_a_num }" hidden="hidden">
                  </div>
                </div>
              </div>
            </div>
            </form>
         </c:forEach>
         
         
         
         <!-- // 요청 예약 정보 -->
            <!--  요청 예약 정보 없을 때.. -->
            <c:if test="${empty reserverequestlist }">
            <div class="container_card">
              <div class="card-media" style="background-color: #ffffff; ">
                  <span>현재 예약 정보가 없습니다..</span> 
              </div>
            </div>
         </c:if>
         <!-- // 현재 예약 정보 없을때 -->
      </div>

   </div>
</div>
<!-- /.container -->
<!-- // 메인 콘텐츠 -->

<br>

<!-- Footer -->
<jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>
<!-- /Footer -->

</body>
</html>