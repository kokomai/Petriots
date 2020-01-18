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
<title>adminLogin.jsp</title>
<link rel="stylesheet" href="<%=cp %>/css/mainpage.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>


<script type="text/javascript">

	function login()
	{
		try
		{
			var f = document.loginForm;
			
			if(!f.Id.value)
			{
				alert("아이디를 입력하세요.");
				f.Id.focus();
				return;
			}
			
			if(!f.pw.value)
			{
				alert("패스워드를 입력하세요.");
				f.pw.focus();
				return;
			}
			alert(f.Id.value + f.pw.value)
			f.action = "<%= cp%>/login_ok.action";
			f.submit();
			
			
		} catch (e)
		{
			alert(e.toString());
		}
	}

</script> 

</head>
<body>

	<div class="card align-middle" style="width: 30.8rem; height: 33.8rem; border-radius: 30.8px; margin-top: 160px; margin-left: auto; margin-right: auto;">
		<div style="margin-top: 30px;">
			<h2 class="card-title text-center" style="color: #113366;">관리자로그인</h2><hr>
		</div>
		<div class="card-body">
			<form action="adminlogin.action" method="post" name="loginForm">
					<table style="width: 400px;" align="center">
						
						<tr style="height: 30px;">
							<td>아이디</td>
							<td>
								<input type="text" id="id" name="Id" size="15" class="boxTF" id="Id" placeholder="아이디">
							</td>
						</tr>
						
						<br>
						
						<tr style="height: 25p;">
							<td>패스워드</td>
							<td>
								<input type="password" id="pw"  name="pw" size="15" class="boxTF" id="pw" placeholder="패스워드">
							</td>
						</tr>
						
						<br>
						
						<tr style="height: 30px;">
							<td colspan="2" align="center">
								<button type="submit" id="join-submit" class="btn btn-primary"  style="margin-top:40px;">
									로그인
								</button>
							</td>
						</tr>
						
					</table>
				</form>
				<hr style="margin-top: 40px; margin-bottom: 50px;">
			
			
			
		</div>
	</div>





</body>
</html>