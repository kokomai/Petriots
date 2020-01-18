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

<title>adminQuestion.jsp</title>
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
         $("#title").text("문의 답글달기").css({"color":"red", "font-weight":"bold"});
        
        $("#admin_num").prop('readonly', false);
        $('#a_maintext').prop('readonly', false);
         
         $("#m_a_num_dp").show(); 
         $("#admin_num_dp").show(); 
         $("#a_maintext_dp").show(); 
         $("#a_deldate_dp").show(); 
         $("#a_isudate_dp").show(); 
          
         $("#m_a_num").val($(this).val());
         $("#m_a_num").val($(this).parents("tr").find("td:eq(6)").text());
         $("#admin_num").val($(this).parents("tr").find("td:eq(7)").text());
         $("#a_maintext").val($(this).parents("tr").find("td:eq(8)").text());
         $("#m_q_num").val($(this).parents("tr").find("td:eq(9)").text());
         $("#a_deldate").val($(this).parents("tr").find("td:eq(10)").text());
         $("#a_isudate").val($(this).parents("tr").find("td:eq(11)").text());
         
         $("#memberForm").attr("action", "questionupdate.action");
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
<div class="container" style="margin-left: 50px;" align="center">

	<div class="panel-group" style="border: 1px solid; width: 1800px;">
      <div class="panel panel-default">
         <div class="panel-heading" id="title"  style="background-color: rgba(108, 201, 251,0.3);" >
                  1대1문의
         </div>
         
         <div class="panel-body">
          
            	 <div class="form-group" style="display:none;" id="m_q_num_dp">
                  <label for="문의번호"  id="m_q_num_la">
                   문의번호
                  </label>
                  <input type="text" id="m_q_num" name="m_q_num" class="form-control" readonly="readonly">
              	 </div>
               
               <div class="form-group" style="display:none;" id="user_num_dp">
                  <label for="유저번호"  id="user_num">
                   유저번호
                  </label>
                  <input type="text" id="user_num" name="user_num" class="form-control" readonly="readonly">
               </div>
               
               <div class="form-group" style="display:none;" id="isudate_dp">
                  <label for="문의날짜"  id="isudate_la">
                   문의날짜
                  </label>
                  <input type="text" id="isudate" name="isudate" class="form-control" readonly="readonly">
               </div>
               
               <div class="form-group" style="display:none;" id="maintext_dp">
                  <label for="문의내용"  id="maintext_la">
                   문의내용
                  </label>
                  <input type="text" id="maintext" name="maintext" class="form-control" readonly="readonly">
               	</div>
               
               <div class="form-group" style="display:none;" id="m_q_t_num_dp">
                  <label for="문의분류번호"  id="m_q_t_num_la">
                   문의분류번호
                  </label>
                  <input type="text" id="m_q_t_num" name="m_q_t_num" class="form-control" readonly="readonly">
               </div>
               
               <div class="form-group" style="display:none;" id="deldate_dp">
                  <label for="문의삭제일자"  id="deldate_la">
                   문의삭제일자
                  </label>
                  <input type="text" id="deldate" name="deldate" class="form-control" readonly="readonly">
               </div>
            	 <!-- ------------------------------------------------------------------------------------------------------------------------------------------------------ -->
            	  <form action="questionupdate.action" method="post" role="form" id="memberForm">
               <div class="form-group" style="display:none;" id="m_a_num_dp">
                  <label for="답글번호"  id="m_a_num_la">
                    답글번호
                  </label>
                  <input type="text" id="m_a_num" name="m_a_num" class="form-control" readonly="readonly">
               </div>
               
               <div class="form-group" style="display:none;" id="admin_num_dp">
                  <label for="문의분류번호" id="admin_num_la">
                    관리자번호
                  </label>
                  <input type="text" id="admin_num" name="admin_num" class="form-control" readonly="readonly">
               </div>
               
               <div class="form-group" style="display:none;" id="a_maintext_dp">
                  <label for="유저번호" id="a_maintext_la">
                    답글내용
                  </label>
                  <input type="text" id="a_maintext" name="a_maintext" class="form-control" readonly="readonly">
               </div>
          
               <div class="form-group" style="display:none;" id="a_deldate_dp">
                  <label for="문의날짜" id="a_deldate_la">
                     답글삭제일자
                  </label>
                  <input type="text" id="a_deldate" name="a_deldate" class="form-control" readonly="readonly">
               </div>
               
               <div class="form-group" style="display:none;" id="a_isudate_dp">
                  <label for="문의내용" id="a_isudate_la">
                    답변일자
                  </label>
                  <input type="text" id="a_isudate" name="a_isudate" class="form-control" readonly="readonly">
               </div>
               
              
               <button type="submit" class="btn btn-primary btn-sm btnSubmit" style="margin: 2px;">답글달기</button>
               
            </form>
         </div>
      </div><!-- end .panel panel-default -->
      
      <div class="panel panel-default">
         <div class="panel-heading" style="background-color: rgba(108, 201, 251,0.3); ">
          	회원정보  
         </div>
         
         <div class="panel-body" >
            <table class="table" >
               <thead>
                  <tr>
                     <th>문의번호</th>
                     <th>유저번호</th>
                     <th>문의날짜</th>
                     <th>문의내용</th>
                     <th>문의분류번호</th>
                     <th>문의삭제일자</th>
                     <th>답글달기</th>
                     
                  </tr>
               </thead>
               <tbody>
                  
                  <c:forEach var="question" items="${list }">
                  <tr>
                     <td>${question.m_q_num }</td>
                     <td>${question.user_num }</td>
                     <td>${question.isudate }</td>
                     <td>${question.maintext }</td>
                     <td>${question.m_q_t_num }</td>
                     <td>${question.deldate }</td>
                     <td style="display:none;">${question.m_a_num }</td>
                     <td style="display:none;">${question.admin_num }</td>
                     <td style="display:none;">${question.a_maintext }</td>
                     <td style="display:none;">${question.m_q_num }</td>
                     <td style="display:none;">${question.a_deldate }</td>
                     <td style="display:none;">${question.a_isudate }</td>
                     
                     <td>
                        
                        <button type="button" class="btn btn-primary btn-xs btnUpdate" value="${question.m_a_num }">답글달기</button>
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
	<footer class="py-5" style="padding-left: 60px;  background-color: rgba(108, 201, 251,0.3)">
		<div class="container">
			<p class="m-0 text-center text-white">Copyright &copy; Petriots! 2019</p>
		</div>
		<!-- /.container -->
	</footer>
<!-- /Footer -->

</body>
</html>