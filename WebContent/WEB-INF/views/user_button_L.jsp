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
<!--  <link href="vendor_mypage/bootstrap/css/bootstrap.css" rel="stylesheet"> -->
 
 <script src="js/bootstrap.min.js"></script>

<style type="text/css">
.vn-click-user{

background-color:none;
color: black;
cursor:pointer;
display:inline-block;
}
.vn-info-user{
display:none;
text-align:center;
background: rgba(255,255,255, 0.6);
color: #67c7fa;
padding:15px 15px 15px 15px;
border: 1px solid gray;
width: 200px;
height: 80px;
border-radius: 5%;
position:relative;
 z-index:1000;
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
  color: #67c7fa;
  z-index: 1000px;

}

li
{
	list-style-type: none;
	z-index: 1000px;
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
	z-index: 1000px;
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


<!-- <script type="text/javascript">

   $(document).ready(function(){
   
	 $("#vn-click-user").click(function(){
       $("#vn-info-user").slideToggle(300);
     });
   
	 $("#modalSubmit").click(function()
	{
		 var sender = $("#msgSender").val();
		 var receiver = $("#msgReceiver").val();
		 var contents = $("#msgContents").val();
		
		 var msgData = {"sender": sender, "receiver":receiver, "contents":contents};
		 $.ajax({
	   		 url : 'messageTest.jsp',
	   		 type : 'POST',
	   		 data : msgData,
		   	 success : function(data) {
	              alert(sender);
	              alert(receiver);
	              alert(contents);
	              location.href="messageTest.jsp"
	         }, // success 
	  
	         error : function(xhr, status) {
	              alert(xhr + " : " + status);
	         }
	   		 
	   		 
	   	 });
		 
		 
	});
	 $("#modalSubmit2").click(function()
				{
					 var reportWho = $("#reportWho").val();
					 var reason = $("#reason").val();
					 var contents = $("#reportContents").val();
					
					 var msgData = {"reportWho": reportWho, "reason":reason, "contents":contents};
					 $.ajax({
				   		 url : 'messageTest.jsp',
				   		 type : 'POST',
				   		 data : msgData,
					   	 success : function(data) {
				              alert(reportWho);
				              alert(reason);
				              alert(contents);
				              location.href="messageTest.jsp"
				         }, // success 
				  
				         error : function(xhr, status) {
				              alert(xhr + " : " + status);
				         }
				   		 
				   		 
				   	 });
					 
					 
				});
	 

   	
   });
   
   
</script>
 -->

</head>
<body>


<div id="vn-click-user${list.nickName}${list.r_a_num}" class="vn-click-user">
${list.nickName}
</div>

<div id="vn-info-user${list.nickName}${list.r_a_num}" class="vn-info-user">
	<ul style="padding-inline-start: 0px;">
		<li><a href="#myModal${list.nickName}${list.r_a_num}"  data-toggle="modal" data-target="#myModal${list.nickName}${list.r_a_num}">쪽지보내기</a></li>
		<li><a href="#myModal2${list.nickName}${list.r_a_num}"  data-toggle="modal" data-target="#myModal2${list.nickName}${list.r_a_num}">신고하기</a></li>
	</ul>
</div>

<div class="modal fade" id="myModal${list.nickName}${list.r_a_num}" role="dialog">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title" style="align:left;">쪽지 보내기</h4>
				<button type="button" class="close" data-dismiss="modal" style="float: right;">x</button>
			</div>
			<div class="modal-body">
				<form action="sendMessage.action" method="post" id="messageForm">
				<div id="content">
					<div class="form-group">
						<div class="input-group">
							<div class="input-group-addon">받는이</div>
							<input type="text" id="msgReceiver${list.nickName}${list.r_a_num}" class="form-control" value="${list.nickName}" readonly="readonly"/>
						</div>
						<br />
						<div class="input-group">
							<div class="input-group-addon">보낸이</div>
							<input type="text" id="msgSender${list.nickName}${list.r_a_num}" class="form-control" value="${sessionScope.login.getUserId() }" readonly="readonly"/>
						</div>
						<br>
						<div class="input-group">
							<div class="input-group-addon">쪽지내용</div>
							<textarea rows="5" cols="60" class="wrap form-control" style="resize: none;"
								id ="msgContents${list.nickName}${list.r_a_num}" required="required"></textarea>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button id="modalSubmit${list.nickName}${list.r_a_num}" type="button" class="btn btn-primary">보내기</button>
					<button type="button" class="btn btn-danger" data-dismiss="modal">닫기</button>
				</div>
			</form>
			</div>
		</div>
	</div>
</div>

<div class="modal fade" id="myModal2${list.nickName}${list.r_a_num}" role="dialog">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title" style="align:left;">신고하기</h4>
				<button type="button" class="close" data-dismiss="modal" style="float: right;">x</button>
			</div>
			<div class="modal-body">
				<form action="sendMessage.action" method="post" id="reportForm">
				<div id="content">
					<div class="form-group">
						<div class="input-group">
							<div class="input-group-addon">신고 대상</div>
							<input type="text" id="reportWho${list.nickName}${list.r_a_num}" class="form-control" value="${list.nickName}" readonly="readonly"/>
						</div>
						<br />
						<div class="input-group" style="width:100%;">
							<div class="input-group-addon">신고사유</div>
							<select name="reason" required="required" id="reason${list.nickName}${list.r_a_num}" style="width:100%;">
						    	<option value="" style="width:100%;">신고사유를 선택해 주세요</option>
						    	<option value="reason1" style="width:100%;">부적절한 홍보 게시물</option>
						    	<option value="reason2" style="width:100%;">음란성 또는 청소년에게 부적합한 내용</option>
						    	<option value="reason3" style="width:100%;">장난성 또는 질문에 맞지 않는 무의미글</option>
						    	<option value="reason4" style="width:100%;">기타</option>
						    </select>
						</div>
						<br>
						<div class="input-group">
							<div class="input-group-addon">상세 내용</div>
							<textarea rows="5" cols="60" class="wrap form-control" style="resize: none;"
								id ="reportContents${list.nickName}${list.r_a_num}" required="required"></textarea>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button id="modalSubmit2${list.nickName}${list.r_a_num}" type="button" class="btn btn-primary">신고하기</button>
					<button type="button" class="btn btn-danger" data-dismiss="modal">닫기</button>
				</div>
			</form>
			</div>
		</div>
	</div>
</div>

<script type="text/javascript">

   $(document).ready(function(){
   	var nickname = '${list.nickName}'+'${list.r_a_num}';
   	
	 $("#vn-click-user"+nickname).click(function(){
       $("#vn-info-user"+nickname).slideToggle(300);
     });
   
	 $("#modalSubmit"+nickname).click(function()
	{
		 var sender = $("#msgSender"+nickname).val();
		 var receiver = $("#msgReceiver"+nickname).val();
		 var contents = $("#msgContents"+nickname).val();
		
		 var msgData = {"sender": sender, "receiver":receiver, "contents":contents};
		 $.ajax({
	   		 url : 'messageTest.jsp',
	   		 type : 'POST',
	   		 data : msgData,
		   	 success : function(data) {
	              alert(sender);
	              alert(receiver);
	              alert(contents);
	              location.href="messageTest.jsp"
	         }, // success 
	  
	         error : function(xhr, status) {
	              alert(xhr + " : " + status);
	         }
	   		 
	   		 
	   	 });
		 
		 
	});
	 $("#modalSubmit2"+nickname).click(function()
				{
					 var reportWho = $("#reportWho"+nickname).val();
					 var reason = $("#reason"+nickname).val();
					 var contents = $("#reportContents"+nickname).val();
					
					 var msgData = {"reportWho": reportWho, "reason":reason, "contents":contents};
					 $.ajax({
				   		 url : 'messageTest.jsp',
				   		 type : 'POST',
				   		 data : msgData,
					   	 success : function(data) {
				              alert(reportWho);
				              alert(reason);
				              alert(contents);
				              location.href="messageTest.jsp"
				         }, // success 
				  
				         error : function(xhr, status) {
				              alert(xhr + " : " + status);
				         }
				   		 
				   		 
				   	 });
					 
					 
				});
	 

   	
   });
   
   
</script>



</body>
</html>