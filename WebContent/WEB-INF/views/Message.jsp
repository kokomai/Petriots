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
<title>Message.jsp</title>
<%-- <link rel="stylesheet" href="<%=cp %>/css/bootstrap.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script> --%>
<style type="text/css">
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
</head>
<c:import url="NavigationBar.jsp"></c:import>
<body style="padding-top: 100px;">
<div><a data-toggle="modal" href="#myModal">쪽지 세부 내용</a></div>

<div class="modal fade" id="myModal" role="dialog">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" style="float: right;">x</button>
				<h4 class="modal-title" style="align:left;">받은 쪽지</h4>
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