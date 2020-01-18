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

.multipl-image-checkbox  input[type="checkbox"][id^="petsize"] {
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
		check_petsize = [];
			
		
		$(".check_petsize").click(function()
		{
			check_petsize = [];
			for(i=1; i<=3; i++)
			{
				if($("#petsize"+i).is(":checked"))
					check_petsize.push(i);

			}
			
			for(i=0; i<check_petsize.length; i++)
			{
				alert(check_petsize[i]);
			}
		});
		
	});
</script>

</head>
<body>

<div class="multipl-image-checkbox"> 
	<ul>
        <li><input type="checkbox" id="petsize1" onchange=""/>
            <label for="petsize1">
              <img src="https://image.flaticon.com/icons/png/512/445/445215.png" />
       		  <h5>대</h5>
          </label>
        </li>
    <li><input type="checkbox" id="petsize2" />
        <label for="petsize2" onclick=""><img src="https://www.flaticon.com/premium-icon/icons/svg/445/445217.svg" />
         <h5>중</h5>
        </label>
    </li>
    <li><input type="checkbox" id="petsize3" />
        <label for="petsize3"><img src="https://image.flaticon.com/icons/png/512/445/445229.png" />
         <h5>소</h5>
        </label>
    </li>
    </ul>
    
    
<!--  <button type="button" class="check_petsize" >확인하기</button> -->
</div>

 
</body>
</html>