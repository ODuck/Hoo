$(document).ready(
		function() {
			$('.changeInfoForm').submit(
					function() {
						var formData = $(this).serialize();
						var type = $(this).find('[name=type]').val();

						$.ajax({
							url : "./changeInfoProcess.jsp",
							type : "POST",
							data : formData,
							success : function() {
								changeIcon(type);
								$('#name_err').html('');
								$('#cellphone_err').html('');
								$('#homephone_err').html('');
								$('#birthday_err').html('');
								$('#address_err').html('');
								$('#school_err').html('');
								$('#workplace_err').html('');
								$('#occupation_err').html('');
							},
							error : function() {
								alert("정보 수정 에러");
							},
							complete : function() {
							}
						});

						return false; // no redirect
					});
		});

// 1. 이름 체크
var _onCheckName = function(userinput) {
	// 숫자 판별
	var val = new Array();
	var di = true;
	for (var i = 0; i < userinput.modal_name.value.length; i++) {
		val[i] = userinput.modal_name.value.charAt(i);
		if (isNaN(val[i]) == false)
			di = false;
	}
	// 숫자가 있으면 제외
	if (di == false) {
		$('#name_err').css('color', 'red');
		$('#name_err').css('font-size', '1em;');
		$('#name_err').attr('class','font_GODOM');
		$('#name_err').html('숫자는 제외해주세요.');
		return false;
	}
	// 빈 공간 체크
	else if (userinput.modal_name.value == "") {
		$('#name_err').css('color', 'red');
		$('#name_err').css('font-size', '1em;');
		$('#name_err').attr('class','font_GODOM');
		$('#name_err').html('이름을 입력하세요.');
		return false;
	}
	// ㅇㅋ 통과.
	else {
		$('#name_err').html('');
		return true;
	}
};

// 2. 핸드폰 체크
var _onCheckCellphone = function(userinput) {
	// 숫자 판별
	var val1 = new Array();
	var val2 = new Array();
	var val3 = new Array();
	var di = true;
	for (var i = 0; i < 4; i++) {
		val1[i] = userinput.modal_cellphone1.value.charAt(i);
		val2[i] = userinput.modal_cellphone2.value.charAt(i);
		val3[i] = userinput.modal_cellphone3.value.charAt(i);
		if (isNaN(val1[i]) == true)
			di = false;
		if (isNaN(val2[i]) == true)
			di = false;
		if (isNaN(val3[i]) == true)
			di = false;
	}

	// 문자가 있으면 제외
	if (di == false) {
		$('#cellphone_err').css('color', 'red');
		$('#cellphone_err').css('font-size', '1em;');
		$('#cellphone_err').attr('class','font_GODOM');
		$('#cellphone_err').html('문자는 제외해주세요.');
		return false;
	}
	// 빈 공간 체크
	else if (userinput.modal_cellphone1.value == "") {
		$('#cellphone_err').css('color', 'red');
		$('#cellphone_err').css('font-size', '1em;');
		$('#cellphone_err').attr('class','font_GODOM');
		$('#cellphone_err').html('번호를 입력하세요.');
		return false;
	} else if (userinput.modal_cellphone2.value == "") {
		$('#cellphone_err').css('color', 'red');
		$('#cellphone_err').css('font-size', '1em;');
		$('#cellphone_err').attr('class','font_GODOM');
		$('#cellphone_err').html('번호를 입력하세요.');
		return false;
	} else if (userinput.modal_cellphone3.value == "") {
		$('#cellphone_err').css('color', 'red');
		$('#cellphone_err').css('font-size', '1em;');
		$('#cellphone_err').attr('class','font_GODOM');
		$('#cellphone_err').html('번호를 입력하세요.');
		return false;
	}
	// 3~4칸 입력 가능.
	else if (userinput.modal_cellphone1.value.length < 3
			|| userinput.modal_cellphone1.value.length > 4) {
		$('#cellphone_err').css('color', 'red');
		$('#cellphone_err').css('font-size', '1em;');
		$('#cellphone_err').attr('class','font_GODOM');
		$('#cellphone_err').html('3~4글자를 입력하세요.');
		return false;
	}
	// 3~4칸 입력 가능.
	else if (userinput.modal_cellphone2.value.length < 3
			|| userinput.modal_cellphone2.value.length > 4) {
		$('#cellphone_err').css('color', 'red');
		$('#cellphone_err').css('font-size', '1em;');
		$('#cellphone_err').attr('class','font_GODOM');
		$('#cellphone_err').html('3~4글자를 입력하세요.');
		return false;
	}
	// 3~4칸 입력 가능.
	else if (userinput.modal_cellphone3.value.length < 3
			|| userinput.modal_cellphone3.value.length > 4) {
		$('#cellphone_err').css('color', 'red');
		$('#cellphone_err').css('font-size', '1em;');
		$('#cellphone_err').attr('class','font_GODOM');
		$('#cellphone_err').html('3~4글자를 입력하세요.');
		return false;
	}

	// ㅇㅋ 통과.
	else {
		$('#cellphone_err').html('');
		return true;
	}
};

