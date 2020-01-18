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
<link href="css_checklist/checkList.css" rel="stylesheet">
<!-- <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script> -->
<script type="text/javascript">
	function add_row()
	{
	 $rowno=$("#employee_table tr").length;
	 $rowno=$rowno+1;
	 
	 
	 $("#employee_table tr:last").after( 
			
			 "<tr id='row"+$rowno+"'>"
			  + "<td><input type='text' name='content[]' placeholder='내용'style='width: 300px;'></td>"
			  + "<td><input type='time' name='startTime[]' placeholder='시작 시간'class='timefont'></td>"
			  + "<td><input type='time' name='endTime[]' placeholder='종료 시간'class='timefont'></td>"
			  + "<td><input class='buttondel'type='button' value='X' style='width:100px;' onclick=delete_row('row"+$rowno+"')></td>"
			  + "</tr>");
		
	 
	}
	
	function delete_row(rowno)
	{
	 $('#'+rowno).remove();
	}

	 
</script>


</head>
<body id="check_body" style="width:70%; height:400px;">
<h1>CHECK LIST</h1>
<div id="check_wrapper" >

	<div id="form_div" style="border: 2px dashed #DA3B50; width:70%;" align="center">

	 <form method="post" action="search_index.php" >
	  <table id="employee_table" align="center" style="width:100%;">
	  <tr id="row1" style="height: 30px;">
	 	<th>내용</th>
	 	<th>시작 시간</th>
	 	<th>종료 시간</th>
	 </tr>
	   <tr id="row1">
	    <td>
	  	    <input type="text" name="content[]" placeholder="내용" style="width: 85%;" readonly="readonly"
	  	     value="밥을 먹여 주세용">
	    </td>
	    <td>
	    	<input type="time" name="startTime[]" placeholder="시작 시간" class="timefont" readonly="readonly"
	    	value="12:00">
	    </td>
	     <td>
	    	<input type="time" name="endTime[]" placeholder="종료 시간" class="timefont" readonly="readonly"
	    	value="13:00">
	    </td>
	   </tr>
	   <tr id="row2">
	    <td>
	  	    <input type="text" name="content[]" placeholder="내용" style="width: 300px;" readonly="readonly"
	  	     value="놀아 주세용">
	    </td>
	    <td>
	    	<input type="time" name="startTime[]" placeholder="시작 시간" class="timefont" readonly="readonly"
	    	value="14:00">
	    </td>
	     <td>
	    	<input type="time" name="endTime[]" placeholder="종료 시간" class="timefont" readonly="readonly"
	    	value="18:00">
	    </td>
	   </tr>
	   <tr id="row3">
	    <td>
	  	    <input type="text" name="content[]" placeholder="내용" style="width: 300px;" readonly="readonly"
	  	     value="저녁 밥을 먹여 주세용">
	    </td>
	    <td>
	    	<input type="time" name="startTime[]" placeholder="시작 시간" class="timefont" readonly="readonly"
	    	value="18:00">
	    </td>
	     <td>
	    	<input type="time" name="endTime[]" placeholder="종료 시간" class="timefont" readonly="readonly"
	    	value="19:00">
	    </td>
	   </tr>
	  </table>
	  <br><br>
	  <c:if test="${blabla }">
	  <input class ="rowadd" type="button" onclick="체크리스트 수정 페이지로"  style="width:30%;" value="체크리스트 수정 하기">
	  </c:if>
	  <div class="br">
    	<br><br>
    	</div>
	 </form>
	 
	</div>
   
    

</div>




</body>
</html>