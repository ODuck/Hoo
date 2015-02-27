<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="main.logon.*"%>

<%
	String email = (String) session.getAttribute("memEmail");
	LogonDBBean manager = LogonDBBean.getInstance();
	LogonDataBean c = manager.getMember(email);
%>

<script type="text/javascript">
	$(document).ready(function() {
		$('.changeInfoForm').submit(function() {
			var formData = $(this).serialize();

			$.ajax({
				url : "./changeInfoProcess.jsp",
				type : "POST",
				data : formData,
				success : function() {
					alert("정보 수정 완료");
				},
				error : function() {
					alert("정보 수정 에러");
				},
				complete : function() {
					$('.md-close').click();
				}
			});

			return false; // no redirect
		});
	});
</script>
<style>
.modifyColor {
	color:rgb(12, 118, 199);
}
</style>
<!-- Modal Dialog -->
<!-- name -->
<div class="md-modal md-effect-7" id="name">
	<div class="md-content">
		<div>
			<h3 class="font_GODOM">정보 수정</h3>
			<form class="changeInfoForm" method="post" action=""
				name="userinput_name">
				<table>
					<tr>
						<%
							if (c.getName().equals("null")) {
						%>
						<td class="signup_text modifyColor font_GODOM">이&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;름</td>
						<td class="signup_form font_GODOM"><input type="hidden"
							name="type" value="name"> <input type="text"
							name="modal_name" id="modal_name" class="color font_GODOM"
							size="10" maxlength="10" placeholder="홍길동"
							onblur="_onCheckName(this.form)" onSubmit="return chekk()"> <%
 	} else {
 		out.println("<script type=\"text/javascript\">changeIcon('name');</script>");
 %>
						<td class="signup_text modifyColor font_GODOM">이&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;름</td>
						<td class="signup_form font_GODOM"><input type="hidden"
							name="type" value="name"> <input type="text"
							name="modal_name" id="modal_name" class="color font_GODOM"
							size="10" maxlength="10" value="<%=c.getName()%>"
							onblur="_onCheckName(this.form)"> <%
 	}
 %>
							<div id="name_err" class="errMsg"></div></td>

					</tr>
					<tr>
						<td class="signup_text" align="center"><input type="submit"
							name="confirm" class="button addButton font_GODOM" value=" 입력 "></td>
						<td class="signup_text" align="center"><input type="button"
							class="button addButton font_GODOM md-close" value=" 취소 "></td>
					</tr>
				</table>
			</form>
		</div>
	</div>
</div>
<!-- cellphone -->
<div class="md-modal md-effect-7" id="cellphone">
	<div class="md-content">
		<div>
			<h3 class="font_GODOM">정보 수정</h3>
			<form class="changeInfoForm" class="changeInfoForm" method="post"
				action="" name="userinput_cellphone">
				<table>
					<tr>
						<td class="signup_text modifyColor font_GODOM">전 화 번 호</td>
						<td class="signup_form font_GODOM">
							<%
								if (c.getCellphone().equals("null")) {
							%> <input type="hidden" name="type" value="cellphone"> <input
							type="text" name="modal_cellphone1" id="modal_cellphone1"
							class="color font_GODOM inputSize" size="10" maxlength="4"
							placeholder="010" onblur="_onCheckCellphone(this.form)">
							<input type="text" name="modal_cellphone2" id="modal_cellphone2"
							class="color font_GODOM inputSize" size="10" maxlength="4"
							placeholder="1234" onblur="_onCheckCellphone(this.form)">
							<input type="text" name="modal_cellphone3" id="modal_cellphone3"
							class="color font_GODOM inputSize" size="10" maxlength="4"
							placeholder="5678" onblur="_onCheckCellphone(this.form)">
							<%
								} else {
										String[] cell = null;
									cell = c.getCellphone().split("-");

									out.println("<script type=\"text/javascript\">changeIcon('cellphone');</script>");
							%> <input type="hidden" name="type" value="cellphone"> <input
							type="text" name="modal_cellphone1" id="modal_cellphone1"
							class="color font_GODOM inputSize" size="10" maxlength="4"
							value="<%=cell[0]%>" onblur="_onCheckCellphone(this.form)">
							<input type="text" name="modal_cellphone2" id="modal_cellphone2"
							class="color font_GODOM inputSize" size="10" maxlength="4"
							value="<%=cell[1]%>" onblur="_onCheckCellphone(this.form)">
							<input type="text" name="modal_cellphone3" id="modal_cellphone3"
							class="color font_GODOM inputSize" size="10" maxlength="4"
							value="<%=cell[2]%>" onblur="_onCheckCellphone(this.form)">
							<%
								}
							%>
							<div id="cellphone_err" class="errMsg"></div>
						</td>
					</tr>
					<tr>
						<td class="signup_text" align="center"><input
							id="cellPhoneInput" type="submit" name="confirm"
							class="button addButton font_GODOM" value=" 입력 "></td>
						<td class="signup_text" align="center"><input type="button"
							class="button addButton font_GODOM md-close" value=" 취소 "></td>
					</tr>
				</table>
			</form>
		</div>
	</div>
