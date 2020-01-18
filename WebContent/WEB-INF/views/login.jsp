<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
   request.setCharacterEncoding("UTF-8");
   String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Petriots! | 로그인</title>
<link rel="stylesheet" href="<%=cp %>/css/mainpage.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>

<script type="text/javascript">

$(document).ready(function(){
 
    // 저장된 쿠키값을 가져와서 ID 칸에 넣어준다. 없으면 공백으로 들어감.
    var key = getCookie("key");
    $("#userId").val(key); 
     
    if($("#userId").val() != ""){ // 그 전에 ID를 저장해서 처음 페이지 로딩 시, 입력 칸에 저장된 ID가 표시된 상태라면,
        $("#idSaveCheck").attr("checked", true); // ID 저장하기를 체크 상태로 두기.
    }
     
    $("#idSaveCheck").change(function(){ // 체크박스에 변화가 있다면,
        if($("#idSaveCheck").is(":checked")){ // ID 저장하기 체크했을 때,
            setCookie("key", $("#userId").val(), 7); // 7일 동안 쿠키 보관
        }else{ // ID 저장하기 체크 해제 시,
            deleteCookie("key");
        }
    });
     
    // ID 저장하기를 체크한 상태에서 ID를 입력하는 경우, 이럴 때도 쿠키 저장.
    $("#userId").keyup(function(){ // ID 입력 칸에 ID를 입력할 때,
        if($("#idSaveCheck").is(":checked")){ // ID 저장하기를 체크한 상태라면,
            setCookie("key", $("#userId").val(), 7); // 7일 동안 쿠키 보관
        }
    });
});
 
function setCookie(cookieName, value, exdays){
    var exdate = new Date();
    exdate.setDate(exdate.getDate() + exdays);
    var cookieValue = escape(value) + ((exdays==null) ? "" : "; expires=" + exdate.toGMTString());
    document.cookie = cookieName + "=" + cookieValue;
}
 
function deleteCookie(cookieName){
    var expireDate = new Date();
    expireDate.setDate(expireDate.getDate() - 1);
    document.cookie = cookieName + "= " + "; expires=" + expireDate.toGMTString();
}
 
function getCookie(cookieName) {
    cookieName = cookieName + '=';
    var cookieData = document.cookie;
    var start = cookieData.indexOf(cookieName);
    var cookieValue = '';
    if(start != -1){
        start += cookieName.length;
        var end = cookieData.indexOf(';', start);
        if(end == -1)end = cookieData.length;
        cookieValue = cookieData.substring(start, end);
    }
    return unescape(cookieValue);
}

</script>

<script type="text/javascript">

   function login()
   {
      try
      {
         var f = document.loginForm;
         
         if(!f.userId.value)
         {
            alert("아이디를 입력하세요.");
            f.userId.focus();
            return;
         }
         
         if(!f.pwd.value)
         {
            alert("패스워드를 입력하세요.");
            f.pwd.focus();
            return;
         }
         
         f.action = "<%=cp %>/login_ok.action";
         f.submit();
         
         
      } catch (e)
      {
         alert(e.toString());
      }
   }

</script>

<script type="text/javascript">


   $(document).ready(function() {
      if (${!empty param.userId1 })
      {
         $("#MyIdModal").modal("show");
      }
      
      if (${!empty param.pwd1 })
      {
         $("#MyPwModal").modal("show");
      }
      
});

</script>

</head>
<body>
<div>
   <c:import url="navigationBar.jsp"></c:import>
</div>

   <div class="card align-middle" style="width: 30.8rem; height: 33.8rem; border-radius: 30.8px; margin-top: 160px; margin-left: auto; margin-right: auto;">
      <div style="margin-top: 30px;">
         <h2 class="card-title text-center" style="color: #113366;">로그인</h2><hr>
      </div>
      <div class="card-body">
         <form action="" method="post" name="loginForm">
               <table style="width: 400px;" align="center">
                  <tr style="height: 30px;">
                     <td>아이디</td>
                     <td>
                        <input type="text" name="userId" size="15" class="boxTF" id="userId" placeholder="아이디">
                     </td>
                  </tr>
                  <br>
                  <tr style="height: 25p;">
                     <td>패스워드</td>
                     <td>
                        <input type="password" name="pwd" size="15" class="boxTF" id="pwd" placeholder="패스워드">
                     </td>
                  </tr>
                  <br>
                  <tr style="height: 30px;">
                     <td colspan="2" align="center">
                        <input type="button" value="로그인" class="btn btn-primary btn2" style="margin-top:40px;" onclick="login()">
                     </td>
                  </tr>
               </table>
               <!-- <input type="checkbox" id="idSaveCheck" value="remember-me"><label>아이디 기억하기</label> -->
                <label for="idSaveCheck" class="idSaveCheck"><input type="checkbox" id="idSaveCheck" class="idSaveCheck" />아이디 기억하기</label>
            </form>
            <hr style="margin-top: 40px; margin-bottom: 50px;">
         
         <button id="btn" class="btn btn-primary" data-toggle="modal" href="#IdModal">아이디찾기</button>
         <button id="btn" class="btn btn-primary" data-toggle="modal" href="#PwModal">비밀번호찾기</button>
         <button id="btn" class="btn btn-dark" style="margin-left: 120px;" onclick="location.href='signup.action'">회원가입</button>
         <c:set var="flag" value="0"></c:set>
      </div>
   </div>

