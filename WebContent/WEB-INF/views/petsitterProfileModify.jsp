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

<title>Petriots! | 펫시터 프로필 수정</title>
<link rel="stylesheet" href="css/cards_hyunwoo.css" />
<link href="vendor_mypage/bootstrap/css/bootstrap.css" rel="stylesheet">
<link rel="stylesheet" href="//code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" />
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="//code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<link href="css/mainpage.css" rel="stylesheet">
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=59eb968ac58e180944e34774405d762b&libraries=services"></script>
<script type="text/JavaScript" src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<!-- Bootstrap core JavaScript -->
<script src="vendor_mypage/jquery/jquery.min.js"></script>
<script src="vendor_mypage/bootstrap/js/bootstrap.bundle.min.js"></script>


<style type="text/css">
@import url(https://fonts.googleapis.com/css?family=Raleway:300,700);

</style>

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
      
      f.action = "petsitter.img";
      f.submit();
   }
   
</script>

</head>
<body>

<header style="padding-left: 60px;">
<!-- Navigation -->
<jsp:include page="/WEB-INF/views/navigationBar.jsp"/>
<!-- //Navigation -->

<!-- banner -->
<!-- //banner -->
</header>
<jsp:include page="/WEB-INF/views/petsitterSideMenu.jsp"/>

<!-- 메인 콘텐츠 -->
<div class="container">

   <div class="row" style="display:flex; flex-direction: row; height: 1000px;">
   <c:forEach var="dto" items="${dto }">
               <div class="card-header" style="width: 80%; height:50px; background-color: rgba(108, 201, 251,0.3)">펫시터 프로필 수정</div>
               
               <div class="card-body" style="display:flex; flex-direction: row; width:80%; height:400px; ">
                  
                  <div style=" width:100%; height: 500px;   padding: 2px;display: flex; flex-direction: column; ">
                     <c:set var ="dto" value="${dto }" scope="request"></c:set><jsp:include page="/WEB-INF/views/multiple_image.jsp"></jsp:include>
                  
                  <form action="" method="post" name="myForm" enctype="multipart/form-data">
                  <div style=" width:60%;  padding: 6px; display: flex; flex-direction: column; margin-top: 80px;">   
                        <label for="imgUpload" style="text-align: center; border: 1px solid gray;" >이미지 업로드</label>
                        <input type="hidden" id="p_s_num" name="p_s_num" value="${dto.p_s_num }">
                        <input type="file" style=" width:100%; margin:0 auto; diplay:block;" hidden="hidden" id="imgUpload" name="imgUpload">
                  <input type="button" value="적용하기" class="btn btm-primary" onclick="sendIt()">
                        </div>
                  </form>
                  </div>
                  
               </div>
               <form action="petsitterprofilemodify.action" method="get" id="petsitterModifyForm" style="margin-top: 50px;">
               <div style=" width:100%; height: 500px; padding: 6px; margin-top: 50px;">
                     <label for="checkin_start">표준 체크인 시간</label>
                     <div class="form-group" style=" display:flex; flex-direction: row;">
                              <input type="time" class="form-control" id="checkin_start" name="checkin_start" placeholder="시간 선택"
                              style="width:30%;" value="${dto.checkin_start }">
                              부터
                              <input type="time" class="form-control" id="checkin_end" name="checkin_end" placeholder="시간 선택"
                              style="width:30%;" value="${dto.checkin_end }">
                              까지
                            </div>
                            <label for="checkout_start">표준 체크아웃 시간</label>
                          <div class="form-group" style=" display:flex; flex-direction: row;">
                              <input type="time" class="form-control" id="checkout_start" name="checkout_start" placeholder="시간 선택"
                              style="width:30%;" value="${dto.checkout_start }">
                              부터
                              <input type="time" class="form-control" id="checkout_end" name="checkout_end" placeholder="시간 선택"
                              style="width:30%;" value="${dto.checkout_end }">
                              까지
                            </div>
                            
                            <label for="">위탁 가능 동물 선택</label>
                         <div class="form-group" style="display:flex; flex-direction: column; border:1px solid silver; width:50%;">
                               <jsp:include page="/WEB-INF/views/sitable_checkbox.jsp"></jsp:include>
                         </div>
                            <label for="">위탁 가능 동물 크기 선택</label>
                         <div class="form-group" style="display:flex; flex-direction: column; border:1px solid silver; width:50%;">
                               <jsp:include page="/WEB-INF/views/petsize_checkbox.jsp"></jsp:include>
                         </div>
                            
                            
                            <div style="display: flex; flex-direction: row">
                            <label for="max_sitable" style="width: 50%;">최대 위탁 가능 숫자</label>
                            <label for="price">주간 가격 금액</label>
                            </div>
                          <div class="form-group" style=" display:flex; flex-direction: row;">
                              <input type="text" id="max_sitable" name="max_sitable" style="width: 40%;" value="${dto.max_sitable }">
                                 
                              <input type="text" class="form-control" id="price" name="price" placeholder="가격"
                              style="width:30%;" value="${dto.price }">원
                            </div>
                  <div class="form-group" style="display:flex; flex-direction: column;">
                     이력 사항
                     <div style="display:flex; flex-direction: row; height:200px;">
                            <textarea rows="100" cols="60%" class="form-group"
                            style="resize:none;" id="records" name="records">${dto.records }</textarea>
                          </div>
                      </div>
                  <div class="form-group" style="display:flex; flex-direction: column;">
                              <label for="addr2">소개</label>
                          <div style="display:flex; flex-direction: row; height:200px;">
                            <textarea rows="100" cols="60%" class="form-group"
                            style="resize:none;" id="introduce" name="introduce">${dto.introduce }</textarea>
                          </div>
                      </div>
                      
                      <label for="">환경 선택</label>
                      <div class="form-group" style="display:flex; flex-direction: column; border:1px solid silver; width:50%;">
                            <c:set var ="dto" value="${dto }" scope="request"></c:set><jsp:include page="/WEB-INF/views/environmentCheckbox.jsp"></jsp:include>
                      </div>
                      
                      <label for="">가능 서비스 선택</label>
                      <div class="form-group" style="display:flex; flex-direction: column; border:1px solid silver; width:80%;">
                            <c:set var="dto" value="${dto }" scope="request"></c:set><jsp:include page="/WEB-INF/views/serviceCheckbox.jsp"></jsp:include>
                      </div>
                      
                      <label for="b_type_num">건물 유형 선택</label>
                      <div class="form-group" style=" display:flex; flex-direction: row;">
                              <select name="b_type_num" id="b_type_num" style="width: 40%;">
                                 <option value="1" ${dto.b_type_num == 1 ? "selected='selected'" : "" }>아파트</option>
                                 <option value="2" ${dto.b_type_num == 2 ? "selected='selected'" : "" }>다세대주택</option>
                                 <option value="3" ${dto.b_type_num == 3 ? "selected='selected'" : "" }>단독주택</option>
                              </select>
                            </div>
                      
                      <div style="width:100%; height:100px; padding-left: 60%;">
                     <button type="button" id="petsitter-submit" class="btn btn-primary">
                               수정완료
                           </button>
                           <a class="btn btn-secondary" href="petsittermain.action">
                               수정취소
                           </a>
                           <br>
                       </div>
               </div>
         </form>
         
      </c:forEach>      
   </div>
      
