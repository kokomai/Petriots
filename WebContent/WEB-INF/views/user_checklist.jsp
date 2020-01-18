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
			  + "<td><input type='text' name='maintxt' placeholder='내용'style='width: 300px;' class='ck' id='ckm'></td>"
			  + "<td><input type='time' name='stttime' placeholder='시작 시간'class='timefont' class='ck' id='cks'></td>"
			  + "<td><input type='time' name='endtime' placeholder='종료 시간'class='timefont' class='ck' id='cke'></td>"
			  + "<td><input class='buttondel'type='button' value='X' style='width:100px;' onclick=delete_row('row"+$rowno+"')></td>"
			  + "</tr>");
		
	 
	}
	
	function delete_row(rowno)
	{
	 $('#'+rowno).remove();
	}

	 
</script>


</head>
<body id="check_body">
<h1>CHECK LIST</h1>
<div id="check_wrapper" >

	<div id="form_div" style="border: 2px dashed #DA3B50;" align="center">

	 <form method="post" action="search_index.php" >
	  <table id="employee_table" align="center" style="width:60%;">
	  <tr id="row" style="height: 30px;">
	 	<th>내용</th>
	 	<th>시작 시간</th>
	 	<th>종료 시간</th>
	 </tr>
	 <c:forEach var="list" items="${cklist }">
	   <tr id="row${list.r_m_c_num }">
	    <td>
	  	    <input type="text" name="maintxt" placeholder="내용" style="width: 300px;" value="${list.maintxt }" class="ck" id="ckm">
	    </td>
	    <td>
	    	<input type="time" name="stttime" placeholder="시작 시간" class="timefont" value="${list.stttime }" class="ck" id="cks">
	    </td>
	     <td>
	    	<input type="time" name="endtime" placeholder="종료 시간" class="timefont" value="${list.endtime }" class="ck" id="cke">
	    </td>
	    <td><input class="buttondel" type="button" value="X" style="width:100px;" onclick="delete_row('row${list.r_m_c_num }')"></td>
	   </tr>
	  </c:forEach>
	  </table>
	  <br><br>
	  <input class ="rowadd" type="button" onclick="add_row();" style="width:30%;" value="항목 추가">
	  <!-- <input class ="rowadd" type="button" onclick=""  style="width:30%;" value="전송 하기"> -->
	  <!-- <input class ="rowadd" type="reset" onclick=""  style="width:30%;" value="취소"> -->
	  <div class="br">
    	<br><br>
    	</div>
	 </form>
	 
	</div>
   
    

</div>




</body>
</html>