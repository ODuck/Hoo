<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>

<%
	String certkey = (String) session.getAttribute("certKey");
	String userKey = request.getParameter("key");

	if (certkey.equals(userKey)) {
		out.print("true");
	} else {
		out.print("false");
	}
%>