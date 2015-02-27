<%@page import="main.logon.LogonDBBean"%>
<%@page import="main.logon.LogonDataBean"%>
<%@page import="main.logon.Encryptor"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>

<%
	String email = request.getParameter("fid");
	String password = request.getParameter("fpass");
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
		response.sendRedirect("main.jsp");
	} else if (check == 0) {
%>

<jsp:forward page="index.jsp" />

<script>
	alert("비밀번호가 틀렸습니다.");
	history.go(-1);
</script>
<%
	} else {
%>
<script>
	alert("아이디가 틀렸습니다.");
	history.go(-1);
</script>
<%
	}
%>