// 3. 집전화 체크
var _onCheckHomephone = function(userinput) {
	// 숫자 판별
	var val1 = new Array();
	var val2 = new Array();
	var val3 = new Array();
	var di = true;
	for (var i = 0; i < 4; i++) {
		val1[i] = userinput.modal_homephone1.value.charAt(i);
		val2[i] = userinput.modal_homephone2.value.charAt(i);
		val3[i] = userinput.modal_homephone3.value.charAt(i);
		if (isNaN(val1[i]) == true)
			di = false;
		if (isNaN(val2[i]) == true)
			di = false;
		if (isNaN(val3[i]) == true)
			di = false;
	}// 문자가 있으면 제외
	if (di == false) {
		$('#homephone_err').css('color', 'red');
		$('#homephone_err').css('font-size', '1em;');
		$('#homephone_err').attr('class','font_GODOM');
		$('#homephone_err').html('문자는 제외해주세요.');
		return false;
	}
	// 빈 공간 체크
	else if (userinput.modal_homephone1.value == "") {
		$('#homephone_err').css('color', 'red');
		$('#homephone_err').css('font-size', '1em;');
		$('#homephone_err').attr('class','font_GODOM');
		$('#homephone_err').html('번호를 입력하세요.');
		return false;
	} else if (userinput.modal_homephone2.value == "") {
		$('#homephone_err').css('color', 'red');
		$('#homephone_err').css('font-size', '1em;');
		$('#homephone_err').attr('class','font_GODOM');
		$('#homephone_err').html('번호를 입력하세요.');
		return false;
	} else if (userinput.modal_homephone3.value == "") {
		$('#homephone_err').css('color', 'red');
		$('#homephone_err').css('font-size', '1em;');
		$('#homephone_err').attr('class','font_GODOM');
		$('#homephone_err').html('번호를 입력하세요.');
		return false;
	}
	// 3~4칸 입력 가능.
	else if (userinput.modal_homephone1.value.length < 3
			|| userinput.modal_homephone1.value.length > 4) {
		$('#homephone_err').css('color', 'red');
		$('#homephone_err').css('font-size', '1em;');
		$('#homephone_err').attr('class','font_GODOM');
		$('#homephone_err').html('3~4글자를 입력하세요.');
		return false;
	}
	// 3~4칸 입력 가능.
	else if (userinput.modal_homephone2.value.length < 3
			|| userinput.modal_homephone2.value.length > 4) {
		$('#homephone_err').css('color', 'red');
		$('#homephone_err').css('font-size', '1em;');
		$('#homephone_err').attr('class','font_GODOM');
		$('#homephone_err').html('3~4글자를 입력하세요.');
		return false;
	}
	// 3~4칸 입력 가능.
	else if (userinput.modal_homephone3.value.length < 3
			|| userinput.modal_homephone3.value.length > 4) {
		$('#homephone_err').css('color', 'red');
		$('#homephone_err').css('font-size', '1em;');
		$('#homephone_err').attr('class','font_GODOM');
		$('#homephone_err').html('3~4글자를 입력하세요.');
		return false;
	}

	// ㅇㅋ 통과.
	else {
		$('#homephone_err').html('');
		return true;
	}
};

