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

<title>Petriots! | FAQ</title>
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
body {font-family: helvetica}
.faq_container {width: 320px; margin: 0 auto; overflow: hidden; height: 600px;}
a{text-decoration: none}

#faq-links {padding: 10px 20px}

#faq-links div {
    color: #aeaeaf;
    cursor: pointer;
    font-weight: 700;
    text-transform: capitalize;
    margin: 18px 0
}

.faq-group {
    padding: 0 20px 40px 20px;
    position: relative
}

.faq-group div {
    font-weight: 700;
    text-align: center;
}

.faq-group hr {
        border: 0;
    border-top: 1px solid rgb(108, 201, 251);
    clear: both;
    -moz-box-sizing: content-box;
    -webkit-box-sizing: content-box;
            box-sizing: content-box;
    height: 0;
}

.faq-group:after {
    top: 33%;
	 left: 50%;
	border: solid transparent;
	content: " ";
	height: 0;
	width: 0;
	position: absolute;
	pointer-events: none;
	border-top-color: rgb(108, 201, 251);
	border-width: 15px;
  margin-left: -15px
}

.faq-accordion>li  {
    border-top: 1px solid rgba(198, 198, 198, 0.4);
    color: #666;
    padding: 1.125em 0
}

.faq-accordion li a {
    color: rgb(108, 201, 251);
    padding: 1.125em;
}

.faq-accordion > li:last-child {
    border-bottom: 1px solid rgb(108, 201, 251);
}

.faq-accordion > li > a:before {
    content: 'Q.';
    padding-right: 0.313em
}

.faq-accordion > li > a:after {
    color: rgb(108, 201, 251);
    content: '+';
    float: right;
    font-weight:300;
    margin-right: 1.25em;
    -webkit-transform: scale(2);
    -ms-transform: scale(2);
            transform: scale(2);
    overflow-y: hidden;
}

.faq-accordion > li > a.expanded:after {
    color:  rgb(108, 201, 251);
    content: '\2212';
    -webkit-transform: scale(2);
    -ms-transform: scale(2);
            transform: scale(2);
}

.faq-accordion > li > a.expanded {font-weight: 700; opacity: 1 !important}

.faq-content {
    background-color: #ececec;
    margin: 20px 0 -20px;
}

.faq-content p:before {
    content: 'A.';
    color: rgb(108, 201, 251);
    float: left;
    font-weight: 700;
  margin-right: .5em
}

.faq-content p {
    margin: 0 1.2em;
    padding: 1.250em 0

}

.faq-hide {display: none}

.faq-selected {
    color: rgb(108, 201, 251)!important;
 -webkit-transition: all 1s ease;
         transition: all 1s ease;
}


.slide-left{

	-webkit-animation-name: slide-left;	
  -moz-animation-name: slide-left;	
  	animation-name: slide-left;

	
	-webkit-animation-duration: 1s;
  -moz-animation-duration: 1s;
  animation-duration: 1s;	

		
	-webkit-animation-timing-function: ease-in-out;	
  -moz-animation-timing-function: ease-in-out;
  animation-timing-function: ease-in-out;

}



@-webkit-keyframes slide-left {
	0% {
		-webkit-transform: translateX(150%);
	}
	50%{
		-webkit-transform: translateX(-8%);
	}
	65%{
		-webkit-transform: translateX(4%);
	}
	80%{
		-webkit-transform: translateX(-4%);
	}
	95%{
		-webkit-transform: translateX(2%);
	}			
	100% {
		-webkit-transform: translateX(0%);
	}
}

