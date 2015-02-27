/**
 * Sign Up Script
 */
var _onCheckEmail = function(userinput) {
	var emailRegex = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
	// 이메일을 입력했는지 검사
	if (userinput.email.value == "") {
		$('#mailMsg').css('color', 'red');
		$('#mailMsg').css('font-size', '1em;');
		$('#mailMsg').attr('class', 'font_GODOM');
		$('#mailMsg').html('이메일을 입력하세요');
		return false;
	}
	// 이메일 형식여부 검사
	else if (!emailRegex.test(userinput.email.value)) {
		$('#mailMsg').css('color', 'red');
		$('#mailMsg').css('font-size', '1em;');
		$('#mailMsg').attr('class', 'font_GODOM');
		$('#mailMsg').html('이메일 형식이 맞지 않습니다.');
		return false;
	}
	// 이메일 형식 맞으면 중복검사
	else {
		$.ajax({
			type : "GET",
			dataType : "text",
			url : "mailCheck.jsp?email=" + userinput.email.value,
			success : function(result) {
				if (result == "true") {
					$('#mailMsg').css('color', '#0c4881');
					$('#mailMsg').css('font-size', '1em;');
					$('#mailMsg').attr('class', 'font_GODOM');
					$('#mailMsg').html('사용 가능한 이메일입니다.');
					return true;
				} else {
					$('#mailMsg').css('color', 'red');
					$('#mailMsg').css('font-size', '1em;');
					$('#mailMsg').attr('class', 'font_GODOM');
					$('#mailMsg').html('이메일이 중복됩니다.');
					return false;
				}
			},
			error : function() {
				alert("서버 통신 오류");
			}
		});
	}
};

var _onSendCertKey = function(userinput) {
	$.ajax({
		type : "GET",
		url : "sendKey.jsp?email=" + userinput.email.value,
		success : function(result) {
			if (result == "true") {
				alert("인증키를 보냈습니다.");
			} else {
				alert("인증키를 보내는 데 실패하였습니다.");
			}
		},
		error : function() {
			alert("이메일 인증 오류");
		}
	});
};

var _onConfirmCertKey = function(userinput) {
	if (userinput.certkey.value == "") {
		alert("인증키를 입력하세요.");
		$('#keyMsg').css('color', 'red');
		$('#keyMsg').css('font-size', '1em;');
		$('#keyMsg').attr('class', 'font_GODOM');
		$('#keyMsg').html("인증키를 입력하세요.");
	} else {
		$.ajax({
			type : "GET",
			url : "mailCert.jsp?key=" + userinput.certkey.value,
			success : function(result) {
				if (result == "true") {
					alert("인증을 완료하였습니다.");
					$('#keyMsg').css('color', '#0c4881');
					$('#keyMsg').css('font-size', '1em;');
					$('#keyMsg').attr('class', 'font_GODOM');
					$('#keyMsg').html('이메일이 인증되었습니다.');
					return true;
				} else {
					alert("인증을 실패하였습니다.");
					return false;
				}
			},
			error : function() {
				alert("이메일을 확인하세요.");
			}
		});
	}
};

var _onCheckPassword1 = function(userinput) {
	var passwdRegex = /^(?=([a-zA-Z]+[0-9]+[a-zA-Z0-9]*|[0-9]+[a-zA-Z]+[a-zA-Z0-9]*)$).{6,16}/;
	// 입력이 아예 없을 경우
	if (userinput.password.value == "") {
		$('#pass1Msg').css('color', 'red');
		$('#pass1Msg').css('font-size', '1em;');
		$('#pass1Msg').attr('class', 'font_GODOM');
		$('#pass1Msg').html('비밀번호를 입력하세요');
		return false;
	}
	// 규칙에 안맞았을 경우.
	else if (!passwdRegex.test(userinput.password.value)) {
		$('#pass1Msg').css('color', 'red');
		$('#pass1Msg').css('font-size', '1em;');
		$('#pass1Msg').attr('class', 'font_GODOM');
		$('#pass1Msg').html('6자에서 16자의 영문과 숫자를 혼합해야합니다.');
		return false;
	}
	// 메일 확인 부분에 비번이 있는데 다를경우.
	else if (userinput.password2.value) {
		if (userinput.password.value != userinput.password2.value) {
			$('#pass1Msg').css('color', 'red');
			$('#pass1Msg').css('font-size', '1em;');
			$('#pass1Msg').attr('class', 'font_GODOM');
			$('#pass1Msg').html('두 값이 다릅니다.');
			$('#pass2Msg').css('color', 'red');
			$('#pass2Msg').css('font-size', '1em;');
			$('#pass2Msg').attr('class', 'font_GODOM');
			$('#pass2Msg').html('두 값이 다릅니다.');
			return false;
		} else {
			$('#pass1Msg').css('color', '#0c4881');
			$('#pass1Msg').css('font-size', '1em;');
			$('#pass1Msg').attr('class', 'font_GODOM');
			$('#pass1Msg').html('적합한 비밀번호입니다.');
			$('#pass2Msg').css('color', '#0c4881');
			$('#pass2Msg').css('font-size', '1em;');
			$('#pass2Msg').attr('class', 'font_GODOM');
			$('#pass2Msg').html('적합한 비밀번호입니다.');
			return true;
		}
	} else {
		$('#pass1Msg').css('color', '#0c4881');
		$('#pass1Msg').css('font-size', '1em;');
		$('#pass1Msg').attr('class', 'font_GODOM');
		$('#pass1Msg').html('아래의 비밀번호을 입력하세요.');
		return true;
	}
};

