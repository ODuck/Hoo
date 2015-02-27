<%@ page import="main.logon.LogonDBBean"%>
<%@ page import="main.logon.LogonDataBean"%>
<%@ page import="main.logon.Encryptor"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	String email = request.getParameter("email");
	String password = request.getParameter("password");
		
	password = Encryptor.encryptSHA(password);
	LogonDBBean manager = LogonDBBean.getInstance();

	String emailcheck = request.getParameter("saveEmail");

	if (emailcheck != null && emailcheck.equals("on")) {
		Cookie cookie = new Cookie("email", email);
		cookie.setMaxAge(60 * 60);
		response.addCookie(cookie);
	} else {
		Cookie cookie = new Cookie("email", email);
		cookie.setMaxAge(0);
	}

	int check = manager.userCheck(email, password);
	LogonDataBean member = manager.getMember(email);
	
	if (check == 1) {
		session.setAttribute("memEmail", email);
		session.setAttribute("client_num", member.getClient_num() + "");
		// 로그인 성공
		out.println("success");
	} else {
		// 로그인 실패
		out.println("failure");
	}
%>