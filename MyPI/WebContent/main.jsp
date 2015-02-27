<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Team Chaser</title>
<meta name="description" content="" />
<meta name="keywords" content="" />
<!-- CSS -->
<!--[if lte IE 8]><script src="css/ie/html5shiv.js"></script><![endif]-->
<link rel="stylesheet" href="css/jquery-ui.css" type="text/css" />
<link rel="stylesheet" href="css/main.css" />
<link rel="stylesheet" href="css/component.css" type="text/css" />
<!-- JavaScript -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
<script src="js/jquery.min.js"></script>
<script src="js/jquery-ui.min.js"></script>
<script src="js/jquery.poptrox.min.js"></script>
<script src="js/skel.min.js"></script>
<script src="js/init.js"></script>
<script src="js/search.js"></script>
<script src="js/effecter/modernizr.custom.js"></script>
<script src="js/modal_content.js"></script>
<noscript>
	<link rel="stylesheet" href="css/skel-noscript.css" />
	<link rel="stylesheet" href="css/style.css" />
</noscript>
<!--[if lte IE 8]><link rel="stylesheet" href="css/ie/v8.css" /><![endif]-->
</head>
<body style="overflow-x:hidden;">
	<%
		if (request.getSession().getAttribute("memEmail") == null) {
	%>
	<script>
		alert("로그인을 하셔야 합니다.");
		location.replace("index.jsp");
	</script>
	<%
		} else {
	%>
	<!-- Header -->
	<jsp:include page="/common/header.jsp" />
	<!-- effecter1_start -->
	<div class="md-modal md-effect-12" id="question" style="top:55%">
		<div class="md-content">
			<img src="./images/ihfb/help.png" id="help" style="width:100%;">
			<button id="closeHelp" class="button addButton font_GODOM md-close">Close me!</button>
		</div>
	</div>
	<!-- effecter1_end -->

	<!-- Intro -->
	<section id="intro" class="main style1 dark fullscreen introForm">
		<div class="content container">
			<div style="width: 600px; margin: auto; background: rgba(77,155,183,0.5);">
				<div class="plue contentMain font_GODOM">
					MyPI에 오신것을 환영합니다.
				</div>
				<hr style="margin: 0 8%; border: 2px solid white;">
				<div class="contentMain font_GODOM"
					style="float: left; width:65%; padding: 5% 0 5% 8%; font-size: 170%; color: white; line-height: 50px;">
						검색 버튼을 눌러<br/>MyPI를 시작하세요!
				</div>	
				<div class="" style="float: left; width: 35%; padding: 2% 8% 2% 3%;">
					<img src="./images/ihfb/icons/search.png" style="width:95%;">
				</div>
				<hr style="margin: 0 8%; border: 2px solid white;">
				<div style="clear: both; font-size: 120%" class="plue contentMain font_GODOM">
					웹에 노출된 자신의 정보를 정리하세요.<br/> MyPI는 개인정보 보호를 위해<br/>최적화된 알고리즘을 제공합니다. 
				</div>
			</div>
		</div>
	</section>
	<div id="questionBar">
		<img id="question_button" class="ui-button md-trigger"
			data-modal="question" style="display: inline;"
			src="./images/ihfb/icons/modal.png">
	</div>
	<div class="md-overlay" style="background: rgba(0, 0, 0, 0.7);"></div>

	<!-- Loading -->
	<section id="work" class="main style2 fullscreen" style="display: none">
		<div id="loadingContainer">
			<div id="loadingLogo">
				<img src="images/ihfb/main_logo/pi_130x44.png">
			</div>
			<div id="progressbar"
				class="ui-progressbar ui-widget ui-widget-content ui-corner-all">
				<div class="ui-progressbar-value ui-widget-header ui-corner-left"
					style="display: none"></div>
			</div>
			<div class="ui-progress-label">Loading...</div>
		</div>

	</section>

	<!-- Result -->
	<section id="contact" style="display: none; margin-bottom: 0;line-height: 3em;">
		<div id="result" class="content"></div>
	</section>

	<!-- Footer -->
	<jsp:include page="/common/footer.jsp" />
	<%
		}
	%>
</body>
</html>
