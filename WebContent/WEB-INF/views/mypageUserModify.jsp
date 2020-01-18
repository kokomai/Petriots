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

<title>Petriots! | 내 정보 수정</title>
<link rel="stylesheet" href="css/cards_hyunwoo.css" />
<link href="vendor_mypage/bootstrap/css/bootstrap.css" rel="stylesheet">
<link rel="stylesheet" href="//code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" />
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="//code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=59eb968ac58e180944e34774405d762b&libraries=services"></script>
<script type="text/JavaScript" src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<link href="css/mainpage.css" rel="stylesheet">
<!-- Bootstrap core JavaScript -->
<script src="vendor_mypage/jquery/jquery.min.js"></script>
<script src="vendor_mypage/bootstrap/js/bootstrap.bundle.min.js"></script>


<style type="text/css">
@import url(https://fonts.googleapis.com/css?family=Raleway:300,700);

</style>

<script type="text/javascript">
   $(document).ready(function()
   {
      $("#alert-danger").hide();
      //이메일 domain선택 selectBox
      $('#selectMail').change(function()
      {
         $("#selectMail option:selected").each(function()
         {
            //직접입력일 경우
            if ($(this).val() == 'self')
            {
               $("#email2").val(''); //textBox값 초기화
               $("#email2").attr("readonly", false); //textBox 활성화
            }
            else
            {
               $("#email2").val($(this).text()); //selectBox에서 선택한 값을 textBox에 입력
               $("#email2").attr("readonly", true); //textBox 비활성화
            }
         });
      });
   });
</script>

<script type="text/javascript">
   $(function()
   {
      $("input").keyup(function()
      {
         var pwd = $("#pwd").val();
         var pwd2 = $("#pwd2").val();
         if (pwd != "" || pwd2 != "")
         {
            if (pwd == pwd2)
            {
               $("#alert-danger").hide();
               $("#join-submit").removeAttr("disabled");
            } else
            {
               $("#alert-danger").show();
               $("#join-submit").attr("disabled", "disabled");
            }
         }
      });
   });
</script>


<script type="text/javascript">
   function openDaumZipAddress()
   {
      new daum.Postcode(
      {
         oncomplete : function(data)
         {
            $("#zipcode").val(data.zonecode);
            $("#address").val(data.address);
            $("#addrdetails").val('');
            console.log(data);
         }
      }).open();
   }
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

      f.action = "userprofile.img";
      f.submit();

   }
   
</script>


</head>
<body>

<header style="padding-left: 60px;">
<!-- Navigation -->


<jsp:include page="/WEB-INF/views//navigationBar.jsp"/>

<!-- //Navigation -->

</header>
<jsp:include page="/WEB-INF/views//mypageSideMenu.jsp"/>

