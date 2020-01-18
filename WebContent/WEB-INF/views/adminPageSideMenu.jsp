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
<title>Adminpage_sidemenu.jsp</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css" />
<!-- <script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script> -->
<!-- <script src="//code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script> -->

<style type="text/css">
.side-menu {
  font-family: 명조체;
  
  position: fixed;
  top: 0;
  left: 0;
  margin: 0;
  padding: 0;
  height: 100%;
  width: 60px;
  list-style-type: none;
  background: rgba(108, 201, 251,0.3);
  overflow: hidden;
  transition: width .5s;
  z-index: 99;
}

.side-menu:hover {
  width: 300px;
}

.side-menu li {
  width: 300px;
}

.side-menu li span {
  font-size: 20px;
  margin: 20px 30px 0 22px;
}

.side-menu li a {
  display: block;
  font-size: 20px;
  text-decoration: none;
  color: #fff;
  height: 60px;
}

.side-menu li a:hover
{
  background: #fff;
  color: #6cc9fb;
  display: block;
}
.side-menu li:first-child a
{
  background: #6cc9fb;
  display: block;
   font-size: 20px;
  text-decoration: none;
  color: #fff;
  height: 62px;
}

.menu li ul
{
	display:;
}

</style>

<script type="text/javascript">

   $(function()
   {
      $(". btnSubmit").on("click", function()
      {
         $("#buttonForm").attr("action", "adminlogout.action");
      });
      
   });

</script>

</head>

<header>

<div class="menu">
	<ul class="side-menu">
	<li><a href="#"><span class="fa square"	></span>Petriots!</a></li>
	<li><a href="adminMypage.action"><span class="fa fa-square"></span>관리자메인</a></li>

	<li><a href="p_q_blist.action"><span class="fa fa-square"></span>인성문제(수정/삭제)</a></li>
	<li><a href="p_q_binsertpage.action"><span class="fa fa-square"></span>인성문제등록</a></li>
	
	
	<li><a href="i_q_blist.action"><span class="fa fa-square"></span>지식문제(수정/삭제)</a></li>
	<li><a href="i_q_binsertpage.action"><span class="fa fa-square"></span>지식문제등록</a></li>
	

	<li><a href="signuplist.action"><span class="fa fa-square"></span>회원관리</a></li>
	<li><a href="questionlistpage.action"><span class="fa fa-square"></span>1대1 문의</a></li>
	<li><a href="declarationlist.action"><span class="fa fa-square"></span>신고관리</a></li>
	<li><a href="ccl_d_rlist.action"><span class="fa fa-square"></span>체크리스트관리</a></li>
	<li><a href="cutline.action"><span class="fa fa-square"></span>커트라인관리</a></li>
	<li><a href="noticelist.action"><span class="fa fa-square"></span>공지사항관리</a></li>
	
	</ul>
	
</div>



</header>
<!-- 
fa fa-cog"></span>내정보수정</a><
fa fa-font"></span></a></li>
fa fa-caret-square-o-right">
fa fa-check-square"></span><
fa  fa-square"></span></a></
fa fa-bars"></span></a></li>
 -->

</html>