<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="main.logon.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Team Chaser</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="description" content="" />
<meta name="keywords" content="" />
<!--[if lte IE 8]><script src="css/ie/html5shiv.js"></script><![endif]-->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
<script src="js/jquery.min.js"></script>
<script src="js/jquery.poptrox.min.js"></script>
<script src="js/skel.min.js"></script>
<script src="js/init.js"></script>
<script src="js/modal_content.js"></script>
<link rel="stylesheet" href="css/changeinfoAll.css" />
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
<script>
	function checkIt() {
		var input = eval("document.userinput");
		if (!input.modal_name.value && !input.modal_cellphone1.value
				&& !input.modal_cellphone2.value
				&& !input.modal_cellphone3.value
				&& !input.modal_homephone1.value
				&& !input.modal_homephone2.value
				&& !input.modal_homephone3.value
				&& !input.modal_birthday1.value && !input.modal_birthday2.value
				&& !input.modal_birthday3.value && !input.modal_address.value
				&& !input.modal_school.value && !input.modal_workplace.value
				&& !input.modal_occupation.value) {
			alert("최소 하나 이상 입력하셔야 합니다.");
			return false;
		}
	}
</script>
</head>
<%
	String email = (String) session.getAttribute("memEmail");
	LogonDBBean manager = LogonDBBean.getInstance();
	LogonDataBean c = manager.getMember(email);
