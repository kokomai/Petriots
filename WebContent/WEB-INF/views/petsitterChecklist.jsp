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
<title>Petriots! | 체크리스트</title>
<link href="css_checklist/checkList.css" rel="stylesheet">
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<script type="text/javascript">

	$(function()
	{
		$rowno=$("#employee_table tr").length-1;
		var checked = 0;
		for(var i=1 ; i<=$rowno; i++)
		{
			var isCheck = $("#box"+i).is(":checked"); 
			if(isCheck == true)
				checked += 1;
		}
		
		var progress = (checked/$rowno) *100;
		
		
		$(".progress-bar").css('width', progress +'%');
		$(".progress-bar").html(progress+"% 완료");
		
		
	});
	
	function check(c_c_num )
	{
		var really = confirm("적용하시겠습니까?\n ※한 번 체크한 항목은 취소할 수 없습니다.");
		
		var f = document.getElementById("check_form"+c_c_num);
		
		
		if(really === true)
		{
			var isCheck = $(".box"+c_c_num).is(":checked"); 
			if(isCheck == true)
			{
				$("#excute"+c_c_num).val("Y");
			}
			else
			{
				$("#excute"+c_c_num).val("N");
			}
			
			f.submit();
		}
		else
		{	
			if($(".box"+c_c_num).is(":checked"))
				$(".box"+c_c_num).prop("checked",false);
			else
				$(".box"+c_c_num).prop("checked",true);
			
			return;
		}
		
		
		
	}
	
</script>


</head>
<body id="check_body" >
<h1>CHECK LIST</h1>
<div id="check_wrapper" >

	<div id="form_div" style="width:75%">
	
	 

	  <table id="employee_table" align=center>
	  <tr id="row1">
	 	<th>완료 여부</th>
	 	<th>내용</th>
	 	<th>시작 시간</th>
	 	<th>종료 시간</th>
	 </tr>
	 <c:forEach var="list" items="${checklist }" varStatus="status">
	 <form id="check_form${list.c_c_num }" method="post" action="checklistcheckok.action" >
	 	<input type="text" value="${list.c_c_num }" hidden="hidden" name="c_c_num">
	 	<input type="text" value="${list.r_a_num }" hidden="hidden" name="r_a_num">
	 	<input type="text" value="N" hidden="hidden" name="excute" id="excute${list.c_c_num }">
	   <tr id="row${status.index+1 }">
	    <td>
	    <div class="checkbox custom">
	    	<!-- 불러올 때 이미 체크 했으면, checked 속성을 부여하고 disabled를 해야 함.. -->
	   		<input id="box${status.index+1 }" class="css-checkbox box${list.c_c_num }" type="checkbox" 
	   		 onclick="check(${list.c_c_num })" 
	   		${list.excute == 'Y' ? "checked='checked'" : "" }${list.excute == 'Y' ?  "disabled='disabled'" : "" } >
	   		<label for="box${status.index+1 }" class="css-label-red" ></label> 
	   	</div>
	    </td> 
	    <td>
	  	    <input type="text" name="maintext" placeholder="내용" style="width: 300px;" value="${list.maintext }" readonly="readonly">
	    </td>
	    <td>
	    	<input type="time" name="sttdate" placeholder="시작 시간" class="timefont" value="${list.cksttdate }" readonly="readonly">
	    </td>
	     <td>
	    	<input type="time" name="enddate" placeholder="종료 시간" class="timefont" value="${list.ckenddate }" readonly="readonly">
	    </td>
	   </tr>
	   </form>
	   </c:forEach>
	  </table>
	  <jsp:include page="progressbar.jsp"></jsp:include>
	  <br><br>
	  
	  <!-- <input class ="" type="button" id="checkok" style="width:30%;" onclick="check()" value="적용 하기"> -->

	  <br><br>
	 
	</div>
</div>




</body>
</html>