<%@page import="main.logon.LogonDataBean"%>
<%@page import="main.logon.LogonDBBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("utf-8");
	// Get Email
	String email = (String) session.getAttribute("memEmail");
	LogonDBBean manager = LogonDBBean.getInstance();
	LogonDataBean c = manager.getMember(email);

	// Get Change Type
	
	String type = (String)request.getParameter("type");
	if(type.equals("name")){
		String name = request.getParameter("modal_name");
		if(name.equals("")) name="null";
		manager.updateName(c,name);
	}else if(type.equals("cellphone")){
		String cellphone1 = request.getParameter("modal_cellphone1");
		if(cellphone1.equals("")) cellphone1="null";
		String cellphone2 = request.getParameter("modal_cellphone2");
		if(cellphone2.equals("")) cellphone2="null";
		String cellphone3 = request.getParameter("modal_cellphone3");
		if(cellphone3.equals("")) cellphone3="null";
		String phone = cellphone1+"-"+cellphone2+"-"+cellphone3;
		if(phone.equals("null-null-null")) phone="null"; 
		manager.updateCellPhone(c,phone);
	}else if(type.equals("homephone")){
		String homephone1 = request.getParameter("modal_homephone1");
		if(homephone1.equals("")) homephone1="null";
		String homephone2 = request.getParameter("modal_homephone2");
		if(homephone2.equals("")) homephone2="null";
		String homephone3 = request.getParameter("modal_homephone3");
		if(homephone3.equals("")) homephone3="null";
		String phone2 = homephone1+"-"+homephone2+"-"+homephone3;
		if(phone2.equals("null-null-null")) phone2="null";
		manager.updateHomePhone(c,phone2);
	}else if(type.equals("birthday")){
		String birthday1 = request.getParameter("modal_birthday1");
		if(birthday1.equals("")) birthday1="null";
		String birthday2 = request.getParameter("modal_birthday2");
		if(birthday2.equals("")) birthday2="null";
		String birthday3 = request.getParameter("modal_birthday3");
		if(birthday3.equals("")) birthday3="null";
		String day = birthday1+"."+birthday2+"."+birthday3+".";
		if(day.equals("null.null.null.")) day="null";
		manager.updateBirthDay(c,day);
	}else if(type.equals("address")){
		String insertAddress = request.getParameter("modal_address");
		String address = insertAddress.replace(" ", "+");
		if(address.equals(""))address="null";
		manager.updateAddress(c, address);
	}else if(type.equals("school")){
		String school = request.getParameter("modal_school");
		if(school.equals("")) school="null";
		manager.updateSchool(c,school);
	}else if(type.equals("workplace")){
		String workplace = request.getParameter("modal_workplace");
		if(workplace.equals("")) workplace="null";
		manager.updateWorkPlace(c,workplace);
	}else if(type.equals("occupation")){
		String occupation = request.getParameter("modal_occupation");
		if(occupation.equals("")) occupation="null";
		manager.updateOccuPation(c,occupation);
	}
%>