@-moz-keyframes slide-left {
	0% {
		-webkit-transform: translateX(150%);
    -moz-transform: translateX(150%);
		        transform: translateX(150%);
	}
	50%{
		-webkit-transform: translateX(-8%);
    -moz-transform: translateX(-8%);
		        transform: translateX(-8%);
	}
	65%{
		-webkit-transform: translateX(4%);
    -moz-transform: translateX(4%);
		        transform: translateX(4%);
	}
	80%{
		-webkit-transform: translateX(-4%);
    -moz-transform: translateX(-4%);
		        transform: translateX(-4%);
	}
	95%{
		-webkit-transform: translateX(2%);
    -moz-transform: translateX(2%);
		        transform: translateX(2%);
	}			
	100% {
		-webkit-transform: translateX(0%);
    -moz-transform: translateX(0%);
		        transform: translateX(0%);
	}
}
@keyframes slide-left {
	0% {
		-webkit-transform: translateX(150%);
    -moz-transform: translateX(150%);
		        transform: translateX(150%);
	}
	50%{
		-webkit-transform: translateX(-8%);
    -moz-transform: translateX(-8%);
		        transform: translateX(-8%);
	}
	65%{
		-webkit-transform: translateX(4%);
    -moz-transform: translateX(4%);
		        transform: translateX(4%);
	}
	80%{
		-webkit-transform: translateX(-4%);
    -moz-transform: translateX(-4%);
		        transform: translateX(-4%);
	}
	95%{
		-webkit-transform: translateX(2%);
    -moz-transform: translateX(2%);
		        transform: translateX(2%);
	}			
	100% {
		-webkit-transform: translateX(0%);
    -moz-transform: translateX(0%);
		        transform: translateX(0%);
	}
}

.faq_name
{
	color: rgb(108, 201, 251);
}
</style>

<script type="text/javascript">
	$(function()
	{
		$(".user_modify").click(function()
		{
			$("#user_form").submit();
		});
		
		$(".pet_modify").click(function()
				{
					$("#pet_form").submit();
				});
		
		/*<p>Pagination part? borrowed from <a href='/JoshBlackwood/'>Joshua Blackwood</a>'s Pen <a href='/JoshBlackwood/pen/yoLBJ/'>yoLBJ</a>.</p>*/

		var accordWithPage =  function() {
		  
		 var faqDiv = $('#faq-links div');
		  

		$(function () {
		  
		faqDiv.on("click", function() {
		    
		  var hideSec = 'faq-hide';  
		      var $this = $(this),
		      $id = $this.attr('id'),
		      $class = '.' + $('.about-' + $id).attr('class').replace(hideSec, '');

		  $('#faq-wrapper').addClass(hideSec);
		  $('.about-' + $id).removeClass(hideSec);
		  $('div[class*=about]').not($class).addClass(hideSec);
		     
		 });

		});

		$(function () {
		  
		        var select = 'faq-selected';      
		  
		        faqDiv.click(function () {

		        if ($(this).hasClass(select)) {
		            $(this).removeClass(select);
		        } else {
		            $('#faq-links .faq-selected').removeClass(select);
		            $(this).addClass(select);             
		        }
		    }); //faq link selected
		});

		  
		  
		//Accordion
		  
		$(function () {
		  
		  var expand = 'expanded';
		  var content = $('.faq-content');
		        //FAQ Accordion
		        $('.faq-accordion > li > a').click(function (e) {
		        		e.preventDefault();
		        if ($(this).hasClass(expand)) {
		            $(this).removeClass(expand);
//		          $('.faq-accordion > li > a > div').not(this).css('opacity', '1');//returns li back to normal state
		            $(this).parent().children('ul').stop(true, true).slideUp();
		        } else {
//		            $('.faq-accordion > li > a > div').not(this).css('opacity', '0.5');//dims inactive li
		            $('.faq-accordion > li > a.expanded').removeClass(expand);
		            $(this).addClass(expand);
		            content.filter(":visible").slideUp();
		            $(this).parent().children('ul').stop(true, true).slideDown();
		        }
		    }); //accordion function

		    content.hide();

		}); 
		  
		}

		accordWithPage();

		/*$(function () {
		   $("#faq-links div").click(function () {
		    $('.slide-left').fadeOut( "slow", "linear" );
		     $('.slide-left').fadeIn( "slow", "linear" );
		    }); //faq link fade in and out
		  }); //document ready*/
		
	});
	

