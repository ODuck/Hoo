<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>비밀번호 찾기</title>

<script src="js/jquery.min.js"></script>
<script src="js/jquery.poptrox.min.js"></script>
<script src="js/skel.min.js"></script>
<script src="js/init.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$('#sendMail').bind('click', function() {
			alert('Mail Sended');
		});
	});
</script>

<noscript>
	<link rel="stylesheet" href="css/skel-noscript.css" />
	<link rel="stylesheet" href="css/style.css" />
</noscript>
</head>
<body>
	<!-- Header -->
	<jsp:include page="/common/header.jsp" />

	<section class="main style4">
		<div id="findpass">
			<p>Input your Email</p>
			<form>
				<input id="email" type="text">
				<input id="sendMail" type="button" value="Send">
			</form>
		</div>
	</section>

	<!-- Footer -->
	<jsp:include page="/common/footer.jsp" />
</body>
</html>