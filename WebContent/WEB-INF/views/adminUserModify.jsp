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

<title>adminUserModify.jsp</title>
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
      $(".btnUpdate").on("click", function()
      {
    	  $("#user_num_dp").show(); 
    	  $("#userid_dp").show(); 
    	  $("#correct_dp").show(); 
    	  $("#username_dp").show(); 
    	  $("#tel_dp").show(); 
    	  $("#email_dp").show(); 
    	  $("#nickname_dp").show(); 
    	  $("#button_la").show(); 
    	  $("#title").show(); 
    	  
    	  $("#user_num").val($(this).val());
    	  $("#user_num").val($(this).parents("tr").find("td:eq(0)").text());
          $("#userid").val($(this).parents("tr").find("td:eq(1)").text());
          $("#pwd").val($(this).parents("tr").find("td:eq(2)").text());
          $("#username").val($(this).parents("tr").find("td:eq(3)").text());
          $("#tel").val($(this).parents("tr").find("td:eq(4)").text());
          $("#email").val($(this).parents("tr").find("td:eq(5)").text());
          $("#nickname").val($(this).parents("tr").find("td:eq(6)").text());
    	  
    	  $('#pwd').prop('readonly', false);
    	  $('#username').prop('readonly', false);
    	  $('#tel').prop('readonly', false);
    	  $('#email').prop('readonly', false);
    	  $('#nickname').prop('readonly', false);
    	  $('#nickname').prop('readonly', false);
    	  $('#userid').prop('readonly', false);
	
         $("#title").text("회원 정보 수정").css({"color":"red", "font-weight":"bold"});
         $("#user_num_la").text("유저번호").css({"color":"red", "font-weight":"bold"});
         $("#userid_la").text("아이디").css({"color":"red", "font-weight":"bold"});
         $("#pwd_la").text("패스워드").css({"color":"red", "font-weight":"bold"});
         $("#username_la").text("이름").css({"color":"red", "font-weight":"bold"});
         $("#tel_la").text("전화번호").css({"color":"red", "font-weight":"bold"});
         $("#email_la").text("이메일").css({"color":"red", "font-weight":"bold"});
         $("#nickname_la").text("닉네임").css({"color":"red", "font-weight":"bold"});
         $("#button_la").text("회원정보수정").css();
         
         $("#memberForm").attr("action", "signupupdate.action");
      });
      
      
      
   });

</script>


</head>
<body>

<header>

<!-- banner -->
<jsp:include page="/WEB-INF/views/banner.jsp"/>
<!-- //banner -->
</header>
<jsp:include page="/WEB-INF/views/adminPageSideMenu.jsp"/>

<!-- 메인 콘텐츠 -->
<div class="container" style=" width:1200px;" align="center">

	<div class="panel-group" style="width:1200px;">
      <div class="panel panel-default">
         <div class="panel-heading" id="title"  style="background-color: rgba(108, 201, 251,0.3); display:none;">
                  회원리스트
         </div>
         
         <div class="panel-body">
            <form action="signupupdate.action" method="post" role="form" id="memberForm">
            
               <div class="form-group" style="display:none;" id="user_num_dp">
                  <label for="유저번호" id="user_num_la">
                    
                  </label>
                  <input type="text" id="user_num" name="user_num" class="form-control" readonly>
               </div>
               
               <div class="form-group" style="display:none;" id="userid_dp">
                  <label for="아이디" id="userid_la">
                    	
                  </label>
                  <input type="text" id="userid" name="userid" class="form-control" readonly>
               </div>
               
               <div class="form-group" style="display:none;" id="pwd_la_dp">
                  <label for="패스워드" id="pwd_la">
                     
                  </label>
                  <input type="text" id="pwd" name="pwd" class="form-control" readonly>
               </div>
               
               <div class="form-group" style="display:none;" id="username_dp">
                  <label for="이름" id="username_la">
                     
                  </label>
                  <input type="text" id="username" name="username" class="form-control" readonly>
               </div>
               
               <div class="form-group" style="display:none;" id="tel_dp">
                  <label for="전화번호" id="tel_la">
                     
                  </label>
                  <input type="text" id="tel" name="tel" class="form-control" readonly>
               </div>
               
               <div class="form-group" style="display:none;" id="email_dp">
                  <label for="이메일" id="email_la">
                     
                  </label>
                  <input type="text" id="email" name="email" class="form-control" readonly>
               </div>
               
               <div class="form-group" style="display:none;" id="nickname_dp">
                  <label for="닉네임" id="nickname_la">
                      
                  </label>
                  <input type="text" id="nickname" name="nickname" class="form-control" readonly>
               </div>
               
               <button type="submit" class="btn btn-primary btn-sm btnSubmit" id="button_la"  style="display:none;">회원수정</button>
               
            </form>
         </div>
         </div>
      </div><!-- end .panel panel-default -->
      
      
      <div class="panel panel-default" style="width: 1400px; margin: 8px;">
         <div class="panel-heading" style="background-color: rgba(108, 201, 251,0.3);">
          	회원 리스트 출력  
         </div>
         
         <div class="panel-body">
            <table class="table">
               <thead>
                  <tr>
                     <th>유저번호</th>
                     <th>아이디</th>
                     <th>패스워드</th>
                     <th>이름</th>
                     <th>전화번호</th>
                     <th>E-mail</th>
                     <th>닉네임</th>
                     <th>삭제  / 수정</th>
                  </tr>
               </thead>
               <tbody>
                  
                  <c:forEach var="signup" items="${list }">
                  <tr>
                     <td>${signup.user_num }</td>
                     <td>${signup.userId }</td>
                     <td>${signup.pwd }</td>
                     <td>${signup.userName }</td>
                     <td>${signup.tel }</td>
                     <td>${signup.email }</td>
                     <td>${signup.nickName }</td>
                     <td>
                        <button type="button" class="btn btn-default btn-xs btnDelete" onclick="location='signupdelete.action?user_num=${signup.user_num }'">삭제</button>
                        <button type="button" class="btn btn-default btn-xs btnUpdate" value="${signup.user_num }" onclick="$('html').animate({scrollTop : 0}, 100)">수정</button>
                     </td>
                  </tr>
                  </c:forEach>
               </tbody>
            </table>
            
         
            
         </div>
      </div><!-- end .panel panel-default -->
      
   
   </div>


	
	
	
	
<!-- Footer -->
	<footer class="py-5" style="padding-left: 60px; background-color: rgba(108, 201, 251,0.3)">
		<div class="container">
			<p class="m-0 text-center text-white">Copyright &copy; Petriots! 2019</p>
		</div>
		<!-- /.container -->
	</footer>
<!-- /Footer -->

</body>
</html>