</script>

</head>
<body>

<header style="padding-left: 60px;">
<!-- Navigation -->
<jsp:include page="/WEB-INF/views/navigationBar.jsp"/>


</header>
<jsp:include page="/WEB-INF/views/mypageSideMenu.jsp"/>

<!-- 메인 콘텐츠 -->
<div class="faq_container" style="width: 60%; height:800px;">
<div class="card-header" style="width: 100%; background-color: rgba(108, 201, 251,0.3)">F A Q</div>
<div id="faq-links">
    <div id="service" class="faq-selected">계정</div>
    <div id="installation">결제</div>
    <div id="plan">신고</div>
    <div id="features">펫시팅</div>
</div>



<div id="faq-wrapper" class="about-service">

<div class="faq-group" >
        <div class="slide-left">
            <div class="faq_name">계정</div>
        </div>
    <hr>
</div><!--faq-group-->
<div class="slide-left">
              <div  class="faq">
                 <ul class="faq-accordion">

                    <li>
                        <a href="#">개인정보는 어디에 쓰이나요?</a>
                        <ul class="faq-content">
                            <li>
                                <div><p>개인정보는 아주 잘 쓰입니다.</p></div>
                            </li>
                        </ul>
                    </li>
                    <!--Bacon ipsum-->

                    <li>
                        <a href="#">계정탈퇴하고싶어요</a>
                        <ul class="faq-content">
                            <li>
                                <div><p>탈퇴하시면 된답니다^^.</p></div>
                            </li>
                        </ul>
                    </li>
                    <!--Beer ipsum-->

                    <li>
                        <a href="#">계정이 해킹당했어요!</a>
                        <ul class="faq-content">
                            <li>
                                <div><p>간첩 신고는 111.</p></div>
                            </li>
                        </ul>
                    </li>
                    <!--Carey ipsum-->
                    </ul>
            </div>
</div>
</div>






        <div class="about-installation faq-hide">

<div class="faq-group">
        <div class="slide-left">
            <div class="faq_name">결제</div>
        </div>
    <hr>
</div>
                 
          <div class="slide-left">     
                 <ul class="faq-accordion">

                    <li>
                        <a href="#">결제는 어떻게 이루어지나요?</a>
                        <ul class="faq-content">
                            <li>
                                <div><p>펫시터와 만나서 하시면 됩니다. 결제에 관해서 저희 페트리어츠는 관여하지 않으며, 금전을 요구하지도 않습니다.</p></div>
                            </li>
                        </ul>
                    </li>
                    <!--Bacon ipsum-->

                    <li>
                        <a href="#">추가금은 어떻게 결제하나요?</a>
                        <ul class="faq-content">
                            <li>
                                <div><p>추가금 역시 개인간의 거래로 이루어집니다 펫시터/위탁자와 상의해주세요.</p></div>
                            </li>
                        </ul>
                    </li>
                    <!--Beer ipsum-->

   
                    </ul>
                    
                </div><!--lide-left --> 
        </div>


        <div  class="about-plan faq-hide">

<div class="faq-group">
    <div class="slide-left">
    <div class="faq_name">신고</div>
    </div>
    <hr>
</div>
            <div class="slide-left">
                 <ul class="faq-accordion">

                    <li>
                        <a href="#">신고당했어요! 어떻게 해야 하죠?</a>
                        <ul class="faq-content">
                            <li>
                                <div><p>이런, 신고를 당하셨군요.</p></div>
                            </li>
                        </ul>
                    </li>
                    <!--Bacon ipsum-->

                    <li>
                        <a href="#">신고하는 방법</a>
                        <ul class="faq-content">
                            <li>
                                <div><p>각각 유저의 아이디를 클릭하시면 신고하기 버튼이 있습니다. 사유와 사항을 적으시고 제출해주세요.</p></div>
                            </li>
                        </ul>
                    </li>
                    <!--Beer ipsum-->
                    </ul>
                </div><!--slide-left-->
        </div>

        <div class="about-features faq-hide">

