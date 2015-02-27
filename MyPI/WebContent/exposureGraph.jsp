<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.globfx.swiffchart.SwiffChart"%>
<%@page import="main.ranking.ExposureGraph"%>
<%@page import="main.ranking.ExpDataBean"%>
<%@page import="java.util.*"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%
	String rootPath = application.getRealPath("/");
	String installation_dir = null;
	if(rootPath.equals("/home/hosting_users/debind/tomcat/webapps/ROOT/")) {
		// Server Path
		installation_dir = rootPath + "SwiffChart";
	} else {
		// Local Path
		installation_dir = "C:\\Program Files (x86)\\GlobFX\\Swiff Chart Generator 3";
	}
	
	//Create a new Swiff Chart object
	SwiffChart chart = new SwiffChart(installation_dir);

	// Required: Initialisation of the chart object
	chart.SetServletInfo(request, response);

	String sep = ";";
	boolean ignoremultseparators = true;
	chart.SetSeparators(sep, ignoremultseparators);

	ArrayList<ExpDataBean> expDataList = new ArrayList<ExpDataBean>();
	ExposureGraph expGraph = new ExposureGraph();
	
	String email = (String) session.getAttribute("memEmail");
	System.out.println("세션에서 받은 이메일 : " + email);
	expDataList = expGraph.getExprecord(email);
	
	
	String categories = expDataList.get(0).getDate();
	String series1 = expDataList.get(0).getExposure() + "";
	
	for(int i=1; i<expDataList.size(); i++){
		
		categories = categories +  sep + expDataList.get(i).getDate();
		series1 = series1 + sep + (expDataList.get(i).getExposure() + "");	
	}
	
	// Fill the categories
// 	String categories = "14.05.13" + sep + "14.05.14" + sep + "14.05.16"
// 			+ sep + "14.05.18" + sep + "14.05.23";
	chart.SetCategoriesFromString(categories);

	// Fill the first series named "Sales 2001"
// 	String series1 = "8" + sep + "15" + sep + "6" + sep + "19" + sep
// 			+ "20";
	chart.AddSeries();
	chart.SetSeriesValuesFromString(0, series1);
	chart.SetSeriesCaption(0, "신상 노출도 관리 현황");

	/*
	String series2 = "23" + sep + "8" + sep + "12" + sep + "14" + sep
			+ "10";
	chart.AddSeries();
	chart.SetSeriesValuesFromString(1, series2);
	chart.SetSeriesCaption(1, "Sales 2002");
	*/

	// Set the chart title
// 	chart.SetTitle("MyPI 솔루션 그래프 생성 테스트");
// 	chart.SetSubtitle("(섭타이틀)");

	// Apply a Line style
	// The chart type is stored in the style file (*.scs)
	// Here the selected style is the predefined line style "Honolulu"
	String style = "line/curve-blue1";
	chart.LoadStyle(style);
	
	chart.SetWidth(100);
	chart.SetHeight(50);
	
	//반복효과
	chart.SetLooping(false);

	chart.SetOutputFormat("PNG");
	
	// 출력 스트림 중복 사용 배제
	out.clear();
	out = pageContext.pushBody();

	chart.ExportAsResponse();
	

%>
