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
<title>Insert title here</title>
<!-- <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script> -->
 <link href="vendor_mypage/bootstrap/css/bootstrap.css" rel="stylesheet">
 
 <script src="js/bootstrap.min.js"></script>

<style type="text/css">
#vn-click2{

background-color:rgba(108, 201, 251);
color:#fff;
cursor:pointer;
display:inline-block;
width:60px;
height:40px;
}
#vn-info2{
position:absolute;
display:none;
text-align:center;
background: rgba(108, 201, 251, 0.7);
color:#fff;
padding:15px 15px 15px 15px;
width: 200px;
height: 150px;
border-radius: 5%;
}

.title
{
     overflow: hidden;
  text-overflow: ellipsis;
  white-space: nowrap;
  width: 100px;
  text-align:left;

}


 a
{
  color:#fff;

}

li
{
	list-style-type: none;
}

.sender, .date
{
   width:80px;
   overflow:hidden;
   text-overflow:ellipsis;
}

#content
{
	border: 1px solid #ccc;
	border-radius: 5px;
	width: 300px;
	padding: 15px;
	margin: 30px;
}


.input-group-addon:first-child {border-right: 0;}
.input-group .form-control:first-child, .input-group-addon:first-child, .input-group-btn:first-child>.btn, .input-group-btn:first-child>.btn-group>.btn, .input-group-btn:first-child>.dropdown-toggle, .input-group-btn:last-child>.btn-group:not(:last-child)>.btn, .input-group-btn:last-child>.btn:not(:last-child):not(.dropdown-toggle)
{
    border-top-right-radius: 0;
    border-bottom-right-radius: 0;
}
.input-group-addon
{
    padding: 6px 12px;
    font-size: 14px;
    font-weight: 400;
    line-height: 1;
    color: #555;
    text-align: center;
    background-color: #eee;
    border: 1px solid #ccc;
    border-radius: 4px;
}
.input-group-addon, .input-group-btn
{
    width: 1%;
    white-space: nowrap;
    vertical-align: middle;
}
.input-group .form-control, .input-group-addon, .input-group-btn {display: table-cell;}
div.input-group-addon{width:80px;}
div#content{width: 450px; height: 300px;}

</style>


<script type="text/javascript">

   $(document).ready(function(){
     $("#vn-click2").click(function(){
       $("#vn-info2").slideToggle(300);
     });
   });
</script>


</head>
<body>

<div id="vn-click2">
<img src="${sessionScope.login.getProfile_img() }" 
alt="프로필" style="width:80%; border-radius: 30%; height:100%;" />
</div>

<div id="vn-info2">
	<ul style="padding-inline-start: 0px;">
		<li>${sessionScope.login.getUserId() }님</li>
		<li>----------</li>
		<li><a href="mypageusermodify.action">내 정보 수정</a></li>
		<li><a href="mypagepetlist.action">내 반려동물</a></li>
		<li><a href="logout.action">로그아웃</a></li>
	</ul>
</div>



</body>
</html>