%>
<body style="overflow-x:hidden;">
	<%
		if (request.getSession().getAttribute("memEmail") == null) {
	%>
	<script>
		alert("로그인을 하셔야 합니다.");
		location.replace("index.jsp");
	</script>
	<%
		}else {
	%>
	<!-- Header -->
	<jsp:include page="/common/header.jsp" />
	
	<!--  content -->
	<section id="ChangeInfoAll" class="main style4 primary changeForm">
		<div class="content container">
			<div class="box container small form_background" style="margin-bottom: 12em;">
				<!--
				<form method="post" action="ChangeInfoAllProcess.jsp" name="userinput"
					onSubmit="return checkIt()">
					<table>
						<tr>
							<td class="modal_text_text font_GODOM">이&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;름</td>
							<td class="signup_form font_GODOM"><input type="hidden"
								name="type" value="name"> <input type="text"
								name="modal_name" id="modal_name" class="color font_GODOM"
								size="10" maxlength="10" placeholder="홍길동"
								onblur="_onCheckName(this.form)"></td>
			
						</tr>
						<tr>
							<td class="modal_text font_GODOM">핸 드 폰</td>
							<td class="signup_form font_GODOM"><input type="hidden"
								name="type" value="cellphone"> <input type="text"
								name="modal_cellphone1" id="modal_cellphone1"
								class="color font_GODOM inputSize" size="10" maxlength="4"
								placeholder="010" onblur="_onCheckCellphone(this.form)"> <input
								type="text" name="modal_cellphone2" id="modal_cellphone2"
								class="color font_GODOM inputSize" size="10" maxlength="4"
								placeholder="1234" onblur="_onCheckCellphone(this.form)"> <input
								type="text" name="modal_cellphone3" id="modal_cellphone3"
								class="color font_GODOM inputSize" size="10" maxlength="4"
								placeholder="5678" onblur="_onCheckCellphone(this.form)"></td>
						</tr>
						<tr>
							<td class="modal_text font_GODOM">전 화 번 호</td>
							<td class="signup_form font_GODOM"><input type="hidden"
								name="type" value="homephone"> <input type="text"
								name="modal_homephone1" id="modal_homephone1"
								class="color font_GODOM inputSize" size="10" maxlength="4"
								placeholder="02" onblur="_onCheckHomephone(this.form)"> <input
								type="text" name="modal_homephone2" id="modal_homephone2"
								class="color font_GODOM inputSize" size="10" maxlength="4"
								placeholder="1234" onblur="_onCheckHomephone(this.form)"> <input
								type="text" name="modal_homephone3" id="modal_homephone3"
								class="color font_GODOM inputSize" size="10" maxlength="4"
								placeholder="5678" onblur="_onCheckHomephone(this.form)"></td>
						</tr>
						<tr>
							<td class="modal_text font_GODOM">생 년 월 일</td>
							<td class="signup_form font_GODOM"><input type="hidden"
								name="type" value="birthday"> <input type="text"
								name="modal_birthday1" id="modal_birthday1"
								class="color font_GODOM inputSize" size="10" maxlength="4"
								placeholder="1990" onblur="_onCheckBirthday(this.form)"> <input
								type="text" name="modal_birthday2" id="modal_birthday2"
								class="color font_GODOM inputSize" size="10" maxlength="2"
								placeholder="07" onblur="_onCheckBirthday(this.form)"> <input
								type="text" name="modal_birthday3" id="modal_birthday3"
								class="color font_GODOM inputSize" size="10" maxlength="2"
								placeholder="14" onblur="_onCheckBirthday(this.form)"></td>
						</tr>
						<tr>
							<td class="modal_text font_GODOM">집 주 소</td>
							<td class="signup_form font_GODOM"><input type="hidden"
								name="type" value="address"><input type="text"
								name="modal_address" id="modal_address" class="color font_GODOM"
								size="10" maxlength="35" placeholder="서울 성북구 삼선1동"
								onblur="_onCheckAddress(this.form)"></td>
						</tr>
						<tr>
							<td class="modal_text font_GODOM">학&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;교</td>
							<td class="signup_form font_GODOM"><input type="hidden"
								name="type" value="school"><input type="text"
								name="modal_school" id="modal_school" class="color font_GODOM"
								size="10" maxlength="10" placeholder="한 성 대"
								onblur="_onCheckSchool(this.form)"></td>
						</tr>
						<tr>
							<td class="modal_text font_GODOM">직 장 주 소</td>
							<td class="signup_form font_GODOM"><input type="hidden"
								name="type" value="workplace"><input type="text"
								name="modal_workplace" id="modal_workplace"
								class="color font_GODOM" size="10" maxlength="35"
								placeholder="한 성 대" onblur="_onCheckWorkplace(this.form)">
							</td>
						</tr>
						<tr>
			
							<td class="modal_text font_GODOM">직&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;업</td>
							<td class="signup_form font_GODOM"><input type="hidden"
								name="type" value="occupation"><input type="text"
								name="modal_occupation" id="modal_occupation"
								class="color font_GODOM" size="10" maxlength="10" placeholder="학 생"
								onblur="_onCheckOccupation(this.form)"></td>
						</tr>
						<tr>
							<td class="modal_text" align="center"><input type="submit"
								name="confirm" class="button addButton font_GODOM" value=" 입력 "></td>
							<td class="modal_text" align="center"><input type="button"
								class="button addButton font_GODOM md-close" onclick ="javascript:window.history.go(-1)" value=" 취소 "></td>
						</tr>
					</table>
				</form>
				-->
				<div style="width: 600px; margin: auto; background: rgba(255, 255, 255, 0.6);">
					<div>
						<div class="changeinfo_img">
							<img class="Mypi" src="./images/ihfb/main_logo/pi_200x66.png">
						</div>
						<div class="font_GODOB" style="float:right;padding: 5.7% 8%;vertical-align: middle; color:#0c4881; font-size: 1.4em;text-align: right;">
							정보 수정
						</div>
					</div>
					<div style="clear:both;"></div>	
					<hr style="margin: 0 8%; border: 2px solid #0c4881;">
					<form action="ChangeInfoAllProcess.jsp" method="post">
						<div class="font_GODOM changeinfo_desc">
							더 정확한 검색을 위해 정보를 입력해주세요!
						</div>
						<div style="padding: 0 8% 5% 8%;">
							<div>
								<div class="font_GODOM changeinfo_text"> 이 름 입 력 </div>
								<input type="hidden" name="type" value="name">
								<input type="text"
								name="modal_name" id="modal_name" class="changeinfo_input color font_GODOM"
								size="10" maxlength="10" placeholder="홍길동"
								onblur="_onCheckName(this.form)">
							</div>
							<span id="name_err" style="float:center;"></span>
						</div>	
						<div style="clear: both;"></div>
						<hr style="margin: 0 8%; border: 2px solid #0c4881;">
						
						<div class="font_GODOM changeinfo_desc">
							모든 항목의 입력이 필수는 아닙니다!
						</div>
						<div style="padding: 0 8% 2% 8%;">
							<div style="padding-right: 0.6em;">
								<div class="font_GODOM changeinfo_text">핸드폰 입력</div>
								<input type="hidden" name="type" value="cellphone">
								<input type="text"
								name="modal_cellphone1" id="modal_cellphone1"
								class="color font_GODOM" size="10" maxlength="4"
								placeholder="010" onblur="_onCheckCellphone(this.form)"> <input
								type="text" name="modal_cellphone2" id="modal_cellphone2"
								class="color font_GODOM" size="10" maxlength="4"
								placeholder="1234" onblur="_onCheckCellphone(this.form)"> <input
								type="text" name="modal_cellphone3" id="modal_cellphone3"
								class="color font_GODOM" size="10" maxlength="4"
								placeholder="5678" onblur="_onCheckCellphone(this.form)">
							</div>
							<span id="cellphone_err" style="float:center;"></span>
							
							<div class="margintop" style="padding-right: 0.6em;">	
								<div class="font_GODOM changeinfo_text">집전화 입력</div>
								<input type="hidden" name="type" value="homephone">
								<input type="text"
								name="modal_homephone1" id="modal_homephone1"
								class="color font_GODOM" size="10" maxlength="4"
								placeholder="02" onblur="_onCheckHomephone(this.form)"> <input
								type="text" name="modal_homephone2" id="modal_homephone2"
								class="color font_GODOMe" size="10" maxlength="4"
								placeholder="1234" onblur="_onCheckHomephone(this.form)"> <input
								type="text" name="modal_homephone3" id="modal_homephone3"
								class="color font_GODOM" size="10" maxlength="4"
								placeholder="5678" onblur="_onCheckHomephone(this.form)">
							</div>
							<span id="homephone_err" style="float:center;"></span>
						
							<div class="margintop" style="padding-right: 0.6em;">	
								<div class="font_GODOM changeinfo_text"> 생 일 입 력 </div>
								<input type="hidden" name="type" value="birthday">
								<input type="text"
								name="modal_birthday1" id="modal_birthday1"
								class="color font_GODOM" size="10" maxlength="4"
								placeholder="1990" onblur="_onCheckBirthday(this.form)"> <input
								type="text" name="modal_birthday2" id="modal_birthday2"
								class="color font_GODOM" size="10" maxlength="2"
								placeholder="07" onblur="_onCheckBirthday(this.form)"> <input
								type="text" name="modal_birthday3" id="modal_birthday3"
								class="color font_GODOM" size="10" maxlength="2"
								placeholder="14" onblur="_onCheckBirthday(this.form)">
							</div>
								<span id="birthday_err" style="float:center;"></span>
						</div>
						<div style="clear: both;"></div>
						<hr style="margin: 3% 8%; border: 2px solid #0c4881;">
						
						
						<div style="padding: 0 8% 2% 8%;">
							<div>
								<div class="font_GODOM changeinfo_text">집주소 입력</div>
								<input type="hidden" name="type" value="address">
								<input type="text"
								name="modal_address" id="modal_address" class="color font_GODOM"
								size="10" maxlength="35" placeholder="서울 성북구 삼선1동"
								onblur="_onCheckAddress(this.form)">
							</div>
								<span id="address_err" style="float:center;"></span>
							<div class="margintop" style="margin-bottom: 0.8em;">
								<div class="font_GODOM changeinfo_text"> 학 교 입 력 </div>
								<input type="hidden" name="type" value="school">
								<input type="text"
								name="modal_school" id="modal_school" class="color font_GODOM"
								size="10" maxlength="10" placeholder="한성대학교"
								onblur="_onCheckSchool(this.form)">
							</div>
								<span id="school_err" style="float:center;"></span>
							<div class="margintop" style="margin-bottom: 0.8em;">
								<div class="font_GODOM changeinfo_text"> 직 장  입 력 </div>
								<input type="hidden" name="type" value="workplace">
								<input type="text"
								name="modal_workplace" id="modal_workplace"
								class="color font_GODOM" size="10" maxlength="35"
								placeholder="한 성 대" onblur="_onCheckWorkplace(this.form)">
							</div>
								<span id="workplace_err" style="float:center;"></span>
							<div class="margintop" style="margin-bottom: 0.8em;">
								<div class="font_GODOM changeinfo_text"> 직 업 입 력 </div>
								<input type="hidden" name="type" value="occupation">
								<input type="text"
								name="modal_occupation" id="modal_occupation"
								class="color font_GODOM" size="10" maxlength="10" placeholder="학 생"
								onblur="_onCheckOccupation(this.form)">
							</div>
								<span id="occupation_err" style="float:center;"></span>
														
							<div style="clear: both;"></div>
							<hr style="border: 1px solid #0c4881;">
							
							<input type="submit"
								name="confirm" class="changeinfo_button button addButton font_GODOB" value=" 정 보 수 정 "
								style="margin:2%;">
						</div>
						<div style="clear: both; background-color: rgba(12, 83, 129, 0.6); padding: 3% 0">
							<input type="reset" id="reset" name="reset" class="button_some changeinfo_button button addButton font_GODOB"
										value=" 다시 입력 " style="margin-right:1.5%;">
							<input type="button" class="button_some changeinfo_button button addButton font_GODOB" value=" 취소 "
									onclick="javascript:window.location='index.jsp'" style="margin-left:1.5%;">
						</div>
					</form>
				</div>
				
			</div>
		</div>
	<!-- footer -->
	<jsp:include page="/common/footer.jsp" />
	</section>
	
	<%
		}
	%>
</body>
</html>