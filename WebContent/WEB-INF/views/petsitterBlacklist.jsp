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

<title>Petriots! | 블랙리스트</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet" href="css_mypage/cards_hyunwoo.css" />
<link href="vendor_mypage/bootstrap/css/bootstrap.css" rel="stylesheet">

<!-- Bootstrap core JavaScript -->
<script src="vendor_mypage/jquery/jquery.min.js"></script>
<script src="vendor_mypage/bootstrap/js/bootstrap.bundle.min.js"></script>


<style type="text/css">
@import url(https://fonts.googleapis.com/css?family=Raleway:300,700);

</style>

<script type="text/javascript">

   $(function()
   {
      $("#removeblacklist").click(function()
      {
         var check = confirm("정말 삭제하시겠습니까?");
         
         if(check === true)
            $("#blacklistForm").submit();
         else
            return;
         
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
      
      <div class="card-header" style="width: 100%; background-color: rgba(108, 201, 251,0.3)">블랙리스트 목록</div>
      
      
         <!-- 유저 프로필 -->
      <c:forEach var="list" items="${blockmember }">
      <div class="col-lg-3" style="height:500px; padding-top: 10px;" align="center">
      <form action="removeblacklist.action" method="post" id="blacklistForm" style="width:200px;">
           <div class="card" style="width: 200px; height: 400px; margin-right: 125px;">
             <div class="card__header" style=" background-size: 200px 230px;"></div>
             <div class="card__image card__image-geoff" style="background-image: url('${list.profile_img}')"></div>
             <div class="card__info">
               <div class="details">
                 <span class="details__text-header" style="font-size: 18pt;">${list.nickName }</span>
                 <span class="details__text-subheader" style="font-size: 15pt; color:white;">
                 <button type="button" id="removeblacklist" style=" background: none;">블랙리스트에서삭제</button>
                 <span class="" style="font-size: 12pt;">${list.isudate }</span>
                 <input type="text" id="user_num" name="user_num" hidden="hidden" value="${list.user_num }">
                 </span>
               </div>
             </div>
           </div>
      </form>
      </div>
      </c:forEach>
      
      
         <!-- 유저 프로필 -->
      <c:if test="${empty blockmember }">
      <div class="col-lg-3" style="height:500px; padding-top: 10px;" align="center">
      <form action="Mypage_user_modify.jsp" method="post" id="user_form" style="width:200px;">
           <div class="card" style="width: 200px; height: 400px; margin-right: 125px;">
             <div class="" style=" background-size: 200px 230px;"></div>
             <div class=""></div>
             <div class="card__info">
               <div class="details">
                 <span class="details__text-header" style="font-size: 16pt;">블랙리스트에<br>추가한 사람이<br>없습니다.</span>
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