</div>
<!-- /.container -->
<!-- // 메인 콘텐츠 -->

<!-- Footer -->
<!--    <footer class="py-5" style="padding-left: 60px; width:100%; background-color: rgba(108, 201, 251,0.3);">
      <div class="container">
         <p class="m-0 text-center text-white">Copyright &copy; Petriots! 2019</p>
      </div>
      /.container
   </footer> -->
<!-- /Footer -->

<script type="text/javascript">

   $(function()
   {
      $("#petsitter-submit").click(function()
      {
         
             
               for(var i=1; i<=4; i++)
               {
                  /* $(".en"+i).val("2"); */
                  
                  if($(".en"+i).is(":checked"))
                  {
                     /* check_en.push(i); */
                     $(".en_t"+i).val("1");
                  }
   
                 

               }
               
              /* for(i=1; i<=4; i++)
               {
                 alert($(".en_t"+i).val());
               }  */
       
     
   
               for(var j=1; j<=5; j++)
               {
                  /* $(".se"+j).val("2"); */
                  if($(".se"+j).is(":checked"))
                  {
                     $(".se_t"+j).val("1");
                  }
   
                  

               }
               
            /*    for(i=1; i<=5; i++)
               {
                  alert($(".se_t"+i).val());
               }   */
   
         
         $("#petsitterModifyForm").submit(); 
         
      });
   });
   
</script>

</body>
</html>