<div class="container">

   <div class="row" style="display:flex; flex-direction: row; height: 780px;">
         <c:forEach var="data" items="${memberdata }">
               <div class="card-header " style="width: 100%; background-color: rgba(108, 201, 251,0.3)">내 정보 수정</div>
                  <form action="" method="post" name="myForm" enctype="multipart/form-data">
                  <div class="card-body" style="display:flex; flex-direction: row; width:100%; height:310px; ">
                  <div style=" width:25%; height: 270px;   padding: 6px;display: flex; flex-direction: column; ">
                     <img class="card-img-top img-fluid" style="border-radius:40%; width:90%; height : 230px; margin: 0 auto; display:block; " src="${data.profile_img }">
                     <input type="hidden" name="user_num" id="user_num" value="${sessionScope.login.getUser_num() }">
                     <div style=" width:100%;  padding: 6px; display: flex; flex-direction: column; ">
                        <label for="imgUpload" style="text-align: center; border: 1px solid gray;" >이미지 업로드</label>
                        <input type="file" style=" width:100%; margin:0 auto; diplay:block;" hidden="hidden" id="imgUpload" name="imgUpload">
                        <input type="button" value="적용하기" class="btn btm-primary" onclick="sendIt()">
                     </div>
                  </div>
                  </form>
               <form method="get" action="modifyok.action" id="form-control" style="width: 1200px;">
                  <div style=" width:75%; height: 270px;   padding: 6px;">
                     <div class="form-group">
                        <input type="hidden" name="user_num" id="user_num" value="${data.user_num }">
                        <input type="hidden" name="pwd2" id="pwd2" value="${data.pwd }">
                                 <label for="inputName">닉네임</label>
                              <input type="text" class="form-control" name="nickName" id="nickName" placeholder="닉네임을 입력해 주세요" value="${data.nickName }">
                            </div>
                          <div class="form-group">
                              <label for="inputPassword">비밀번호</label>
                              <input type="password" class="form-control" id="pwd" placeholder="비밀번호를 입력해주세요">
                              <div class="alert alert-danger" id="alert-danger" style="margin-top:10px;">비밀번호가 일치하지 않습니다.</div>
                          </div>
                  </div>   
               </div>
               <div style=" width:100%; height: 360px;   padding: 6px;">
                  <div class="form-group" style="display:flex; flex-direction: column;">
                     핸드폰 번호
                     <div style="display:flex; flex-direction: row; height:60px;">
                              <select id="tel1" name="tel1" style="height:35px;">
                                 <option>선택해주세요.</option>
                                 <option value="010" ${data.tel1=="010" ? "selected='selected'" : "" }>010</option>
                                 <option value="011" ${data.tel1=="011" ? "selected='selected'" : "" }>011</option>
                                 <option value="016" ${data.tel1=="016" ? "selected='selected'" : "" }>016</option>
                                 <option value="018" ${data.tel1=="018" ? "selected='selected'" : "" }>018</option>
                                 <option value="019" ${data.tel1=="019" ? "selected='selected'" : "" }>019</option>
                              </select>
                              <p style="font-size: 30pt; position:relative; bottom: 15px;">-</p>
                              <input type="tel" class="form-control" id="tel2" name="tel2" value="${data.tel2 }" style="width:20%;">
                              <p style="font-size: 30pt; position:relative; bottom: 15px;">-</p>
                              <input type="tel" class="form-control" id="tel3" name="tel3" value="${data.tel3 }" style="width:20%;">
                          </div>
                      </div>
                   
                  <div class="form-group" style="display:flex; flex-direction: column;">
                              <label for="addr2">주소</label>
                          <div style="width: 100%; display:flex; flex-direction:row;">
                             <input type="text" class="form-control" name="zipcode" id="zipcode"
                                    style="width:8%; background-color: white; text-align: center;"
                                    readonly="readonly"
                                    placeholder="우편번호"  value="${data.zipcode }">
                             <input type="text" class="form-control" name="address" id="address"
                                    style="width:30%; background-color: white;"
                                    readonly="readonly"
                                    placeholder="주소 찾기" value="${data.address }">
                              <button type="button" style="
                                    background: url('https://us.123rf.com/450wm/iconmama/iconmama1512/iconmama151200204/49892581-%EA%B2%80%EC%83%89-%EC%95%84%EC%9D%B4%EC%BD%98-%EB%B2%A1%ED%84%B0.jpg?ver=6');
                                    background-size: cover;
                                    width: 35px;
                                    height: 35px;
                                    border-radius: 20%;" onClick="openDaumZipAddress();">
                              </button>
                          </div>
                          <div style="width: 60%;  height:80px;">
                             <input type="text" class="form-control" name="addrdetails" id="addrdetails"
                               placeholder="상세 주소를 입력해주세요" value="${data.addrdetails }" onclick="exchange();">
                          </div>
                     <input type="hidden" name="addrLat" id="addrLat" value="${data.addrLat }">
                           <input type="hidden" name="addrLong" id="addrLong" value="${data.addrLong }">
                     <script>
                        function exchange()
                        {
                           var address = $("#address").val();
                           var coordXY = document.getElementById("coordXY"); //검색 지도 경도위도 알아내기
                           // 주소-좌표 변환 객체를 생성합니다
                           var geocoder = new kakao.maps.services.Geocoder();
                           // 주소로 좌표를 검색합니다
                           geocoder.addressSearch(address, function(result, status)
                           {
                              // 정상적으로 검색이 완료됐으면 
                              if (status === kakao.maps.services.Status.OK)
                              {
                                 var coords = new kakao.maps.LatLng(
                                    result[0].y, result[0].x);
                                    y = result[0].y;
                                    x = result[0].x;
                                    document.getElementById("addrLat").value = y;
                                    document.getElementById("addrLong").value = x;
                              }
                           });
                        };
                  </script>
               </div>
               
                      <label for="InputEmail">이메일 주소</label>
                          <div  style="height:80px; display:flex; flex-direction: row; ">
                              <input type="text" class="form-control" name="email1" id="email1"
                                    style="width:30%;"
                                    placeholder="주소 입력" value="${data.email1 }">
                             <p style="font-size:15pt; position:relative;  width:30px;"align="center"> @ </p>
                             <input type="text" class="form-control" name="email2" id="email2"
                                    style="width:23%;"
                                    placeholder="직접입력" readonly="readonly" value="${data.email2 }">
                             <select style="width:20%; height:33px;" id="selectMail">
                                <option ${data.email2=="naver.com" ? "selected='selected'" : "" }>naver.com</option>
                                <option ${data.email2=="gmail.com" ? "selected='selected'" : "" }>gmail.com</option>
                                <option ${data.email2=="nate.com" ? "selected='selected'" : "" }>nate.com</option>
                                <option ${data.email2=="hanmail.net" ? "selected='selected'" : "" }>hanmail.net</option>
                                <option value="self">직접 입력</option>
                             </select>
                          </div>
                      </c:forEach>
                      
                      <div style="width:40%; height:80px; float:right;">
                           
                           <a class="btn btn-secondary" href="mypagemain.action" style="float:right;">
                               수정취소
                           </a>
                           <button type="submit" id="join-submit" class="btn btn-primary" style="float:right;">
                               수정완료
                           </button>
                       </div>
            </div>
      </form>
      
   </div>
      
</div>
<!-- /.container -->
<!-- // 메인 콘텐츠 -->

<br><br><br><br><br><br>

<!-- Footer -->
<jsp:include page="footer.jsp"></jsp:include>
<!-- /Footer -->


</body>
</html>