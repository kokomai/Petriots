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
<link href="css/checkList.css" rel="stylesheet">
<link href="form_style.css" type="text/css" rel="stylesheet"/>
<script type="text/javascript" src="jquery.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://use.fontawesome.com/f31527a575.js"></script>
<script type="text/javascript">
	function add_row()
	{
	 $rowno=$("#employee_table tr").length;
	 $rowno=$rowno+1;
	 
	 
	 
	 $("#employee_table tr:last").after( 
			
			 "<tr id='row"+$rowno+"'>"
			  + "<td>"
			  + "<div class='checkbox custom'><input id='box" +$rowno + "' class='css-checkbox' type='checkbox' >"
			  + "<label for='box" +$rowno + "' class='css-label-red'></label></div> "
			  + "</td>"
			  + "<td><input type='text' name='content[]' placeholder='내용'style='width: 300px;'></td>"
			  + "<td><input type='time' name='startTime[]' placeholder='시작 시간'class='timefont'></td>"
			  + "<td><input type='time' name='endTime[]' placeholder='종료 시간'class='timefont'></td>"
			  + "<td><input class='buttondel'type='button' value='X' onclick=delete_row('row"+$rowno+"')></td>"
			  + "</tr>");
	
	 	
	}
	
	function delete_row(rowno)
	{
	 $('#'+rowno).remove();
	}
	
</script>


</head>
<body>
<h1>CHECK LIST</h1>
<div id="wrapper">

	<div id="form_div">
	
	 <form method="post" action="search_index.php">

	  <table id="employee_table" align=center>
	  <tr id="row1">
	 	<th>완료 여부</th>
	 	<th>내용</th>
	 	<th>시작 시간</th>
	 	<th>종료 시간</th>
	 </tr>
	   <tr id="row1">
	    <td>
	    <div class="checkbox custom">
	   		<input id="box1" class="css-checkbox" type="checkbox" >
	   		<label for="box1" class="css-label-red"></label> 
	   	</div>
	    </td> 
	    <td>
	  	    <input type="text" name="content[]" placeholder="내용" style="width: 300px;">
	    </td>
	    <td>
	    	<input type="time" name="startTime[]" placeholder="시작 시간" class="timefont">
	    </td>
	     <td>
	    	<input type="time" name="endTime[]" placeholder="종료 시간" class="timefont">
	    </td>
	   </tr>
	  </table>
	  <input class ="rowadd" type="button" onclick="add_row();" value="항목 추가">
	  <input class ="rowadd" type="button" onclick="" value="전송 하기">
	  <input class ="rowadd" type="reset" onclick="" value="취소">
	 </form>
	</div>
    
    

</div>




</body>
</html>