<!-- Modal -->
<div class="modal fade" id="IdModal" role="dialog">
   <div class="modal-dialog">
      <!-- Modal content-->
      <div class="modal-content">
         <div class="modal-header">
            <h4 class="modal-title" style="align: left;">아이디 찾기</h4><br>
            <button type="button" class="close" data-dismiss="modal" style="float: right;">x</button>
         </div>
         <div class="modal-body">
         <form action="idsearch.action">
            <table style="margin: auto;">
               <tr>
                  <td><span>이 름    : </span><input type="text" name="userName" id="userName" style="margin-left: 63px; margin-bottom: 5px;"></td>
               </tr>
               <tr>
                  <td><span>주민등록번호 : </span><input type="text" name="ssn" id="ssn" style="margin-left: 3px; margin-bottom: 5px;"></td>
               </tr>
            </table>
            <br>
            <table style="margin: auto;">
               <tr>
                  <td><button type="submit" id="myIdSearch" class="btn btn-primary" style="padding: 5px; margin-left: 350px;">찾기</button></td>
               </tr>
            </table>
         </form>
         </div>
         <div class="modal-footer">
            <button type="button" class="btn btn-default" data-dismiss="modal">돌아가기</button>
         </div>
      </div>
   </div>
</div>

<!-- Modal -->
<div class="modal fade" id="PwModal" role="dialog">
   <div class="modal-dialog">
      <!-- Modal content-->
      <div class="modal-content">
         <div class="modal-header">
            <h4 class="modal-title" style="align: left;">비밀번호 찾기</h4><br>
            <button type="button" class="close" data-dismiss="modal" style="float: right;">x</button>
         </div>
         <div class="modal-body">
         <form action="pwsearch.action">
            <table style="margin: auto;">
               <tr>

                  <td><span>아 이 디 : </span><input type="text" name="userId" id="userId" style="margin-left: 43px; margin-bottom: 5px;"></td>
               </tr>
               <tr>
                  <td><span>이 름    : </span><input type="text" name="userName" id="userName" style="margin-left: 63px; margin-bottom: 5px;"></td>
               </tr>
               <tr>
                  <td><span>주민등록번호 : </span><input type="text" name="ssn" id="ssn" style="margin-left: 3px; margin-bottom: 5px;"></td>
               </tr>
            </table>
            <br>
            <table style="margin: auto;">
               <tr>
                  <td><button type="submit" id="myPwSearch" class="btn btn-primary" style="padding: 5px; margin-left: 350px;">찾기</button></td>
               </tr>
            </table>
         </form>
         </div>
         <div class="modal-footer">
            <button type="button" class="btn btn-default" data-dismiss="modal">돌아가기</button>
         </div>
      </div>
   </div>
</div>


<div class="modal fade" id="MyIdModal" role="dialog">
   <div class="modal-dialog">
      <!-- Modal content-->
      <div class="modal-content">
         <div class="modal-header">
            <h4 class="modal-title" style="align: left;">아이디 찾기</h4><br>
            <button type="button" class="close" data-dismiss="modal" style="float: right;">x</button>
         </div>
         <div class="modal-body">
         <c:choose>
         <c:when test="${param.userId1 eq '0' }">
         <span>존재하지 않는 정보입니다.</span>
       </c:when>
         <c:when test="${!empty param.userId1}">
         <span>당신의 아이디는 ${param.userId1}입니다.</span>
       </c:when>
       </c:choose>
         </div>
         <div class="modal-footer">
            <button type="button" class="btn btn-default" data-dismiss="modal">돌아가기</button>
         </div>
      </div>
   </div>
</div>

<div class="modal fade" id="MyPwModal" role="dialog">
   <div class="modal-dialog">
      <!-- Modal content-->
      <div class="modal-content">
         <div class="modal-header">
            <h4 class="modal-title" style="align: left;">아이디 찾기</h4><br>
            <button type="button" class="close" data-dismiss="modal" style="float: right;">x</button>
         </div>
         <div class="modal-body">
         <c:choose>
         <c:when test="${param.pwd1 eq '0' }">
         <span>존재하지 않는 정보입니다.</span>
       </c:when>
         <c:when test="${!empty param.pwd1}">
         <span>당신의 패스워드는 ${param.pwd1}입니다.</span>
       </c:when>
       </c:choose>
         </div>
         <div class="modal-footer">
            <button type="button" class="btn btn-default" data-dismiss="modal">돌아가기</button>
         </div>
      </div>
   </div>
</div>

</body>
</html>