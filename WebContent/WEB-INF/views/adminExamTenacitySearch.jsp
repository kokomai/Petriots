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

<title>adminExamTenacitySearch.jsp</title>
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

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
	
<script type="text/javascript">

   $(function()
   {
      $(".btnUpdate").on("click", function()
      {
    	 	$("[id^=search]").hide();
    	  //$("[id^=searchlist_dp]").hide();
    	  
    	  $("#p_t_q_num_dp").show(); 
    	  $("#maintext_dp").show(); 
    	  $("#correct_dp").show(); 
    	  $("#chioce1_dp").show(); 
    	  $("#chioce2_dp").show(); 
    	  $("#chioce3_dp").show(); 
    	  $("#chioce4_dp").show(); 
    	  $("#chioce5_dp").show(); 
    	  $("#modify").show(); 
    	  $("#title").show(); 
    	  
         $("#title").text("인성 문제 수정").css({"color":"red", "font-weight":"bold"});
         $("#p_t_q_num").val($(this).val());
         $("#p_t_q_num").val($(this).parents("tr").find("td:eq(0)").text());
         $("#maintext").val($(this).parents("tr").find("td:eq(1)").text());
         $("#correct").val($(this).parents("tr").find("td:eq(2)").text());
         $("#chioce1").val($(this).parents("tr").find("td:eq(3)").text());
         $("#chioce2").val($(this).parents("tr").find("td:eq(4)").text());
         $("#chioce3").val($(this).parents("tr").find("td:eq(5)").text());
         $("#chioce4").val($(this).parents("tr").find("td:eq(6)").text());
         $("#chioce5").val($(this).parents("tr").find("td:eq(7)").text());
         
         $("#memberForm").attr("action", "p_q_bupdate.action");
      });
      
   });

</script>

<script type="text/javascript">

   $(function()
   {
      $(".btnSubmit").on("click", function()
      {
    	 
    	  //$("#searchlist_dp").show(); 
         
         $("#searchForm").attr("action", "p_q_bsearch.action");
      });
      
   });

</script>






</head>
<body>

<header style="padding-left: 60px;">

<!-- banner -->
<jsp:include page="/WEB-INF/views/banner.jsp"/>
<!-- //banner -->
</header>
<jsp:include page="/WEB-INF/views/adminPageSideMenu.jsp"/>

<!-- 메인 콘텐츠 -->
<div class="container" style="padding: 1000; width:2100px; margin: 0px 70px 20px 45px;" align="left" >

	<div class="panel-group" style="border: px solid; width: 1600px; margin: 0px 20px 0px 0px;">
      <div class="panel panel-default">
         <div class="panel-heading" id="title" style="background-color: rgba(108, 201, 251,0.3); display: none;" >
                 인성문제 
         </div>
         
         <div class="panel-body">
         
            <form action="p_q_bupdate.action" method="post" role="form" id="memberForm">
            	<div class="form-group"  style="display:none;" id="p_t_q_num_dp">
                  <label for="문제번호">
                     문제번호: 
                  </label>
                  <input type="text" id="p_t_q_num" name="p_t_q_num" class="form-control" readonly="readonly">
               </div>
            
               <div class="form-group" style="display:none;" id="maintext_dp">
                  <label for="문제">
                     문제: 
                  </label>
                  <input type="text" id="maintext" name="maintext" class="form-control">
               </div>
               
               <div class="form-group" style="display:none;" id="correct_dp">
                  <label for="문제 정답">
                     정답: 
                  </label>
                  <input type="text" id="correct" name="correct" class="form-control">
               </div>
               
               <div class="form-group" style="display:none;" id="chioce1_dp">
                  <label for="보기1">
                     보기1: 
                  </label>
                  <input type="text" id="chioce1" name="chioce1" class="form-control">
               </div>
               
               <div class="form-group" style="display:none;" id="chioce2_dp">
                  <label for="보기2">
                     보기2: 
                  </label>
                  <input type="text" id="chioce2" name="chioce2" class="form-control">
               </div>
               
               <div class="form-group" style="display:none;" id="chioce3_dp">
                  <label for="보기3">
                     보기3: 
                  </label>
                  <input type="text" id="chioce3" name="chioce3" class="form-control">
               </div>
               
               <div class="form-group" style="display:none;" id="chioce4_dp">
                  <label for="보기4">
                     보기4: 
                  </label>
                  <input type="text" id="chioce4" name="chioce4" class="form-control">
               </div>
               
               <div class="form-group" style="display:none;" id="chioce5_dp">
                  <label for="보기5">
                     보기5: 
                  </label>
                  <input type="text" id="chioce5" name="chioce5" class="form-control">
               </div>
               
               <button type="submit" class="btn btn-primary btn-sm btnSubmit" style="display:none;" id="modify">수정</button>
            </form>
            
         </div>
      </div><!-- end .panel panel-default -->
      
     <!-- -------------------------------------------------------- 여기서부터 리스트 출력 ------------------------------------------------------------------- -->
      
      <div class="panel panel-default" style="width: 1900px;   magin: 400px, 0px 0px 0x;">
         <div class="panel-heading"   style="background-color: rgba(108, 201, 251,0.3);">
           인성 문제 정보 출력
         </div>
         
         <div class="panel-body">
            <table class="table">
               <thead>
                  <tr>
                     <th>인성문제번호</th>
                     <th>인성문제</th>
                     <th>관리자번호</th>
                     <th>문제정답</th>
                     <th>보기1</th>
                     <th>보기2</th>
                     <th>보기3</th>
                     <th>보기4</th>
                     <th>보기5</th>
                     <th>삭제  / 수정</th>
                  </tr>
               </thead>
               <tbody>
                  
                 	<c:forEach var="member" items="${list }">
						<tr>
							<td>${member.p_t_q_num }</td>
							<td>${member.maintext }</td>
							<td>${member.admin_num }</td>
							<td>${member.correct }</td>
							<td>${member.chioce1 }</td>
							<td>${member.chioce2 }</td>
							<td>${member.chioce3 }</td>
							<td>${member.chioce4 }</td>
							<td>${member.chioce5 }</td>
							<td>
								<button type="button" class="btn btn-primary btn-xs btnDelete" onclick="location='p_q_bdelete.action?p_t_q_num=${member.p_t_q_num }'">삭제</button>
								<button type="button" class="btn btn-primary btn-xs btnUpdate" value="${search.p_t_q_num }" onclick="$('html').animate({scrollTop : 0}, 100)">수정</button>
							</td>
						</tr>
						</c:forEach>
               </tbody>
            </table>
            
         
            
         </div>
      </div><!-- end .panel panel-default -->
      
		
      
   </div>

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