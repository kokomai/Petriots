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

<title>adminChecklistModify.jsp</title>
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

.span
{
	display : none;
}

</style>

<script type="text/javascript">

   $(function()
   {
      $(".btnUpdate").on("click", function()
      {
         $("#title").text("체크리스트 수정").css({"color":"red", "font-weight":"bold"});
         
         $("#c_d_r_num_dp").show(); 
         $("#c_d_num_dp").show(); 
         $("#maintext_dp").show(); 
         
         $("#c_d_r_num").val($(this).val());
         $("#c_d_r_num").val($(this).parents("tr").find("td:eq(0)").text());
         $("#c_d_num").val($(this).parents("tr").find("td:eq(4)").text());
         $("#maintext").val($(this).parents("tr").find("td:eq(8)").text());
       
         $("#memberForm").attr("action", "checklistmodify.action");
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
<div class="container" style="margin: 20px 50px 10px 400px;" align="center">

	<div class="panel-group" style="border: 1px solid; width: 1100px;">
      <div class="panel panel-default">
         <div class="panel-heading" id="title" style="background-color: rgba(108, 201, 251,0.3);">
         체크리스트관리
         </div>
         
         
         <div class="panel-body">
         <form action="checklistmodify.action" method="post" role="form" id="memberForm">
  
               <div class="form-group"  style="display:none;" id="c_d_r_num_dp">
                  <label for="search">
                     기본값 항목 등록 번호 
                  </label>
                  <input type="text" id="c_d_r_num" name="c_d_r_num" class="form-control" readonly>
               </div>
               
               <div class="form-group" style="display:none;" id="c_d_num_dp">
                  <label for="search">
                     체크리스트 기본값 번호
                  </label>
                  <input type="text" id="c_d_num" name="c_d_num" class="form-control" readonly>
               </div>
               
               <div class="form-group"style="display:none;" id="maintext_dp">
                  <label for="search">
                     내용
                  </label>
                  <input type="text" id="maintext" name="maintext" class="form-control">
               </div>
               
               <button type="submit" class="btn btn-primary btn-sm btnSubmit" style="margin:1px;">수정</button>
               
            </form>	
         </div>
      </div><!-- end .panel panel-default -->
      
      
      <div class="panel panel-default" style="margin:10px 30px 10px 10px;">
         <div class="panel-heading" style="background-color: rgba(108, 201, 251,0.3); width: 1100px;">
               체크리스트 내용 출력
         </div>
         
         <div class="panel-body">
            <table class="table">
               <thead>
                  <tr>
                     <th>기본값 항목 등록 번호</th>
					 <th></th>	     
					 <th></th>	     
					 <th></th>	     
                     <th>체크리스트 기본값 번호</th>		
                     <th></th>	     
                     <th></th>	     
                     <th></th>	     
                     <th>내용</th>
                     <th></th>	                    
                     <th></th>	                    
                     <th></th>	                    
                     <th></th>	                    
                     <th></th>	                    
                     <th>수정 / 삭제</th>
                  </tr>
               </thead>
               <tbody>
                  
                  <c:forEach var="ccldr" items="${list }">
                  <tr>
                     <td>${ccldr.c_d_r_num }</td>
                     <td></td>
                     <td></td>
                     <td></td>
                     <td>${ccldr.c_d_num }</td>
                     <td></td>
                     <td></td>
                     <td></td>
                     <td>${ccldr.maintext }</td>
                     <td></td>
                     <td></td>
                     <td></td>
                     <td></td>
                     <td></td>
                     <td>
                        <button type="button" class="btn btn-primary btn-xs btnUpdate" value="${ccldr.c_d_r_num }" onclick="$('html').animate({scrollTop : 0}, 100)">수정</button>
                        <button type="button" class="btn btn-primary btn-xs btnDelete" onclick="location='ccl_d_rdelete.action?c_d_r_num=${ccldr.c_d_r_num }'">삭제</button>
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
	<footer class="py-5" style="padding-left: 60px; magin: auto;  background-color: rgba(108, 201, 251,0.3)">
		<div class="container">
			<p class="m-0 text-center text-white">Copyright &copy; Petriots! 2019</p>
		</div>
		<!-- /.container -->
	</footer>
<!-- /Footer -->

</body>
</html>