// 4. 생년월일 체크
var _onCheckBirthday = function(userinput) {
	// 숫자 판별
	var val1 = new Array();
	var val2 = new Array();
	var val3 = new Array();
	var di = true;
	for (var i = 0; i < 4; i++) {
		val1[i] = userinput.modal_birthday1.value.charAt(i);
		val2[i] = userinput.modal_birthday2.value.charAt(i);
		val3[i] = userinput.modal_birthday3.value.charAt(i);
		if (isNaN(val1[i]) == true)
			di = false;
		if (isNaN(val2[i]) == true)
			di = false;
		if (isNaN(val3[i]) == true)
			di = false;
	}
	// 문자가 있으면 제외
	if (di == false) {
		$('#birthday_err').css('color', 'red');
		$('#birthday_err').css('font-size', '1em;');
		$('#birthday_err').attr('class','font_GODOM');
		$('#birthday_err').html('문자는 제외해주세요.');
		return false;
	}
	// 년도 체크 - 빈공간
	else if (userinput.modal_birthday1.value == "") {
		$('#birthday_err').css('color', 'red');
		$('#birthday_err').css('font-size', '1em;');
		$('#birthday_err').attr('class','font_GODOM');
		$('#birthday_err').html('년도 를 입력하세요.');
		return false;
	}
	// 년도 체크 - 길이
	// 4칸 입력 가능.
	else if (userinput.modal_birthday1.value.length != 4) {
		$('#birthday_err').css('color', 'red');
		$('#birthday_err').css('font-size', '1em;');
		$('#birthday_err').attr('class','font_GODOM');
		$('#birthday_err').html('4글자를 입력하세요.');
		return false;
	}

	// 월 체크 - 빈공간
	else if (userinput.modal_birthday2.value == "") {
		$('#birthday_err').css('color', 'red');
		$('#birthday_err').css('font-size', '1em;');
		$('#birthday_err').attr('class','font_GODOM');
		$('#birthday_err').html('월 을 입력하세요.');
		return false;
	}
	// 월 체크 - 길이
	// 2칸 입력 가능.
	else if (userinput.modal_birthday2.value.length != 2) {
		$('#birthday_err').css('color', 'red');
		$('#birthday_err').css('font-size', '1em;');
		$('#birthday_err').attr('class','font_GODOM');
		$('#birthday_err').html('2글자를 입력하세요.');
		return false;
	}

	// 일 체크 - 빈공간
	else if (userinput.modal_birthday3.value == "") {
		$('#birthday_err').css('color', 'red');
		$('#birthday_err').css('font-size', '1em;');
		$('#birthday_err').attr('class','font_GODOM');
		$('#birthday_err').html('일 을 입력하세요.');
		return false;
	}
	// 일 체크 - 길이
	// 2칸 입력 가능.
	else if (userinput.modal_birthday3.value.length != 2) {
		$('#birthday_err').css('color', 'red');
		$('#birthday_err').css('font-size', '1em;');
		$('#birthday_err').attr('class','font_GODOM');
		$('#birthday_err').html('2글자를 입력하세요.');
		return false;
	}

	// ㅇㅋ 통과.
	else {
		$('#birthday_err').html('');
		return true;
	}
};

// 5. 집주소 체크
var _onCheckAddress = function(userinput) {
	if (userinput.modal_address.value == '') {
		$('#address_err').css('color', 'red');
		$('#address_err').css('font-size', '1em;');
		$('#address_err').attr('class','font_GODOM');
		$('#address_err').html('주소를 입력하세요.');
		return false;
	} else if (userinput.modal_address.value.length > 5) {
		$('#address_err').css('color', 'red');
		$('#address_err').css('font-size', '1em;');
		$('#address_err').attr('class','font_GODOM');
		$('#address_err').html('5글자 이상 입력하세요.');
		return false;
	}
	// ㅇㅋ 통과.
	else {
		$('#address_err').html('');
		return true;
	}
};

