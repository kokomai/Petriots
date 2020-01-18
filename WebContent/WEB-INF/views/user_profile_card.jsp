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
 <link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css">

<link href='https://fonts.googleapis.com/css?family=Lato:400,300' rel='stylesheet' type='text/css'>

<style type="text/css">
@import url(https://fonts.googleapis.com/css?family=Open+Sans:400,700);

.card {
  margin: 0 auto;
  width: 350px;
  height: 400px;
  position: relative;
  box-shadow: 0 10px 20px rgba(0, 0, 0, 0.22), 0 14px 56px rgba(0, 0, 0, 0.25);
}
.card__header {
  width: 100%;
  height: 233px;
  background-image: url("https://t1.daumcdn.net/liveboard/holapet/529ffebe11304d50999a4319dacf3ee0.jpg");
}
.card__image {
  width: 125px;
  height: 125px;
  margin-left: -62.5px;
  position: absolute;
  left: 50%;
  top: 150px;
  border-radius: 50%;
  border: 1px solid #fff;
}
.card__image:hover {
 /*  box-shadow: 0 10px 20px rgba(0, 0, 0, 0.22), 0 14px 56px rgba(0, 0, 0, 0.25); */
}
.card__image-geoff {
  background-image: url("https://t1.daumcdn.net/news/201809/13/seouleconomy/20180913155006402emzy.png");
  background-size: 100% 100%;
  cursor: pointer;
  z-index: 10;
/*   -webkit-filter: grayscale(100%);
  filter: grayscale(100%); */
  -webkit-transition: all 0.2s ease-in-out;
  -moz-transition: all 0.2s ease-in-out;
  transition: all 0.2s ease-in-out;
}
.card__image-geoff:hover {
  -webkit-filter: grayscale(0%);
  filter: grayscale(0%);
}
.card__info {
  width: 350px;
  height: 167px;
  background-color: rgba(108, 201, 251,0.3);
}
.card__info__section-3 {
  float: left;
  display: block;
  width: 34.11922%;
  height: 100%;
  position: relative;
}
.card__info__section-3:last-child {
  width: 31.76157%;
}

.card__info__section-3:nth-child(-n+3) .details-bottom {
  border-right: 1px solid #fff;
}

.details-bottom {
  position: absolute;
  bottom: 0;
  width: 100%;
  border-top: 1px solid white;
  background-color: rgba(108, 201, 251,0.3);
  cursor: pointer;
  -webkit-transition: background-color, 0.5s, ease-in-out;
  -moz-transition: background-color, 0.5s, ease-in-out;
  transition: background-color, 0.5s, ease-in-out;
}
.details-bottom:hover {
  -webkit-transition: background-color, 0.5s, ease-in-out;
  -moz-transition: background-color, 0.5s, ease-in-out;
  transition: background-color, 0.5s, ease-in-out;
  background-color: #fff;
  color: #6cc9fb;
  
}
.details__number {
  display: block;
  text-align: center;
  font-size: 1.5em;
  line-height: 1em;
  padding-top: 5px;
  font-weight: 900;
}
.details__text {
  display: block;
  text-align: center;
  font-size: .8em;
  padding-bottom: 6px;
}
.details__text-header {
  display: block;
  text-align: center;
  width: 100%;
  font-size: 1.8em;
  padding-top: 40px;
  position: absolute;
}
.details__text-subheader {
  display: block;
  text-align: center;
  width: 100%;
  font-size: .8em;
  padding-top: 80px;
  position: absolute;
}


</style>


</head>
<body>


<div class="wrapper">
  <div class="card">
    <div class="card__header"></div>
    <div class="card__image card__image-geoff"></div>
    <div class="card__info">
      <div class="details">
        <span class="details__text-header">Geoff Storbeck</span>
        <span class="details__text-subheader">Front-End Web Developer</span>
      </div>
      <div class="card__info__section-3">
        <div class="details-bottom">
          <span class="details__number">25k</span>
          <span class="details__text">followers</span>
        </div>
      </div>
      <div class="card__info__section-3">
        <div class="details-bottom">
          <span class="details__number">3</span>
          <span class="details__text">following</span>
        </div>
      </div>
      <div class="card__info__section-3">
        <div class="details-bottom">
          <span class="details__number">16k</span>
          <span class="details__text">tweets</span>
        </div>
      </div>
    </div>
  </div>
</div>
 
</body>

</html>