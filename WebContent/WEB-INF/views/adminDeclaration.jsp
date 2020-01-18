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

<title>Admin_declaration.jsp</title>
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
         $("#title").text("신고처리").css({"color":"red", "font-weight":"bold"});
         
        
         $("#rpt_num_dp").show();
         $("#reporter_dp").show();
         $("#reported_dp").show();
         $("#isudate_dp").show();
         $("#details_dp").show();
         $("#rpt_type_num_dp").show();
         $("#sct_num_dp").show();
         $("#admin_num_dp").show();         
         $("#sct_type_num_dp").show();
         $("#sctday_dp").show();
         $("#s_isudate_dp").show();
         
         $("#rpt_num_dp").text("신고번호").css({"color":"dark"});
         $("#sct_type_num_css").text("신고처리 종류 번호 (숫자만 입력 1.경고 2. 활동정지 3. 강퇴) ").css({"color":"red"});
         
         $("#rpt_num").val($(this).val());
         $("#rpt_num").val($(this).parents("tr").find("td:eq(0)").text());
         $("#reporter").val($(this).parents("tr").find("td:eq(1)").text());
         $("#reported").val($(this).parents("tr").find("td:eq(2)").text());
         $("#isudate").val($(this).parents("tr").find("td:eq(3)").text());
         $("#details").val($(this).parents("tr").find("td:eq(4)").text());
         $("#rpt_type_num").val($(this).parents("tr").find("td:eq(5)").text());
         $("#sct_num").val($(this).parents("tr").find("td:eq(6)").text());
         $("#admin_num").val($(this).parents("tr").find("td:eq(7)").text());
         $("#sct_type_num").val($(this).parents("tr").find("td:eq(8)").text());
         $("#sctday").val($(this).parents("tr").find("td:eq(9)").text());
         $("#s_isudate").val($(this).parents("tr").find("td:eq(10)").text());
      
         
         $("#memberForm").attr("action", "declarationupdate.action");
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
<div class="container" style="margin: 20px 50px 20px 60px;" align="center">

	<div class="panel-group" style="border: 1px solid; width: 1800px;">
      <div class="panel panel-default">
         <div class="panel-heading" id="title" style="background-color: rgba(108, 201, 251,0.3);">
         신고인조회
         </div>
         
         
         <div class="panel-body">
         <form action="declarationupdate.action" method="post" role="form" id="memberForm">
            	<!-- 신고테이블 -->
               <div class="form-group" >
                  <label for="search" id="rpt_num_dp">
                     SEARCH : 
                  </label>
                  <input type="text" id="rpt_num" name="rpt_num" class="form-control" readonly>
               </div>
               
               <div class="form-group" style="display:none;" id="reporter_dp">
                  <label for="search">
                     신고인 
                  </label>
                  <input type="text" id="reporter" name="reporter" class="form-control" readonly>
               </div>
               
               <div class="form-group"style="display:none;" id="reported_dp">
                  <label for="search">
                     피신고인 
                  </label>
                  <input type="text" id="reported" name="reported" class="form-control" readonly>
               </div>
               
               <div class="form-group"style="display:none;" id="isudate_dp">
                  <label for="search">
                    신고날짜
                  </label>
                  <input type="text" id="isudate" name="isudate" class="form-control" readonly>
               </div>
               
               <div class="form-group"style="display:none;" id="details_dp">
                  <label for="search">
                     신고내용
                  </label>
                  <input type="text" id="details" name="details" class="form-control" readonly>
               </div>
               <!-- 신고테이블  끝-->
               
               
               <!-- 신고구분테이블 -->
               
               <div class="form-group"style="display:none;" id="rpt_type_num_dp">
                  <label for="search">
                     신고구분번호
                  </label>
                  <input type="text" id="rpt_type_num" name="rpt_type_num" class="form-control" readonly>
               </div>
               
              
               
               <!-- 신고구분테이블  끝-->
               
               <!--  신고 처리테이블 입력폼 전송-->
               
               <div class="form-group"style="display:none;" id="sct_num_dp">	
                  <label for="search">
                     신고처리번호
                  </label>
                  <input type="text" id="sct_num" name="sct_num" class="form-control" readonly>
               </div>
               
               <div class="form-group"style="display:none;" id="admin_num_dp">
                  <label for="search">
                     관리자번호
                  </label>
                  <input type="text" id="admin_num" name="admin_num" class="form-control">
               </div>
             
               <div class="form-group"style="display:none;" id="sct_type_num_dp">
                  <label for="search" id="sct_type_num_css">
                     신고처리 종류 번호 (숫자만 입력 1.경고 2. 활동정지 3. 강퇴) 
                  </label>
                  <input type="text" id="sct_type_num" name="sct_type_num" class="form-control" >
               </div>
               
               <div class="form-group"style="display:none;" id="sctday_dp">
                  <label for="search">
                     일수
                  </label>
                  <input type="text" id="sctday" name="sctday" class="form-control">
               </div>
               
               <div class="form-group"style="display:none;" id="s_isudate_dp">
                  <label for="search">
                     신고처리 일자
                  </label>
                  <input type="text" id="s_isudate" name="s_isudate" class="form-control" readonly>
               </div>
               
               <button type="submit" class="btn btn-primary btn-sm btnSubmit">신고처리</button>
               
            </form>	<!--  신고 처리테이블 입력폼 전송 끝-->
         </div>
      </div><!-- end .panel panel-default -->
      
      
      <div class="panel panel-default" style="margin: 10px;">
         <div class="panel-heading" style="background-color: rgba(108, 201, 251,0.3);">
                신고 내용 출력
         </div>
         
         <div class="panel-body">
            <table class="table">
               <thead>
                  <tr>
                     <th>신고번호</th> <!-- report 테이블 -->
                     <th>신고인</th>		<!-- report 테이블 -->
                     <th>피신고인</th>	<!-- report 테이블 -->
                     <th>신고날짜</th>	<!-- report 테이블 -->
                     <th>신고내용</th>	<!-- report 테이블 -->
                     <th>신고구분번호</th>  <!-- report 테이블 -->
                     <th>신고처리번호</th>
                     <th>관리자번호</th>
                     <th>신고처리종류번호</th>
                     <th>일수</th>
                     <th>신고처리일자</th>
                     
                     <th>신고내용 처리하기</th>
                  </tr>
               </thead>
               <tbody>
                  
                  <c:forEach var="declaration" items="${list }">
                  <tr>
                     <td>${declaration.rpt_num }</td>
                     <td>${declaration.reporter }</td>
                     <td>${declaration.reported }</td>
                     <td>${declaration.isudate }</td>
                     <td>${declaration.details }</td>
                     <td>${declaration.rpt_type_num }</td>
                     <td>${declaration.sct_num }</td>
                     <td>${declaration.admin_num }</td>
                     <td>${declaration.sct_type_num }</td>
                     <td>${declaration.sctday }</td>
                     <td>${declaration.s_isudate }</td>
                    
                     <td>
                        <button type="button" class="btn btn-primary btn-xs btnUpdate" value="${declaration.rpt_num }">신고처리</button>
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