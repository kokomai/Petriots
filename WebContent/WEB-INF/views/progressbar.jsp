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
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link href="vendor_mypage/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<style type="text/css">


</style>

<script type="text/javascript">

	$(function()
	{
		!function ($) {

		    "use strict";

		    // PROGRESSBAR CLASS DEFINITION
		    // ============================

		    var Progressbar = function (element) {
		        this.$element = $(element);
		    }

		    Progressbar.prototype.update = function (value) {
		        var $div = this.$element.find('div');
		        var $span = $div.find('span');
		        $div.attr('aria-valuenow', value);
		        $div.css('width', value + '%');
		        $span.text(value + '% Complete');
		    }

		    Progressbar.prototype.finish = function () {
		        this.update(100);
		    }

		    Progressbar.prototype.reset = function () {
		        this.update(0);
		    }

		    // PROGRESSBAR PLUGIN DEFINITION
		    // =============================

		    $.fn.progressbar = function (option) {
		        return this.each(function () {
		            var $this = $(this),
		                data = $this.data('jbl.progressbar');

		            if (!data) $this.data('jbl.progressbar', (data = new Progressbar(this)));
		            if (typeof option == 'string') data[option]();
		            if (typeof option == 'number') data.update(option);
		        })
		    };

		    // PROGRESSBAR DATA-API
		    // ====================

		    $(document).on('click', '[data-toggle="progressbar"]', function (e) {
		        var $this = $(this);
		        var $target = $($this.data('target'));
		        var value = $this.data('value');

		        e.preventDefault();

		        $target.progressbar(value);
		    });

		}(window.jQuery);
	});

</script>


</head>
<body>

    <div class="container" style="width:50%;">
        <h5>체크리스트 진행도</h5>

  <!--       <p>
            <button data-toggle="progressbar" data-target="#myProgressbar" data-value="reset" data-level="info" class="btn btn-default">Reset</button>
            <button data-toggle="progressbar" data-target="#myProgressbar" data-value="0" class="btn btn-default">0%</button>
            <button data-toggle="progressbar" data-target="#myProgressbar" data-value="10" class="btn btn-default">10%</button>
            <button data-toggle="progressbar" data-target="#myProgressbar" data-value="30" class="btn btn-default">30%</button>
            <button data-toggle="progressbar" data-target="#myProgressbar" data-value="75" class="btn btn-default">75%</button>
            <button data-toggle="progressbar" data-target="#myProgressbar" data-value="100" class="btn btn-default">100%</button>
            <button data-toggle="progressbar" data-target="#myProgressbar" data-value="finish" data-level="success" class="btn btn-default">Finish</button>
        </p> -->

        <div id="myProgressbar" class="progress">
          <div class="progress-bar" role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100" >
            <span style="font-size: 15px;"></span>
          </div>
        </div>
    </div>


</body>
</html>