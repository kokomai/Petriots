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

<title>Petriots! | 펫시터 전환 약관 동의</title>
<link href="vendor_mypage/bootstrap/css/bootstrap.css" rel="stylesheet">
<link href="css/mainpage.css" rel="stylesheet">
<!-- Bootstrap core JavaScript -->
<script src="vendor_mypage/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  
<style type="text/css">
@import url(https://fonts.googleapis.com/css?family=Raleway:300,700);

</style>

<script type="text/javascript">
	$(function()
{	
		$("#accept-terms1").click(function()
	{	
			
			if($("#accept-terms1").is(":checked"))
			{	
				$(".form-check-label1").html("동의 완료.");
			}
			else
			{
				$(".form-check-label1").html("약관에 동의합니다.");
			}
			
		});
		
		$("#accept-terms2").click(function()
		{	
				
				if($("#accept-terms2").is(":checked"))
				{	
					$(".form-check-label2").html("동의 완료.");
				}
				else
				{
					$(".form-check-label2").html("약관에 동의합니다.");
				}
				
		});
});


</script>

</head>
<body>

<header style="padding-left: 60px;">
<!-- Navigation -->

<jsp:include page="/WEB-INF/views/navigationBar.jsp"/>

<!-- //Navigation -->

</header>
<jsp:include page="/WEB-INF/views/mypageSideMenu.jsp"/>

<!-- 메인 콘텐츠 -->
<div class="container">

	<div class="row" style="display:flex; flex-direction: column;">
		<form action="personalitytest.action" method="post">
		<!-- 위탁 중인 항목.. -->
		<div class="col-lg-12" align="center" style=" background-color:rgba(108, 201, 251,0.3);">
			<div style="height:30px;"><span style="font-size: 15pt; font-weight: bold;">펫시터 지원 약관</span></div>
			<div>
<textarea rows="20" cols="100%" style="resize:none; background-color: white;" readonly="readonly">

Lorem ipsum dolor sit amet, consectetur adipisicing elit. Earum at inventore est sit consequuntur molestias. Dolore in quaerat incidunt quibusdam recusandae numquam libero vitae fugit sapiente officiis quae est nostrum.
Lorem ipsum dolor sit amet, consectetur adipisicing elit. Accusantium deserunt nemo iure sunt laborum molestias rerum. Inventore vel quibusdam dolorum explicabo nihil cum ipsa numquam facere. Laudantium voluptas iste repellendus.
Lorem ipsum dolor sit amet, consectetur adipisicing elit. Accusantium deserunt nemo iure sunt laborum molestias rerum. Inventore vel quibusdam dolorum explicabo nihil cum ipsa numquam facere. Laudantium voluptas iste repellendus.
Lorem ipsum dolor sit amet, consectetur adipisicing elit. Accusantium deserunt nemo iure sunt laborum molestias rerum. Inventore vel quibusdam dolorum explicabo nihil cum ipsa numquam facere. Laudantium voluptas iste repellendus.
Lorem ipsum dolor sit amet, consectetur adipisicing elit. Accusantium deserunt nemo iure sunt laborum molestias rerum. Inventore vel quibusdam dolorum explicabo nihil cum ipsa numquam facere. Laudantium voluptas iste repellendus.
Lorem ipsum dolor sit amet, consectetur adipisicing elit. Accusantium deserunt nemo iure sunt laborum molestias rerum. Inventore vel quibusdam dolorum explicabo nihil cum ipsa numquam facere. Laudantium voluptas iste repellendus.
Lorem ipsum dolor sit amet, consectetur adipisicing elit. Accusantium deserunt nemo iure sunt laborum molestias rerum. Inventore vel quibusdam dolorum explicabo nihil cum ipsa numquam facere. Laudantium voluptas iste repellendus.
Lorem ipsum dolor sit amet, consectetur adipisicing elit. Accusantium deserunt nemo iure sunt laborum molestias rerum. Inventore vel quibusdam dolorum explicabo nihil cum ipsa numquam facere. Laudantium voluptas iste repellendus.
Lorem ipsum dolor sit amet, consectetur adipisicing elit. Accusantium deserunt nemo iure sunt laborum molestias rerum. Inventore vel quibusdam dolorum explicabo nihil cum ipsa numquam facere. Laudantium voluptas iste repellendus.
Lorem ipsum dolor sit amet, consectetur adipisicing elit. Accusantium deserunt nemo iure sunt laborum molestias rerum. Inventore vel quibusdam dolorum explicabo nihil cum ipsa numquam facere. Laudantium voluptas iste repellendus.
Lorem ipsum dolor sit amet, consectetur adipisicing elit. Accusantium deserunt nemo iure sunt laborum molestias rerum. Inventore vel quibusdam dolorum explicabo nihil cum ipsa numquam facere. Laudantium voluptas iste repellendus.
Lorem ipsum dolor sit amet, consectetur adipisicing elit. Accusantium deserunt nemo iure sunt laborum molestias rerum. Inventore vel quibusdam dolorum explicabo nihil cum ipsa numquam facere. Laudantium voluptas iste repellendus.
Lorem ipsum dolor sit amet, consectetur adipisicing elit. Accusantium deserunt nemo iure sunt laborum molestias rerum. Inventore vel quibusdam dolorum explicabo nihil cum ipsa numquam facere. Laudantium voluptas iste repellendus.
Lorem ipsum dolor sit amet, consectetur adipisicing elit. Accusantium deserunt nemo iure sunt laborum molestias rerum. Inventore vel quibusdam dolorum explicabo nihil cum ipsa numquam facere. Laudantium voluptas iste repellendus.
Lorem ipsum dolor sit amet, consectetur adipisicing elit. Accusantium deserunt nemo iure sunt laborum molestias rerum. Inventore vel quibusdam dolorum explicabo nihil cum ipsa numquam facere. Laudantium voluptas iste repellendus.
</textarea>
				<div class="form-check" style="display:flex; flex-direction: row; padding-left: 80%;">
	            <input
	              type="checkbox"
	              id="accept-terms1"
	              class="form-check-input"
	              required
	            />
	            <br>
	            <label for="accept-terms1" class="form-check-label1"
	              style="font-size:11pt;" >약관에 동의합니다.</label>
           		 <br><br>

    			
         		 </div>
         		 <div class="col-lg-12" align="center" >
			<div style="height:30px;"><span style="font-size: 15pt; font-weight: bold;">개인정보 제공 동의 약관</span></div>
			<div >
<textarea rows="20" cols="100%" style="resize:none; background-color: white;" readonly="readonly">

Lorem ipsum dolor sit amet, consectetur adipisicing elit. Earum at inventore est sit consequuntur molestias. Dolore in quaerat incidunt quibusdam recusandae numquam libero vitae fugit sapiente officiis quae est nostrum.
Lorem ipsum dolor sit amet, consectetur adipisicing elit. Accusantium deserunt nemo iure sunt laborum molestias rerum. Inventore vel quibusdam dolorum explicabo nihil cum ipsa numquam facere. Laudantium voluptas iste repellendus.
Lorem ipsum dolor sit amet, consectetur adipisicing elit. Accusantium deserunt nemo iure sunt laborum molestias rerum. Inventore vel quibusdam dolorum explicabo nihil cum ipsa numquam facere. Laudantium voluptas iste repellendus.
Lorem ipsum dolor sit amet, consectetur adipisicing elit. Accusantium deserunt nemo iure sunt laborum molestias rerum. Inventore vel quibusdam dolorum explicabo nihil cum ipsa numquam facere. Laudantium voluptas iste repellendus.
Lorem ipsum dolor sit amet, consectetur adipisicing elit. Accusantium deserunt nemo iure sunt laborum molestias rerum. Inventore vel quibusdam dolorum explicabo nihil cum ipsa numquam facere. Laudantium voluptas iste repellendus.
Lorem ipsum dolor sit amet, consectetur adipisicing elit. Accusantium deserunt nemo iure sunt laborum molestias rerum. Inventore vel quibusdam dolorum explicabo nihil cum ipsa numquam facere. Laudantium voluptas iste repellendus.
Lorem ipsum dolor sit amet, consectetur adipisicing elit. Accusantium deserunt nemo iure sunt laborum molestias rerum. Inventore vel quibusdam dolorum explicabo nihil cum ipsa numquam facere. Laudantium voluptas iste repellendus.
Lorem ipsum dolor sit amet, consectetur adipisicing elit. Accusantium deserunt nemo iure sunt laborum molestias rerum. Inventore vel quibusdam dolorum explicabo nihil cum ipsa numquam facere. Laudantium voluptas iste repellendus.
Lorem ipsum dolor sit amet, consectetur adipisicing elit. Accusantium deserunt nemo iure sunt laborum molestias rerum. Inventore vel quibusdam dolorum explicabo nihil cum ipsa numquam facere. Laudantium voluptas iste repellendus.
Lorem ipsum dolor sit amet, consectetur adipisicing elit. Accusantium deserunt nemo iure sunt laborum molestias rerum. Inventore vel quibusdam dolorum explicabo nihil cum ipsa numquam facere. Laudantium voluptas iste repellendus.
Lorem ipsum dolor sit amet, consectetur adipisicing elit. Accusantium deserunt nemo iure sunt laborum molestias rerum. Inventore vel quibusdam dolorum explicabo nihil cum ipsa numquam facere. Laudantium voluptas iste repellendus.
Lorem ipsum dolor sit amet, consectetur adipisicing elit. Accusantium deserunt nemo iure sunt laborum molestias rerum. Inventore vel quibusdam dolorum explicabo nihil cum ipsa numquam facere. Laudantium voluptas iste repellendus.
Lorem ipsum dolor sit amet, consectetur adipisicing elit. Accusantium deserunt nemo iure sunt laborum molestias rerum. Inventore vel quibusdam dolorum explicabo nihil cum ipsa numquam facere. Laudantium voluptas iste repellendus.
Lorem ipsum dolor sit amet, consectetur adipisicing elit. Accusantium deserunt nemo iure sunt laborum molestias rerum. Inventore vel quibusdam dolorum explicabo nihil cum ipsa numquam facere. Laudantium voluptas iste repellendus.
Lorem ipsum dolor sit amet, consectetur adipisicing elit. Accusantium deserunt nemo iure sunt laborum molestias rerum. Inventore vel quibusdam dolorum explicabo nihil cum ipsa numquam facere. Laudantium voluptas iste repellendus.
</textarea>
				<div class="form-check" style="display:flex; flex-direction: row; padding-left: 80%;">
	            <input
	              type="checkbox"
	              id="accept-terms2"
	              class="form-check-input"
	              required
	            />
	            <br>
	            <label for="accept-terms2" class="form-check-label2"
	              style="font-size:11pt;" >약관에 동의합니다.</label>
           		 <br><br>
    			
         		 </div>
         		 <br />
		          <button
		            type="submit"
		            id="submit"
		            name="submit"
		            class="btn btn-outline-success"
		            style="width:100px;"
		            
		          >
		            다음으로
		          </button>
		          <button
		            type="button"
		            id="cancel"
		            name="cancel"
		            class="btn btn-outline-danger"
		            style="width:100px;"
		            onclick="location.href='/mainpage.action'"
		          >
		            돌아가기
		          </button>
		          <br><br><br>
			</div>
		
		</div>
		<!-- // 위탁 중 항목 -->

				</div>
			</div>
 		</form>
 	</div>
</div>
<!-- /.container -->
<!-- // 메인 콘텐츠 -->

<br>

<!-- Footer -->
<jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>
<!-- /Footer -->

</body>
</html>