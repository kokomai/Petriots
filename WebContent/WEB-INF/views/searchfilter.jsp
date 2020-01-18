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
<title>펫시터찾기</title>
<link rel="stylesheet" href="//code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" />
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="//code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500" rel="stylesheet" />
<link href="css/searchfilter.css" rel="stylesheet" />

<script type="text/javascript">


   $(function() {
      
      $( ".datepicker1" ).datepicker({
             dateFormat: 'yy-mm-dd',
             prevText: '이전 달',
             nextText: '다음 달',
             monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
             monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
             dayNames: ['일','월','화','수','목','금','토'],
             dayNamesShort: ['일','월','화','수','목','금','토'],
             dayNamesMin: ['일','월','화','수','목','금','토'],
             showMonthAfterYear: true,
             changeMonth: true,
             changeYear: true,
             yearSuffix: '년',
             
             minDate: 0,
             
              onSelect: function(selected) {
              $(".datepicker2").datepicker("option","minDate", selected)
              }
                 
             
           });
      
      $( ".datepicker2" ).datepicker({
             dateFormat: 'yy-mm-dd',
             prevText: '이전 달',
             nextText: '다음 달',
             monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
             monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
             dayNames: ['일','월','화','수','목','금','토'],
             dayNamesShort: ['일','월','화','수','목','금','토'],
             dayNamesMin: ['일','월','화','수','목','금','토'],
             showMonthAfterYear: true,
             changeMonth: true,
             changeYear: true,
             yearSuffix: '년',
             
             
           });
      /* $( ".datepicker1" ).datepicker({ minDate: 0}); */
      
      
      $(".btn-search").click(function()
   {
      if($("#max_sitable option:selected").val()==="")
      {
         alert("마리수를 선택해 주세요!");
         return;
      }
      else
         $("#searchForm").submit();
      
   })
   
   /*  function onlyNum()
{
   if ((event.keyCode < 48) || (event.keyCode > 57))
   {
      if (navigator.appName =="Nescape")
      {
         event.preventDefault();
      }
      else
         event.returnValue = false;
   }
} */

      
   });


  /*  function login()
   {
      alert("${sessionScope.login.getUser_num() } || ${sessionScope.login.getP_s_num() }");
   } */



</script>

</head>
<body>
<div class="s002">
      <form action="searchfilter.action" method="get" id="searchForm">
        <fieldset>
          <legend>SEARCH PETSITTER</legend>
        </fieldset>
        <div class="inner-form">
          <div class="input-field first-wrap">
            <div class="icon-wrap">
              <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24">
                <path d="M12 2C8.13 2 5 5.13 5 9c0 5.25 7 13 7 13s7-7.75 7-13c0-3.87-3.13-7-7-7zm0 9.5c-1.38 0-2.5-1.12-2.5-2.5s1.12-2.5 2.5-2.5 2.5 1.12 2.5 2.5-1.12 2.5-2.5 2.5z"></path>
              </svg>
            </div>
            <input id="address" name="address" type="text" placeholder="지역을 입력해 주세요" required="required"/>
          </div>
          <div class="input-field second-wrap">
            <div class="icon-wrap">
              <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24">
                <path d="M17 12h-5v5h5v-5zM16 1v2H8V1H6v2H5c-1.11 0-1.99.9-1.99 2L3 19c0 1.1.89 2 2 2h14c1.1 0 2-.9 2-2V5c0-1.1-.9-2-2-2h-1V1h-2zm3 18H5V8h14v11z"></path>
              </svg>
            </div>
            <input class="datepicker1" id="checkin_start" type="text" placeholder="체크인 날짜" />
          </div>
          <div class="input-field third-wrap">
            <div class="icon-wrap">
              <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24">
                <path d="M17 12h-5v5h5v-5zM16 1v2H8V1H6v2H5c-1.11 0-1.99.9-1.99 2L3 19c0 1.1.89 2 2 2h14c1.1 0 2-.9 2-2V5c0-1.1-.9-2-2-2h-1V1h-2zm3 18H5V8h14v11z"></path>
              </svg>
            </div>
            <input class="datepicker2" id="checkout_end" type="text" placeholder="체크아웃 날짜" />
          </div>
          <div class="input-field fouth-wrap">
            <div class="icon-wrap">
              <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24">
                <path d="M12 12c2.21 0 4-1.79 4-4s-1.79-4-4-4-4 1.79-4 4 1.79 4 4 4zm0 2c-2.67 0-8 1.34-8 4v2h16v-2c0-2.66-5.33-4-8-4z"></path>
              </svg>
            </div>
            <select data-trigger="" name="max_sitable" id="max_sitable">
              <option value="">마리 수</option>
              <option value="1">1 마리</option>
              <option value="2">2 마리</option>
              <option value="3">3 마리</option>
              <option value="4">4 마리 이상</option>
            </select>
          </div>
          <div class="input-field fifth-wrap">
            <button class="btn-search" type="button" >SEARCH</button>
          </div>
        </div>
      </form>
    </div>
    <script src="js/extention/choices.js"></script>

    <script>
      const choices = new Choices('[data-trigger]',
      {
        searchEnabled: false,
        itemSelectText: '',
      });

    </script>
</body>
</html>