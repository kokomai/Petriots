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

<title>Petriots! | 펫시터 프로필 추가</title>
<link rel="stylesheet" href="css/cards_hyunwoo.css" />
<link href="vendor_mypage/bootstrap/css/bootstrap.css" rel="stylesheet">
<link rel="stylesheet" href="//code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" />
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="//code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<link href="css/mainpage.css" rel="stylesheet">
<!-- Bootstrap core JavaScript -->
<script src="vendor_mypage/jquery/jquery.min.js"></script>
<script src="vendor_mypage/bootstrap/js/bootstrap.bundle.min.js"></script>


<style type="text/css">
@import url(https://fonts.googleapis.com/css?family=Raleway:300,700);

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
<div class="container">

	<div class="row" style="display:flex; flex-direction: row; height: 1000px;">
		<form action="pesitter_modify_ok.jsp" method="post" id="petsitterJoinForm">
					<div class="card-header" style="width: 80%; height:50px; background-color: rgba(108, 201, 251,0.3)">펫시터 프로필 입력</div>
					
					<div class="card-body" style="display:flex; flex-direction: row; width:80%; height:400px; ">
						<div style=" width:100%; height: 500px;   padding: 2px;display: flex; flex-direction: column; ">
						<!-- 	<img class="card-img-top img-fluid" style="border-radius:40%; width:90%; height : 230px;
									margin: 0 auto; display:block; "
									src="https://t1.daumcdn.net/news/201801/29/segye/20180129150015458rnog.jpg"
									onclick=""> -->
							<jsp:include page="/WEB-INF/views/multiple_image.jsp"></jsp:include>
						</div>
						
					</div>
					<div style=" width:60%;  padding: 6px; display: flex; flex-direction: column; ">
								<label for="imgUpload" style="text-align: center; border: 1px solid gray;" >이미지 업로드</label>
								<input type="file" style=" width:100%; margin:0 auto; diplay:block;" hidden="hidden" id="imgUpload">
							</div>
					<div style=" width:100%; height: 500px;   padding: 6px;">
					
							<label for="checkin_start">표준 체크인 시간</label>
							<div class="form-group" style=" display:flex; flex-direction: row;">
	                        	<input type="time" class="form-control" id="checkin_start" placeholder="시간 선택"
	                        	style="width:30%;">
	                        	부터
	                        	<input type="time" class="form-control" id="checkin_end" placeholder="시간 선택"
	                        	style="width:30%;">
	                        	까지
	                   		</div>
	                   		<label for="checkout_start">표준 체크아웃 시간</label>
	                    	<div class="form-group" style=" display:flex; flex-direction: row;">
	                        	<input type="time" class="form-control" id="checkout_start" placeholder="시간 선택"
	                        	style="width:30%;">
	                        	부터
	                        	<input type="time" class="form-control" id="checkout_end" placeholder="시간 선택"
	                        	style="width:30%;">
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
	                        	<input type="text" id="max_sitable" name="max_sitable" style="width: 40%;">
	                        	<input type="text" class="form-control" id="price" placeholder="가격"
	                        	style="width:30%;">원
	                   		</div>
                                    		
						<div class="form-group" style="display:flex; flex-direction: column;">
							이력 사항
							<div style="display:flex; flex-direction: row; height:200px;">
		                      <textarea rows="100" cols="60%" class="form-group"
		                      style="resize:none;"id="records"></textarea>
		                      
		              		</div>
	                	</div>
						<div class="form-group" style="display:flex; flex-direction: column;">
	                        	<label for="introduce">소개</label>
		                    <div style="display:flex; flex-direction: row; height:200px;">
		                      <textarea rows="100" cols="60%" class="form-group"
		                      style="resize:none;" id="introduce"></textarea>
		              		</div>
	                	</div>
	                	
	                	<label for="">환경 선택</label>
	                	<div class="form-group" style="display:flex; flex-direction: column; border:1px solid silver; width:50%;">
	                      	<jsp:include page="/WEB-INF/views/environmentCheckbox.jsp"></jsp:include>
	                	</div>
	                	
	                	<label for="">가능 서비스 선택</label>
	                	<div class="form-group" style="display:flex; flex-direction: column; border:1px solid silver; width:80%;">
	                      	<jsp:include page="/WEB-INF/views/serviceCheckbox.jsp"></jsp:include>
	                	</div>
	                	
	                	<label for="b_type_num">건물 유형 선택</label>
	                	<div class="form-group" style=" display:flex; flex-direction: row;">
	                        	<select name="b_type_num" style="width: 40%;">
	                        		<option value="1">아파트</option>
	                        		<option value="2">다세대주택</option>
	                        		<option value="3">단독주택</option>
	                        	</select>
	                   		</div>
	                	
	                	<div style="width:100%; height:100px; padding-left: 60%; ">
							<button type="submit" id="petsitter-submit" class="btn btn-primary" onclick="location.href='petsitterprofileinsert.action'">
	                            입력하기
	                        </button>
	                        <a class="btn btn-secondary" href="Petsitter_main.jsp">
	                            취소하기
	                        </a>
	                        <br>
	                    </div>
					</div>
			</form>		
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