var _onCheckPassword2 = function(userinput) {
	var checkpasswd = /^(?=([a-zA-Z]+[0-9]+[a-zA-Z0-9]*|[0-9]+[a-zA-Z]+[a-zA-Z0-9]*)$).{6,16}/;
	// 입력이 아예 없을 경우
	if (userinput.password2.value == "") {
		$('#pass2Msg').css('color', 'red');
		$('#pass2Msg').css('font-size', '1em;');
		$('#pass2Msg').attr('class', 'font_GODOM');
		$('#pass2Msg').html('비밀번호를 입력하세요');
		return false;
	}
	// 규칙에 안맞았을 경우.
	else if (!checkpasswd.test(userinput.password2.value)) {
		$('#pass2Msg').css('color', 'red');
		$('#pass2Msg').css('font-size', '1em;');
		$('#pass2Msg').attr('class', 'font_GODOM');
		$('#pass2Msg').html('6자에서 16자의 영문과 숫자를 혼합해야합니다.');
		return false;
	}
	// 메일 확인 부분에 비번이 있는데 다를경우.
	else if (userinput.password.value) {
		if (userinput.password.value != userinput.password2.value) {
			$('#pass1Msg').css('color', 'red');
			$('#pass1Msg').css('font-size', '1em;');
			$('#pass1Msg').attr('class', 'font_GODOM');
			$('#pass1Msg').html('두 값이 다릅니다.');
			$('#pass2Msg').css('color', 'red');
			$('#pass2Msg').css('font-size', '1em;');
			$('#pass2Msg').attr('class', 'font_GODOM');
			$('#pass2Msg').html('두 값이 다릅니다.');
			return false;
		} else {
			$('#pass1Msg').css('color', '#0c4881');
			$('#pass1Msg').css('font-size', '1em;');
			$('#pass1Msg').attr('class', 'font_GODOM');
			$('#pass1Msg').html('적합한 비밀번호입니다.');
			$('#pass2Msg').css('color', '#0c4881');
			$('#pass2Msg').css('font-size', '1em;');
			$('#pass2Msg').attr('class', 'font_GODOM');
			$('#pass2Msg').html('적합한 비밀번호입니다.');
			return true;
		}
	} else {
		$('#pass2Msg').css('color', '#0c4881');
		$('#pass2Msg').css('font-size', '1em;');
		$('#pass2Msg').attr('class', 'font_GODOM');
		$('#pass2Msg').html('위의 비밀번호를 입력하세요.');
		return true;
	}
};
var msgreset = function() {
	$('#mailMsg').html('');
	$('#pass1Msg').html('');
	$('#pass2Msg').html('');
};

var check = function() {
	var email = $('#mailMsg').text();
	var password1 = $('#pass1Msg').text();
	var password2 = $('#pass2Msg').text();
	if (email == "이메일 형식이 맞지 않습니다." || email == "이메일을 입력하세요"
			|| password1 == "비밀번호를 입력하세요" || email == "이메일이 중복됩니다."
			|| password1 == "6자에서 16자의 영문과 숫자를 혼합해야합니다."
			|| password1 == "두 값이 다릅니다." || password2 == "두 값이 다릅니다."
			|| password2 == "비밀번호를 입력하세요"
			|| password2 == "6자에서 16자의 영문과 숫자를 혼합해야합니다." || email == ""
			|| password1 == "" || password2 == "") {
		alert("정확한 정보를 입력하셔야 합니다.");
		return false;
	} else
		return true;
};