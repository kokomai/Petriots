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

<title>Petriots! | 회원 탈퇴</title>
<link rel="stylesheet" href="css_mypage/cards_hyunwoo.css" />
<link href="vendor_mypage/bootstrap/css/bootstrap.css" rel="stylesheet">
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" />
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
			$("#user_delete").click(function()
			{
				var sure = confirm("정말 탈퇴하시겠습니까?");
				if(sure == true)
				{
					$("#user_delete_form").submit();
				}
				else
				{
					return;
				}
			});
			
			/* $("#wd_r_num").change(function()
			{
				if($("#wd_r_num").val()==4)
				{ 
					$("#details").val("");
					$("#details").prop("disabled",false);
				}
				else
				{
					$("#details").val("기타 사유를 입력해주세요");
					$("#details").prop("disabled",true);
				}
			}) */
		});
</script>

<script type="text/javascript">
	$(document).ready(function()
	{
		//이메일 domain선택 selectBox
		$('#wd_r_num').change(function()
		{
			$("#wd_r_num option:selected").each(function()
			{
				//직접입력일 경우
				if ($(this).val() == '4')
				{
					$("#details").val(''); //textBox값 초기화
					$("#details").attr("readonly", false); //textBox 활성화
				}
				else
				{
					$("#details").val($(this).text()); //selectBox에서 선택한 값을 textBox에 입력
					$("#details").attr("readonly", true); //textBox 비활성화
				}
			});
		});
	});
</script>

<script type="text/javascript">
	$(function()
	{
		$("input").keyup(function()
		{
			var pwd = $("#pwd").val();
			var pwd2 = $("#pwd2").val();
			if (pwd != "" || pwd2 != "")
			{
				if (pwd == pwd2)
				{
					$("#alert-danger").hide();
					$("#user_delete").removeAttr("disabled");
				} else
				{
					$("#alert-danger").show();
					$("#user_delete").attr("disabled", "disabled");
				}
			}
		});
	});
</script>


</head>
<body>

	<header style="padding-left: 60px;">
		<!-- Navigation -->
<jsp:include page="/WEB-INF/views//navigationBar.jsp"/>

		<!-- //Navigation -->

		<!-- banner -->
		<jsp:include page="/WEB-INF/views//banner.jsp" />
		<!-- //banner -->
	</header>
	<jsp:include page="/WEB-INF/views//mypageSideMenu.jsp" />

	<!-- 메인 콘텐츠 -->
	<div class="container">

		<div class="row"
			style="display: flex; flex-direction: row; height: 400px;" align="center">

			<div class="card-header" style="width: 100%; background-color: rgba(108, 201, 251, 0.3); ">회원 탈퇴</div>

			<div class="card-body"
				style="display: flex; flex-direction: column; width: 100%; height: 350px;" align="center">
				<form role="form" action="userdelete.action" method="POST" id="user_delete_form">
				<div style="width:100%; height:310px;"align="center" >
				<c:forEach var="data" items="${withdrawaldata }">
					<div class="form-group">
						<input type="hidden" name="pwd2" id="pwd2" value="${data.pwd }">
                  	 	<label for="inputName">비밀번호 입력</label>
                       	<input type="password" class="form-control" name="pwd" id="pwd" placeholder="비밀번호를 입력해주세요" style="width:30%;">
                       	<div class="alert alert-danger" id="alert-danger" style="margin-top:10px; width:30%; display: none">비밀번호가 일치하지 않습니다.</div>
                	</div>
                </c:forEach>
                	<div class="form-group" style="height:100px;">
                  	 	<label for="inputName">사유 입력</label>
                       	<div class="form-group" style="height:100px;">
	                        	<select class="del_reason" id="wd_r_num" name="wd_r_num">
	                        		<option value="">사유를 선택해주세요</option>
	                        		<c:forEach var="reason" items="${withdrawalreason }">
	                        		<option value="${reason.wd_r_num }">${reason.reason }</option>
	                        		</c:forEach>
	                        	</select>
	                        	<input type="text" class="form-control del_reason2 details" id="details" name="details"
	                        	 placeholder="기타 사유를 입력해주세요" style="width:40%;" readonly="readonly">
	                    	</div>
                	</div>
                	<div style="width: 100%; height: 80px; " align="center">
                	<button type="button" id="user_delete" class="btn btn-danger" disabled="disabled">회원탈퇴</button>
					<a class="btn btn-secondary" href="mainpage.action">탈퇴취소</a>
				</div>
                	
				</div>
				
				</form>
			</div>


		</div>

	</div>
	<!-- /.container -->
	<!-- // 메인 콘텐츠 -->
	<div style="margin-top:150px;"></div>
	<br>

<!-- Footer -->
<jsp:include page="footer.jsp"></jsp:include>
<!-- /Footer -->


</body>
</html>