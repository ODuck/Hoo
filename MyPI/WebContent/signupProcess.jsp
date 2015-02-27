<%@page import="main.logon.Encryptor"%>
<%@ page import="main.logon.LogonDBBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<jsp:useBean id="member" class="main.logon.LogonDataBean">
	<jsp:setProperty name="member" property="*" />
</jsp:useBean>

<%
	LogonDBBean manager = LogonDBBean.getInstance();
	member.setPassword(Encryptor.encryptSHA(member.getPassword()));
	manager.insertMember(member);

	response.sendRedirect("index.jsp");
%>
