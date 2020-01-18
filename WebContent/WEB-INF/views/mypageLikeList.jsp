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

<title>Petriots! | 찜목록</title>
<link rel="stylesheet" href="css_mypage/cards_hyunwoo.css" />
<link href="vendor_mypage/bootstrap/css/bootstrap.css" rel="stylesheet">
<link rel="stylesheet" href="//code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link href="css/mainpage.css" rel="stylesheet">
<link rel="stylesheet" href="css/PetsitterQuestList.css" />
<!-- Bootstrap core JavaScript -->
<script src="vendor_mypage/jquery/jquery.min.js"></script>
<script src="vendor_mypage/bootstrap/js/bootstrap.bundle.min.js"></script>


<style type="text/css">
@import url(https://fonts.googleapis.com/css?family=Raleway:300,700);

</style>

<script type="text/javascript">
   $(function()
   {
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

<div class="container">
<jsp:include page="navigationBar.jsp"/>
</div>

<jsp:include page="/WEB-INF/views/mypageSideMenu.jsp"/>

<!-- 메인 콘텐츠 -->
<div class="container">
   
   <div class="row" style="display:flex; flex-direction: row;">
      
      <div class="col-lg-12" align="center" style="border: 1px solid silver;">
      <div class="card-header" style="width: 100%; background-color: rgba(108, 201, 251,0.3)">내 찜 목록</div>
         <c:forEach var="list" items="${favoritelist }">
         <!-- 찜한 펫시터 정보 -->
            <div class="container_card">
              
              <div class="card-media">
                <!-- media container -->
                <div class="card-media-object-container">
                   <!-- URL 안에 펫시터 사진.. -->
                  <div class="card-media-object" style="background-image: url(${list.profile_img});"></div>
                  <ul class="card-media-object-social-list" style="display:flex; flex-direction: row;">
                     <li style="width:20%; height:30%;">
                      
                     </li>
                     <li style="width:20%; height:30%;">
                      
                     </li>
                     <li style="width:20%; height:30%;">
                      
                     </li>
                    <li style="width:20%; height:30%;">
                     <!-- 펫시터 업적 사진 -->
                       <img src="badges/badge_blue.png" title="펫시팅 횟수 10회 이상"
                         style="width:60%; position: relative;" >
                    </li>
                     <li style="width:20%; height:30%;">
                     <!-- 펫시터 업적 사진 -->
                       <img src="badges/badge_purple.png" title="첫 평점 5점 달성"
                         style="width:60%; position: relative; ">
                    </li>
                    <li style="width:20%; height:30%;">
                     <!-- 펫시터 업적 사진 -->
                       <img src="badges/badge_gold.png" title="이달의 펫시터"
                         style="width:60%; position: relative; ">
                    </li>
                  </ul>
                
                </div>
                <!-- body container -->
                <div class="card-media-body">
                  <div class="card-media-body-top">
                    <span class="subtle">${list.address }</span>
                    <div class="card-media-body-top-icons u-float-right">
                      <a href="#/" class="card-media-body-supporting-bottom-text card-media-link u-float-right">♥</a>
                    </div>
                  </div>
                  <span class="card-media-body-heading">펫시터 아이디 : <c:set var="nickName" value="${list.nickName }" scope="request"></c:set><jsp:include page="user_button.jsp"></jsp:include></span>
                  <div class="card-media-body-supporting-bottom">
                    <span class="card-media-body-supporting-bottom-text subtle"></span>
                    <span class="card-media-body-supporting-bottom-text subtle u-float-right"><span class="text-warning">★★★★★</span> 5.0</span>
                  </div>
                  <div class="card-media-body-supporting-bottom card-media-body-supporting-bottom-reveal">
                    <span class="card-media-body-supporting-bottom-text subtle">펫시팅 횟수 : <span style="font-weight: bold;">1989회</span></span>
                    <a href="#/" class="card-media-body-supporting-bottom-text card-media-link u-float-right">더보기</a>
                  </div>
                </div>
              </div>
            </div>
         <!-- // 찜한 펫시터 정보 -->
         </c:forEach>
            
            
            <!--  찜한 펫시터가 없을 때.. -->
            <c:if test="${empty favoritelist }">
            <div class="container_card">
              
              <div class="card-media">
                <!-- media container -->
                <div class="card-media-object-container">
                   <!-- URL 안에 펫시터 사진.. -->
                  <div class="card-media-object" style="background-color: white;"></div>
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
                    <span class="subtle"></span>
                    <div class="card-media-body-top-icons u-float-right">
                      <a href="#/" class="card-media-body-supporting-bottom-text card-media-link u-float-right"></a>
                    </div>
                  </div>
                  <span class="card-media-body-heading">아직 찜한 펫시터가 없습니다..!</span>
                  <div class="card-media-body-supporting-bottom">
                    <span class="card-media-body-supporting-bottom-text subtle"></span>
                    <span class="card-media-body-supporting-bottom-text subtle u-float-right"><span class="text-warning"></span></span>
                  </div>
                  <div class="card-media-body-supporting-bottom card-media-body-supporting-bottom-reveal">
                    <span class="card-media-body-supporting-bottom-text subtle"> <span style="font-weight: bold;"></span></span>
                    <a href="#/" class="card-media-body-supporting-bottom-text card-media-link u-float-right"></a>
                  </div>
                </div>
              </div>
              
            </div>
            </c:if>
         <!-- // 찜한 펫시터가 없을때 -->
      </div>

   </div>
</div>
<!-- /.container -->
<!-- // 메인 콘텐츠 -->

<br>


</body>
</html>