</div>

<!-- homephone -->
<div class="md-modal md-effect-7" id="homephone">
	<div class="md-content">
		<div>
			<h3 class="font_GODOM">정보 수정</h3>
			<form class="changeInfoForm" class="changeInfoForm" method="post"
				action="" name="userinput_homephone">
				<table>
					<tr>
						<%
							if (c.getHomephone().equals("null")) {
						%>
						<td class="signup_text modifyColor font_GODOM">전 화 번 호</td>
						<td class="signup_form font_GODOM"><input type="hidden"
							name="type" value="homephone"> <input type="text"
							name="modal_homephone1" id="modal_homephone1"
							class="color font_GODOM inputSize" size="10" maxlength="4"
							placeholder="02" onblur="_onCheckHomephone(this.form)"> <input
							type="text" name="modal_homephone2" id="modal_homephone2"
							class="color font_GODOM inputSize" size="10" maxlength="4"
							placeholder="1234" onblur="_onCheckHomephone(this.form)">
							<input type="text" name="modal_homephone3" id="modal_homephone3"
							class="color font_GODOM inputSize" size="10" maxlength="4"
							placeholder="5678" onblur="_onCheckHomephone(this.form)">
							<%
								} else {
									String[] home = null;
									home = c.getHomephone().split("-");
									
									out.println("<script type=\"text/javascript\">changeIcon('homephone');</script>");
							%>
						<td class="signup_text modifyColor font_GODOM">전 화 번 호</td>
						<td class="signup_form font_GODOM"><input type="hidden"
							name="type" value="homephone"> <input type="text"
							name="modal_homephone1" id="modal_homephone1"
							class="color font_GODOM inputSize" size="10" maxlength="4"
							value="<%=home[0] %>" onblur="_onCheckHomephone(this.form)">
							<input type="text" name="modal_homephone2" id="modal_homephone2"
							class="color font_GODOM inputSize" size="10" maxlength="4"
							value="<%=home[1] %>" onblur="_onCheckHomephone(this.form)">
							<input type="text" name="modal_homephone3" id="modal_homephone3"
							class="color font_GODOM inputSize" size="10" maxlength="4"
							value="<%=home[2] %>" onblur="_onCheckHomephone(this.form)">
							<%
								}
							%>
							<div id="homephone_err" class="errMsg"></div></td>
					</tr>
					<tr>
						<td class="signup_text" align="center"><input type="submit"
							name="confirm" class="button addButton font_GODOM" value=" 입력 "></td>
						<td class="signup_text" align="center"><input type="button"
							class="button addButton font_GODOM md-close" value=" 취소 "></td>
					</tr>
				</table>
			</form>
		</div>
	</div>
</div>

