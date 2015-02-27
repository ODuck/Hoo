<%@page import="main.ranking.Ranking"%>
<%@page import="main.ranking.EngineGraph"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.globfx.swiffchart.SwiffChart"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%
	String rootPath = application.getRealPath("/");
	String installation_dir = null;
	if (rootPath
			.equals("/home/hosting_users/debind/tomcat/webapps/ROOT/")) {
		// Server Path
		installation_dir = rootPath + "SwiffChart";
	} else {
		// Local Path
		installation_dir = "C:\\Program Files (x86)\\GlobFX\\Swiff Chart Generator 3";
	}

	// Create a new Swiff Chart object
	SwiffChart chart = new SwiffChart(installation_dir);

	// JSP Init
	chart.SetServletInfo(request, response);

	String sep = ";";
	boolean ignoremultseparators = true;
	chart.SetSeparators(sep, ignoremultseparators);

	// Fill the series and categories
	String categories = "Google" + sep + "Naver" + sep + "Daum";
	chart.SetCategoriesFromString(categories);

	int googleCount = 0;
	int naverCount = 0;
	int daumCount = 0;
	double rate[] = { 0, 0, 0 };
	for (int i = 0; i < Ranking.result.size(); i++) {
		if (Ranking.result.get(i).getEngine().equals("Google")) {
			googleCount++;
		} else if (Ranking.result.get(i).getEngine().equals("Naver")) {
			naverCount++;
		} else if (Ranking.result.get(i).getEngine().equals("Daum")) {
			daumCount++;
		}
	}

	EngineGraph engineGraph = new EngineGraph(googleCount, naverCount,
			daumCount);
	System.out.println("카운트가 어떻게 되는데 그래요? : " + googleCount + "   "
			+ naverCount + "    " + daumCount);

	rate = engineGraph.computeEngineRate();

	String series = rate[0] + sep + rate[1] + sep + rate[2];

	chart.SetSeriesValueColor(0, 30, "black");
	chart.SetSeriesColor(1, "black");

	chart.SetSeriesValuesFromString(0, series);

	// Set the chart title

	// Apply a Pie style
	// The chart type is stored in the style file (*.scs)
	// Here the selected style is the predefined column style "Honolulu"
	String style = "pie/Honolulu";
	chart.LoadStyle(style);

	chart.SetWidth(100);
	chart.SetHeight(50);

	chart.SetLooping(false);

	chart.SetOutputFormat("PNG");
	// 출력 스트림 중복 사용 배제
	out.clear();
	out = pageContext.pushBody();

	//   String chart_res= chart.GetHTMLTag();
	//   chart.Release();

	chart.ExportAsResponse();
%>