// 6. 학교 체크
var _onCheckSchool = function(userinput) {

	var val = new Array();
	var di = true;
	for (var i = 0; i < userinput.modal_school.value.length; i++) {
		val[i] = userinput.modal_school.value.charAt(i);
		if (isNaN(val[i]) == false)
			di = false;
	}

	// 숫자 체크
	if (di == false) {
		$('#school_err').css('color', 'red');
		$('#school_err').css('font-size', '1em;');
		$('#school_err').attr('class','font_GODOM');
		$('#school_err').html('숫자는 제외해주세요.');
		return false;
	} else if (userinput.modal_school.value == '') {
		$('#school_err').css('color', 'red');
		$('#school_err').css('font-size', '1em;');
		$('#school_err').attr('class','font_GODOM');
		$('#school_err').html('학교를 입력하세요.');
		return false;
	} else if (userinput.modal_school.value.length > 5) {
		$('#school_err').css('color', 'red');
		$('#school_err').css('font-size', '1em;');
		$('#school_err').attr('class','font_GODOM');
		$('#school_err').html('5글자 이하 입력하세요.');
		return false;
	} else if (val[userinput.modal_school.value.length - 1] != "대"
			&& val[userinput.modal_school.value.length - 1] != "고") {
		$('#school_err').css('color', 'red');
		$('#school_err').css('font-size', '1em;');
		$('#school_err').attr('class','font_GODOM');
		$('#school_err').html('고,대를 구분해주세요.');
		return false;
	}
	// ㅇㅋ 통과.
	else {
		$('#school_err').html('');
		return true;
	}
};

// 7. 직장 체크
var _onCheckWorkplace = function(userinput) {

	if (userinput.modal_workplace.value == '') {
		$('#workplace_err').css('color', 'red');
		$('#workplace_err').css('font-size', '1em;');
		$('#workplace_err').attr('class','font_GODOM');
		$('#workplace_err').html('직장을 입력하세요.');
		return false;
	}

	else if (userinput.modal_workplace.value.length < 2) {
		$('#workplace_err').css('color', 'red');
		$('#workplace_err').css('font-size', '1em;');
		$('#workplace_err').attr('class','font_GODOM');
		$('#workplace_err').html('2글자 이상 입력하세요.');
		return false;
	}

	// ㅇㅋ 통과.
	else {
		$('#workplace_err').html('');
		return true;
	}
};

// 8. 직업 체크
var _onCheckOccupation = function(userinput) {

	var val = new Array();
	var di = true;
	for (var i = 0; i < userinput.modal_occupation.value.length; i++) {
		val[i] = userinput.modal_occupation.value.charAt(i);
		if (isNaN(val[i]) == false)
			di = false;
	}
	// 숫자 체크
	if (di == false) {
		$('#occupation_err').css('color', 'red');
		$('#occupation_err').css('font-size', '1em;');
		$('#occupation_err').attr('class','font_GODOM');
		$('#occupation_err').html('숫자는 제외해주세요.');
		return false;
	} else if (userinput.modal_occupation.value == '') {
		$('#occupation_err').css('color', 'red');
		$('#occupation_err').css('font-size', '1em;');
		$('#occupation_err').attr('class','font_GODOM');
		$('#occupation_err').html('직업을 입력하세요.');
		return false;
	}

	else if (userinput.modal_occupation.value.length < 2) {
		$('#occupation_err').css('color', 'red');
		$('#occupation_err').css('font-size', '1em;');
		$('#occupation_err').attr('class','font_GODOM');
		$('#occupation_err').html('2글자 이상 입력하세요.');
		return false;
	}

	// ㅇㅋ 통과.
	else {
		$('#occupation_err').html('');
		return true;
	}
};
