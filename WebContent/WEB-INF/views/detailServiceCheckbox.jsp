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
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script> -->
<style type="text/css">

.multipl-image-checkbox ul {
  list-style-type: none;
}

.multipl-image-checkbox  li {
  display: inline-block;
}

.multipl-image-checkbox  input[type="checkbox"][class^="se"] {
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
      check_ser = [];
         
      
      $("#petsitter-submit").click(function()
      {
         for(i=1; i<=5; i++)
         {
            if($(".se"+i).is(":checked"))
               $(".se"+i).val("1");
            else
            {
                /* check_en.push(i); */
                $(".se"+i).val("2");
             }

         }
         
         for(i=1; i<=5; i++)
         {
            /* alert($(".se"+i).val()); */
         }
      });
      
   });
</script> -->

</head>
<body>

<div class="multipl-image-checkbox"> 
   <ul>
        <li><input type="checkbox" id="walk_c" class="se1" disabled="disabled"${dto.walk == 1 ? "checked='checked'" : "" }/>
            
            <label for="walk_c">
              <img src="https://image.flaticon.com/icons/png/512/10/10869.png" />
               <h5>산책 가능 여부</h5>
               <input type="text" id="walk" name="walk" value="2" hidden="hidden" class="se_t1">
          </label>
        </li>
    <li><input type="checkbox" id="beauty_c" class="se2" disabled="disabled" ${dto.beauty == 1 ? "checked='checked'" : "" }/>
        
        <label for="beauty_c" onclick=""><img src="https://image.flaticon.com/icons/png/512/720/premium/720752.png" />
         <h5>미용 가능 여부</h5>
         <input type="text" id="beauty" name="beauty" value="2" hidden="hidden" class="se_t2">
        </label>
    </li>
    <li><input type="checkbox" id="snack_c" class="se3" disabled="disabled" ${dto.snack == 1 ? "checked='checked'" : "" }/>
        
        <label for="snack_c"><img src="https://image.flaticon.com/icons/png/512/1152/1152485.png" />
         <h5>간식 제공 여부</h5>
         <input type="text" id="snack" name="snack" value="2" hidden="hidden" class="se_t3">
        </label>
    </li>
    <li><input type="checkbox" id="pick_up_c" class="se4" disabled="disabled" ${dto.pick_up == 1 ? "checked='checked'" : "" }/>
        
        <label for="pick_up_c"><img src="https://image.flaticon.com/icons/png/512/846/846296.png" />
         <h5>픽업가능 여부</h5>
         <input type="text" id="pick_up" name="pick_up" value="2" hidden="hidden" class="se_t4">
        </label>
    </li>
    <li><input type="checkbox" id="medication_c" class="se5" disabled="disabled" ${dto.medication == 1 ? "checked='checked'" : "" }/>
        
        <label for="medication_c"><img src="https://image.flaticon.com/icons/png/512/883/883407.png" />
         <h5>투약 가능 여부</h5>
         <input type="text" id="medication" name="medication" value="2" hidden="hidden" class="se_t5">
        </label>
    </li>
    </ul>
    
<!--     <button type="button" class="check_ser" >확인하기</button> -->
</div>

 
</body>
</html>