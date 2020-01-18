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
<title>Insert title here</title>
<link href="css/reservationForm.css" rel="stylesheet">
<link href="vendor_mypage/bootstrap/css/bootstrap.css" rel="stylesheet">
<link rel="stylesheet" href="css_mypage/cards_hyunwoo.css" />
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	
<script type="text/javascript">
	$(function()
	{
		
		$(".isck").click(function()
		{
			if($("#isck1").is(":checked"))
			{
				$("#label1").css('color','blue');
				$("#label2").css('color','black');
				$("#showck").prop('hidden', true);
				$("#ckm").attr('name',"");
				$("#cks").attr('name',"");
				$("#cke").attr('name',"");
				
			}
			else if($("#isck2").is(":checked"))
			{
				$("#label2").css('color','blue');
				$("#label1").css('color','black');
				$("#showck").prop('hidden', false);
				$("#ckm").attr('name',"maintext");
				$("#cks").attr('name',"cksttdate");
				$("#cke").attr('name',"ckenddate");
				
			}
			
		});
		
	});
</script>	

</head>
<body>
	<div class="resvReq">
	<form action="reserveapply.action" method="POST" id="applyform">
		<div class="center-column">
			<h1>
				<strong>PETRIOTS 예약 신청</strong>
			</h1>
			<div class="notiBoard" id="reservation-warning-box">
				<p class="p24">
					<u><b>예약 전 꼭! 읽어주세요</b></u>
				</p>
				<p class="p18">
					<strong>펫시팅을 신청할 때 꼭! 연락받을 수 있는 번호를 알려주세요. </strong> 예약 설명 1<br>
					<strong>진한글씨 예약설명 1 </strong> 강한 예약설명 하위설명 1<br> <strong>진한글씨
						예약설명 2</strong> 진한글씨 예약설명 2
				</p>
			</div>
			
			<div class="notiBoard" id="selected-petsitter-box">
				<p class="p24 blue">
					<b>0. 선택하신 펫시터 입니다. [완료]</b>
				</p>

				<div class="card-media">
				<c:forEach var="card" items="${petsittercard }">
					<!-- media container -->
					<div class="card-media-object-container">
						<!-- URL 안에 유저 사진.. -->
						<div class="card-media-object"
							style="background-image: url(${card.profile_img});"></div>
					</div>
					<!-- body container -->
					<div class="card-media-body">
						<div class="card-media-body-top">
							<span class="subtle">${card.address }</span>
							<div class="card-media-body-top-icons u-float-right">
								<a href="#/"
									class="card-media-body-supporting-bottom-text card-media-link u-float-right"></a>
							</div>
						</div>
						<input type="hidden" id="p_s_num" name="p_s_num" value="${card.p_s_num }">
						<span class="card-media-body-heading">회원 아이디 : ${card.nickName }</span>
					</div>
				</c:forEach>
				</div>

			</div>
		</div>
	<c:forEach var="dto" items="${detaildata }">
	<div class="boarder-box float-clear-both">
		<p class="p24">
			<b>1. 선택한 펫시터의 지역을 확인해 주세요.</b>
		</p>
		<div class="col-xl-12">
			<div class="index-search">
				<input type="text" id="address" name="address"
					autocomplete="off" value="${dto.address }&nbsp;${dto.addrdetails }" readonly="readonly" style="background-color: white; text-align: center;">
			</div>
		</div>
	</div>
	<div class="boarder-box">
		<p class="p24">
			<b>2. 펫시팅 날짜를 확인해 주세요.</b>
		</p>
		<div class="input-dateselect input-group" id="datepicker_start_end">
			시작일<input class="input-sm form-control" id="startDate" type="text"
				name="sttdate" placeholder="시작 날짜" readonly="readonly" value="${checkin }" style="background-color: white; text-align: center;"> 
			종료일<input
				class="input-sm form-control" id="endDate" type="text"
				name="enddate" placeholder="종료 날짜" readonly="readonly" value="${checkout }" style="background-color: white; text-align: center;">
		</div>
		<p></p>
	</div>
	<div class="boarder-box" id="calculateBox">
		<p class="p24">
			<b>3. 예약 금액을 확인하세요.</b>
		</p>
		<div class="tab-flex">	
			<input
				class="input-sm form-control" id="count" type="text"
				name="count" placeholder="종료 날짜" readonly="readonly" value="펫시팅 기간 : ${counts }일" style="background-color: white; text-align: center;">
		</div>
		<div class="tab-flex">
			<input
				class="input-sm form-control" id="price" type="text"
				name="priced" placeholder="종료 날짜" readonly="readonly" value="일일 비용 : ${dto.price}원" style="background-color: white; text-align: center;">
		</div>
		<div class="tab-flex">
			<input
				class="input-sm form-control" id="sum" type="text"
				name="sum" placeholder="종료 날짜" readonly="readonly" value="총 펫시팅 금액 : ${dto.price * counts}원" style="background-color: white; text-align: center;">
		</div>
		<p></p>
	</div>
	</c:forEach>
	<div class="boarder-box" id="reservation-option-box">
		<p class="p24 fc-grey6">
			<b>5. 위탁할 반려동물을 선택해주세요.</b>
		</p>
		<div class="container">
			<jsp:include page="petCheckbox.jsp"></jsp:include>
			<br>
			<br>

			<table class="table order-list" id="myTable">
				<thead>
					<tr>
						<td></td>
						<td class="peteInfoTable-header">
						<h3 style="color:red">※ 안전한 위탁을 위해 더블클릭 하여 선택해 주세요!</h3><br>
						※반려동물 정보를 수정하고 싶으신 경우
							마이페이지에서 수정해주세요.</td>
					</tr>
				</thead>
			</table>
		</div>
		<p></p>
	</div>
	<div class="boarder-box" id="reservation-option-box">
		<p class="p24 fc-grey6">
			<b>6. 체크리스트<br>
			<br>
				<table class="table order-list" id="myTable">
					<thead>
						<tr>
							<td></td>
							<td class="peteInfoTable-header">체크리스트를 입력해 주세요. ( 요청사항 / 시간) <br> 
							※체크리스트란? : 체크리스트는 펫시터에게 시간별로 지켜야할 사항들을 적는 목록입니다.<br>
							
							<h3>※ 체크리스트 작성 방식을 선택해 주세요.</h3>
							<input type="radio" name="isck" id="isck1" class="isck">
							<label for="isck1" id="label1"style="color:black;">기존 체크리스트 사용.</label> 
							<input type="radio" name="isck" id="isck2" class="isck">
							<label for="isck2" id="label2" style="color:black;">새로운 체크리스트로 예약</label> 
							<div id="showck"><jsp:include page="user_applychecklist.jsp"></jsp:include></div>
							</td>
						</tr>
					</thead>
				</table>
			</b>
		</p>
	</div>
	<div class="boarder-box" id="clauses-box">
		<p class="p24 colorMain">
			<b>내용을 한번 더 확인하시고 체크해주세요!</b>
		</p>
		<div class="termTitles d-flex justify-content-between flex-wrap">
			<div>
				<input id="input-agree-service" type="checkbox" required="required"> <label for="input-agree-service">
				<span style="margin-left: 10px;">확인하셨나요?</span></label>
			</div>
		</div>
	</div>
	<button class="btn-main" type="submit" id="reservesubmit">예약 신청하기</button>
	<img
		src="https://storage.googleapis.com/pefam-web-cdn/check_box_on.png"
		width="0" height="0">
	</form>
	</div>
	</div>
	</div>
	<script src="js/bootstrap.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.18.1/moment.min.js"></script>
</body>
</html>