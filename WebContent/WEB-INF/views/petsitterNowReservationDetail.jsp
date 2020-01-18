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

<title>Petriots! | 현재 예약 정보</title>   
<link rel="stylesheet" href="css_mypage/cards_hyunwoo.css" />
<link href="vendor_mypage/bootstrap/css/bootstrap.css" rel="stylesheet">
<link href="css/mainpage.css" rel="stylesheet">
<!-- Bootstrap core JavaScript -->
<script src="vendor_mypage/jquery/jquery.min.js"></script>
<script src="vendor_mypage/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>

<style type="text/css">
@import url(https://fonts.googleapis.com/css?family=Raleway:300,700);

.services
{
	width:30%;
	height:45%;
	text-align: center;
}

#content
{
	border: 1px solid #ccc;
	border-radius: 5px;
	width: 300px;
	padding: 15px;
	margin: 30px;
}

.input-group-addon:first-child {border-right: 0;}
.input-group .form-control:first-child, .input-group-addon:first-child, .input-group-btn:first-child>.btn, .input-group-btn:first-child>.btn-group>.btn, .input-group-btn:first-child>.dropdown-toggle, .input-group-btn:last-child>.btn-group:not(:last-child)>.btn, .input-group-btn:last-child>.btn:not(:last-child):not(.dropdown-toggle)
{
    border-top-right-radius: 0;
    border-bottom-right-radius: 0;
}
.input-group-addon
{
    padding: 6px 12px;
    font-size: 14px;
    font-weight: 400;
    line-height: 1;
    color: #555;
    background-color: #eee;
    border: 1px solid #ccc;
    border-radius: 4px;
}
.input-group-addon, .input-group-btn
{
    width: 1%;
    white-space: nowrap;
}
.input-group .form-control, .input-group-addon, .input-group-btn {display: table-cell;}
div.input-group-addon{width:80px;}
div#content{width: 450px; height: 300px;}
</style>

<script type="text/javascript">

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
<div class="container" style="padding-left: 200px;">

	<div class="row" style="height: 800px; ">
	<div class="col-lg-12" style="width:80%;">
					<div class="card-header" style="width: 100%; height:50px; background-color: rgba(108, 201, 251,0.3)">요청된 예약 정보
						<p class="text-success" style="float:right;">예약번호: 111123</p>
					</div>
					
					<div class="card-body" style="display:flex; flex-direction: column; width:80%; height:600px; ">
						<div style=" width:100%; height: 300px;   padding: 2px;display: flex; flex-direction: column; ">
							<p>유저 정보</p>
						<div class="container_card">
				  
				  <div class="card-media">
				    <!-- media container -->
				    <div class="card-media-object-container">
				    	<!-- URL 안에 유저 사진.. -->
				      <div class="card-media-object" style="background-image: url(https://file.mk.co.kr/meet/neds/2017/05/image_readtop_2017_320929_14947258072880662.jpg);"></div>
				      <ul class="card-media-object-social-list">
				        <li>
				         <!-- 맡긴 반려동물 사진 -->
				          <img src="" class=""
				          	style="width:100%; position: relative; bottom:10px;">
				        </li>
				      </ul>
				    
				    </div>
				    <!-- body container -->
				    <div class="card-media-body">
				      <div class="card-media-body-top">
				        <span class="subtle">인천 중구 중산동 1881-1</span>
				        <div class="card-media-body-top-icons u-float-right">
				          <a href="#/" class="card-media-body-supporting-bottom-text card-media-link u-float-right"></a>
				        </div>
				      </div>
				      <span class="card-media-body-heading">회원 아이디 : superman</span>
				      <div class="card-media-body-supporting-bottom">
				        <span class="card-media-body-supporting-bottom-text subtle"></span>
				        <span class="card-media-body-supporting-bottom-text subtle u-float-right"><span class="text-warning"></span> </span>
				      </div>
				      <div class="card-media-body-supporting-bottom card-media-body-supporting-bottom-reveal">
				        <span class="card-media-body-supporting-bottom-text subtle"> <span style="font-weight: bold;"></span></span>
				        <a href="#/" class="card-media-body-supporting-bottom-text card-media-link u-float-right"></a>
				      </div>
				    </div>
				  </div>
				  
				</div>
	
					</div>
					<div style=" width:100%; height: 300px;   padding: 2px;display: flex; flex-direction: column; ">
							<p>반려동물 정보</p>
						<div class="container_card">
				  
				  <div class="card-media">
				    <!-- media container -->
				    <div class="card-media-object-container">
				    	<!-- URL 안에 펫시터 사진.. -->
				      <div class="card-media-object" style="background-image: url(https://t1.daumcdn.net/liveboard/holapet/529ffebe11304d50999a4319dacf3ee0.jpg);"></div>
				      <ul class="card-media-object-social-list">
				        <li>
				         <!-- 맡긴 반려동물 사진 -->
				          <img src="" class=""
				          	style="width:100%; position: relative; bottom:10px;">
				        </li>
				      </ul>
				    
				    </div>
				    <!-- body container -->
				    <div class="card-media-body">
				      <div class="card-media-body-top">
				        <span class="subtle">네바마스커레이드</span>
				        <div class="card-media-body-top-icons u-float-right">
				          <a href="#/" class="card-media-body-supporting-bottom-text card-media-link u-float-right"></a>
				        </div>
				      </div>
				      <span class="card-media-body-heading">이름 : 랑이</span>
				      <div class="card-media-body-supporting-bottom">
				        <span class="card-media-body-supporting-bottom-text subtle"></span>
				        <span class="card-media-body-supporting-bottom-text subtle u-float-right"><span class="text-warning">질병 있음</span></span>
				      </div>
				      <div class="card-media-body-supporting-bottom card-media-body-supporting-bottom-reveal">
				        <span class="card-media-body-supporting-bottom-text subtle"> <span class="text-warning" style="font-weight: bold;">감기 걸림</span></span>
				        <a href="#" class="card-media-body-supporting-bottom-text card-media-link u-float-right"></a>
				      </div>
				    </div>
				  </div>
				  
				</div>
	
					</div>
						
					</div>
					
					<div class="form-group" style="display:flex; flex-direction: column; height:200px; width:100%;">
							<div style="display:flex; flex-direction: column; height:400px; width:70%;">
							위탁 날짜
		                      <input type="text" class="form-control" id="checkInStart" readonly="readonly"
	                        	style="width:100%; align-items:  center;" value="2019.12.22" >
	                        	<label for="checkInStart">체크인 시간</label>
	                        	<input type="time" class="form-control" id="checkInStart" readonly="readonly"
	                        	style="width:100%;">
	                        	<label for="checkInStart">체크아웃 시간</label>
	                        	<input type="time" class="form-control" id="checkOutStart" readonly="readonly"
	                        	style="width:100%;">
	                        	</div>
	                	</div>
	                	
						<div style=" width:80%; height: 450px; padding: 6px; display:flex; flex-direction: column;">
						
	                	<div style="display:flex; flex-direction: column; width:80%;">
	                	<label for="">요청한 서비스</label>
	                	<div class="form-group" style="display:flex; flex-direction: row; border:1px solid silver;
	                		padding: 10px;">
	                      	<div class="services">
	                      	<img style="width:100%; hieght:100%;" src="https://image.flaticon.com/icons/png/512/10/10869.png" />
					         <h5>산책</h5>
					        </div>
					        <div class="services">
	                      	<img style="width:100%; hieght:100%;" src="https://image.flaticon.com/icons/png/512/720/premium/720752.png" />
					         <h5>미용</h5>
					        </div>
					        <div class="services">
	                      	<img style="width:100%; hieght:100%;" src="https://image.flaticon.com/icons/png/512/1152/1152485.png" />
					         <h5>간식 제공</h5>
					        </div>
					        <div class="services">
	                      	<img style="width:100%; hieght:100%;" src="https://image.flaticon.com/icons/png/512/846/846296.png" />
					         <h5>픽업</h5>
					        </div>
					        <div class="services">
	                      	<img style="width:100%; hieght:100%;" src="https://image.flaticon.com/icons/png/512/883/883407.png" />
					         <h5>투약</h5>
					        </div>
	                	</div>
	                	</div>
	                	<div style="width: 30px;">
	                	</div>
						<div class="form-group" style="display:flex; flex-direction: column;">
							세부 요청 사항
							<div style="display:flex; flex-direction: row; height:200px;">
		                      <textarea rows="100" cols="80%" class="form-group"
		                      style="resize:none;" readonly="readonly">아이워너비</textarea>
		              		</div>
	                	</div>
	                	
	                	
	                    </div>
					<div class="form-group" style="display:flex; flex-direction: column; height:500px; width:60%;" align="center">
						<jsp:include page="/WEB-INF/views//user_requested_checklist.jsp"/>
						<!-- 여길 c:if로 하든, 다르게 하던 해야함(지난 정보의 경우) -->
						 <a data-toggle="modal" href="#myModal2" class="btn btn-warning">
	                            체크리스트 수정요청
	                      </a>
					</div>
					
					<div style="width:100%; height:100px; padding-left: 30%; ">
					<!-- 여길 c:if로 하든, 다르게 하던 해야함(지난 정보의 경우) -->
	                        <button type="submit" id="petsitter-submit" class="btn btn-success" value="예약번호">
	                            승낙하기
	                        </button>
	                        <a data-toggle="modal" href="#myModal1" class="btn btn-danger">거절하기</a>
	                       
	                        <a class="btn btn-secondary" href="Petsitter_reservation_request.jsp">
	                            돌아가기
	                        </a>
	                        <br>
	                </div>
			</div>
		</div>		
</div>
<!-- <div><a data-toggle="modal" href="#myModal">쪽지 세부 내용</a></div> -->


<div class="modal fade" id="myModal1" role="dialog">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
			<h4 class="modal-title" style="align:left;">거절 사유</h4>
				<button type="button" class="close" data-dismiss="modal" style="float: right;">x</button>
				
			</div>
			<div class="modal-body">
				<div id="content">
					<div class="form-group">
						<div class="input-group">
							<div class="input-group-addon">받는이</div>
							<input type="text" id="txtCount" class="form-control" readonly="readonly"/>
						</div>
						<br />
						<div class="input-group">
							<div class="input-group-addon">보낸이</div>
							<input type="text" id="txtCheck" class="form-control" readonly="readonly"/>
						</div>
						<br>
						<div class="input-group">
							<div class="input-group-addon">내용 입력</div>
							<textarea rows="5" cols="60" id="txtCheck" class="wrap form-control" style="resize: none;" required="required" placeholder="사유를 입력해 주세요">
							</textarea>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-info" data-dismiss="modal">전송하기</button>
					<button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>
</div>

<div class="modal fade" id="myModal2" role="dialog">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
			<h4 class="modal-title" style="align:left;">체크리스트 수정 요청</h4>
				<button type="button" class="close" data-dismiss="modal" style="float: right;">x</button>
				
			</div>
			<div class="modal-body">
				<div id="content">
					<div class="form-group">
						<div class="input-group">
							<div class="input-group-addon">받는이</div>
							<input type="text" id="txtCount" class="form-control" readonly="readonly"/>
						</div>
						<br />
						<div class="input-group">
							<div class="input-group-addon">보낸이</div>
							<input type="text" id="txtCheck" class="form-control" readonly="readonly"/>
						</div>
						<br>
						<div class="input-group">
							<div class="input-group-addon">내용 입력</div>
							<textarea rows="5" cols="60" id="txtCheck" class="wrap form-control" style="resize: none;" required="required" placeholder="사유를 입력해 주세요">
							</textarea>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-info" data-dismiss="modal">전송하기</button>
					<button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>
</div>
		

<!-- /.container -->
<!-- // 메인 콘텐츠 -->

<!-- Footer -->
<!-- 	<footer class="py-5" style="padding-left: 60px; width:100%; background-color: rgba(108, 201, 251,0.3);">
		<div class="container">
			<p class="m-0 text-center text-white">Copyright &copy; Petriots! 2019</p>
		</div>
		/.container
	</footer> -->
<!-- /Footer -->

</body>
</html>