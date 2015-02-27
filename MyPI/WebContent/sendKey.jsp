<%@page import="main.logon.Encryptor"%>
<%@page import="main.logon.MailService"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	// 메일 전송
	String email = request.getParameter("email");
	String certKey = Encryptor.getRandomString();
	String from = "noreply@mypi.co.kr";
	String to = email;
	String subject = "[MyPI] 회원가입 인증 코드";
	String content = "회원님의 인증 코드는<br>" + certKey
			+ "<br>입니다.<br><br>이 메일은 발신전용 메일입니다.";
	if (MailService.send(from, to, subject, content)) {
		session.setAttribute("certKey", certKey);
		out.print("true");
	} else {
		out.print("false");
	}
%>
