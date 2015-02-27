<%@page import="main.logon.Encryptor"%>
<%@page import="main.logon.LogonDataBean"%>
<%@page import="main.logon.LogonDBBean"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<jsp:useBean id="member" class="main.logon.LogonDataBean">
	<jsp:setProperty name="member" property="*" />
</jsp:useBean>

<%
	String email = request.getParameter("email");
	String password = request.getParameter("password");
	password = Encryptor.encryptSHA(password);
	out.println(email);

	member.setEmail(email);
	member.setPassword(password);
	LogonDBBean manager = LogonDBBean.getInstance();
	manager.insertMember(member);
%>