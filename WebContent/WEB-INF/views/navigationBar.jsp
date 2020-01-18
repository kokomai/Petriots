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
<title>NavigationBar.jsp</title>
  <title>Heroic Features - Start Bootstrap Template</title>
  
<!-- <link href="css/mainpage.css" rel="stylesheet"> -->

<!-- Bootstrap core JavaScript -->
<!-- <script src="vendor_mypage/jquery/jquery.min.js"></script> -->
<!-- <script src="vendor_mypage/bootstrap/js/bootstrap.bundle.min.js"></script> -->
</head>
<body>
<!-- Navigation -->
  <nav class="navbar navbar-expand-lg navbar-dark fixed-top" style="background-color: rgba(108, 201, 251);
    border-radius: 0%; z-index: 500px;" >
    <div class="container">
      <a class="navbar-brand" href="mainpage.action">PETRIOTS!!</a>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarResponsive">
        <ul class="navbar-nav ml-auto">
          <%-- <c:if test="${! empty sessionScope.login.getUser_num() }">
       	  <li class="nav-item">
			<jsp:include page="message_slidedown.jsp"></jsp:include>
          </li>
          </c:if> --%>
          <li class="nav-item">
            <a class="nav-link" href="searchpetsitter.action">펫시터 찾기</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="<%=cp %>/noticelist.action">공지사항</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="<%=cp %>/questionlist.action">Q&A</a>
          </li>
          
          <c:if test="${! empty sessionScope.login.getUser_num() }">
          <li class="nav-item">
            <a class="nav-link" href="mypagemain.action">마이페이지</a>
          </li>
          </c:if> 
  			
  		  <c:if test="${! empty sessionScope.login.getP_s_num() }">
          <li class="nav-item" >
          	<a class="nav-link" href="petsittermain.action">펫시터 페이지</a>
          </li>
          </c:if> 
          
          <c:if test="${! empty sessionScope.admin }">
          <li class="nav-item" >
          	<a class="nav-link" href="Petsitter_main.jsp">관리자 페이지</a>
          </li>
          </c:if>
          
          <c:if test="${empty sessionScope.login.getUser_num()}">
          <li class="nav-item">
          	<button type="button" class="loginbutton" onclick="location.href='login_ok.action'">로그인</button>
          </li>
		  </c:if> 
		  <c:if test="${! empty sessionScope.login.getUser_num() }">
          <li class="nav-item" >
          	<jsp:include page="profile_button.jsp"></jsp:include>
          </li>
          </c:if>
        </ul>
      </div>
    </div>
  </nav>
</body>
</html>