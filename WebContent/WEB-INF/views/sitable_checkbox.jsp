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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<style type="text/css">

.multipl-image-checkbox ul {
  list-style-type: none;
}

.multipl-image-checkbox  li {
  display: inline-block;
}

.multipl-image-checkbox  input[type="checkbox"][id^="sitable"] {
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
		check_sitable = [];
			
		
		$(".check_sitable").click(function()
		{
			check_sitable = [];
			for(i=1; i<=4; i++)
			{
				if($("#sitable"+i).is(":checked"))
					check_sitable.push(i);

			}
			
			for(i=0; i<check_sitable.length; i++)
			{
				alert(check_sitable[i]);
			}
		});
		
	});
</script>

</head>
<body>

<div class="multipl-image-checkbox"> 
	<ul>
        <li><input type="checkbox" id="sitable1" onchange=""/>
            <label for="sitable1">
              <img src="https://image.flaticon.com/icons/svg/107/107409.svg" />
       		  <h5>강아지</h5>
          </label>
        </li>
    <li><input type="checkbox" id="sitable2" />
        <label for="sitable2" onclick=""><img src="https://image.flaticon.com/icons/svg/1530/1530720.svg" />
         <h5>고양이</h5>
        </label>
    </li>
    <li><input type="checkbox" id="sitable3" />
        <label for="sitable3"><img src="https://image.flaticon.com/icons/svg/820/820812.svg" />
         <h5>새</h5>
        </label>
    </li>
    <li><input type="checkbox" id="sitable4" />
        <label for="sitable4"><img src="https://image.flaticon.com/icons/svg/109/109232.svg" />
         <h5>기타(파충류,곤충 등등)</h5>
        </label>
    </li>
    </ul>
    
    
<!--  <button type="button" class="check_sitable" >확인하기</button> -->
</div>

 
</body>
</html>