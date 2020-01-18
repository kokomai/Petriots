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

<title>adminCutline.jsp</title>
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
    	  $("#cutline_num_dp").show(); 
    	  $("#admin_num_dp").show(); 
    	  $("#p_cl_dp").show(); 
    	  $("#i_cl_dp").show(); 
    	  $("#isudate	_dp").show(); 
    	  $("#button_la").show(); 
    	  $("#title").show(); 
    	  
    	  $("#cutline_num").val($(this).val());
    	  $("#cutline_num").val($(this).parents("tr").find("td:eq(0)").text());
          $("#admin_num").val($(this).parents("tr").find("td:eq(1)").text());
          $("#p_cl").val($(this).parents("tr").find("td:eq(2)").text());
          $("#i_cl").val($(this).parents("tr").find("td:eq(3)").text());
          $("#isudate").val($(this).parents("tr").find("td:eq(4)").text());
          
    	  $('#p_cl').prop('readonly', false);
    	  $('#i_cl').prop('readonly', false);
    	  
         $("#title").text("커트라인 정보 수정").css({"color":"red", "font-weight":"bold"});
         $("#cutline_num_la").text("커트라인 번호").css({"color":"red", "font-weight":"bold"});
         $("#admin_num_la").text("관리자번호").css({"color":"red", "font-weight":"bold"});
         $("#p_cl_la").text("인성검사커트라인").css({"color":"red", "font-weight":"bold"});
         $("#i_cl_la").text("지식검사커트라인").css({"color":"red", "font-weight":"bold"});
         $("#isudate_la").text("변경날짜").css({"color":"red", "font-weight":"bold"});
         
         $("#button_la").text("커트라인수정").css();
         
         $("#memberForm").attr("action", "cutlineupdate.action");
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
<div class="container" style="margin: 20px 120px 0px 360px; width:1200px;" align="center">

	<div class="panel-group" style="width:1200px; border: solid 1px; margin: 8px; dispay: none;">
      <div class="panel panel-default">
         <div class="panel-heading" id="title"  style="background-color: rgba(108, 201, 251,0.3); display:none;">
                  커트라인 리스트
         </div>
         
         <div class="panel-body">
            <form action="cutlineupdate.action" method="post" role="form" id="memberForm">
            
               <div class="form-group" style="display:none;" id="cutline_num_dp">
                  <label for="커트라인번호" id="cutline_num_la">
                    
                  </label>
                  <input type="text" id="cutline_num" name="cutline_num" class="form-control" readonly>
               </div>
               
               <div class="form-group" style="display:none;" id="admin_num_dp">
                  <label for="관리자 번호" id="admin_num_la">
                    	
                  </label>
                  <input type="text" id="admin_num" name="admin_num" class="form-control" readonly>
               </div>
               
               <div class="form-group" style="display:none;" id="p_cl_dp">
                  <label for="인성커트라인" id="p_cl_la">
                     
                  </label>
                  <input type="text" id="p_cl" name="p_cl" class="form-control" readonly>
               </div>
               
               <div class="form-group" style="display:none;" id="i_cl_dp">
                  <label for="지식커트라인" id="i_cl_la">
                     
                  </label>
                  <input type="text" id="i_cl" name="i_cl" class="form-control" readonly>
               </div>
               
               <div class="form-group" style="display:none;" id="isudate_dp">
                  <label for="변경날짜" id="isudate_la">
                     
                  </label>
                  <input type="text" id="isudate" name="isudate" class="form-control" readonly>
               </div>
               
               <button type="submit" class="btn btn-primary btn-sm btnSubmit" id="button_la"  style="display:none; margin:5px;">커트라인수정</button>
               
            </form>
         </div>
         </div>
      </div><!-- end .panel panel-default -->
      
      
      <div class="panel panel-default" style="width: 1200px;	margin: 8px;">
         <div class="panel-heading" style="background-color: rgba(108, 201, 251,0.3);">
          	커트라인 리스트 출력  
         </div>
         
         <div class="panel-body">
            <table class="table">
               <thead>
                  <tr>
                     <th>커트라인번호</th>
                     <th>관리자번호</th>
                     <th>인성검사</th>
                     <th>지식검사</th>
                     <th>변경날짜</th>
                     <th>삭제  / 수정</th>
                  </tr>
               </thead>
               <tbody>
                  
                  <c:forEach var="cutline" items="${list }">
                  <tr>
                     <td>${cutline.cutline_num }</td>
                     <td>${cutline.admin_num }</td>
                     <td>${cutline.p_cl }</td>
                     <td>${cutline.i_cl }</td>
                     <td>${cutline.isudate }</td>
                     <td>
                       <%--  <button type="button" class="btn btn-default btn-xs btnDelete" onclick="location='cutlinedelete.action?cutline_num=${cutline.cutline_num }'">삭제</button> --%>
                        <button type="button" class="btn btn-default btn-xs btnUpdate" value="${cutline.cutline_num }">수정</button>
                     </td>
                  </tr>
                  </c:forEach>
               </tbody>
            </table>
            
         
            
         </div>
      </div><!-- end .panel panel-default -->
      
   
   </div>


	
	
	
	
<!-- Footer -->
	<footer class="py-5" style=" margin: 282px 60px 0px 60px; width:1860px;  background-color: rgba(108, 201, 251,0.3)">
		<div class="container">
			<p class="m-0 text-center text-white">Copyright &copy; Petriots! 2019</p>
		</div>
		<!-- /.container -->
	</footer>
<!-- /Footer -->

</body>
</html>