<%@page import="main.logon.Encryptor"%>
<%@page import="main.logon.MailService"%>
<%@ page import="main.logon.LogonDBBean"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ page language="java" contentType="text/plain; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	String email = request.getParameter("email");
	LogonDBBean manager = LogonDBBean.getInstance();

	if (manager.confirmEmail(email)) {
		out.print("true");
	} else {
		out.print("false");
	}
%>