<div class="faq-group">
    <div class="slide-left">
    <div class="faq_name">펫시팅</div>
    </div>
    <hr>
</div>
            <div class="slide-left">
                 <ul class="faq-accordion">

                    <li>
                        <a href="#">펫시터가 되는법</a>
                        <ul class="faq-content">
                            <li>
                                <div><p>인성검사와 지식검사를 통과하시면 펫시터가 될 수 있습니다. 각각20문제로서 특정 점수를 넘어야 가능합니다.
                              	인성검사를 먼저 시행하신 다음에 지식검사를 시행하실 수 있습니다.</p></div>
                            </li>
                        </ul>
                    </li>
                    <!--Bacon ipsum-->

                    <li>
                        <a href="#">펫시터는 누구나 가능 한가요?</a>
                        <ul class="faq-content">
                            <li>
                                <div><p>반려동물에 대한 애정과 페트리어츠 아이디만 있으면 누구든 가능합니다.</p></div>
                            </li>
                        </ul>
                    </li>
                    <!--Beer ipsum-->
                   
                    </ul>
                </div><!--slide-left-->
        </div> <!--about-features faq-hide-->


         <div  class="about-mobile faq-hide">

<!-- <div class="faq-group">
        <div class="slide-left">
            <div class="faq_name">mobile</div>
        </div>
    <hr>
</div>
            <div class="slide-left">
                 <ul class="faq-accordion">

                    <li>
                        <a href="#">Bacon ipsum</a>
                        <ul class="faq-content">
                            <li>
                                <div><p>Bacon ipsum dolor sit amet ham beef ribs pork, sirloin tail meatball filet mignon pancetta strip steak. T-bone swine turducken fatback beef ribs andouille meatball. Corned beef short ribs ribeye, hamburger brisket venison capicola boudin filet mignon drumstick shankle bacon beef. Shoulder shank filet mignon, kevin meatball beef ribs short loin shankle kielbasa jowl pancetta. Biltong shank tri-tip prosciutto sirloin pastrami. Turkey swine pork loin ground round pig chicken kielbasa sausage kevin ham hock.</p></div>
                            </li>
                        </ul>
                    </li>
                    Bacon ipsum

                    <li>
                        <a href="#">Beer Ipsum</a>
                        <ul class="faq-content">
                            <li>
                                <div><p>ester saccharification mead lambic draft (draught), hand pump cask. brewing ale balthazar hops, " bitter becher craft beer keg alpha acid." crystal malt racking mouthfeel mash, barrel ale; malt! brewpub; biere de garde balthazar acid rest alcohol carbonation. wit beer krug brew mash hop back? shelf life, balthazar hand pump.</p></div>
                            </li>
                        </ul>
                    </li>
                    Beer ipsum

                    <li>
                        <a href="#">Carey ipsum</a>
                        <ul class="faq-content">
                            <li>
                                <div><p>Alrighty then it's because i'm green isn't it! here she comes to wreck the day. alrighty then kinda hot in these rhinos. i just heard about evans new position,good luck to you evan backstabber, bastard, i mean baxter. your entrance was good, his was better. we're going for a ride on the information super highway. we're going for a ride on the information super highway. look at that, it's exactly three seconds before i honk your nose and pull your underwear over your head. brain freeze. we got no food we got no money and our pets heads are falling off! haaaaaaarry.</p></div>
                            </li>
                        </ul>
                    </li>
                    Carey ipsum
                    </ul>
                </div>slide-left -->
        </div> 
        
        <div class="icons"><button type="button" class="btn-my ask btn" style=" font-size: 15pt; font-weight: bold; width:100%;" onclick="location.href='mypageqform.action'">문의하기
	    		<p style="color:rgb(108, 201, 251); font-size: 15pt; font-weight: bold;">(클릭시 이동)</p></button></div>
     </div><!--faq_container-->



<!-- Footer -->
<jsp:include page="footer.jsp"></jsp:include>
<!-- /Footer -->

</body>
</html>