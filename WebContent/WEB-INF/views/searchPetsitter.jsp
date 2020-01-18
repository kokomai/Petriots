<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri ="http://java.sun.com/jsp/jstl/core" %>
<%
   request.setCharacterEncoding("UTF-8");
   String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Petriots! | 펫시터 찾기</title>
<link href="css/main2.css" rel="stylesheet" />
<link href="css/mainpage.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.1.1/dist/css/bootstrap.min.css" />
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/icheck-material@1.0.1/icheck-material.min.css" />
<!-- Global site tag (gtag.js) - Google Analytics -->
<script>
window.dataLayer = window.dataLayer || [];
function gtag() { dataLayer.push(arguments); }
gtag('js', new Date());
gtag('config', 'UA-119561710-1');

(adsbygoogle = window.adsbygoogle || []).push({
    google_ad_client: "ca-pub-7283038302339833",
    enable_page_level_ads: true
  });

function check(field)
{
   for(i = 0; i < field.length; i++)
      field[i].checked = false; // 모든 체크박스를 해제한다.
}
</script>
<script type="text/javascript">
   $(function()
      {
         $(".reserveDetail").click(function()
         {
            var num = $(this).attr('id');
            
            /* alert(num); */
             $("#reserveDetail"+num).submit();
         });
      
      
      });

</script>
<link rel="stylesheet" href="<%=cp %>/css/SearchPetsitor.css">

</head>
<c:import url="navigationBar.jsp"></c:import>
<body>
<div class="s009" id="side_Banner" >
   <form>
      <div class="inner-form">
         <div class="advance-search">
            <span class="desc">원하시는 조건을 선택하세요</span>
            <div class="row">
               <div class="input-field">
                  <div class="input-select">
                     <select data-trigger="" name="choices-single-defaul">
                        <option placeholder="" value="">반려견 나이</option>
                        <option>강아지 (1살 이하)</option>
                        <option>성견 (2~6살)</option>
                        <option>노령견 (7살 이상)</option>
                     </select>
                  </div>
               </div>
               <div class="input-field">
                  <div class="input-select">
                     <select data-trigger="" name="choices-single-defaul">
                        <option placeholder="" value="">반려견 크기</option>
                        <option>소형견 (0~4.9kg)</option>
                        <option>중형견 (5~14.9kg)</option>
                        <option>대형견 (15kg이상)</option>
                     </select>
                  </div>
               </div>
               <div class="input-field">
                  <div class="input-select">
                     <select data-trigger="" name="choices-single-defaul">
                        <option placeholder="" value="">반려견 종류</option>
                        <option>개</option>
                        <option>고양이</option>
                        <option>기타</option>
                     </select>
                  </div>
               </div>
            </div>
            <span class="desc">원하시는 태그을 선택하세요</span>
            <div class="col-md-3 col-sm-4 col-xs-6 demo-col" style="max-width: 100px;">
               <div class="icheck-material-cyan">
                  <input type="checkbox" id="cyan" name="tag"/><label for="cyan">환자</label>
               </div>
            </div>
            
            <div class="col-md-3 col-sm-4 col-xs-6 demo-col" style="max-width: 200px;">
               <div class="icheck-material-cyan">
                  <input type="checkbox" id="2" name="tag"/><label for="2">자격증보유</label>
               </div>
            </div>
            
            <div class="col-md-3 col-sm-4 col-xs-6 demo-col" style="max-width: 200px;">
               <div class="icheck-material-cyan">
                  <input type="checkbox" id="3" name="tag"/><label for="3">실외배변</label>
               </div>
            </div>
            
            <div class="col-md-3 col-sm-4 col-xs-6 demo-col" style="max-width: 200px;">
               <div class="icheck-material-cyan">
                  <input type="checkbox" id="4" name="tag"/><label for="4">픽업가능</label>
               </div>
            </div>
            
            <div class="col-md-3 col-sm-4 col-xs-6 demo-col" style="max-width: 200px;">
               <div class="icheck-material-cyan">
                  <input type="checkbox" id="5" name="tag"/><label for="5">응급처치</label>
               </div>
            </div>
            
            <div class="col-md-3 col-sm-4 col-xs-6 demo-col" style="max-width: 200px;">
               <div class="icheck-material-cyan">
                  <input type="checkbox" id="6" name="tag"/><label for="6">투약가능</label>
               </div>
            </div>
            
            <div class="row third">
               <div class="input-field">
                  <div class="group-btn">
                     <button class="btn-delete" id="delete" type="reset" onclick="this.value=check(this.form.tag)">RESET</button>
                     <button class="btn-search">SEARCH</button>
                  </div>
               </div>
            </div>
         </div>
      </div>
   </form>
