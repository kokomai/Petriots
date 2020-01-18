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
<title>Petriots! | 업적 목록</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" />
<script src="vendor_mypage/jquery/jquery.min.js"></script>
<script src="vendor_mypage/bootstrap/js/bootstrap.bundle.min.js"></script>
<link href="css/mainpage.css" rel="stylesheet">
<style type="text/css">

.multipl-image-checkbox ul {
  list-style-type: none;
}

.multipl-image-checkbox  li {
  display: inline-block;
}

.multipl-image-checkbox  input[type="checkbox"][class^="quest_num"] {
  display: none;
}

.multipl-image-checkbox  label {
  border: 1px solid #fff;
  padding: 10px;
  display: block;
  position: relative;
  margin: 10px;
  cursor: pointer;
}

.multipl-image-checkbox  label:before {
  background-color: white;
  color: white;
  content: " ";
  display: block;
  border-radius: 50%;
  border: 1px solid grey;
  position: absolute;
  top: -5px;
  left: -5px;
  width: 25px;
  height: 25px;
  text-align: center;
  line-height: 28px;
  transition-duration: 0.4s;
  transform: scale(0);
}

.multipl-image-checkbox  label img {
  height: 100px;
  width: 100px;
  transition-duration: 0.2s;
  transform-origin: 50% 50%;
}

.multipl-image-checkbox :checked + label {
  border-color: #ddd;
}

.multipl-image-checkbox  :checked + label:before {
  content: "✓";
  background-color: grey;
  transform: scale(1);
}

.multipl-image-checkbox :checked + label img {
  transform: scale(0.9);
  box-shadow: 0 0 5px #333;
  z-index: -1;
}
</style>

<script type="text/javascript">

	$(function()
	{	
		var num = '${questlist}';
		
		/* $("#quest_update").click(function()
		{
			var sure = confirm("정말 적용하시겠습니까?");
			
			if(sure === true)
			{
				for(i=1; i<=2; i++)
				{
					if($("#quest_num"+i).is(":checked"))
						$(".q_use"+i).val("1")
	
				}
				
				$("#questForm").submit();
			}
			else
				return;
		}); */
		
		
		$('.quest_num_c').click(function() {
			
			var num = $(this).val();
			
			
			
			/* alert(num); */
			 if($("#quest_num_c"+num).is(":checked"))
				$(".q_use"+num).val("1");
			else
				$(".q_use"+num).val("0");
            
			/* alert($(".q_use"+num).val()); */	
			$('#quest_num'+num).val(num);
			
           /*  $.ajax({
                type: "POST",
                url: "/Petriots_01_03_3/petsitterquestlist_ok.action",
                data: { "quest_num" : num,
                        "q_use" : $(".q_use"+num).val()},
                success: function() {
                    alert('적용 성공');
                    location.reload();
                }, error: function() {
                    alert('적용 실패');
                    alert($(this).val());
                    alert($(".q_use"+$(this).val()).val());
                }
            });  */
			alert("적용되었습니다!");
            $("#questForm"+num).submit();
            
        });


		
	});
</script>

</head>
<body>

<div class="container">
<jsp:include page="navigationBar.jsp"/>
</div>

<jsp:include page="/WEB-INF/views/petsitterSideMenu.jsp"/>

<!-- 메인 콘텐츠 -->
<div class="container" >
	
	<div class="row" style="display:flex; flex-direction: row;">
		
		<div class="card-header" style="width: 100%; background-color: rgba(108, 201, 251,0.3)">업적 목록(업적 클릭시 자동 적용)</div>
		
		<div class="multipl-image-checkbox">
		<c:forEach var="list" items="${questlist }"> 
		<form action="petsitterquestlist_ok.action" method="get" id="questForm${list.quest_num }">
		<ul>
        <li><input type="checkbox" id="quest_num_c${list.quest_num }" name="quest_num_c" 
        	class="quest_num_c" value="${list.quest_num }" ${list.q_use == 1 ? "checked='checked'" : "" }
        	/>
            <label for="quest_num_c${list.quest_num }">
              <img src="${list.q_link }" title="${list.q_name }"
				          	style="width:200px; position: relative;" >
				<h5>${list.q_condition }</h5>
			<input type="text" id="q_use${list.quest_num }" name="q_use" value="${list.q_use }" hidden="hidden" class="q_use${list.quest_num }">
          	<input type="text" id="quest_num${list.quest_num }" name="quest_num" value="${list.quest_num }" hidden="hidden" class="q_use${list.quest_num }">
          </label>
        </li>
    	</ul>
    	
<!--  <button type="button" class="check_en" >확인하기</button> -->

</form>
</c:forEach>

		 <button type="button" class="btn btn-primary" onclick="location.href='petsittermain.action'">메인으로</button>
</div>
		
		
			

	</div>
</div>
<!-- /.container -->
<!-- // 메인 콘텐츠 -->

<br>

<!-- Footer -->
<!-- /Footer -->

</body>
</html>