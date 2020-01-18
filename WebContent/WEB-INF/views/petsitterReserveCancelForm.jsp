<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri ="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Petriots! | 예약 취소</title>
<link href="css/ReviewForm.css" rel="stylesheet">
<link href="vendor_mypage/bootstrap/css/bootstrap.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">
	
	$(function()
	{
		
		
		$("#send").click(function()
		{
			var really = confirm("취소하시겠습니까?");
			
			if(really == true)
			{
				if($("#pw").val() === "1234")
					$("#cancelForm").submit();
				else
				{
					alert("비밀번호가 맞지 않습니다.")
					return;
				}
			}
			else
			{
				return;
			}
		});
		
	});


</script>
</head>
<body>

<div class="review-form">

	<div>
	<h1>취소 사유</h1>	
	</div>
		
		<form action="rejectInput.action" method="post" id="cancelForm">
			<h3>비밀번호 입력</h3>
			<input type="password" class="form-group" placeholder="비밀번호를 입력해주세요." id="pw" required
				style="width: 40%;">
			<h3>취소 사유 입력</h3>
            <textarea cols="80" id="id_content" maxlength="1024" name="content" rows="10" style="resize: none;" placeholder="취소 사유를 작성하여 주세요"
            	required></textarea>
            	
            <button type="button" class="btn btn-success" id="send">예약취소하기</button>
            <button type="button" class="btn btn-danger" onclick="#">돌아가기</button>
		</form>
    </div>
</body>
</html>