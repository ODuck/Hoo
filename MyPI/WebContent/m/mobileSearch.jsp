<%@page import="main.extending.form.ExtendedStorage"%>
<%@page import="main.ranking.ImageStorage"%>
<%@page import="net.sf.json.JSONObject"%>
<%@page import="net.sf.json.JSONArray"%>
<%@page import="main.search.SearchResult"%>
<%@page import="java.util.Vector"%>
<%@page import="main.search.SearchDic"%>
<%@page import="main.ranking.ExtendedInfo"%>
<%@page import="main.ranking.Ranking"%>
<%@page import="main.ranking.ProgressObserver"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>

<%
	String client_str = (String) session.getAttribute("client_num");
	int client_num = 1; //Integer.parseInt(client_str);
	ProgressObserver observer = new ProgressObserver();
	Ranking ranking = new Ranking(client_num, observer);
	ExtendedInfo extend = new ExtendedInfo((String)session.getAttribute("memEmail"));
	SearchDic searchDic = new SearchDic((String)session.getAttribute("memEmail"));
	extend.makeKeywordMap();

	searchDic.bindingWord(extend.getKeywordMap());

	Vector<SearchResult> result = ranking.getResult(searchDic
			.getSearchWordList());

	// Make JSON
	JSONObject object = new JSONObject();

	// Summary
	String grade = ranking.getGradeText()[0]; // 등급
	String gradeExp = ranking.getGradeText()[1]; // 설명
	object.put("grade", grade);
	object.put("gradeExp", gradeExp);

	// Graph
	// object.put("graph", "");

	// Image
	JSONArray imageList = JSONArray.fromObject(ImageStorage
			.getImgUrlList());
	object.put("image", imageList);

	// Static
	JSONArray staticSearch = JSONArray
			.fromObject(ExtendedStorage.siteInfoList);
	object.put("static", staticSearch);

	// Dynamic
	JSONArray dynamicSearch = JSONArray.fromObject(result);
	object.put("dynamic", dynamicSearch);

	out.println(object);
%>