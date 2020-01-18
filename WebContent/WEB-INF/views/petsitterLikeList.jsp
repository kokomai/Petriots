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

<title>Petriots! | 나를 찜한 사람</title>
<link rel="stylesheet" href="css_mypage/cards_hyunwoo.css" />
<link href="vendor_mypage/bootstrap/css/bootstrap.css" rel="stylesheet">
<link rel="stylesheet" href="//code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" />
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

<jsp:include page="/WEB-INF/views/petsitterSideMenu.jsp"/>

<!-- 메인 콘텐츠 -->
<div class="container">
   
   <div class="row" style="display:flex; flex-direction: row;">
      
      <div class="card-header" style="width: 100%; background-color: rgba(108, 201, 251,0.3)">나를 찜한 사람 목록</div>
      
         <!-- 유저 프로필 -->
      <c:forEach var="list" items="${favoritemember }">
      <div class="col-lg-3" style="height:500px; padding-top: 10px;" align="center">
      <form action="" method="post" id="user_form" style="width:200px;">
           <div class="card" style="width: 200px; height: 400px; margin-right: 125px;">
             <div class="card__header" style=" background-size: 200px 230px;"></div>
             <div class="card__image card__image-geoff" style="background-image: url('${list.profile_img}')"></div>
             <div class="card__info">
               <div class="details">
                 <span class="details__text-header" style="font-size: 18pt;">${list.nickName }</span>
                 <span class="details__text-subheader" style="font-size: 15pt; color:white;">♥</span>
               </div>
             </div>
           </div>
      </form>
      </div>
      </c:forEach>   
      
         <!-- 유저 프로필 -->
      <c:if test="${empty favoritemember }">
      <div class="col-lg-3" style="height:500px; padding-top: 10px;" align="center">
      <form action="Mypage_user_modify.jsp" method="post" id="user_form" style="width:200px;">
           <div class="card" style="width: 200px; height: 400px; margin-right: 125px;">
             <div class="" style=" background-size: 200px 230px;"></div>
             <div class=""></div>
             <div class="card__info">
               <div class="details">
                 <span class="details__text-header" style="font-size: 15pt;"> 아직 나를 찜한 사람이 없습니다..</span>
                 <span class="details__text-subheader" style="font-size: 15pt; color:white;"></span>
               </div>
             </div>
           </div>
      </form>
      </div>
      </c:if>

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