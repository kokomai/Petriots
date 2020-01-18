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
<meta name="description" content="">
<meta name="author" content="">

<title>Petriots! | 반려동물 정보 수정</title>
<!-- <link rel="stylesheet" href="css/cards_hyunwoo.css" /> -->
<script src="vendor_mypage/jquery/jquery.min.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link href="css/mainpage.css" rel="stylesheet">
<link href="vendor_mypage/bootstrap/css/bootstrap.css" rel="stylesheet">

<!-- Bootstrap core JavaScript -->
<!-- <script src="vendor_mypage/jquery/jquery.min.js"></script> -->
<script src="vendor_mypage/bootstrap/js/bootstrap.bundle.min.js"></script>

<style type="text/css">
@import url(https://fonts.googleapis.com/css?family=Raleway:300,700);
</style>
<script type="text/javascript">

   $(function()
   {
      
      $( "#birth" ).datepicker({
          dateFormat: 'yy-mm-dd',
           prevText: '이전 달',
           nextText: '다음 달',
           monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
           monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
           dayNames: ['일', '월', '화', '수', '목', '금', '토'],
           dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
           dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
           showMonthAfterYear: true,
           yearSuffix: '년'
        });
      
      

   });
</script>

<script type="text/javascript">

   function sendIt()
   {
      f = document.myForm;

      str = f.imgUpload.value;
      if (!str)
      {
         alert("이미지 파일을 선택하세요.");
         return;
      }

      if (!/(\.gif|\.jpg|\.jpeg|\.png)$/i.test(str))
      {
         alert("이미지 파일만 업로드 가능합니다.");
         return;
      }
      
      f.action = "petprofile.img";
      f.submit();
   }
   
</script>


</head>
<body>

   <header style="padding-left: 60px;">
      <!-- Navigation -->

      <div class="container">
         <jsp:include page="navigationBar.jsp" />
      </div>

      <!-- //Navigation -->


   </header>
   <jsp:include page="/WEB-INF/views/mypageSideMenu.jsp" />

   <!-- 메인 콘텐츠 -->
   <div class="container">

      <div class="row" style="display: flex; flex-direction: row;">
         <div class="card-header" style="width: 100%; background-color: rgba(108, 201, 251, 0.3)">내 반려동물 정보 수정</div>
         <form action="" method="post" name="myForm" enctype="multipart/form-data" style="width:40%;">
         <c:forEach var="data" items="${petdata }">
         <div style="width: 65%; height: 270px; padding: 6px; display: flex; flex-direction: column;">
            <img class="card-img-top img-fluid" style="border-radius: 40%; width: 90%; height: 230px; margin: 0 auto; display: block;" src="${data.pet_img }">
            <input type="hidden" name="p_r_num" id="p_r_num" value="${data.p_r_num }">
            <div style="width: 100%; padding: 6px; display: flex; flex-direction: column;">
               <label for="imgUpload" style="text-align: center; border: 1px solid gray;">이미지 업로드</label> 
               <input type="file" style="width: 100%; margin: 0 auto; diplay: block;" hidden="hidden" id="imgUpload" name="imgUpload">
               <input type="button" value="적용하기" class="btn btm-primary" onclick="sendIt()">
            </div>
         </div>
         </c:forEach>
         </form>
         <form role="form" method="GET" action="petmodifyok.action"
            id="form-control" style="width: 1200px;">
            <c:forEach var="data" items="${petdata }">
               <div class="card-body" style="display: flex; flex-direction: row; width: 100%; height: 310px;">
                  
                  <div style="width: 75%; height: 270px; padding: 6px;">
                     <div class="form-group">
                        <input type="hidden" name="p_r_num" id="p_r_num"
                           value="${data.p_r_num }"> <label for="inputName">이름</label>
                        <input type="text" class="form-control" name="name" id="name"
                           placeholder="이름을 입력해 주세요" value="${data.name }">
                     </div>

                     <div class="form-group">
                        <label for="inputType">종류</label><br> <select
                           name="maintype" id="maintype">
                           <option value="개"
                              ${data.maintype=="개" ? "selected='selected'" : "" }>강아지</option>
                           <option value="고양이"
                              ${data.maintype=="고양이" ? "selected='selected'" : "" }>고양이</option>
                           <option value="새"
                              ${data.maintype=="새" ? "selected='selected'" : "" }>새</option>
                           <option value="기타"
                              ${data.maintype=="기타" ? "selected='selected'" : "" }>기타</option>
                        </select> <select name="subtype" id="subtype">
                           <option value="소형"
                              ${data.subtype=="소형" ? "selected='selected'" : "" }>소형</option>
                           <option value="중형"
                              ${data.subtype=="중형" ? "selected='selected'" : "" }>중형</option>
                           <option value="대형"
                              ${data.subtype=="대형" ? "selected='selected'" : "" }>대형</option>
                        </select>
                     </div>
                     <div class="form-group">
                        <label for="inputSpeices">종</label> <input type="text"
                           class="form-control" name="speices" id="species"
                           placeholder="종을 입력해 주세요" value="${data.speices }">
                     </div>
                     <div class="form-group">
                        <label for="petBirth">생년월일</label> <input type="text"
                           class="form-control" name="birth" id="birth"
                           readonly="readonly" value="${data.birth }">
                     </div>
                  </div>

               </div>
               <div style="width: 100%; height: 700px; padding: 6px; margin-top: 20px;">
                  <div class="form-group" style="display: flex; flex-direction: column;">
                     <div
                        style="width: 100%; display: flex; flex-direction: row; padding: 6px;">
                        <div
                           style="width: 25%; display: flex; flex-direction: column; padding: 6px;">
                           <div
                              style="width: 80%; display: flex; flex-direction: column; padding: 6px;">
                              <label for="">소유 질병</label>
                              <textarea rows="3" cols="20%" class="illContent"
                                 name="illness" id="illness" style="resize: none;">${data.illness }</textarea>
                              <label for="">복용 중인 약</label>
                              <textarea rows="3" cols="20%" class="drugContent" name="drug"
                                 id="drug" style="resize: none;">${data.drug }</textarea>
                           </div>
                        </div>
                     </div>
                     <div class="form-group"
                        style="display: flex; flex-direction: column;">
                        <label for="">특이사항</label>
                        <textarea rows="1%" cols="100%" class="content"
                           name="additional" id="additional" style="resize: none;">${data.additional }</textarea>
                     </div>
                  </div>
            </c:forEach>

            <div style="height: 300px; width: 100%;" align="center">
               <jsp:include page="/WEB-INF/views/user_checklist.jsp" />
               <br> <br>
               <button type="submit" id="modify_pet" class="btn btn-primary">수정하기</button>
               <a class="btn btn-secondary" href="mypagepetlist.action"> 취소하기</a>
               <br> <br>
               <!-- Footer -->
               <jsp:include page="footer.jsp"></jsp:include>
               <!-- /Footer -->
            </div>
         </form>
      </div>
   </div>

   <!-- /.container -->
   <!-- // 메인 콘텐츠 -->


</body>
</html>