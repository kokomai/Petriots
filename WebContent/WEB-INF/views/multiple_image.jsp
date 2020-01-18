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
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script> -->
<style type="text/css">

.image-gallery {
  position:relative;
  width:100%;
  min-width:60%;
  max-width: 60%;
  border:1px solid rgba(108, 201, 251,0.3);
  border-radius:1%;
  padding:0.88%;
  background: #ffffff;
  box-sizing:border-box;
  display :inline-block;
  margin-right:50px;
  height:55%;
}

.current {
  width:100%;
  max-height:100%;
  max-width:100%;
  margin:0%;
  display:block;
  border-radius:inherit;
  border:0px solid #E87461;
 }

.thumbnail {
  width:calc(70%/4);
  max-height:100px;
  max-width:200px;
  display:inline-block;
  margin-top:12px;
  margin-right:1%;
  cursor:pointer;  
   }

.thumbnail:last-child {
  margin-right:0;
}

@keyframes fadeIn {
  to {
    opacity:1;
  }
}

.fade-in {
  opacity: 0;
  animation: fadeIn 0.4s ease-in 1 forwards;
}
</style>

<script type="text/javascript">

   $(function()
   {

      var galerias = document.querySelectorAll('div.image-gallery');

      for (var i = 0; i < galerias.length; i++){
        var Idgaleria = galerias[i].id;
        galerias[i].addEventListener('mouseover', golive(Idgaleria));
      };

      function golive(Idgaleria){
        
      var current = document.querySelector('div#'+Idgaleria+' .current');
      var thumbnails = document.querySelectorAll('div#'+Idgaleria+' .thumbnail');

      thumbnails[0].style.opacity = 0.6;

      for (let i = 0; i < thumbnails.length; i++){
        thumbnails[i].addEventListener('click', show);
      };

      function show() {
        thumbnails.forEach(function (img){
          img.style.opacity = 1;
        })
        let imgSource = this.getAttribute('src');
        current.setAttribute('src', imgSource);
        current.classList.add('fade-in');
        this.style.opacity = 0.6;
        setTimeout (function (){
          current.classList.remove('fade-in');
        },500);
      }
      }

   });


</script>

</head>
<body>
<!-- https://codepen.io/thmdeveloper/pen/xvymZb -->

<div class="image-gallery" id="galeria">
  
  <img src="https://media.earlyexperts.net/wp-content/uploads/2018/07/how-to-level-a-yard.jpg" alt="" class="current">
  
  <div class="thumbnailsContainer" >
  <img src="${dto.pst_img1 }" alt="" class="thumbnail">
  </div>
  

</div>
 
</body>
</html>