<!-- birthday -->
<div class="md-modal md-effect-7" id="birthday">
	<div class="md-content">
		<div>
			<h3 class="font_GODOM">정보 수정</h3>
			<form class="changeInfoForm" class="changeInfoForm" method="post"
				action="" name="userinput_birthday">
				<table>
					<tr>
						<%
							if (c.getBirthday().equals("null")) {
						%>
						<td class="signup_text modifyColor font_GODOM">생 년 월 일</td>
						<td class="signup_form font_GODOM"><input type="hidden"
							name="type" value="birthday"> <input type="text"
							name="modal_birthday1" id="modal_birthday1"
							class="color font_GODOM inputSize" size="10" maxlength="4"
							placeholder="1990" onblur="_onCheckBirthday(this.form)">
							<input type="text" name="modal_birthday2" id="modal_birthday2"
							class="color font_GODOM inputSize" size="10" maxlength="2"
							placeholder="07" onblur="_onCheckBirthday(this.form)"> <input
							type="text" name="modal_birthday3" id="modal_birthday3"
							class="color font_GODOM inputSize" size="10" maxlength="2"
							placeholder="14" onblur="_onCheckBirthday(this.form)"> <%
 	} else {
 		String[] birth = null;
 		birth = c.getBirthday().split("\\.");
 		out.println("<script type=\"text/javascript\">changeIcon('birthday');</script>");
 %>
						<td class="signup_text modifyColor font_GODOM">생 년 월 일</td>
						<td class="signup_form font_GODOM"><input type="hidden"
							name="type" value="birthday"> <input type="text"
							name="modal_birthday1" id="modal_birthday1"
							class="color font_GODOM inputSize" size="10" maxlength="4"
							value="<%=birth[0] %>" onblur="_onCheckBirthday(this.form)">
							
							<input type="text" name="modal_birthday2" id="modal_birthday2"
							class="color font_GODOM inputSize" size="10" maxlength="2"
							value="<%=birth[1] %>" onblur="_onCheckBirthday(this.form)">
							
							<input type="text" name="modal_birthday3" id="modal_birthday3"
							class="color font_GODOM inputSize" size="10" maxlength="2"
							value="<%=birth[2] %>" onblur="_onCheckBirthday(this.form)">
							<%
								}
							%>
							<div id="birthday_err" class="errMsg"></div></td>
					</tr>
					<tr>
						<td class="signup_text" align="center"><input type="submit"
							name="confirm" class="button addButton font_GODOM" value=" 입력 "></td>
						<td class="signup_text" align="center"><input type="button"
							class="button addButton font_GODOM md-close" value=" 취소 "></td>
					</tr>
				</table>
			</form>
		</div>
	</div>
</div>
<!-- address -->
<div class="md-modal md-effect-7" id="address">
	<div class="md-content">
		<div>
			<h3 class="font_GODOM">정보 수정</h3>
			<form class="changeInfoForm" class="changeInfoForm" method="post"
				action="" name="userinput_address">
				<table>
					<tr>
						<%
							if (c.getAddress().equals("null")) {
						%>
						<td class="signup_text modifyColor font_GODOM">집 주 소</td>
						<td class="signup_form font_GODOM"><input type="hidden"
							name="type" value="address"><input type="text"
							name="modal_address" id="modal_address" class="color font_GODOM"
							size="10" maxlength="35" placeholder="서울 성북구 삼선1동"
							onblur="_onCheckAddress(this.form)"> <%
 	} else {
 %>
						<td class="signup_text modifyColor font_GODOM">집 주 소</td>
						<td class="signup_form font_GODOM"><input type="hidden"
							name="type" value="address"><input type="text"
							name="modal_address" id="modal_address" class="color font_GODOM"
							size="10" maxlength="35" value="<%=c.getAddress()%>"
							onblur="_onCheckAddress(this.form)"> <%
 	out.println("<script type=\"text/javascript\">changeIcon('address');</script>");
 	}
 %>
							<div id="address_err" class="errMsg"></div></td>
					</tr>
					<tr>
						<td class="signup_text" align="center"><input type="submit"
							name="confirm" class="button addButton font_GODOM" value=" 입력 "></td>
						<td class="signup_text" align="center"><input type="button"
							class="button addButton font_GODOM md-close" value=" 취소 "></td>
					</tr>
				</table>
			</form>
		</div>
	</div>
</div>

