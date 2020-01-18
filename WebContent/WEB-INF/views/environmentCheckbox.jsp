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

.multipl-image-checkbox  input[type="checkbox"][class^="en"] {
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

<!-- <script type="text/javascript">

   $(function()
   {   
      check_en = [];
         
      
      $("#petsitter-submit").click(function()
      {
         for(i=1; i<=4; i++)
         {
            if($(".en"+i).is(":checked"))
            {
               /* check_en.push(i); */
               $(".en"+i).val("1");
            }
            else
            {
                /* check_en.push(i); */
                $(".en"+i).val("2");
             }

         }
         
         for(i=1; i<=4; i++)
         {
           /* alert($(".en"+i).val()); */
         }
      });
      
   });
</script> -->

</head>
<body>

<div class="multipl-image-checkbox"> 
   <ul>
        <li><input type="checkbox" id="family_c" class="en1"  ${dto.family == 1 ? "checked='checked'" : "" }/>
           
            <label for="family_c">
              <img src="https://image.flaticon.com/icons/png/512/15/15767.png" />
               <h5>가족 동거 여부</h5>
               <input type="text" id="family" name="family" value="2" hidden="hidden" class="en_t1">
          </label>
        </li>
        
    <li>
    <input type="checkbox" id="other_animal_c" class="en2"  ${dto.other_animal == 1 ? "checked='checked'" : "" }/>
        
        <label for="other_animal_c"><img src="https://image.flaticon.com/icons/svg/489/489868.svg" />
         <h5>다른 반려동물 유무</h5>
         <input type="text" id="other_animal" name="other_animal" value="2" hidden="hidden" class="en_t2">
        </label>
    </li>    
    <li><input type="checkbox" id="kids_c" class="en3"  ${dto.kids == 1 ? "checked='checked'" : "" }/>
        
        <label for="kids_c" onclick=""><img src="https://image.flaticon.com/icons/png/512/98/98768.png" />
         <h5>14세미만 아동 유무</h5>
         <input type="text" id="kids" name="kids" value="2" hidden="hidden" class="en_t3">
        </label>
    </li>
    <li><input type="checkbox" id="garden_c" class="en4"  ${dto.garden == 1 ? "checked='checked'" : "" }/>
        
        <label for="garden_c"><img src="https://image.flaticon.com/icons/png/512/427/427584.png" />
         <h5>마당 유무</h5>
         <input type="text" id="garden" name="garden" value="2" hidden="hidden" class="en_t4">
        </label>
    </li>
    </ul>
<!--     
<button type="button" class="check_en" >확인하기</button> -->
</div>

 
</body>
</html>