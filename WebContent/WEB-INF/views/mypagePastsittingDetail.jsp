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

<title>Petriots! | 과거 위탁 조회</title>
<link rel="stylesheet" href="css_mypage/cards_hyunwoo.css" />
<link href="vendor_mypage/bootstrap/css/bootstrap.css" rel="stylesheet">
<link href="css/mainpage.css" rel="stylesheet">
<!-- Bootstrap core JavaScript -->
<script src="vendor_mypage/jquery/jquery.min.js"></script>
<script src="vendor_mypage/bootstrap/js/bootstrap.bundle.min.js"></script>


<style type="text/css">
@import url(https://fonts.googleapis.com/css?family=Raleway:300,700);

.services
{
	width:30%;
	height:45%;
	text-align: center;
}


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
<!-- //banner -->
</header>
<jsp:include page="/WEB-INF/views/mypageSideMenu.jsp"/>

<!-- 메인 콘텐츠 -->
<div class="container" style="padding-left: 200px;">
<form id="reservation_form" action="reservation_delete.action" method="post">
	<div class="row" style="height: 800px; ">
	<div class="col-lg-12" style="width:80%;">
		<c:forEach var="list" items="${reservepastdetail}">
               <div class="card-header" style="width: 100%; height:50px; background-color: rgba(108, 201, 251,0.3)">상세 위탁 정보
               <p class="text-success" style="float:right;">위탁번호: ${list.r_a_num }</p>
               </div>
               
               <div class="card-body" style="display:flex; flex-direction: column; width:80%; height:600px; ">
                  <div style=" width:100%; height: 300px;   padding: 2px;display: flex; flex-direction: column; ">
                     <p>펫시터 정보</p>
                  <div class="container_card">
              
              <div class="card-media">
                <!-- media container -->
                <div class="card-media-object-container">
                   <!-- URL 유저 사진.. -->
                  <div class="card-media-object" style="background-image: url(${list.profile_img });"></div>
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
                    <span class="subtle">${list.address }</span>
                    <div class="card-media-body-top-icons u-float-right">
                      <a href="#/" class="card-media-body-supporting-bottom-text card-media-link u-float-right"></a>
                    </div>
                  </div>
                  <span class="card-media-body-heading">펫시터 닉네임 : <c:set var="list" value="${list}" scope="request"></c:set><jsp:include page="user_button_L.jsp"></jsp:include></span>
                  <div class="card-media-body-supporting-bottom">
                    <span class="card-media-body-supporting-bottom-text subtle"></span>
                    <span class="card-media-body-supporting-bottom-text subtle u-float-right"><span class="text-warning"></span></span>
                  </div>
                  <div class="card-media-body-supporting-bottom card-media-body-supporting-bottom-reveal">
                    <span class="card-media-body-supporting-bottom-text subtle"> <span style="font-weight: bold;"></span></span>
                    <a href="" class="card-media-body-supporting-bottom-text card-media-link u-float-right"></a>
                  </div>
                </div>
              </div>
              
            </div>
   
               </div>
               <div style=" width:100%; height: 300px;   padding: 2px;display: flex; flex-direction: column; ">
                     <p>반려동물 정보</p>
                  <div class="container_card">
              
              <div class="card-media">
                <!-- media container -->
                <div class="card-media-object-container">
                   <!-- URL 안에 펫시터 사진.. -->
                  <div class="card-media-object" style="background-image: url(${list.pet_img});"></div>
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
                    <span class="subtle">${list.speices }</span>
                    <div class="card-media-body-top-icons u-float-right">
                      <a href="#/" class="card-media-body-supporting-bottom-text card-media-link u-float-right"></a>
                    </div>
                  </div>
                  <span class="card-media-body-heading">이름 : ${list.pet_name }</span>
                  <div class="card-media-body-supporting-bottom">
                    <span class="card-media-body-supporting-bottom-text subtle">질병 : ${list.illness }</span>
                    <span class="card-media-body-supporting-bottom-text subtle u-float-right"><span class="text-warning">특이사항 : ${list.additional }</span></span>
                  </div>
                  <div class="card-media-body-supporting-bottom card-media-body-supporting-bottom-reveal">
                    <span class="card-media-body-supporting-bottom-text subtle"> <span style="font-weight: bold;">투여할 약 : ${list.drug }</span></span>
                  </div>
                </div>
              </div>
              
            </div>
   
               </div>
                  
               </div>
               
               <div class="form-group" style="display:flex; flex-direction: column; height:200px; width:100%;">
                     <div style="display:flex; flex-direction: column; height:400px; width:70%;">
                     위탁 날짜
                            <input type="text" class="form-control" id="sttdate" readonly="readonly"
                              style="width:100%; align-items:  center;" value="${list.sttdate }" >
                              <label for="checkin">체크인 시간</label>
                              <input type="time" class="form-control" id="checkInStart" readonly="readonly"
                              style="width:100%;" value="${list.checkin }">
                              <label for="checkout">체크아웃 시간</label>
                              <input type="time" class="form-control" id="checkOutStart" readonly="readonly"
                              style="width:100%;" value="${list.checkout }">
                              </div>
                      </div>
                      </c:forEach>
                      
					<div class="form-group" style="display:flex; flex-direction: column; height:500px; width:75%;" align="center">
						<jsp:include page="/WEB-INF/views/petsitterPastChecklist.jsp"/>
						 <a class="btn btn-secondary" href="mypagemain.action">
	                            돌아가기
	                     </a>
					</div>

			</div>
		</div>		
</form>
</div>


		

<!-- /.container -->
<!-- // 메인 콘텐츠 -->

<!-- Footer -->
<!-- 	<footer class="py-5" style="padding-left: 60px; width:100%; background-color: rgba(108, 201, 251,0.3);">
		<div class="container">
			<p class="m-0 text-center text-white">Copyright &copy; Petriots! 2019</p>
		</div>
		/.container
	</footer> -->
<!-- /Footer -->

</body>
</html>