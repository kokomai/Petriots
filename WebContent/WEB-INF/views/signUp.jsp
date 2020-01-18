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

<link href='https://fonts.googleapis.com/css?family=Open+Sans:400,300,700' rel='stylesheet' type='text/css'>
<link href="css/sign_up2.css" rel="stylesheet" type='text/css'>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/angular.js/1.3.14/angular.min.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=59eb968ac58e180944e34774405d762b&libraries=services"></script>
<script type="text/JavaScript" src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

<script type="text/javascript">

$(document).ready(function ()
{
	var idJ = /^[A-Za-z0-9+]{6,16}$/;                           // 아이디(영문, 숫자 6~16글자)
	var pwJ = /^.*(?=^.{8,16}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/;   // 비밀번호(영문, 숫자, 특문 8~16글자)
	var nameJ = /^[가-힣]{2,10}|[a-zA-Z]{2,10}\s[a-zA-Z]{2,10}$/;      // 이름(국문 2~10글자, 영문 성, 이름 각각 2~10글자)
	var ssnJ = /^[0-9]{6}[0-9]{7}/;                           // 주민번호 (6글자, 7글자)
	var nickNameJ =  /^[\wㄱ-ㅎㅏ-ㅣ가-힣]{2,10}$/;               // 닉네임(한글영문숫자 혼용 2~10글자)
	var email1J = /^[A-Za-z0-9+]{6,16}$/;         // 이메일(영문숫자@영문숫자.영문2~4자리)
	
   $("#userId").keyup(function ()
   {
      if(idJ.test($("#userId").val()))         
      {
         $("#errId").text("");
      }
      else
      {   
         $("#errId").text("ID : 영문,숫자를 혼합하여 6~16글자");
      }
      
   });
   
   $("#pwd").keyup(function ()
   {
      if(pwJ.test($("#pwd").val()))         
      {
         $("#errPwd1").text("");
      }
      else
      {   
         $("#errPwd1").text("비밀번호 : 영문, 숫자, 특수문자포함하여 8~16 글자 입력");
      }
      
   });
   
   $("#pwd2").keyup(function ()
   {
      if($("#pwd").val() != $("#pwd2").val())         
      {
         $("#errPwd2").text("비밀번호가 일치하지 않습니다.");
      }
      else{
         $("#errPwd2").text("");
      }
      
   });
   
   $("#userName").keyup(function ()
   {
      if(nameJ.test($("#userName").val()))         
      {
         $("#errName").text("");
      }
      else
      {   
         $("#errName").text("이름 : 2~10 글자");
      }
      
   });
   $("#ssn").keyup(function ()
   {
      if(ssnJ.test($("#ssn").val()))         
      {
         $("#errSsn").text("");
      }
      else
      {   
         $("#errSsn").text("유효한 주민번호가 아닙니다.");
      }
      
      
      
   }); 
   $("#nickName").keyup(function ()
   {
      if(nickNameJ.test($("#nickName").val()))         
      {
         $("#errnickname").text("");
      }
      else
      {   
         $("#errnickname").text("닉네임 : (특수문자 제외 2~6글자)");
      }
      
   });      
   $("#email1").keyup(function ()
   {
      if(email1J.test($("#email1").val()))         
      {
         $("#errEmail").text("");
      }
      else
      {   
         $("#errEmail").text("유효한 이메일이 아닙니다.");
      }
      
   });
   
});
   

 
 function onlyNum()
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
}
</script>

<script type="text/javascript">
	var email2J = /^[a-zA-Z0-9]+\.[a-zA-Z]{2,4}$/i;   
	$(document).ready(function()
	{
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
			if(email2J.test($("#email2").val()))         
		      {
		         $("#errEmail").text("");
		      }
		      else
		      {   
		         $("#errEmail").text("유효한 이메일이 아닙니다.");
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
            $("#addrdetails").val("");
            console.log(data);
         }
      }).open();
   }
</script>
<script type="text/javascript"> 
//이메일 입력방식 선택 
$('#selectEmail').change(function(){ 
	$("#selectEmail option:selected").each(function () { 
		if($(this).val()== '1'){ //직접입력일 경우 
			$("#email2").val(''); //값 초기화 
			$("#email2").attr("disabled",false); //활성화 
			}else{ //직접입력이 아닐경우 
				$("#email2").val($(this).text()); //선택값 입력 
				$("#email2").attr("disabled",true); //비활성화 
				} }); }); 