</div>

<div class="container" style="padding-left: 300px;">
   <div class="row" style="display:flex; flex-direction: row;" align="center">
      <!-- 펫시터 목록 -->
      <div class="col-lg-12" align="center" style=" background-color:rgba(108, 201, 251,0.3);">
         <div style="height:30px;"><span style="font-size: 15pt; font-weight: bold;">펫시터 목록</span></div>
         
         <!-- 찜한 펫시터 정보 -->
         <c:forEach var="list" items="${petsitterlist }">
         <form action="userpetsitterreservedetail.action" method="GET" id="reserveDetail${list.user_num }" class="reserveDetail">
         <input type="hidden" name="p_s_num" value="${list.p_s_num }">
            <div class="container_card">
              <div class="card-media">
                <!-- media container -->
                <div class="card-media-object-container">
                   <!-- URL 안에 펫시터 사진.. -->
                  <div class="card-media-object" style="background-image: url(${list.profile_img});"></div>
                  <ul class="card-media-object-social-list" style="display:flex; flex-direction: row;">
                    <li style="width:25%;">
                     <!-- 펫시터 환경 사진 -->
                      <img src="http://www.nongnoochtropicalgarden.com/wp-content/uploads/2018/08/PON05650_2047x1365-1024x683.jpg" class=""
                         style="width:100%; position: relative; bottom:10px;">
                    </li>
                     <li style="width:25%;">
                     <!-- 펫시터 환경 사진 -->
                      <img src="https://i0.wp.com/projectarchitecture.com/wp-content/uploads/Tung-House-0480-Custom.jpg?w=1165" class=""
                         style="width:100%; position: relative; bottom:10px;">
                    </li>
                  </ul>
                
                </div>
                <!-- body container -->
                <div class="card-media-body">
                  <div class="card-media-body-top">
                    <span class="subtle">${list.address }</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <c:if test="${!empty sessionScope.login.getUser_num() }">
                    <c:set var="distance" value="${list.distance }"/>
                    <span class="subtle">나와의 거리 : ${fn:substring(distance,0,5) }km</span>
                    </c:if>
                    <div class="card-media-body-top-icons u-float-right">
                      <a href="#/" class="card-media-body-supporting-bottom-text card-media-link u-float-right">♥</a>
                    </div>
                  </div>
                  <span class="card-media-body-heading">펫시터 아이디 : <c:set var="nickName" value="${list.nickName }" scope="request"></c:set><jsp:include page="user_button.jsp"></jsp:include></span>
                  <div class="card-media-body-supporting-bottom">
                    <span class="card-media-body-supporting-bottom-text subtle"></span>
                    <span class="card-media-body-supporting-bottom-text subtle u-float-right"><span class="text-warning">★★★★★</span> 5.0</span>
                  </div>
                  <div class="card-media-body-supporting-bottom card-media-body-supporting-bottom-reveal">
                    <span class="card-media-body-supporting-bottom-text subtle">펫시팅 횟수 : <span style="font-weight: bold;">1989회</span></span>
                    <input type="hidden" name="user_num" id="user_num${list.user_num }" value="${list.user_num }">
                    <a class="card-media-body-supporting-bottom-text card-media-link u-float-right reserveDetail" href="#" id="${list.user_num }">더보기</a>
                 
                  </div>
                </div>
              </div>
            </div>
         </form>
         </c:forEach>
         <!-- // 찜한 펫시터 정보 -->
            
         <!-- 펫시터 정보 없을 때.. -->
         <c:if test="${empty petsitterlist }">
            <div class="container_card">
              <div class="card-media" style="background-color: #ffffff; ">
                  <span>펫시터가 없습니다..</span> 
              </div>
              
            </div>
         </c:if>
         <!-- // 펫시터 정보 없을때 -->
      
      </div>
      <!-- // 위탁 중 항목 -->
      </div>
</div>
</div>


<script src="js/choices.js"></script>
<script>
const customSelects = document.querySelectorAll("select");
const deleteBtn = document.getElementById('delete')
const choices = new Choices('select',
{
   searchEnabled : false,
   itemSelectText : '',
   removeItemButton : true,
});
deleteBtn.addEventListener("click", function(e)
{
   e.preventDefault()
   const deleteAll = document.querySelectorAll('.choices__button')
   for (let i = 0; i < deleteAll.length; i++)
   {
      deleteAll[i].click();
   }
});
</script>
</body>
</html>