<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page session="true"%>
<!DOCTYPE HTML>
<html>
<head>
<title>Team Chaser</title>

<meta name="description" content="" />
<meta name="keywords" content="" />
<!--[if lte IE 8]><script src="css/ie/html5shiv.js"></script><![endif]-->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>

<script src="js/jquery.min.js"></script>
<script src="js/jquery.poptrox.min.js"></script>
<script src="js/skel.min.js"></script>
<script src="js/init.js"></script>
<script src="js/signup.js"></script>
<link rel="stylesheet" href="css/signup.css"/>
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

table,tr,td,th {
	border: 3px solid white;
}
</style>

<!--[if lte IE 8]><link rel="stylesheet" href="css/ie/v8.css" /><![endif]-->
</head>
<!-- <link href="style.css" rel="stylesheet" type="text/css"> -->

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

	<!--  Sign Up -->
	<section id="login" class="main style4 primary signupForm">
		<div class="content container">
			<div class="box container small form_background">
				<!--
				<form method="post" action="signupProcess.jsp" name="userinput"
					onSubmit="return checkIt()">
					<table id="signup_form">
						<tr>
							<td colspan="3" align="center" class="signup_text font_GODOM">회원
								가입</td>
						</tr>
						<tr>
							<td class="signup_text font_GODOM">계정 이메일</td>
							<td class="signup_form font_GODOM"><input type="text"
								name="email" id="email" class="color font_GODOM" size="10"
								maxlength="35" placeholder="이메일"
								onblur="_onCheckEmail(this.form)"> <span id="mailMsg"></span></td>
							<td><input type="button" id="sendKey" name="sendKey"
								value=" 인증키 전송 " class="button addButton font_GODOM"
								onclick="_onSendCertKey(this.form)"></td>
						</tr>
						<tr>
							<td class="signup_text font_GODOM">이메일 인증</td>
							<td class="signup_form font_GODOM"><input type="text"
								name="certkey" id="certkey" class="color font_GODOM" size="10"
								maxlength="35" placeholder="인증키"><span id="keyMsg"></span></td>
							<td class="font_GODOM"><input type="button"
								name="confirm_email" value=" 인증 확인 "
								class="button addButton font_GODOM"
								onclick="_onConfirmCertKey(this.form)"></td>
						</tr>
						<tr>
							<td class="signup_text font_GODOM">비밀번호</td>
							<td class="signup_form font_GODOM"><input type="password"
								name="password" id="password" class="color font_GODOM" size="15"
								maxlength="12" placeholder="비밀번호"
								onblur="_onCheckPassword1(this.form)"> <span
								id="pass1Msg"></span></td>
							<td></td>
						</tr>
						<tr>
							<td class="signup_text font_GODOM">비밀번호 확인</td>
							<td class="signup_form font_GODOM"><input type="password"
								name="password2" id="password2" class="color font_GODOM"
								size="15" maxlength="12" placeholder="비밀번호 확인"
								onblur="_onCheckPassword2(this.form)"> <span
								id="pass2Msg"></span></td>
							<td></td>
						</tr>
						<tr>
							<td class="signup_text" align="center"><input type="submit"
								name="confirm" class="button addButton font_GODOM" value=" 회원가입 "></td>
							<td class="signup_text" align="center" id="reset"><input
								type="reset" name="reset" class="button addButton font_GODOM"
								value=" 다시입력 "></td>
							<td class="signup_text" align="center"><input type="button"
								class="button addButton font_GODOM" value=" 취소 "
								onclick="javascript:window.location='index.jsp'"></td>
						</tr>
					</table>
				</form>
				-->
				<div style="width: 600px; margin: auto; background: rgba(255, 255, 255, 0.6);">
					<div>
						<div class="signup_img">
							<img class="Mypi" src="./images/ihfb/main_logo/pi_200x66.png">
						</div>
						<div class="font_GODOB" style="float:right;padding: 5.7% 8%;vertical-align: middle; color:#0c4881; font-size: 1.4em;text-align: right;">
							회원 가입
						</div>
					</div>
					<div style="clear:both;"></div>	
					<hr style="margin: 0 8%; border: 2px solid #0c4881;">
					<form action="signupProcess.jsp" method="post" onSubmit="return check()">
						<div class="font_GODOM sign_number">
							1. 이메일을 입력하신 후, 발송된 메일을 확인하여 인증해 주세요.
						</div>
						<div style="padding: 0 8% 2% 8%;">
							<div>
								<div class="font_GODOM sign_text">메일주소 입력</div>
								<input type="text"
								name="email" id="email" class="signup_input color font_GODOM" size="10"
								maxlength="35" placeholder="이메일"
								onblur="_onCheckEmail(this.form)"> 
								<input type="button" id="sendKey" name="sendKey"
								value=" 인증키 전송 " class="sign_button button addButton font_GODOB"
								onclick="_onSendCertKey(this.form)">
							</div>
								<span id="mailMsg" style="float:center;"></span>
							<div class="margintop">
								<div class="font_GODOM sign_text">인증번호 입력</div>
								<input type="text"
								name="certkey" id="certkey" class="signup_input color font_GODOM" size="10"
								maxlength="35" placeholder="인증키">
								<input type="button"
								name="confirm_email" value=" 인증 확인 "
								class="sign_button button addButton font_GODOB"
								onclick="_onConfirmCertKey(this.form)">
							</div>
								<span id="keyMsg" style="float:center;"></span>
						</div>
						<div style="clear: both;"></div>
						
						<hr style="margin: 0 8%; border: 1px solid #0c4881;">
						
						<div class="font_GODOM sign_number">
							2. 비밀번호를 입력하신 후, 정확하게 다시 한 번 입력해 주세요.
						</div>
						<div style="padding: 0 8% 2% 8%;">
							<div>
								<div class="font_GODOM sign_text">비밀번호 입력</div>
								<input type="password"
								name="password" id="password" class="signup_input color font_GODOM" size="15"
								maxlength="12" placeholder="비밀번호 입력"
								onblur="_onCheckPassword1(this.form)">
								<input type="button" id="sendKey" name="sendKey"
								value=" 인증키 전송 " class="sign_button button addButton font_GODOM"
								style="visibility: hidden;">
							</div>
								<span id="pass1Msg" style="float:center;"></span>
							<div class="margintop" style="margin-bottom: 0.8em;">
								<div class="font_GODOM sign_text">비밀번호 확인</div>
								<input type="password"
								name="password2" id="password2" class="signup_input color font_GODOB"
								size="15" maxlength="12" placeholder="비밀번호 확인"
								onblur="_onCheckPassword2(this.form)">
								<input type="button"
								name="confirm_email" value=" 인증 확인 "
								class="sign_button button addButton font_GODOB"
								style="visibility: hidden;">
							</div>
								<span id="pass2Msg" style="float:center;"></span>
							<div style="clear: both;"></div>
							
							<hr style="border: 1px solid #0c4881;">
							
							<input type="submit"
								name="confirm" class="sign_button button addButton font_GODOB" value=" 회원가입 "
								style="margin:2%;">
						</div>
						<div style="clear: both; background-color: rgba(12, 83, 129, 0.6); padding: 3% 0">
							<input type="reset" id="reset" name="reset" class="button_some sign_button button addButton font_GODOB"
										value=" 다시 입력 " onclick="msgreset()" style="margin-right:1.5%;">
							<input type="button" class="button_some sign_button button addButton font_GODOB" value=" 가입 취소 "
									onclick="javascript:window.location='index.jsp'" style="margin-left:1.5%;">
						</div>
					</form>
				</div>
			</div>
		</div>
	</section>

	<!-- Footer -->
	<jsp:include page="/common/footer.jsp" />
</body>
</html>