</script>

</head>
<body>

<div class="container">

    <form id="signup" action="signupinsert.action" method="post" role="form">

        <div class="header">
        
            <h3>회원가입</h3>
            
            <p>아래의 입력란을 작성해 주세요</p>
            
        </div>
        
        <div class="sep"></div>

        <div class="inputs">
           <span id="errId" class="err"></span>
           <input type="text" name ="userId" id = "userId" placeholder="ID" autofocus required="required"/>
           
            <span id="errPwd1" class="err"></span>  
            <input type="password" name ="pwd" id ="pwd" placeholder="비밀번호" required="required"/>
            <span id="errPwd2" class="err"></span>
            <input type="password" name ="pwd2" id ="pwd2" placeholder="비밀번호 확인" required="required"/>
            
            <span id="errName" class="err"></span>
            <input type="text" name ="userName" id ="userName"placeholder="이름" autofocus required="required"/>
            
            <span id="errSsn" class="err"></span>
            <input type="text" name="ssn" id ="ssn" placeholder="주민번호('-' 없이)" autofocus required="required"/>  
            
            <span id="errnickname" class="err"></span>
            <input type="text" name ="nickName" id ="nickName" placeholder="닉네임" autofocus required="required"/>
            <span id="errEmail" class="err"></span><br>
          <input type="text" class="form-control" name="email1" id="email1"style="width:20%;" placeholder="이메일">@
          <input type="text" class="form-control" name="email2" id="email2"style="width:20%;" placeholder="직접입력" readonly="readonly">
           	<select style="width:30%; height:40px;" id="selectMail">
           		<option>선 택</option>
           		<option value="naver.com">naver.com</option>
           		<option value="gmail.com">gmail.com</option>
           		<option value="nate.com">nate.com</option>
           		<option value="hanmail.net">hanmail.net</option>
           		<option value="self">직접 입력</option>
           	</select>
            
            
            <input type="text" name="zipcode" id="zipcode" placeholder="번호" readonly="readonly" style="width: 10%" required="required">
            <input type="text" name="address" id ="address" placeholder="주소(동, 읍, 면, 리)" readonly="readonly" autofocus style="width: 60%;" required="required"/>
            <input type="button" name="searchaddress" id ="searchaddress" autofocus style="
                                    background: url('https://us.123rf.com/450wm/iconmama/iconmama1512/iconmama151200204/49892581-%EA%B2%80%EC%83%89-%EC%95%84%EC%9D%B4%EC%BD%98-%EB%B2%A1%ED%84%B0.jpg?ver=6');
                                    background-size: cover;
                                    width: 35px;
                                    height: 35px;" onclick="openDaumZipAddress();"/>
            <input type="text" name="addrdetails" id ="addrdetails" placeholder="상세주소를 입력하여 주세요" autofocus onclick="exchange();" required="required"/>
            <input type="hidden" name="addrLat" id="addrLat">
            <input type="hidden" name="addrLong" id="addrLong">
                     <script>
                        function exchange()
                        {
                           var address = $("#address").val();
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

 
            <select name="tel1" style="width: 20%;" required="required">
               <option value="">선택</option>
               <option value="010">010</option>
               <option value="011">011</option>
               <option value="016">016</option>
               <option value="017">017</option>
               <option value="019">019</option>
            </select>
            
            <input type="text" name="tel2" id="tel2"size="5" maxlength="4"  onkeypress="onlyNum()" style="width: 18%;" required="required"> - 
            <input type="text" name="tel3" id="tel3"size="5" maxlength="4"  onkeypress="onlyNum()"style="width: 18%;" required="required">
                     
            <div class="checkboxy">
                <input name="cecky" id="checky" value="1" type="checkbox" required="required"/><label class="terms">개인정보 수집 동의</label>
            </div>
            
            
            <input type="submit" class="submit" value="등록하기" style="width: 45%;">
            <input type="button" class="submit" value="가입취소" onclick="location.href='MainPage.jsp'" style="width: 45%;">

        
        </div>

    </form>

</div>
 
</body>
</html>