<!-- school -->
<div class="md-modal md-effect-7" id="school">
	<div class="md-content">
		<div>
			<h3 class="font_GODOM">정보 수정</h3>
			<form class="changeInfoForm" class="changeInfoForm" method="post"
				action="" name="userinput_school">
				<table>
					<tr>
						<%
							if (c.getSchool().equals("null")) {
						%>
						<td class="signup_text modifyColor font_GODOM">학&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;교</td>
						<td class="signup_form font_GODOM"><input type="hidden"
							name="type" value="school"><input type="text"
							name="modal_school" id="modal_school" class="color font_GODOM"
							size="10" maxlength="10" placeholder="한 성 대"
							onblur="_onCheckSchool(this.form)"> <%
 	} else {
 %>
						<td class="signup_text modifyColor font_GODOM">학&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;교</td>
						<td class="signup_form font_GODOM"><input type="hidden"
							name="type" value="school"><input type="text"
							name="modal_school" id="modal_school" class="color font_GODOM"
							size="10" maxlength="10" value="<%=c.getSchool()%>"
							onblur="_onCheckSchool(this.form)"> <%
 	out.println("<script type=\"text/javascript\">changeIcon('school');</script>");
 	}
 %>
							<div id="school_err" class="errMsg"></div></td>
					</tr>
					<tr>
						<td class="signup_text" align="center"><input type="submit"
							name="confirm" class="button addButton font_GODOM" value=" 입력 "></td>
						<td class="signup_text" align="center"><input type="button"
							class="button addButton font_GODOM md-close" value=" 취소 "></td>
					</tr>
				</table>
			</form>
		</div>
	</div>
</div>

<!-- workplace -->
<div class="md-modal md-effect-7" id="workplace">
	<div class="md-content">
		<div>
			<h3 class="font_GODOM">정보 수정</h3>
			<form class="changeInfoForm" class="changeInfoForm" method="post"
				action="" name="userinput_workplace">
				<table>
					<tr>
						<%
							if (c.getWorkplace().equals("null")) {
						%>
						<td class="signup_text modifyColor font_GODOM">직 장 주 소</td>
						<td class="signup_form font_GODOM"><input type="hidden"
							name="type" value="workplace"><input type="text"
							name="modal_workplace" id="modal_workplace"
							class="color font_GODOM" size="10" maxlength="35"
							placeholder="한 성 대" onblur="_onCheckWorkplace(this.form)">
							<%
								} else {
							%>
						<td class="signup_text modifyColor font_GODOM">직 장 주 소</td>
						<td class="signup_form font_GODOM"><input type="hidden"
							name="type" value="workplace"><input type="text"
							name="modal_workplace" id="modal_workplace"
							class="color font_GODOM" size="10" maxlength="35"
							value="<%=c.getWorkplace()%>"
							onblur="_onCheckWorkplace(this.form)"> <%out.println("<script type=\"text/javascript\">changeIcon('workplace');</script>");
 	}
 %>
							<div id="workplace_err" class="errMsg"></div></td>
					</tr>
					<tr>
						<td class="signup_text" align="center"><input type="submit"
							name="confirm" class="button addButton font_GODOM" value=" 입력 "></td>
						<td class="signup_text" align="center"><input type="button"
							class="button addButton font_GODOM md-close" value=" 취소 "></td>
					</tr>
				</table>
			</form>
		</div>
	</div>
</div>

<!-- occupation -->
<div class="md-modal md-effect-7" id="occupation">
	<div class="md-content">
		<div>
			<h3 class="font_GODOM">정보 수정</h3>
			<form class="changeInfoForm" method="post" action=""
				name="userinput_occupation">
				<table>
					<tr>
						<%
							if (c.getOccupation().equals("null")) {
						%>
						<td class="signup_text modifyColor font_GODOM">직&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;업</td>
						<td class="signup_form font_GODOM"><input type="hidden"
							name="type" value="occupation"><input type="text"
							name="modal_occupation" id="modal_occupation"
							class="color font_GODOM" size="10" maxlength="10"
							placeholder="학 생" onblur="_onCheckOccupation(this.form)">
							<%
								} else {
							%>
						<td class="signup_text modifyColor font_GODOM">직&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;업</td>
						<td class="signup_form font_GODOM"><input type="hidden"
							name="type" value="occupation"><input type="text"
							name="modal_occupation" id="modal_occupation"
							class="color font_GODOM" size="10" maxlength="10"
							value="<%=c.getOccupation()%>"
							onblur="_onCheckOccupation(this.form)"> <%out.println("<script type=\"text/javascript\">changeIcon('occupation');</script>");
 	}
 %>
							<div id="occupation_err" class="errMsg"></div></td>
					</tr>
					<tr>
						<td class="signup_text" align="center"><input type="submit"
							name="confirm" class="button addButton font_GODOM" value=" 입력 "></td>
						<td class="signup_text" align="center"><input type="button"
							class="button addButton font_GODOM md-close" value=" 취소 "></td>
					</tr>
				</table>
			</form>
		</div>
	</div>
</div>

<div class="md-overlay" style="background: rgba(0,0,0,0.6);"></div>
