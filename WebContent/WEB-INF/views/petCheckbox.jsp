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
<link rel="stylesheet" href="css_mypage/cards_hyunwoo.css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<style type="text/css">

.multipl-image-checkbox ul {
  list-style-type: none;
}

.multipl-image-checkbox  li {
  display: inline-block;

}

.multipl-image-checkbox  input[type="radio"][id^="en"] {
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
  height: 140px;
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
		
		 $(".pets").change(function()
		{
			
			$(".pets").prop("name","default");
			$("#en"+$(this).val()).prop("name","p_r_num");	
			
		}); 
		
	}); 
	
</script>

</head>
<body>

<div class="multipl-image-checkbox"> 
	<ul>
	<c:forEach var="list" items="${petlist }">
        <li style="width:300px;"><input type="radio" id="en${list.p_r_num }" name="default" value="${list.p_r_num }" class="pets"/>
            <label for="en${list.p_r_num }">
             <!-- 펫 프로필 -->
			<div class="snip1344" style="width:50%;" ><img src="" class="background"/>
				<img src="${list.pet_img }" alt="profile-sample1" class="profile"/>
	 		 	<div>
	   				 <h3>${list.name }<span>${list.speices }</span></h3>
		    	</div>
		 	</div>
		<!--// 펫 프로필 -->
          </label>
        </li>
    </c:forEach>
    </ul>
 
</div>

 
</body>
</html>