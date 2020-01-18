<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>

<head>
<!-- Required meta tags -->
<!-- <link rel="stylesheet" href="css_mypage/cards_hyunwoo.css" /> -->
<!-- <link href="vendor_mypage/bootstrap/css/bootstrap.css" rel="stylesheet">

Bootstrap core JavaScript
<script src="vendor_mypage/jquery/jquery.min.js"></script>
<script src="vendor_mypage/bootstrap/js/bootstrap.bundle.min.js"></script> -->


<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<title>Explore</title>

<style type="text/css">
@import url(https://fonts.googleapis.com/css?family=Raleway:300,700);

body {
	
}

.qForm_wrapper {
	width: 90%;
	margin: 0 auto;
}
</style>

<script type="text/javascript">
  	$(function()
	{	
  		$("#accept-terms").click(function()
		{	
  			
  			if($("#accept-terms").is(":checked"))
  			{	
  				$(".form-check-label").html("네!!");
  			}
  			else
  			{
  				$(".form-check-label").html("내용을 확인하셨습니까?");
  			}
  			
  		});
  		
	});
  
  </script>

</head>

<body>
	<div class="qForm_wrapper">
		<h1>Petriots! | 문의하기</h1>
		<br />
		<main class="formStyle">
			<form class="needs-validation was-validated contract-form" action="questionok.action" method="GET">
				<div style="display: flex; flex-direction: row;">
					<div class="form-group">
						<label for="forename" style="font-size: 15pt;">회원 번호</label> 
						<input type="text" id="user_num" name="user_num" class="form-control" required style="font-size: 15pt;" value="${usernum }"/>
					</div>

				</div>

				<div class="form-group">
					<label for="exampleInputEmail1" style="font-size: 15pt;">이메일</label>
					<input type="text" class="form-control" name="email" id="email" placeholder="example@explorewonders.com" required style="font-size: 15pt;" />
					 <small id="emailHelp" class="form-text text-muted">응답을 받으실 이메일 주소를 입력해주세요</small>
				</div>

				<div class="form-group">
					<label for="gender" style="font-size: 15pt;">문의사항</label> 
					<select name="m_q_t_num" id="m_q_t_num" class="form-control" required style="font-size: 15pt;">
						<option value="">선택해주세요</option>
						<c:forEach var="menu" items="${questiondata }">
	                    <option value="${menu.m_q_t_num }">${menu.type }</option>
	                    </c:forEach>
					</select>
				</div>

				<div class="form-group">
					<label for="bodyMessage" style="font-size: 15pt;">내용</label>
					<textarea class="form-control" rows="5" id="maintext" name="maintext" placeholder="내용을 입력해 주세요" required style="font-size: 15pt; resize: none;"></textarea>
				</div>

				<div class="form-check"
					style="display: flex; flex-direction: column;">

					<input type="checkbox" id="accept-terms" class="form-check-input" style="z-index: -999px; position: relative; left: 25px; top: 15px;" required /> 
					<label for="accept-terms" class="form-check-label" style="font-size: 11pt;">내용을 확인하셨습니까?</label>
				</div>
				<div>
					<br>
					<button type="submit" id="submit" name="submit" class="btn btn-outline-success" style="width: 100px;">제출</button>
					<button type="button" id="cancel" name="cancel" class="btn btn-outline-danger" style="width: 100px;" onclick="location.href='mypagemain.action'">돌아가기</button>
				</div>
				<br>

			</form>
		</main>

	</div>
	<div style="margin-bottom: 10%"></div>


</body>
</html>