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

<title>Petriots! | 펫시터 인성 검사</title>
<link href="vendor_mypage/bootstrap/css/bootstrap.css" rel="stylesheet">
<link href="css/mainpage.css" rel="stylesheet">
<!-- Bootstrap core JavaScript -->
<script src="vendor_mypage/jquery/jquery.min.js"></script>
<script src="vendor_mypage/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  
<style type="text/css">
/* css here */

{
  border: 1px dotted black;
}

p.question {
  font-family: Arial, sans-serif;
	  font-size:20px;
  color: #2E2E2E;
  margin-bottom:0px;
}

h2.quizHeader {
  font-family: Arial, sans-serif;
  font-weight:normal;
  font-size:25px;
  line-height: 27px;
  margin: 24px 0 12px 0;
  padding: 0 0 4px 0;
  border-bottom: 1px solid #a2a2a2;
}

h2.quizScore{
  font-family: Arial, sans-serif;
  font-size:25px;
}

div.quizAnswers{
  font-family: Arial, sans-serif;
  font-size:16px;
  color: #424242;
  padding: 4px 0 4px 0;
}

label {
  font-family: Arial, sans-serif;
  font-size:14px;
  color: #424242;
  vertical-align:top;
}

input.answer[type="radio"] {
  margin-bottom: 10px;
}

input.quizSubmit[type="submit"] {
  -webkit-background-clip: border-box;
  -webkit-background-origin: padding-box;
  -webkit-background-size: auto;
  -webkit-transition-delay: 0s, 0s;
  -webkit-transition-duration: 0.2s, 0.2s;
  -webkit-transition-property: color, background-color;
  -webkit-transition-timing-function: ease, ease;
  box-shadow: rgba(0, 0, 0, 0.498039) 0px 0px 5px 0px;
  color: #ffffff;
  background-color: #c30b0a;
  margin: 0;
  border: 0;
  outline: 0;
  text-transform:uppercase;
  height:35px;
  width:85px;
  border: 1px solid #5E5E5E;
  border-radius:5px;
  
 }

input.quizSubmit[type="submit"]:hover {
  color: #ffffff;
  background: #680f11;
  text-decoration: none;
}

table {
  background-color: #F2F2F2;
	  border:1px solid #BDBDBD;
  border-radius:5px;
  padding:10px;
  padding-left:25px;
  box-shadow: rgba(0, 0, 0, 0.498039) 0px 0px 1px 0px;
}

th {
  
}

tr {
  
}

td {

}

.submitter {
	  width:85px;
}

.hide {
	  display:none;
}


/*SFS light red = #c30b0a;
SFS dark red = #9f2026; */



</style>

<script type="text/javascript">
//scripts here:

function check()
{

	var q = document.getElementsByName("question"); 
// 	alert(q.length)
	for(i=1; i<=q.length; i++)
	{	
		var isCheck = false;
		var chk_radio = document.getElementsByName("q"+i);
		
		
		for(j=0; j<q.length; j++)
		{
/* 		alert(chk_radio[j].checked); */ 
			if(chk_radio[j].checked)
			{	
				isCheck= true;
			}
		}
		
		if(isCheck === false)
		{
		alert("답변을 하지 않은 문제가 있습니다."); 
		return;
		}
	
	}
	
		humanity_form.submit();


}


</script>

</head>
<body>

<header style="padding-left: 60px;">
<!-- Navigation -->

<jsp:include page="/WEB-INF/views/navigationBar.jsp"/>

<!-- //Navigation -->

</header>
<jsp:include page="/WEB-INF/views/mypageSideMenu.jsp"/>

<!-- 메인 콘텐츠 -->
<div class="container">

	<div class="row" style="display:flex; flex-direction: column;">
		<!-- 위탁 중인 항목.. -->
		<div class="col-lg-12" align="center" style=" background-color:rgba(108, 201, 251,0.3);">
			<div style="height:30px;"><span style="font-size: 15pt; font-weight: bold;">인성 검사</span></div>
		<form action="<%=cp %>/personalitytestresult.action" method="post" id="humanity_form">
		<!--컨트롤러 구성해서 합격 시 합격 페이지로, 실패시 실패 페이지로  -->
		
		<c:forEach var="dto" items="${lists }" varStatus="status">
			<div>
		  		<p class="question">${dto.mainText }</p>
	
		    	<input class="answer" type="radio" name="a${status.count }" id="q${status.count }-1" value="1">
		        <label for="q${status.count }-1">${dto.chioce1 }</label>
		    	<br>
		        <input class="answer" type="radio" name="a${status.count }" id="q${status.count }-2" value="2">
		        <label for="q1${status.count }-2">${dto.chioce2 }</label>
		        <br>
		        <input class="answer" type="radio" name="a${status.count }" id="q${status.count }-3" value="3">
		        <label for="q1${status.count }-3">${dto.chioce3 }</label>
		        <br>
		        <input class="answer" type="radio" name="a${status.count }" id="q${status.count }-4" value="4">
		        <label for="q1${status.count }-4">${dto.chioce4 }</label>
		        <br>
		        <input class="answer" type="radio" name="a${status.count }" id="q${status.count }-5" value="5">
		        <label for="q1${status.count }-5">${dto.chioce5 }</label>
		  	</div>
		</c:forEach>
	  	
	  
<br/>
  <div class="submitter">
          <input class="btn btn-primary" id="submitButton" onclick="check()"
          type="button" value="제출" />
    </div>
  
<!--show only wrong answers on submit-->
    <div class="quizAnswers" id="correctAnswer1"></div>
	    <div class="quizAnswers" id="correctAnswer2"></div>
    <div class="quizAnswers" id="correctAnswer3"></div>
    <div class="quizAnswers" id="correctAnswer4"></div>

<!--show score upon submit-->
    <div>
    	<h2 class="quizScore" id="userScore"></h2>
    </div>
	</div>
			
		
 		</form>
 		</div>
 	</div>
</div>
<!-- /.container -->
<!-- // 메인 콘텐츠 -->

<%-- 
<!-- Footer -->
<jsp:include page="Footer.jsp"></jsp:include>
<!-- /Footer -->
 --%>
</body>
</html>