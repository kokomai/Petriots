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
<!-- <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
 <link href="vendor_mypage/bootstrap/css/bootstrap.css" rel="stylesheet">
 
 <script src="js/bootstrap.min.js"></script> -->

<style type="text/css">
#vn-click{
padding:10px 0px 0px 0px;
background-color:rgba(108, 201, 251);
color:#fff;
cursor:pointer;
display:inline-block;
width:110px;

}
#vn-info{
position:absolute;
display:none;
text-align:center;
background: rgba(148, 148, 148, 0.9);
color:#fff;
padding:15px 15px 15px 15px;
width: 500px;
height: 300px;
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

.message_list
{
   
   width: 450px; 
   white-space: nowrap; 
   overflow: hidden; 
   text-overflow: ellipsis;
   border: 1px solid white;
   table-layout: fixed;
}

.message_list th
{
  text-align: center;
  border-bottom: 1px solid white;

}

.message_list a
{
  color:#fff;

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
     $("#vn-click").click(function(){
       $("#vn-info").slideToggle(300);
     });
   });
</script>


</head>
<body>

<div id="vn-click">쪽지 &nbsp;<img src="images/message_white.png" alt="쪽지" style="width:20%;" />
<span class="badge-primary badge" >1</span>
</div>

<div id="vn-info">
   <table class="message_list">
      <tr>
         <th>번호</th>
         <th class="title" style="text-align: center;">제목</th>
         <th class="sender">보낸이</th>
         <th class="date">날짜</th>
         <th>삭제</th>
      </tr>
      <tr>
         <td>1</td>
         <td class="title"><a href="#myModal0-1"  data-toggle="modal" data-target="#myModal0-1">대홍단감자</a></td>
         <td class="sender">감자를매우좋아하는북한어린이</td>
         <td class="date">2019.11.11</td>
         <td><button type="button" class="btn btn-danger">삭제</button></td>
      </tr>
      <tr>
         <td>2</td>
         <td class="title"><a href="#myModal0-2"  data-toggle="modal" data-target="#myModal0-2">동에 번쩍 서에 번쩍 천하를 쥐락펴락</a></td>
         <td class="sender">북한청년</td>
         <td class="date">2019.11.11</td>
         <td><button type="button" class="btn btn-danger">삭제</button></td>
      </tr>
   </table>
</div>

<div class="modal fade" id="myModal0-1" role="dialog" style="position: fixed;z-index: 1000px;">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title" style="align:left;">받은 쪽지</h4>
				<button type="button" class="close" data-dismiss="modal" style="float: right;">x</button>
			</div>
			<div class="modal-body">
				<div id="content">
					<div class="form-group">
						<div class="input-group">
							<div class="input-group-addon">받는이</div>
							<input type="text" id="txtCount" class="form-control" value="김영민"/>
						</div>
						<br />
						<div class="input-group">
							<div class="input-group-addon">보낸이</div>
							<input type="text" id="txtCheck" class="form-control" value="김창기"/>
						</div>
						<br>
						<div class="input-group">
							<div class="input-group-addon">쪽지내용</div>
							<textarea rows="5" cols="60" id="txtCheck" class="wrap form-control" style="resize: none;">쪽지 내용</textarea>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-info" data-dismiss="modal">답장하기</button>
					<button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>
</div>

</body>
</html>