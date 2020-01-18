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

<title>adminExamTenacitySubmit.jsp</title>
<link rel="stylesheet" href="css_mypage/cards_hyunwoo.css" />
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
<!-- banner -->
<jsp:include page="/WEB-INF/views/banner.jsp"/>
<!-- //banner -->
</header>
<jsp:include page="/WEB-INF/views/adminPageSideMenu.jsp"/>

<!-- 메인 콘텐츠 -->
<div class="container" >

	<div class="row" style="display:flex; flex-direction: row; height: 600px; margin: 20px 0px 0px 120px;">

					<div class="card-header" style="width: 100%; background-color: rgba(108, 201, 251,0.3); margin-top: 10px;">인성 검사 문제 제출</div>
					
					<div class="card-body" style="display:flex; flex-direction: row; width:100%; height:100%; ">
						
						<div style=" width: 100%; height: 100%; padding: 6px;">
						
						<form action="p_q_binsert.action" method="post" role="form">
							
							<div class="form-group">	
	                       	 	<label for="문제">문제</label>
	                        	<input type="text" class="form-control" id="maintext"  name="maintext" placeholder="문제를 입력해 주세요">
	                   		</div>
	                   		
	                    	<div class="form-group">
	                        	<label for="보기1">보기1</label>
	                        	<input type="text" class="form-control" id="chioce1" name="chioce1" placeholder="보기 1번을 입력해주세요">
	                    	</div>
	                    	<div class="form-group">
	                        	<label for="보기2">보기2</label>
	                        	<input type="text" class="form-control" id="chioce2" name="chioce2"  placeholder="보기 2번을 입력해주세요">
	                    	</div>
	                    	<div class="form-group">
	                        	<label for="보기3">보기3</label>
	                        	<input type="text" class="form-control" id="chioce3" name="chioce3"  placeholder="보기 3번을 입력해주세요">
	                    	</div>
	                    	<div class="form-group">
	                        	<label for="보기4">보기4</label>
	                        	<input type="text" class="form-control" id="chioce4" name="chioce4" placeholder="보기 4번을 입력해주세요">
	                    	</div>
	                    	<div class="form-group">
	                        	<label for="보기5">보기5</label>
	                        	<input type="text" class="form-control" id="chioce5"  name="chioce5" placeholder="보기 5번를 입력해주세요">
	                    	</div>
	                    
	                    	<div class="form-group">
	                       	 	<label for="정답">정답</label>
	                        	<input type="text" class="form-control" id="correct"  name="correct" placeholder="정답을 입력해 주세요"
	                        	style="width: 160px;">
	                   		</div>

							
								     <a class="btn btn-secondary" href="http://localhost:8090/Petriots_12_31_1/adminMypage.jsp" style="float:right;">
								         문제제출취소
								     </a>
								     <button type="submit" id="join-submit" class="btn btn-primary" style="float:right;">
								         인성문제제출
								     </button>
								
							</form>
							
						</div>
						
					</div>
										
					</div>
					
	</div>
					
					
					

	
	
	
	
<!-- Footer -->
	<footer class="py-5" style="padding: 100px; width:1896px; background-color: rgba(108, 201, 251,0.3); margin: 150px 120px 10px 10px;">
		<div class="container">
			<p class="m-0 text-center text-white">Copyright &copy; Petriots! 2019</p>
		</div>
		<!-- /.container -->
	</footer>
<!-- /Footer -->

</body>
</html>