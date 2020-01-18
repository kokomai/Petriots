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

<title>Petriots! | 내 반려동물</title>
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
      $(".user_modify").click(function()
      {
         $("#user_form").submit();
      });
      
      $(".pet_add").click(function()
      {
         $(location).attr("href"
               , "mypagepetadd.action")
      });
      
      $(".checklist_modify").click(function()
      {
         $(location).attr("href"
               , "Mypage_checklist_modify.jsp")
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

<!-- banner -->
<jsp:include page="/WEB-INF/views/banner.jsp"/>
<!-- //banner -->
</header>
<jsp:include page="/WEB-INF/views/mypageSideMenu.jsp"/>

<!-- 메인 콘텐츠 -->
<div class="container">

   <div class="row" style="display:flex; flex-direction: row;">
      <!-- 펫 프로필 -->
      <c:forEach var="pet" items="${petlist }">
      <div class="col-lg-5" style="height:560px;"align="center">
      <form>
         <div class="snip1344"><img src="${data.pet_img }" class="background" style="width: 120px; height: 260px;"/>
            <img src="${pet.pet_img }" alt="profile-sample1" class="profile"/>
              <div>
                   <h3>${pet.name }<span>${pet.speices }</span></h3>
                 <div class="icons">
                 <button type="button" class="btn-my pet_modify btn" style="background-color: rgba(108, 201, 251,0.3); font-size: 15pt; font-weight: bold; height:40px;" onclick="location.href='mypagepetmodify.action?p_r_num=${pet.p_r_num }'">정보 / 체크리스트 수정</button>
                 <button type="button" id="delete" class="btn-my pet_delete btn" style=" font-size: 15pt; font-weight: bold; background-color: rgba(255, 0, 0, 0.2);height: 40px;" onclick="location.href='petdelete.action?p_r_num=${pet.p_r_num }'">반려동물 삭제</button>
                  
                  </div>
              </div>
         </div>
      </form>
      </div>
      </c:forEach>
      <!--// 펫 프로필 -->
      
      <!-- 펫 추가!! -->
      <div class="col-lg-5" style="height:450px;"align="center">      
         <div class="snip1344" style="height:400px;">
         <img src="https://png.pngtree.com/svg/20170921/invisible_1331502.png" class="background"/>
                <h3><span></span></h3>
              <div class="icons"><button type="button" class="btn-my pet_add btn"
               style=" font-size: 15pt; font-weight: bold;">
               <img src="https://cdn3.iconfinder.com/data/icons/stroke/53/Button-512.png" alt="profile-sample1" class="profile"/>
               반려동물추가
               </button>
               </div>
         </div>
      </div>
      <!--// 펫 추가!! -->
      
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