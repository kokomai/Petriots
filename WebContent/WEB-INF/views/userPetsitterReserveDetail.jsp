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

<title>Petriots! | 상세 펫시터 정보</title>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="css/cards_hyunwoo.css" />
<link href="vendor_mypage/bootstrap/css/bootstrap.css" rel="stylesheet">
<link href="css/mainpage.css" rel="stylesheet">
<!-- Bootstrap core JavaScript -->
<script src="vendor_mypage/bootstrap/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=59eb968ac58e180944e34774405d762b&libraries=services"></script>

<style type="text/css">
@import url(https://fonts.googleapis.com/css?family=Raleway:300,700);
</style>

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
          
          minDate: 1,
          
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
   
   $("#reserve").click(function()
	{
		var really = confirm("예약을 진행하시겠습니까?");
		
		if($("#checkin_start").val()==="" || $("#checkout_end").val()==="")
		{
			alert("예약 날짜를 확인해 주세요!");
			return;
		}
		else
		{
			if(really ===true)
			{
				$("#reservationform").submit();
			}
		}
		
		
	});
   
});


</script>

<script type="text/javascript">
function submitWithoutRefresh() {  
    // Ajax 통신으로 서버에 Data를 전송하고 Return 받습니다.
    
    var p_s_num = $("#p_s_num").val();
    var user_num = $("#user_num").val()
    var checkFavorite = $("#checkF").val()
    $.ajax({
        // type을 설정합니다.
        type : 'POST',
        url : "favorite.action",
        dataType: 'json',
        data : {"p_s_num" : p_s_num
              ,"user_num" : user_num
              ,"checkFavorite" : checkFavorite},
    });
    if ($("#checkF").val() == 1)
   {
       $("#checkF").val(0);
   }
    else
       {
          $("#checkF").val(1);
       }
   
   
   if($("#favorite").html()=="♡")
      {
         $("#favorite").html("♥");
      }
   else
      {
         $("#favorite").html("♡");
      }
}
</script>

</head>
<body>

<header style="padding-left: 60px;">
<!-- Navigation -->
<jsp:include page="/WEB-INF/views/navigationBar.jsp"/>
<!-- //Navigation -->
</header>

<!-- 메인 콘텐츠 -->

