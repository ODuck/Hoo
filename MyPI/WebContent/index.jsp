<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
<title>Team Chaser</title>

<meta name="description" content="" />
<meta name="keywords" content="" />
<!--[if lte IE 8]><script src="css/ie/html5shiv.js"></script><![endif]-->
<script
	src="https://ajax.googleapis.codm/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
<script src="js/jquery.min.js"></script>
<script src="js/jquery.poptrox.min.js"></script>
<script src="js/skel.min.js"></script>
<script src="js/init.js"></script>
<link rel="stylesheet" href="css/index.css" />
<noscript>
	<link rel="stylesheet" href="css/skel-noscript.css" />
	<link rel="stylesheet" href="css/style.css" />
</noscript>
<!-- effecter_start -->
<link rel="stylesheet" type="text/css" href="css/component.css" />
<script src="js/effecter/modernizr.custom.js"></script>
<!-- effecter_end -->
<style type="text/css" media="screen">
/*index Page button remove*/
.navbar .btn.btn-navbar {
	display: none;
}
</style>
<!--[if lte IE 8]><link rel="stylesheet" href="css/ie/v8.css" /><![endif]-->
</head>
<body style="overflow-x:hidden;">
	<%
		if (session.getAttribute("memEmail") != null) {
	%>
	<script type="text/javascript">
		alert("이미 로그인 되어있습니다..");
		location.replace("main.jsp");
	</script>
	<%
		}
	%>
	<!-- Header -->
	<jsp:include page="/common/header.jsp" />

	<!--  Login -->
	<section id="login" class="main style4 primary loginForm">
		<div class="content container">
			<div class="box container small form_background" style="margin-bottom: 12em;">

				<!-- 
					<table>
						<tr>
							<td rowspan="3" class="login_img"><img class="Mypi"
								src="images/fulls/02.jpg"></td>
							<td colspan="3" class="login_session"><input type="text"
								id="fid" name="fid" class="color font_GODOM" placeholder="이메일" />
								<input type="password" id="fpass" name="fpass"
								class="color font_GODOM" placeholder="비밀번호" /></td>
							<td><input type="submit" class="button addButton font_GODOM"
								id="login_button" value=" 로그인  " /></td>
						</tr>
						<tr>
							<td colspan="4"><p class="font_GODOM login_text">MyPI가
									처음이신가요?</p> <input type="button"
								class="button addButton font_GODOM" id="signup_button"
								value=" 회원 가입 " onclick="location.href='signup.jsp' " /></td>
						</tr>
						<tr>
							<td colspan="4" style="padding-bottom: 4%;"><p
									class="font_GODOM login_text">비밀번호를 잊으셨나요?</p> <input
								type="button" class="button addButton font_GODOM"
								id="findinfo_button" value=" 비밀번호 찾기  "
								onclick="location.href='main.jsp' " /></td>
						</tr>
					</table>
				-->
				<div style="width: 600px; margin: auto; background: rgba(255, 255, 255, 0.6);">
					<div class="login_img">
						<img class="Mypi" src="./images/ihfb/main_logo/pi_200x66.png">
					</div>
					<hr style="margin: 0 8%; border: 2px solid #0c4881;">
					<div style="width: 100%;">
						<div class="font_GODOM"
							style="width: 50%; float: left; padding: 8% 3% 8% 8%; font-size: 1em; color: #0c4881; line-height: 65px;">
							정보의 바다에서 떠도는<br /> 당신의 기록,<br />스스로 지켜주세요.
						</div>
						<div class=""
							style="width: 50%; float: right; padding: 8% 8% 8% 3%;">
							<form action="signinProcess.jsp" method="post">
								<input type="text" id="fid" name="fid" class="color font_GODOM"
									placeholder="이메일" /> <input type="password" id="fpass"
									name="fpass" class="color font_GODOM" placeholder="비밀번호" /> <input
									type="submit" class="button addButton font_GODOB"
									id="login_button" value=" 로그인  " />
							</form>
						</div>
					</div>
					<div
						style="clear: both; background-color: rgba(12, 83, 129, 0.6); padding: 1% 0">
						<span class="font_GODOM login_text">MyPI가 처음이신가요? </span> <span
							style="padding: 0 8% 0 1.5%; margin-bottom: 0em;"><input
							type="button" class="button addButton font_GODOB"
							id="signup_button" value=" 회원 가입 "
							onclick="location.href='signup.jsp' " /> </span>
					</div>
					<div style="clear: both;"></div>
				</div>
			</div>
		</div>
	<!-- footer -->
	<jsp:include page="/common/footer.jsp" />
	</section>
</body>
</html>