<div class="container">

   <div class="row" style="display:flex; flex-direction: row; height: 1000px;">
   <c:forEach var ="dto" items="${reserveDetail }">
      <form action="reservationform.action" method="get" id="reservationform">
               <div class="card-header" style="width: 80%; height:50px; background-color: rgba(108, 201, 251,0.3)">상세 펫시터 정보
               <input type="hidden" name="user_num" id="user_num" value="${dto.user_num }">
               <input type="hidden" name="p_s_num" id="p_s_num" value="${dto.p_s_num }">
               <input type="hidden" name="checkF" id="checkF" value="${favorite }">
               <p class="text" style="float:right;">펫시터 닉네임 : ${dto.nickName }</p>
               </div>
               
               <div class="card-body" style="display:flex; flex-direction: row; width:80%; height:400px; ">
                  <div style=" width:100%; height: 400px;   padding: 2px;display: flex; flex-direction: row; ">
                  <!--    <img class="card-img-top img-fluid" style="border-radius:40%; width:90%; height : 230px;
                           margin: 0 auto; display:block; "
                           src="https://t1.daumcdn.net/news/201801/29/segye/20180129150015458rnog.jpg"
                           onclick=""> -->
                     <c:set var ="dto" value="${dto }" scope="request"></c:set><jsp:include page="/WEB-INF/views/multiple_image.jsp"></jsp:include>
                     <div style="display:flex; flex-direction: column; height: 200px;">
                     <div class="card-header" style="width: 100%; height:50px; background-color: rgba(108, 201, 251,0.3)">
                     <c:if test="${favorite eq '0'}">
                      <button type="button" id="favorite" name="favorite" style="border: none; background-color: transparent; color: red;" onclick="submitWithoutRefresh()">♡</button>
                      </c:if>
                      <c:if test="${favorite ne '0'}">
                      <button type="button" id="favorite" name="favorite" style="border: none; background-color: transparent; color: red;" onclick="submitWithoutRefresh()">♥</button>
                      </c:if>
                     </div>
                     <img alt="펫시터 프로필 사진" style="width: 100%; height: 380px;" 
                     src="${dto.profile_img }">
                     </div>
                  </div>
                  
               </div>
               <div style=" width:100%; height: 250px;   padding: 6px;">
               
               <div class="card-header" style="width: 35%; height:50px; background-color: rgba(108, 201, 251,0.3)">업적 정보</div>
                     <div style=" display:flex; flex-direction: row; height: 150px;">
                        <div class="form-group" style=" display:flex; flex-direction: row; border:1px solid silver;
                              width: 35%; height: 150px;">
                           
                           <div style="border:1px solid silver;">
                            <img src="badges/badge_purple.png" title="첫 별점 5점"
                                     style="width:120px; position: relative;" >
                              <h5>첫 별점 5점</h5>
                           </div>
                           <div style="border:1px solid silver;">
                           <img src="badges/badge_green.png" title="신규 펫시터"
                                     style="width:120px; position: relative;" >
                              <h5>신규 펫시터</h5>
                           </div>
                        </div>
                        <div style="width:60%; height:100px; padding-left: 20%; ">
                        <div class="input-field second-wrap">
                        <div class="icon-wrap">
                          <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24">
                            <path d="M17 12h-5v5h5v-5zM16 1v2H8V1H6v2H5c-1.11 0-1.99.9-1.99 2L3 19c0 1.1.89 2 2 2h14c1.1 0 2-.9 2-2V5c0-1.1-.9-2-2-2h-1V1h-2zm3 18H5V8h14v11z"></path>
                          </svg>
                        </div>
                        <input class="datepicker1" id="checkin_start" type="text" name="checkin" placeholder="체크인 날짜" readonly="readonly" value="" />
                      </div>
                      <div class="input-field third-wrap">
                        <div class="icon-wrap">
                          <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24">
                            <path d="M17 12h-5v5h5v-5zM16 1v2H8V1H6v2H5c-1.11 0-1.99.9-1.99 2L3 19c0 1.1.89 2 2 2h14c1.1 0 2-.9 2-2V5c0-1.1-.9-2-2-2h-1V1h-2zm3 18H5V8h14v11z"></path>
                          </svg>
                        </div>
                        <input class="datepicker2" id="checkout_end" name="checkout" type="text" placeholder="체크아웃 날짜" readonly="readonly" value="" />
                      </div>
                      <br>
                      <c:if test="${!empty sessionScope.login.userId }">
                          <button type="button" id="reserve" class="btn btn-primary" style="width:30%">
                                    예약하기
                                </button>
                      </c:if>
                                <a class="btn btn-secondary" href="searchpetsitter.action" style="width:30%">
                                    돌아가기
                                </a>
                               </div>
                          </div>
                     </div>
                     <label for="checkin_start">표준 체크인 시간</label>
                     <div class="form-group" style=" display:flex; flex-direction: row;">
                              <input type="time" class="form-control" id="checkin_start"
                              style="width:30%;" readonly="readonly" value="${dto.checkin_start }">
                              부터
                              <input type="time" class="form-control" id="checkInEnd" 
                              style="width:30%;" readonly="readonly" value="${dto.checkin_end }">
                              까지
                            </div>
                            <label for="checkout_start">표준 체크아웃 시간</label>
                          <div class="form-group" style=" display:flex; flex-direction: row;">
                              <input type="time" class="form-control" id="checkout_start" 
                              style="width:30%;" readonly="readonly" value="${dto.checkout_start }">
                              부터
                              <input type="time" class="form-control" id="checkOutEnd" 
                              style="width:30%;" readonly="readonly" value="${dto.checkout_end }">
                              까지
                            </div>
                            <div style="display: flex; flex-direction: row">
                            <label for="sittingCount" style="width: 30%;">최대 위탁 가능 숫자</label>
                            <label for="">주간 가격 금액</label>
                            </div>
                          <div class="form-group" style=" display:flex; flex-direction: row;">
                              <input type="text" class="form-control" id="checkInEnd" value="${dto.max_sitable }"
                              style="width:10%;" readonly="readonly" >마리
                              <div style="width:200px;">
                              </div>
                              <input type="text" class="form-control" id="checkInEnd" value="${dto.price }"
                              style="width:10%;" readonly="readonly">원
                            </div>
                   <div class="form-group" style="display:flex; flex-direction: column; height:100px;">
                              <label for="address">주소</label>
                          <div style="width: 100%; display:flex; flex-direction:row;">
                             <input type="text" class="form-control" id="zipcode"
                                    style="width:8%; background-color: white; text-align: center;"
                                    disabled="disabled"
                                    placeholder="우편번호"  value="${dto.zipcode }">
                             <input type="text" class="form-control" id="address"
                                    style="width:30%; background-color: white;"
                                    disabled="disabled"
                                    placeholder="주소" value="${dto.address }"><c:set var="address" value="${dto.address }" /><c:set var="myaddress" value="${myAddress }" />
                            
                          </div>
                          <div style="width: 60%;  height:80px;">
                             <input type="text" class="form-control" id="addrdetails"
                               placeholder="상세 주소를 입력해주세요" value="${dto.addrdetails }" style="background-color: white;" disabled="disabled">
                          </div>
                     
               </div>
                  <div class="form-group" style="display:flex; flex-direction: column;">
                     이력 사항
                     <div style="display:flex; flex-direction: row; height:200px;">
                            <textarea rows="100" cols="60%" class="form-group"
                            style="resize:none;" readonly="readonly" id="records">${dto.records }</textarea>
                          </div>
                      </div>
                  <div class="form-group" style="display:flex; flex-direction: column;">
                              <label for="addr2">소개</label>
                          <div style="display:flex; flex-direction: row; height:200px;">
                            <textarea rows="100" cols="60%" class="form-group"
                            style="resize:none;" readonly="readonly" id="introduce">${dto.introduce }</textarea>
                          </div>
                      </div>
                      
                      <div style="display:flex; flex-direction: column; width:50%;">
                      <label for="">펫시팅 환경</label>
                      <div class="form-group" style="display:flex; flex-direction: row; border:1px solid silver;
                         padding: 10px;">
                        <c:set var ="dto" value="${dto }" scope="request"></c:set><jsp:include page="/WEB-INF/views/detailEnvironmentCheckbox.jsp"></jsp:include>
                       
                      </div>
                      </div>
                      
                      <div style="display:flex; flex-direction: column; width:50%;">
                      <label for="">요청 가능한 서비스</label>
                      <div class="form-group" style="display:flex; flex-direction: row; border:1px solid silver;
                         padding: 10px;">
                            <c:set var="dto" value="${dto }" scope="request"></c:set><jsp:include page="/WEB-INF/views/detailServiceCheckbox.jsp"></jsp:include>
                      </div>
                      </div>
                      
                      <label for="building_type">건물 유형</label>
                      <div class="form-group" style=" display:flex; flex-direction: row;">
                              <input type="text" class="form-control" id="building_type" value="${dto.b_type }"
                              style="width:30%; background-color: white;" readonly="readonly">
                         </div>
                      
                         
                   <div class="form-group" style="display:flex; flex-direction: column;">
                     후기
                     <div style="display:flex; flex-direction: column; border: 1px solid silver; padding: 15px;">
                        <div style="display:flex; flex-direction: row; width:100%;">
                           <img style="width:10%; hieght:100%; border-radius: 40%; border: 1px solid silver;" 
                                 src="https://image.flaticon.com/icons/png/512/883/883407.png" />
                           <input type="text" class="text" value="아이디 : 냥냥이" disabled="disabled"
                              style="border: none; background-color: white;">
                        </div>
                           <input type="text" class="text text-warning" value="★★★★" disabled="disabled"
                              style="border: none; background-color: white;">
                            <textarea rows="10" cols="70%" class="form-group" style="resize:none;" readonly="readonly">좋았다데스^^</textarea>
                      </div>
                    </div>
                         <br><br><br>   
                </form>              
             </c:forEach> 
             
             
             
             
             <div id="map" style="width: 650px; height: 500px; margin-bottom: 100px"></div>
	
	<script>
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	mapOption =
	{
		center : new kakao.maps.LatLng(37.5504896, 126.921932801), // 지도의 중심좌표
		level : 6 // 지도의 확대 레벨
	};
	// 지도를 생성합니다    
	var map = new kakao.maps.Map(mapContainer, mapOption);
	
	var mapTypeControl = new kakao.maps.MapTypeControl();
	map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);
	var zoomControl = new kakao.maps.ZoomControl();
	map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
	
	// 주소-좌표 변환 객체를 생성합니다
	var geocoder = new kakao.maps.services.Geocoder();
	// 주소로 좌표를 검색합니다
	geocoder.addressSearch('${myaddress}', 
		function(result, status)
		{
			// 정상적으로 검색이 완료됐으면 
			if (status === kakao.maps.services.Status.OK)
			{
				var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
				y1 = result[0].y;
				x1 = result[0].x;
				// 결과값으로 받은 위치를 마커로 표시합니다
				var marker = new kakao.maps.Marker(
				{
					map : map, position : coords
				});
				// 인포윈도우로 장소에 대한 설명을 표시합니다
				var infowindow = new kakao.maps.InfoWindow(
				{
					content : '<div style="width:150px;text-align:center;padding:4px 0;">우리집</div>'
				});
				infowindow.open(map, marker);
				// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
				// map.setCenter(coords);
			}
		});
	
	// 주소-좌표 변환 객체를 생성합니다
	var geocoder2 = new kakao.maps.services.Geocoder();
	// 주소로 좌표를 검색합니다
	geocoder2.addressSearch('${address}', 
		function(result, status)
		{
			// 정상적으로 검색이 완료됐으면 
			if (status === kakao.maps.services.Status.OK)
			{
				var coords2 = new kakao.maps.LatLng(result[0].y, result[0].x);
				y2 = result[0].y;
				x2 = result[0].x;
				// 결과값으로 받은 위치를 마커로 표시합니다
				var marker2 = new kakao.maps.Marker(
				{
					map : map, position : coords2
				});
				// 인포윈도우로 장소에 대한 설명을 표시합니다
				var infowindow = new kakao.maps.InfoWindow(
				{
					content : '<div style="width:150px;text-align:center;padding:4px 0;">펫시터집</div>'
				});
				infowindow.open(map, marker2);
				// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
				map.setCenter(coords2);
			}
		});
	
	</script>
             
             
             
             
              
               </div>
        
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